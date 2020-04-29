Dado("que eu tenho {int} certificados cadastrados") do |qtd|
  participants = FactoryBot.create_list(:participant, qtd)
  @certificates = FactoryBot.create_list(:certificate, qtd)
  expect(Certificate.count).to eq qtd
end

Dado("que eu visito a página de pesquisa de certificados") do
  click_link "Pesquisa"
end

Quando("eu realizar a pesquisa por Título") do
  @title = @certificates.last.title
  fill_in "term", with: @title
  click_button "Pesquisar"
end

Então("eu devo ver somente o certificado com Título pesquisado") do
  title_one = @certificates.first.title
  title_two = @certificates.second.title
  title_three= @certificates.third.title
  title_four= @certificates.fourth.title
  expect(page).to have_content @title
  expect(page).not_to have_content title_one
  expect(page).not_to have_content title_two
  expect(page).not_to have_content title_three
  expect(page).not_to have_content title_four
end

Quando("eu realizar a pesquisa por Número") do
  @number = @certificates.last.id
  fill_in "term", with: @number
  select 'Número', :from => "type"
  click_button "Pesquisar"
end

Então("eu devo ver somente o certificado com Número pesquisado") do
  number_one = @certificates.first.id
  number_two = @certificates.second.id
  number_three = @certificates.third.id
  number_four = @certificates.fourth.id
  expect(page).to have_content @number
  expect(page).not_to have_content number_one
  expect(page).not_to have_content number_two
  expect(page).not_to have_content number_three
  expect(page).not_to have_content number_four
end

Quando("eu realizar a pesquisa por ano") do
  @year = @certificates.last.year
  fill_in "term", with: @year
  select 'Ano', :from => "type"
  click_button "Pesquisar"
end

Então("eu devo ver somente o certificado com ano pesquisado") do
  number_one = @certificates.first.id
  number_two = @certificates.second.id
  number_three = @certificates.third.id
  number_four = @certificates.fourth.id
  expect(page).to have_content @certificates.last.id
  expect(page).not_to have_content number_one
  expect(page).not_to have_content number_two
  expect(page).not_to have_content number_three
  expect(page).not_to have_content number_four
end

Quando("eu realizar a pesquisa por Nome") do
  @name = @certificates.last.participant.name
  fill_in "term", with: @name
  select 'Nome', :from => "type"
  click_button "Pesquisar"
end

Então("eu devo ver somente o certificado com Nome pesquisado") do
  name_one = @certificates.first.participant.name
  name_two = @certificates.second.participant.name
  name_three = @certificates.third.participant.name
  name_four = @certificates.fourth.participant.name
  expect(page).to have_content @name
  expect(page).not_to have_content name_one
  expect(page).not_to have_content name_two
  expect(page).not_to have_content name_three
  expect(page).not_to have_content name_four
end

Quando("eu realizar a pesquisa por Evento") do
  @event = @certificates.last.event.description
  fill_in "term", with: @event
  select 'Evento', :from => "type"
  click_button "Pesquisar"
end

Então("eu devo ver somente o certificado com Evento pesquisado") do
  number_one = @certificates.first.id
  number_two = @certificates.second.id
  number_three = @certificates.third.id
  number_four = @certificates.fourth.id
  expect(page).to have_content @certificates.last.id
  expect(page).not_to have_content number_one
  expect(page).not_to have_content number_two
  expect(page).not_to have_content number_three
  expect(page).not_to have_content number_four
end

Quando("eu realizar a pesquisa por Data de Emissão") do
  @date_issue = @certificates.last.date_issue
  fill_in "term", with: @date_issue
  select 'Data', :from => "type"
  click_button "Pesquisar"
end

Então("eu devo ver somente o certificado com Data de Emissão pesquisada") do
  number_one = @certificates.first.id
  number_two = @certificates.second.id
  number_three = @certificates.third.id
  number_four = @certificates.fourth.id
  expect(page).to have_content @certificates.last.id
  expect(page).not_to have_content number_one
  expect(page).not_to have_content number_two
  expect(page).not_to have_content number_three
  expect(page).not_to have_content number_four
end

Quando("eu realizar a pesquisa por Data de Emissão com valor inválido") do
  @date_issue = 'dd/mm/yyyy'
  fill_in "term", with: @date_issue
  select 'Data', :from => "type"
  click_button "Pesquisar"
end
