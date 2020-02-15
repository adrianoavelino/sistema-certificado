require 'rails_helper'

RSpec.describe UsuariosController, type: :controller do
  describe 'Como um usuário logado' do
    before (:each) do
    end
    context 'POST #create' do
      it 'cria um novo usuário' do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        @current_usuario = FactoryBot.create(:usuario)
        sign_in @current_usuario
        usuario = FactoryBot.attributes_for(:usuario)
        expect {
          post :create, params: { usuario: { email: usuario[:email], password: usuario[:password] } }
        }.to change(Usuario, :count).by 1
      end
    end
  end
end
