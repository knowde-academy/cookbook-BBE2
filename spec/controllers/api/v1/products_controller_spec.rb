require 'rails_helper'

describe Api::V1::ProductsController do
  describe '[GET] #index' do
    before do
      create_list(:product, 5)
      get :index
    end
    
    it 'returns all products' do
      expect(JSON.parse(response.body)['data'].size).to eq(5)
    end
  end
  
  describe '[GET] #show' do
    let(:product) { create(:product) }
    let(:expected_response) { ProductSerializer.new(product).to_json }
    
    before do
      get :show, params: { id: product.id }
    end
    
    it 'returns requested recipe' do
      expect(response.body).to eq(expected_response)
    end
  end
  
  describe '[POST] #create' do
    let(:product_params) do
      {
        product: {
          name: 'kielbacha mmm',
          quantity: 2137
        }
      }
    end
    
    context 'with valid params' do
      it 'creates recipe' do
        expect do
          post :create, params: product_params
        end.to change(Product, :count).by(1)
      end
    end
    
    context 'with invalid params' do
      let(:invalid_name) { '' }
      it 'creates recipe' do
        expect do
          post :create, params: { product: { name: invalid_name, content: 'uwu'} }
        end.not_to change(Product, :count)
      end
    end
  end
  
  describe '[PUT] #update' do
    let(:old_name) { 'ziemniaczek' }
    let(:new_name) { 'kurczaczek' }
    let(:product) { create(:product, name: old_name) }
    
    context 'with valid params' do
      it 'updates name' do
        expect do
          put :update, params: { id: product.id, product: { name: new_name } }
        end.to change { product.reload.name }.from(old_name).to(new_name)
      end
      
      it 'returns updated object' do
        put :update, params: { id: product.id, product: { name: new_name } }
        expect(JSON.parse(response.body)['name']).to eq(new_name)
      end
    end
    
    context 'with invalid params' do
      let(:invalid_new_name) { '' }
      it 'doesn\'t update name' do
        expect do
          put :update, params: { id: product.id, product: { name: invalid_new_name } }
        end.not_to change { product.reload.name }
      end
    end
  end
  
  describe '[DELETE] #destroy' do
    let!(:product) { create(:product) }
    
    it 'destroys the recipe' do
      expect { delete :destroy, params: { id: product.id } }.to change(Product, :count).by(-1)
    end
    
    it 'returns destroyed object' do
      delete :destroy, params: { id: product.id }
      expect(JSON.parse(response.body)['name']).to eq(product.name)
    end
  end
end
