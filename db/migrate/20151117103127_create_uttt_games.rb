class CreateUtttGames < ActiveRecord::Migration
  def change
    create_table :uttt_games do |t|

      t.timestamps null: false
    end
  end
end
