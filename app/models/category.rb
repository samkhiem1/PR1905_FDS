class Category < ApplicationRecord
  has_many :documents
  validates :name, presence: true, uniqueness: true
end
