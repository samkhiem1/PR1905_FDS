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
  enum status: [:actived, :baned]

  def username
    return email.split('@')[0].capitalize
  end

  def check_user_download
    downloads.where("created_at > ? AND created_at < ?", Time.now.beginning_of_month, Time.now.end_of_month).count
  end
end
