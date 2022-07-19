require 'rails_helper'
RSpec.describe '#sign_in' do
  let(:password) { 'password' }
  let(:user) { build(:user, password: password) }
  let(:register) do
    post '/api/v1/auth/', params: { email: user.email, password: password }
  end

  context 'with valid params' do
    it do
      expect do
        register
      end.to change(User, :count).by(1)
    end

    it 'request successful' do
      register
      expect(response).to have_http_status(:ok)
    end
  end

  context 'with invalid params' do
    let(:email) { 'aaaa' }
    let(:user) { build(:user, email: email) }

    it { expect { register }.not_to change(User, :count) }

    it 'request successful' do
      register
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
