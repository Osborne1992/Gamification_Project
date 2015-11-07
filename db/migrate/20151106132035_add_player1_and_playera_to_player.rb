class AddPlayer1AndPlayeraToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :player1, :string
    add_column :players, :playera, :string
  end
end
