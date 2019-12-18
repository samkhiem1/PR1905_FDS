class AddUserNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone, :string
    add_column :users, :total_coi, :integer
    add_column :users, :admin, :boolean
  end
end
