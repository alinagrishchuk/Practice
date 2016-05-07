class AddPersonRefToPeople < ActiveRecord::Migration
  def change
    add_reference :people, :parent, index: true
  end
end
