E("tenho um participante, um evento, um certification_type e um emission_sector cadastrado") do
  @participant = FactoryBot.create(:participant)
  @event = FactoryBot.create(:event)
  @certification_type = FactoryBot.create(:certification_type)
  @emission_sector = FactoryBot.create(:emission_sector)
end

E ("que eu visito a página de cadastro de certificados") do
  visit new_certificate_path
end

Quando("eu enviar as informações do cadastro do certificado") do
  certificate = FactoryBot.build(
    :certificate,
    participant_id: @participant.id,
    event_id: @event.id,
    certification_type_id: @certification_type.id,
    emission_sector_id: @emission_sector.id
  )
  full_certificate_form(certificate)
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
  certificate = FactoryBot.create_list( :certificate, qtd)
  expect(Certificate.count).to eq qtd
end

Dado("eu acessar a página de certificados") do
  visit certificates_path
end

Então("eu devo visualizar {int} certificados na lista de certificados") do |int|
  certificate_um = Certificate.first
  certificate_dois = Certificate.second
  certificate_tres = Certificate.third
  certificate_quatro = Certificate.fourth
  expect(page).to have_content certificate_um.title
  expect(page).to have_content certificate_dois.title
  expect(page).to have_content certificate_tres.title
  expect(page).to have_content certificate_quatro.title
end

Dado("que eu tenho {int} certificado cadastrado") do |int|
  certificate = FactoryBot.create( :certificate)
  expect(Certificate.count).to eq int
end

Quando("deletar um certificado") do
  @deleted_certificate = Certificate.last
  all('[data-toggle="modal"]').last.click
  all('a.btn-danger').last.click
end

Então("eu não devo visualizar as informações desse certificado") do
  expect(page).not_to have_content @deleted_certificate.title
  expect(page).to have_content 'Certificado excluído com sucesso!'
end

Dado("que eu acesso a página de atualização do certificado") do
  FactoryBot.create(:certificate)
  visit certificates_path
  all('.edit_certificate').last.click
end

Quando("eu alterar as informações do certificado") do
  @updated_certificate = FactoryBot.build(
    :certificate,
    participant_id: @participant.id,
    event_id: @event.id,
    certification_type_id: @certification_type.id,
    emission_sector_id: @emission_sector.id
  )
  full_certificate_form(@updated_certificate)
  click_button "Atualizar Certificado"
end

Então("eu devo visualizar as informações atualizadas desse certificado") do
  expect(page).to have_content @updated_certificate.title
end

def full_certificate_form(certificate)
  fill_in "certificate_year", with: certificate.year
  fill_in "certificate_date_issue", with: certificate.date_issue
  select certificate.participant.name, :from => "certificate_participant_id"
  select certificate.event.description, :from => "certificate_event_id"
  fill_in "certificate_title", with: certificate.title
  fill_in "certificate_initial_period", with: certificate.initial_period
  fill_in "certificate_final_period", with: certificate.final_period
  fill_in "certificate_workload", with: certificate.workload
  select certificate.certification_type.description, :from => "certificate_certification_type_id"
  fill_in "certificate_additional_data", with: certificate.additional_data
  select certificate.emission_sector.description, :from => "certificate_emission_sector_id"
  file_path = Rails.root.join("features", "support", "assets", "test.pdf")
  attach_file("certificate_anexo", file_path)
  fill_in "certificate_observation", with: certificate.observation
end

After do
  file_path = Rails.root.join("tmp", "storage")
  FileUtils.rm_rf(file_path)
end
