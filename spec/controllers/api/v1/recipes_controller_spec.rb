require 'rails_helper'

describe Api::V1::RecipesController do
  describe '[GET] #index' do
    before do
      create_list(:recipe, 5)
      get :index
    end

    it 'returns all recipes' do
      expect(JSON.parse(response.body)['data'].size).to eq(5)
    end
  end

  describe '[GET] #show' do
    let!(:recipe) { create(:recipe) }
    let(:expected_response) { RecipeShowSerializer.new(recipe).to_json }

    before do
      get :show, params: { id: recipe.to_param }
    end

    it 'returns requested recipe' do
      expect(response.body).to eq(expected_response)
    end
  end

  describe '[POST] #create' do
    let(:recipe_params) do
      {
        recipe: {
          name: 'Leczo',
          content: 'Very good dish',
          price: 20,
          cooking_time: 12,
          video_link: 'http://www.link.com',
          level: 4
        }
      }
    end

    context 'with valid params' do
      let(:recipe_params) do
        {
          recipe: { name: 'Pierogi', content: 'Wrzuc do wody', price: 7,
                    cooking_time: 10, video_link: 'http://www.pieroges.com', level: 2 }
        }
      end

      it 'creates recipe' do
        expect do
          post :create, params: recipe_params
        end.to change(Recipe, :count).by(1)
      end
    end

    context 'with invalid level' do
      let(:recipe_params) do
        {
          recipe: { name: '', content: '', price: -1,
                    cooking_time: -2, video_link: 'aaa', level: -10 }
        }
      end

      it 'doesn\'t create recipe' do
        expect do
          post :create, params: recipe_params
        end.not_to change(Recipe, :count)
      end
    end
  end

  describe '[PUT] #update' do
    let(:old_name) { 'Rosol' }
    let(:new_name) { 'Pierogi' }
    let(:old_video_link) { 'http://www.rosol.com' }
    let(:new_video_link) { 'http://www.pieroges.com' }
    let(:old_cooking_time) { 10 }
    let(:new_cooking_time) { 7 }
    let(:old_price) { 5 }
    let(:new_price) { 7.0 }
    let(:old_level) { 3 }
    let(:new_level) { 2 }
    let(:recipe) do
      create(:recipe, name: old_name, video_link: old_video_link,
                      cooking_time: old_cooking_time, price: old_price, level: old_level)
    end
    let(:params) do
      { id: recipe.id, recipe: { name: new_name, video_link: new_video_link,
                                 cooking_time: new_cooking_time, price: new_price, level: new_level } }
    end

    context 'with valid params' do
      it do
        expect do
          put :update, params: params
        end.to change { recipe.reload.name }.from(old_name).to(new_name)
                                            .and change { recipe.reload.video_link }.from(old_video_link).to(new_video_link)
                                                                                    .and change {
                                                                                           recipe.reload.cooking_time
                                                                                         }.from(old_cooking_time).to(new_cooking_time)
          .and change {
                 recipe.reload.price
               }.from(old_price).to(new_price)
          .and change {
                 recipe.reload.level
               }.from(old_level).to(new_level)
      end

      it 'returns updated name' do
        put :update, params: { id: recipe.id, recipe: { name: new_name, video_link: new_video_link,
                                                        cooking_time: new_cooking_time, price: new_price, level: new_level } }
        expect(JSON.parse(response.body)['name']).to eq(new_name)
        expect(JSON.parse(response.body)['video_link']).to eq(new_video_link)
        expect(JSON.parse(response.body)['cooking_time']).to eq(new_cooking_time)
        expect(JSON.parse(response.body)['price']).to eq(new_price.to_s)
        expect(JSON.parse(response.body)['level']).to eq(new_level)
      end
    end

    context 'with invalid params' do
      let(:invalid_new_name) { '' }
      let(:invalid_video_link) { 'qweqweqwe' }
      let(:invalid_cooking_time) { -2 }
      let(:invalid_price) { -20 }
      let(:invalid_level) { 'level' }

      it 'doesn\'t update name' do
        expect do
          put :update, params: { id: recipe.id, recipe: { name: invalid_new_name } }
        end.not_to change { recipe.reload.name }
      end

      it 'doesn\'t update video_link' do
        expect do
          put :update, params: { id: recipe.id, recipe: { video_link: invalid_video_link } }
        end.not_to change { recipe.reload.video_link }
      end

      it 'doesn\'t update cooking_time' do
        expect do
          put :update, params: { id: recipe.id, recipe: { cooking_time: invalid_cooking_time } }
        end.not_to change { recipe.reload.cooking_time }
      end

      it 'doesn\'t update price' do
        expect do
          put :update, params: { id: recipe.id, recipe: { price: invalid_price } }
        end.not_to change { recipe.reload.price }
      end

      it 'doesn\'t update level' do
        expect do
          put :update, params: { id: recipe.id, recipe: { level: invalid_level } }
        end.not_to change { recipe.reload.level }
      end
    end
  end

  describe '[DELETE] #destroy' do
    let!(:recipe) { create(:recipe) }

    it 'destroys the recipe' do
      expect { delete :destroy, params: { id: recipe.id } }.to change(Recipe, :count).by(-1)
    end

    it 'returns destroyed object' do
      delete :destroy, params: { id: recipe.id }
      expect(JSON.parse(response.body)['name']).to eq(recipe.name)
    end
  end
end
