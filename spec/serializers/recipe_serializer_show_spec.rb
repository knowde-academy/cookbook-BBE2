require 'rails_helper'

describe RecipeSerializerShow do
  subject(:serialized_recipe) { described_class.new(recipe).to_h }

  let(:recipe) { build(:recipe) }

  it { is_expected.to include(name: recipe.name) }
  it { is_expected.to include(content: recipe.content) }
  it { is_expected.to include(video_link: recipe.video_link) }
end
