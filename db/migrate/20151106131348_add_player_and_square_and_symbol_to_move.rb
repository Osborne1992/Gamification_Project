class AddPlayerAndSquareAndSymbolToMove < ActiveRecord::Migration
  def change
    add_column :moves, :player, :string
    add_column :moves, :square, :integer
    add_column :moves, :symbol, :string
  end
end
