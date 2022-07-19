class Product < ApplicationRecord
  validates :name, uniqueness: true
  validates :quantity, 
            allow_nil: true, 
            numericality: { only_integer: true, greater_than: 0 }
end