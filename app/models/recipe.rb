class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :level, allow_blank: true, numericality: {greater_than: 0, less_than: 6}
end
