class AddTeamIdAndRemoveDateFromGames < ActiveRecord::Migration
  def change
    add_column :games, :team_id, :integer
    remove_column :games, :date
  end
end
