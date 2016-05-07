class ChangePartNumberTypeInProducts < ActiveRecord::Migration
  def change
    change_column :products, :part_number, :text
  end
end
