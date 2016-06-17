class AddReleasedOnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :released_on, :date
  end
end
