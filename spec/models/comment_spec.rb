require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:recipe) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_least(10) }
  end
end
