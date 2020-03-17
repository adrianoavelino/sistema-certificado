E("tenho um aluno, um evento, um certification_type e um emission_sector cadastrado") do
  @aluno = FactoryBot.create(:aluno)
  @evento = FactoryBot.create(:evento)
  @certification_type = FactoryBot.create(:certification_type)
  @emission_sector = FactoryBot.create(:emission_sector)
end

E ("que eu visito a página de cadastro de certificados") do
  visit new_certificado_path
end

Quando("eu enviar as informações do cadastro do certificado") do
  certificado = FactoryBot.build(
    :certificado,
    aluno_id: @aluno.id,
    evento_id: @evento.id,
    certification_type_id: @certification_type.id,
    emission_sector_id: @emission_sector.id
  )
  preencher_form_certificado(certificado)
  click_button "Criar Certificado"
end

Quando("eu enviar as informações do cadastro do certificado com informações inválidas") do
  click_button "Criar Certificado"
end

Então('devo ver uma notificação de {string}') do | notificacao |
  expect(page).to have_content "#{notificacao}"
end

Então("eu devo ver uma notificação de certificado cadastrado") do
  expect(page).to have_content 'Certificado cadastrado com sucesso!'
end

Dado("que eu tenho {int} certificados") do |qtd|
  certificado = FactoryBot.create_list( :certificado, qtd)
  expect(Certificado.count).to eq qtd
end

Dado("eu acessar a página de certificados") do
  visit certificados_path
end

Então("eu devo visualizar {int} certificados na lista de certificados") do |int|
  certificado_um = Certificado.first
  certificado_dois = Certificado.second
  certificado_tres = Certificado.third
  certificado_quatro = Certificado.fourth
  expect(page).to have_content certificado_um.titulo
  expect(page).to have_content certificado_dois.titulo
  expect(page).to have_content certificado_tres.titulo
  expect(page).to have_content certificado_quatro.titulo
end

Dado("que eu tenho {int} certificado cadastrado") do |int|
  certificado = FactoryBot.create( :certificado)
  expect(Certificado.count).to eq int
end

Quando("deletar um certificado") do
  @certificado_deletado = Certificado.last
  all('[data-toggle="modal"]').last.click
  all('a.btn-danger').last.click
end

Então("eu não devo visualizar as informações desse certificado") do
  expect(page).not_to have_content @certificado_deletado.titulo
  expect(page).to have_content 'Certificado excluído com sucesso!'
end

Dado("que eu acesso a página de atualização do certificado") do
  FactoryBot.create(:certificado)
  visit certificados_path
  all('.edit_certificado').last.click
end

Quando("eu alterar as informações do certificado") do
  @certificado_atualizado = FactoryBot.build(
    :certificado,
    aluno_id: @aluno.id,
    evento_id: @evento.id,
    certification_type_id: @certification_type.id,
    emission_sector_id: @emission_sector.id
  )
  preencher_form_certificado(@certificado_atualizado)
  click_button "Atualizar Certificado"
end

Então("eu devo visualizar as informações atualizadas desse certificado") do
  expect(page).to have_content @certificado_atualizado.titulo
end

def preencher_form_certificado(certificado)
  fill_in "certificado_ano", with: certificado.ano
  fill_in "certificado_data_emissao", with: certificado.data_emissao
  fill_in "certificado_data_emissao", with: certificado.data_emissao
  select certificado.aluno.nome, :from => "certificado_aluno_id"
  select certificado.evento.descricao, :from => "certificado_evento_id"
  fill_in "certificado_titulo", with: certificado.titulo
  fill_in "certificado_periodo_inicial", with: certificado.periodo_inicial
  fill_in "certificado_periodo_final", with: certificado.periodo_final
  fill_in "certificado_carga_horaria", with: certificado.carga_horaria
  select certificado.certification_type.description, :from => "certificado_certification_type_id"
  fill_in "certificado_dados_adicionais", with: certificado.dados_adicionais
  select certificado.emission_sector.description, :from => "certificado_emission_sector_id"
  file_path = Rails.root.join("features", "support", "assets", "test.pdf")
  attach_file("certificado_anexo", file_path)
  fill_in "certificado_observacoes", with: certificado.observacoes
end

After do
  file_path = Rails.root.join("tmp", "storage")
  FileUtils.rm_rf(file_path)
end
