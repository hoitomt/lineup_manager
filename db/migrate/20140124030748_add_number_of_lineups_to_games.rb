class AddNumberOfLineupsToGames < ActiveRecord::Migration
  def change
    add_column :games, :number_of_lineups, :integer
  end
end
