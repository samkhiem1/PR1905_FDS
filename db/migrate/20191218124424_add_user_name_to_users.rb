class AddUserNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :total_coin, :integer
    add_column :users, :admin, :boolean, default: false
  end
end
