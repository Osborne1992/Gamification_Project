class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :player1
      t.string :playera
      t.boolean :botme

      t.timestamps null: false
    end
  end
end
