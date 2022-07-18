require 'rails_helper'

RSpec.describe RecipeShowSerializer do
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

  describe '#rates' do
    let!(:rates) do
      create_list(:rate, 3, recipe: recipe).map do |rate|
        RateSerializer.new(rate).to_h
      end
    end

    it { is_expected.to include(rates: rates) }
  end
end
