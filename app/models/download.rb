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

  scope :created_in_month_download, -> do
    now = Time.zone.now
    where created_at: now.beginning_of_month..now
  end
end
