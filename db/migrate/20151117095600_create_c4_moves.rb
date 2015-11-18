class CreateC4Moves < ActiveRecord::Migration
  def change
    create_table :c4_moves do |t|
      t.integer :square
      t.string :token
      t.integer :game_id
      t.integer :player_id

      t.timestamps null: false
    end
  end
end
