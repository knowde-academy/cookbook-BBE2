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
      context 'recipe with video_link' do
        it { is_expected.to include(video_link: recipe.video_link) }
      end

      context 'recipe without video_link' do
        let(:recipe) { build :recipe, video_link: nil }

        it { is_expected.to include(video_link: described_class::NIL_RESULT) }
      end
    end
  end

  describe '#rates' do
    context 'when recipe with rates' do
      before { create_list(:rate, 3, recipe: recipe) }

      it { is_expected.to include(rates_count: recipe.rates.count) }
      it { is_expected.to include(avg_rate: recipe.rates.average(:vote)) }
    end

    context 'when recipe without rates' do
      it { is_expected.to include(rates_count: 0) }
      it { is_expected.to include(avg_rate: 0) }
    end
  end
end
