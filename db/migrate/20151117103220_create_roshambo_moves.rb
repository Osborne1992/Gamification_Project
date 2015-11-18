class CreateRoshamboMoves < ActiveRecord::Migration
  def change
    create_table :roshambo_moves do |t|
      t.integer :player_id
      t.integer :game_id
      t.string :shape

      t.timestamps null: false
    end
  end
end
