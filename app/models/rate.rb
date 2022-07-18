class Rate < ApplicationRecord
  INCLUSION_ERROR_MESSAGE = 'must be integer in range 1-5 inclusive'.freeze
  
  belongs_to :recipe
  
  validates :vote, presence: true,
            inclusion: { in: 1..5, message: INCLUSION_ERROR_MESSAGE }
end