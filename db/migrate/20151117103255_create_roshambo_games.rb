class CreateRoshamboGames < ActiveRecord::Migration
  def change
    create_table :roshambo_games do |t|
      t.integer :player1_id
      t.integer :player2_id

      t.timestamps null: false
    end
  end
end
