class AddPriceToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :price, :decimal, :precision => 2, :scale => 8
  end
end
