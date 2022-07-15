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
    end
  end
end
