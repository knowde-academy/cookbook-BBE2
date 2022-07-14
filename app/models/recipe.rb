class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { only_float: true }
end
