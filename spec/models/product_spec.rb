require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }

    it do
      is_expected.to validate_numericality_of(:quantity)
        .only_integer
        .is_greater_than(0)
    end
  end
end
