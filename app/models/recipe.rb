class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :level, allow_nil: true, inclusion: { in: 1..5 }
end
