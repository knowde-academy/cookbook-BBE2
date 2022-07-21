require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :controller do
  describe '[POST] #create' do
    let(:recipe) { create :recipe }
    let(:post_request) { post :create, params: recipe_params }
    
    context 'when user not logged in' do
      let(:recipe_params) do
        {
          comment: {
            author: 'Adam Mickiewicz',
            body: 'Adam Mickiewicz wielkim polakiem był'
          },
          recipe_id: recipe.id
        }
      end
      
      
      it 'returns status unauthorized' do
        post_request
        expect(response).to have_http_status(:unauthorized)
      end
    end
    
    context 'when user logged in' do
      login_user
      
      context 'with correct params' do
        let(:recipe_params) do
          {
            comment: {
              author: 'Adam Mickiewicz',
              body: 'Adam Mickiewicz wielkim polakiem był'
            },
            recipe_id: recipe.id
          }
        end
        
        it 'creates a comment' do
          expect { post_request }.to change(Comment, :count).by(1)
        end
    
        it 'returns status ok' do
          #sign_in test_user
          post_request
          expect(response).to have_http_status(:ok)
        end
      end
    
      context 'with incorrect/invalid params' do
        let(:recipe_params) do
          {
            comment: {
              author: 'Adam Mickiewicz',
              body: ''
            },
            recipe_id: recipe.id
          }
        end
    
        it 'doesnt creates a comment' do
          expect { post_request }.not_to change(Comment, :count)
        end
    
        it 'returns status unprocessable_entity' do
          post_request
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
