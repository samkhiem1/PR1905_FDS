# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  status     :string
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friendship < ApplicationRecord
end
