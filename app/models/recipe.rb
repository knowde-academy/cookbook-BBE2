class Recipe < ApplicationRecord
  INCLUSION_ERROR_MESSAGE = 'must be integer in range 1-5 inclusive'.freeze

  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :cooking_time, numericality: { greater_than: 0 }, allow_nil: true
  validates :video_link, allow_blank: true, url: true
  validates :level, allow_nil: true,
                    inclusion: { in: 1..5,
                                 message: INCLUSION_ERROR_MESSAGE }
end
