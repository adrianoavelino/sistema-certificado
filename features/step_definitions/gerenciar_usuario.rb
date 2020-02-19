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

Dado("que eu tenho {int} usuários") do |qtd|
  total_usuarios = qtd - Usuario.count
  FactoryBot.create_list(:usuario, total_usuarios)
  expect(Usuario.count).to eq qtd
end

Quando("eu acessar a página de usuários") do
  visit usuarios_path
end

Então("eu devo visualizar {int} usuários na lista de usuários") do |qtd|
  usuario_um = Usuario.first
  usuario_dois = Usuario.second
  usuario_tres = Usuario.third
  usuario_quatro = Usuario.fourth
  expect(page).to have_content usuario_um.email
  expect(page).to have_content usuario_dois.email
  expect(page).to have_content usuario_tres.email
  expect(page).to have_content usuario_quatro.email
end

Quando("deletar {int} usuário") do |int|
  @usuario_deletado = Usuario.last
  all('[data-toggle="modal"]').last.click
  all('a.btn-danger').last.click
end

Então("eu não devo visualizar as informações desse usuário") do
  expect(page).not_to have_content @usuario_deletado.email
  expect(page).to have_content 'Usuário excluído com sucesso!'
end

Dado("que eu acesso a página de atualização do usuário") do
  FactoryBot.create(:usuario)
  visit usuarios_path
  all('.edit_usuario').last.click
end

Quando("eu alterar as informações") do
  @usuario_atualizado = FactoryBot.build(:usuario)
  fill_in "usuario_email", with: @usuario_atualizado.email
  fill_in "usuario_password", with: @usuario_atualizado.password
  fill_in "usuario_password_confirmation", with: @usuario_atualizado.password
  click_button "Atualizar Usuário"
end

Então("eu devo visualizar as informações atualizadas desse usuário") do
  expect(page).to have_content @usuario_atualizado.email
end
