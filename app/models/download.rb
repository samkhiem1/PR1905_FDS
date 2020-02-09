# == Schema Information
#
# Table name: downloads
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  document_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Download < ApplicationRecord
  belongs_to :user
  belongs_to :document
end
