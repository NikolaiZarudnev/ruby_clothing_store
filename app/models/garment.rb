class Garment < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :description, presence: true
<<<<<<< HEAD
  validates :price, presence: true
end
=======
  validates :price, presence: true, numericality: {only_float: true, greater_than: 0}
  
end
>>>>>>> fix-bugs
