require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'Como um usuário logado' do
    before (:each) do
    end
    context 'POST #create' do
      it 'cria um novo usuário' do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        @current_user = FactoryBot.create(:user)
        sign_in @current_user
        user = FactoryBot.attributes_for(:user)
        expect {
          post :create, params: { user: { email: user[:email], password: user[:password] } }
        }.to change(User, :count).by 1
      end
    end
  end
end
