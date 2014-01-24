class Game < ActiveRecord::Base
  belongs_to :team
  has_many :game_players

  validates :team, presence: true

  def display_date
    self.created_at.strftime("%B %e, %Y")
  end

  def players_with_availability
    existing_availability.blank? ? new_availability : existing_availability
  end

  def new_availability
    team.players.each do |player|
      GamePlayer.create(game_id: self.id, player_id: player.id, available: true)
    end
    existing_availability
  end

  def existing_availability
    self.game_players.includes(:player).order('players.first_name, players.last_name')
  end

  # expecting hash to be {player_id => available} (e.g. "7" => "0")
  def update_availability(availability_hash)
    availability_hash.each { |k, v| GamePlayer.add_or_update(self.id, k, v) }
  end
end
