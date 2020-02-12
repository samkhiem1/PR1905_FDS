# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  phone                  :string
#  total_coin             :integer
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :documents
  has_many :downloads
  has_many :friendships
  has_many :messages
  has_many :friends, through: :friendships
  enum status: [:actived, :baned]

  def username
    return email.split('@')[0].capitalize
  end

  def check_user_download
    downloads.where("created_at > ? AND created_at < ?", Time.now.beginning_of_month, Time.now.end_of_month).count
  end

  def get_friendship other
    Friendship.find_by(user_id: self.id, friend_id: other.id) ||
      Friendship.find_by(friend_id: self.id, user_id: other.id)
  end
end
