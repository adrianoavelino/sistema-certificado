Dado("que eu visito a página de cadastro de tipo de certificação") do
  visit new_certification_type_path
end

Quando("eu enviar as informações do cadastro do tipo de certificação") do
  tipo_certificacao = FactoryBot.build(:certification_type)
  preencher_form_tipo_certificacao(tipo_certificacao)
  click_button "Criar Tipo de Certificação"
end

Então("eu devo ver uma notificação de tipo de certificação cadastrado") do
  expect(page).to have_content "Tipo de Certificação cadastrado com sucesso!"
end

Quando("eu enviar as informações do cadastro do tipo de certificação com a descrição repetida") do
  tipo_certificacao = FactoryBot.create(:certification_type)
  preencher_form_tipo_certificacao(tipo_certificacao)
  fill_in "certification_type_description", with: tipo_certificacao.description
  click_button "Criar Tipo de Certificação"
end

Então("eu devo ver uma notificação de descrição do tipo de certificação em uso") do
  expect(page).to have_content "Descrição já está em uso"
end

Dado("que eu tenho {int} tipos de certificação") do |qtd|
  FactoryBot.create_list(:certification_type, qtd)
  expect(CertificationType.count).to eq qtd
end

Quando("eu acessar a página de tipo de certificação") do
  visit certification_types_path
end

Então("eu devo visualizar {int} tipos de certificação na lista de tipo de certificação") do |int|
  tipo_certificacao_um = CertificationType.first
  tipo_certificacao_dois = CertificationType.second
  tipo_certificacao_tres = CertificationType.third
  tipo_certificacao_quatro = CertificationType.fourth
  expect(page).to have_content tipo_certificacao_um.description
  expect(page).to have_content tipo_certificacao_dois.description
  expect(page).to have_content tipo_certificacao_tres.description
  expect(page).to have_content tipo_certificacao_quatro.description
end

Quando("deletar um tipo de certificação") do
  @tipo_certificacao_deletado = CertificationType.last
  all('[data-toggle="modal"]').last.click
  all('a.btn-danger').last.click
end

Então("eu não devo visualizar as informações desse tipo de certificação") do
  expect(page).not_to have_content @tipo_certificacao_deletado.description
  expect(page).to have_content 'Tipo de Certificação excluído com sucesso!'
end

Dado("que eu acesso a página de atualização do tipo de certificação") do
  FactoryBot.create(:certification_type)
  visit certification_types_path
  all('.edit_certification_type').last.click
end

Quando("eu alterar as informações do tipo de certificação") do
  @tipo_certificacao_atualizado = FactoryBot.build(:certification_type)
  preencher_form_tipo_certificacao(@tipo_certificacao_atualizado)
  click_button "Atualizar Tipo de Certificação"
end

Então("eu devo visualizar as informações atualizadas desse tipo de certificação") do
  expect(page).to have_content @tipo_certificacao_atualizado.description
end

def preencher_form_tipo_certificacao(tipo_certificacao)
  fill_in "certification_type_description", with: tipo_certificacao.description
end
