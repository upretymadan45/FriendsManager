class AddColumnsToFriends < ActiveRecord::Migration[5.1]
  def change
    add_column :friends, :address, :string
    add_column :friends, :email, :string
    add_column :friends, :contact, :string
  end
end
