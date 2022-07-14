require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
  describe 'check if cooking_time is integer and >0' do
    it { is_expected.to validate_numericality_of(:cooking_time).only_integer.is_greater_than(0) }
  # it {expect(:cooking_time).to be_a_kind_of(Integer)}
  end
  
end
