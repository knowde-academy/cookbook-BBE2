require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to allow_value(nil).for(:level) }
    it { is_expected.to validate_inclusion_of(:level).in_range(1..5) }
  end
end
