class GamePlayer < ActiveRecord::Base
  belongs_to :game
  belongs_to :player

  def self.add_or_update(game_id, player_id, available="1")
    if gp = GamePlayer.where('game_id = ? and player_id = ?', game_id, player_id).first
      gp.update_attributes(available: available)
    else
      GamePlayer.create(game_id: game_id, player_id: player_id, available: available)
    end
  end
end
