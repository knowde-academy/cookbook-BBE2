class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :level, allow_nil: true, numericality: {in: 1..5, only_integer: true}
end
