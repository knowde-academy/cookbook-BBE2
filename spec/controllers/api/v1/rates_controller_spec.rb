require 'rails_helper'

describe Api::V1::RatesController do
  describe '[POST] #create' do
    let(:recipe) { create(:recipe) }
    let(:rate_params) { { vote: 3 } }

    context 'with valid votes' do
      it 'creates new rate' do
        expect do
          post :create,
               params:
               {
                 recipe_id: recipe.id,
                 rate: rate_params
               }
        end.to change(Rate, :count).by(1)
      end
    end

    context 'with invalid votes' do
      let(:invalid_vote) { 'thats invalid af' }

      it 'doesn\'t create new rate' do
        expect do
          post :create,
               params:
               {
                 recipe_id: recipe.id,
                 rate: {
                   vote: invalid_vote
                 }
               }
        end.not_to change(Rate, :count)
      end
    end
  end
end
