require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to allow_value(nil).for(:level) }

    it {
      is_expected.to validate_inclusion_of(:level).in_range(1..5).with_message(described_class::INCLUSION_ERROR_MESSAGE)
    }

    it { is_expected.to allow_value('', nil).for(:video_link) }
    it { is_expected.to validate_url_of(:video_link) }
  end

  describe 'price should be decimal + can be nil' do
    it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    it { is_expected.to allow_value(nil).for(:price) }
  end
end
