class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|

      t.timestamps null: false
    end
  end
end
