class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :link, :string
    add_column :users, :about, :string
    add_column :users, :birthday, :date
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :website, :string
  end
end
