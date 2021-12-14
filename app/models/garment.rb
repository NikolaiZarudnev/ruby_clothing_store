class Garment < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: {only_float: true, greater_than: 0}
  
end