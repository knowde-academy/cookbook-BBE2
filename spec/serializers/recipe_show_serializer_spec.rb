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

  describe '#cooking_time' do
    context 'with cooking_time' do
      it { is_expected.to include(cooking_time: recipe.cooking_time) }
    end

    context 'without cooking_time' do
      let!(:recipe) { create :recipe, cooking_time: nil }

      it { is_expected.to include(cooking_time: described_class::NIL_RESULT) }
    end
  end

  describe '#comments' do
    let!(:comments) { create_list :comment, 2, recipe: recipe }
    let(:serialized_comments) do
      comments.sort_by(&:created_at).reverse!.map do |comment|
        CommentSerializer.new(comment).to_h
      end
    end

    it { is_expected.to include(comments: serialized_comments) }
  end

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
