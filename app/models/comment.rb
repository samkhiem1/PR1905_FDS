class Comment < ApplicationRecord
  belongs_to :document
  belongs_to :user
  validates :content, presence: true
  default_scope { order("created_at DESC") }
end
