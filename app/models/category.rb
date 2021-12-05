class Category < ApplicationRecord
  has_many :garments
  validates :title, presence: true
end
