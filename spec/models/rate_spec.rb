require 'rails_helper'

RSpec.describe Rate, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:recipe) }
  end
  
  describe 'validations' do
    it { is_expected.to validate_presence_of(:vote) }
    it { is_expected.to validate_inclusion_of(:vote).in_range(1..5).with_message(described_class::INCLUSION_ERROR_MESSAGE) }
  end
end
