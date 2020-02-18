Dado("que eu sou um usuário cadastrado") do
  criar_usuario
  expect(Usuario.count).to eq 1
end

Dado("visito a página de login") do
  visit new_usuario_session_path
  expect(page).to have_content 'Login'
end

Quando("eu enviar as informações de login") do
  fazer_login
end

Então("eu devo ter acesso ao sistema") do
  expect(page).to have_content "Bem vindo,"
end

Dado("que eu sou um usuário autenticado") do
  visit new_usuario_session_path
  fazer_login
end

Quando("eu clico no link de sair") do
  page.find('a', text: 'Sair').click
end

Então("eu devo acessar a página de login") do
  expect(page).to have_current_path(new_usuario_session_path)
end

def criar_usuario
  @usuario = FactoryBot.create(:usuario)
end

def fazer_login
  fill_in "usuario_email", with: @usuario.email
  fill_in "usuario_password", with: @usuario.password
  click_button "Entrar"
end
