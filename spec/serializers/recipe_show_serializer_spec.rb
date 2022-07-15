require 'rails_helper'

describe RecipeShowSerializer do
  subject do
    context 'with correct cooking_time' do
      let(:recipe) { build(:recipe, cooking_time: 12) }

      it { is_expected.to include(cooking_time: recipe.cooking_time) }
    end

    context 'with incorrect cooking_time' do
      let(:recipe) { build(:recipe, cooking_time: nil) }

      it { is_expected.to include(cooking_time: described_class::NIL_RESULT) }
      
   subject(:serialized_recipe) { described_class.new(recipe).to_h }
    let(:recipe) { build(:recipe) }

    it { is_expected.to include(name: recipe.name) }
    it { is_expected.to include(content: recipe.content) }

  describe '#video_link' do
    context 'when recipe with video_link' do
      it { is_expected.to include(video_link: recipe.video_link) }
    end

    context 'when recipe without video_link' do
      let(:recipe) { build :recipe, video_link: nil }

      it { is_expected.to include(video_link: described_class::NIL_RESULT) }
    end
  end
end
