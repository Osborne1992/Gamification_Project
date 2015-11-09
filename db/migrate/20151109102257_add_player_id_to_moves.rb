class AddPlayerIdToMoves < ActiveRecord::Migration
  def change
    add_column :moves, :player_id, :integer
  end
end
