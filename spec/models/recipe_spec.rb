require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
  describe 'price should be decimal + can be nil' do
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0)}
    it { is_expected.to allow_value(nil).for (:price)}
  end
end
