class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
  enum status:  [:pending, :accept]
  validates :user_id, presence: true
  validates :friend_id, presence: true
end
