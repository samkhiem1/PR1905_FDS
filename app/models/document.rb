class Document < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  acts_as_paranoid
  mount_uploader :attachment, AttachmentUploader
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :attachment, presence: true
end
