# == Schema Information
#
# Table name: documents
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category_id :integer
#  status      :integer          default("pending")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string
#  description :text
#  attachment  :string
#  deleted_at  :datetime
#  thumbnail   :text
#

class Document < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :downloads
  has_many :favorites, dependent: :destroy
  belongs_to :category, dependent: :destroy
  acts_as_paranoid
  mount_uploader :attachment, AttachmentUploader
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :attachment, presence: true
  enum status: [:pending, :legal, :illegal]

  scope :created_in_month, -> do
    now = Time.zone.now
    where created_at: now.beginning_of_month..now
  end
end
