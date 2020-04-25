Dado("que eu sou um usuário cadastrado") do
  create_user
  expect(User.count).to eq 1
end

Dado("visito a página de login") do
  visit new_user_session_path
  expect(page).to have_content 'Login'
end

Quando("eu enviar as informações de login") do
  fazer_login
end

Então("eu devo ter acesso ao sistema") do
  expect(page).to have_content "Bem vindo,"
end

Dado("que eu sou um usuário autenticado") do
  visit new_user_session_path
  fazer_login
end

Quando("eu clico no link de sair") do
  page.find('a', text: 'Sair').click
end

Então("eu devo acessar a página de login") do
  expect(page).to have_current_path(new_user_session_path)
end

def create_user
  @user = FactoryBot.create(:user)
end

def fazer_login
  fill_in "user_email", with: @user.email
  fill_in "user_password", with: @user.password
  click_button "Entrar"
end
