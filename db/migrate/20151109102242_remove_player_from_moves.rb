class RemovePlayerFromMoves < ActiveRecord::Migration
  def change
    remove_column :moves, :player, :player_id
  end
end
