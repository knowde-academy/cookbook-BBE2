require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:rates).dependent(:destroy) }
  end
  
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to allow_value('', nil).for(:video_link) }
    it { is_expected.to validate_url_of(:video_link) }
  end
end
