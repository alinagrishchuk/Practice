class AddInformationToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :email, :string
    add_column :authors, :bio ,:text
    add_column :authors, :gender, :string
    add_column :authors, :public_profile, :boolean
  end
end
