require 'rails_helper'

describe RecipeShowSerializer do
  subject(:serialized_recipe) { described_class.new(recipe).to_h }

  let(:recipe) { create :recipe }

  describe '#price' do
    context 'with price' do
      it { is_expected.to include(price: recipe.price) }
    end

    context 'without price' do
      let!(:recipe) { create :recipe, price: nil }

      it { is_expected.to include(price: described_class::NIL_RESULT) }
    end
  end
end
