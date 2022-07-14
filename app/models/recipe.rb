class Recipe < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :cooking_time, numericality: { greater_than: 0 }
end
