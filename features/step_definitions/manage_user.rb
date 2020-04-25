Dado("que eu visito a página de cadastro de usuários") do
  visit new_user_path
end

Quando("eu enviar as informações do cadastro do usuario") do
  @new_user = FactoryBot.build(:user)
  fill_in "user_email", with: @new_user.email
  fill_in "user_password", with: @new_user.password
  fill_in "user_password_confirmation", with: @new_user.password
  click_button "Criar Usuário"
end

Então("eu devo ver as informações do novo usuario") do
  expect(page).to have_content "Administrador cadastrado com sucesso!"
end

Quando("eu enviar as informações do cadastro do usuario com senhas diferentes") do
  @new_user = FactoryBot.build(:user)
  fill_in "user_email", with: @new_user.email
  fill_in "user_password", with: @new_user.password
  fill_in "user_password_confirmation", with: 'different password'
  click_button "Criar Usuário"
end

Então("eu devo ver uma mensagem sobre senhas diferentes") do
  expect(page).to have_content "Confirmação de senha não é igual a Senha"
end

Dado("que eu tenho {int} usuários") do |qtd|
  total_users = qtd - User.count
  FactoryBot.create_list(:user, total_users)
  expect(User.count).to eq qtd
end

Quando("eu acessar a página de usuários") do
  visit users_path
end

Então("eu devo visualizar {int} usuários na lista de usuários") do |qtd|
  user_one = User.first
  user_two = User.second
  user_three = User.third
  user_four = User.fourth
  expect(page).to have_content user_one.email
  expect(page).to have_content user_two.email
  expect(page).to have_content user_three.email
  expect(page).to have_content user_four.email
end

Quando("deletar {int} usuário") do |int|
  @deleted_user = User.last
  all('[data-toggle="modal"]').last.click
  all('a.btn-danger').last.click
end

Então("eu não devo visualizar as informações desse usuário") do
  expect(page).not_to have_content @deleted_user.email
  expect(page).to have_content 'Usuário excluído com sucesso!'
end

Dado("que eu acesso a página de atualização do usuário") do
  FactoryBot.create(:user)
  visit users_path
  all('.edit_user').last.click
end

Quando("eu alterar as informações") do
  @updated_user = FactoryBot.build(:user)
  fill_in "user_email", with: @updated_user.email
  fill_in "user_password", with: @updated_user.password
  fill_in "user_password_confirmation", with: @updated_user.password
  click_button "Atualizar Usuário"
end

Então("eu devo visualizar as informações atualizadas desse usuário") do
  expect(page).to have_content @updated_user.email
end
