Dado("que eu visito a página de cadastro de usuários") do
  visit new_usuario_path
end

Quando("eu enviar as informações do cadastro do usuario") do
  @novo_usuario = FactoryBot.build(:usuario)
  fill_in "usuario_email", with: @novo_usuario.email
  fill_in "usuario_password", with: @novo_usuario.password
  click_button "Save"
end

Então("eu devo ver as informações do novo usuario") do
  expect(page).to have_content "Administrador cadastrado com sucesso!"
end
