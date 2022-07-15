class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :level, allow_nil: true, 
                    inclusion: { in: 1..5,
                                message: 'Level must be integer in range 1-5 inclusive' }
end
