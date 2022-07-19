require 'rails_helper'
RSpec.describe '#sign_in' do
  let(:password) {'password'}
  let(:user) {create(:user, password: password)}
   let(:login_params) do
    {
      email: user.email,
      password: password
    }
  end
    let(:login_users) do
    post '/api/v1/auth/sign_in', params: login_params
  end
  
  context ' with valid params' do
    it ' request successful' do
      login_users
      expect(response).to have_http_status(:ok)
    end
    it ' check auth headers' do
      login_users
      expect(response.headers['access-token']).to be_present
      expect(response.headers['client']).to be_present
      expect(response.headers['uid']).to be_present
    end
  end
  
  context ' with invalid params' do
    let!(:login_params) { { password: 'WrongPassword' } }
    
    it 'request unauthorized' do
      login_users
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
