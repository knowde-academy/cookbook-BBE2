require 'rails_helper'

describe RecipeShowSerializer do
  subject(:serialized_recipe) { described_class.new(recipe).to_h }

  let(:recipe) { build(:recipe) }

  it { is_expected.to include(name: recipe.name) }
  it { is_expected.to include(content: recipe.content) }
  
  describe '#video_link' do
    context 'when recipe with level' do
      it { is_expected.to include(level: recipe.level) }
    end

    context 'when recipe without level' do
      let(:recipe) { build :recipe, level: nil }

      it { is_expected.to include(level: described_class::NIL_RESULT) }
    end
  end
end