class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :purchased_at, :datetime
    add_column :orders, :shipping, :boolean
  end
end
