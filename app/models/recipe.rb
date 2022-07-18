class Recipe < ApplicationRecord
  INCLUSION_ERROR_MESSAGE = 'must be integer in range 1-5 inclusive'.freeze

  has_many :rates, dependent: :destroy

  validates :name, presence: true
  validates :level, allow_nil: true,
                    inclusion: { in: 1..5,
                                 message: INCLUSION_ERROR_MESSAGE }
  validates :video_link, allow_blank: true, url: true
end
