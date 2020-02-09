class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :status, default: 0
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
