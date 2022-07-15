class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :video_link, allow_blank: true, url: true
end
