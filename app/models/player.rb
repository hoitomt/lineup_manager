class Player < ActiveRecord::Base
  belongs_to :team
  has_many :game_players

  validates :team, presence: true

  attr_accessor :available

  def name
    "#{first_name} #{last_name}"
  end
end
