Dado("que eu visito a página de cadastro de usuários") do
  visit new_usuario_path
end

Quando("eu enviar as informações do cadastro do usuario") do
  @novo_usuario = FactoryBot.build(:usuario)
  fill_in "usuario_email", with: @novo_usuario.email
  fill_in "usuario_password", with: @novo_usuario.password
  fill_in "usuario_password_confirmation", with: @novo_usuario.password
  click_button "Criar Usuário"
end

Então("eu devo ver as informações do novo usuario") do
  expect(page).to have_content "Administrador cadastrado com sucesso!"
end

Quando("eu enviar as informações do cadastro do usuario com senhas diferentes") do
  @novo_usuario = FactoryBot.build(:usuario)
  fill_in "usuario_email", with: @novo_usuario.email
  fill_in "usuario_password", with: @novo_usuario.password
  fill_in "usuario_password_confirmation", with: 'different password'
  click_button "Criar Usuário"
end

Então("eu devo ver uma mensagem sobre senhas diferentes") do
  expect(page).to have_content "Confirmação de senha não é igual a Senha"
end
