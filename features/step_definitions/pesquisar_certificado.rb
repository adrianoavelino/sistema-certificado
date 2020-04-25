Dado("que eu tenho {int} certificados cadastrados") do |qtd|
  alunos = FactoryBot.create_list(:aluno, qtd)
  @certificados = FactoryBot.create_list(:certificado, qtd)
  expect(Certificado.count).to eq qtd
end

Dado("que eu visito a página de pesquisa de certificados") do
  click_link "Pesquisa"
end

Quando("eu realizar a pesquisa por Título") do
  @title = @certificados.last.titulo
  fill_in "term", with: @title
  click_button "Pesquisar"
end

Então("eu devo ver somente o certificado com Título pesquisado") do
  titulo_um = @certificados.first.titulo
  titulo_dois = @certificados.second.titulo
  titulo_tres = @certificados.third.titulo
  titulo_quatro = @certificados.fourth.titulo
  expect(page).to have_content @title
  expect(page).not_to have_content titulo_um
  expect(page).not_to have_content titulo_dois
  expect(page).not_to have_content titulo_tres
  expect(page).not_to have_content titulo_quatro
end

Quando("eu realizar a pesquisa por Número") do
  @numero = @certificados.last.id
  fill_in "term", with: @numero
  select 'Número', :from => "type"
  click_button "Pesquisar"
end

Então("eu devo ver somente o certificado com Número pesquisado") do
  numero_um = @certificados.first.id
  numero_dois = @certificados.second.id
  numero_tres = @certificados.third.id
  numero_quatro = @certificados.fourth.id
  expect(page).to have_content @numero
  expect(page).not_to have_content numero_um
  expect(page).not_to have_content numero_dois
  expect(page).not_to have_content numero_tres
  expect(page).not_to have_content numero_quatro
end

Quando("eu realizar a pesquisa por ano") do
  @ano = @certificados.last.ano
  fill_in "term", with: @ano
  select 'Ano', :from => "type"
  click_button "Pesquisar"
end

Então("eu devo ver somente o certificado com ano pesquisado") do
  numero_um = @certificados.first.id
  numero_dois = @certificados.second.id
  numero_tres = @certificados.third.id
  numero_quatro = @certificados.fourth.id
  expect(page).to have_content @certificados.last.id
  expect(page).not_to have_content numero_um
  expect(page).not_to have_content numero_dois
  expect(page).not_to have_content numero_tres
  expect(page).not_to have_content numero_quatro
end

Quando("eu realizar a pesquisa por Nome") do
  @nome = @certificados.last.aluno.nome
  fill_in "term", with: @nome
  select 'Nome', :from => "type"
  click_button "Pesquisar"
end

Então("eu devo ver somente o certificado com Nome pesquisado") do
  nome_um = @certificados.first.aluno.nome
  nome_dois = @certificados.second.aluno.nome
  nome_tres = @certificados.third.aluno.nome
  nome_quatro = @certificados.fourth.aluno.nome
  expect(page).to have_content @nome
  expect(page).not_to have_content nome_um
  expect(page).not_to have_content nome_dois
  expect(page).not_to have_content nome_tres
  expect(page).not_to have_content nome_quatro
end

Quando("eu realizar a pesquisa por Evento") do
  @event = @certificados.last.event.description
  fill_in "term", with: @event
  select 'Evento', :from => "type"
  click_button "Pesquisar"
end

Então("eu devo ver somente o certificado com Evento pesquisado") do
  numero_um = @certificados.first.id
  numero_dois = @certificados.second.id
  numero_tres = @certificados.third.id
  numero_quatro = @certificados.fourth.id
  expect(page).to have_content @certificados.last.id
  expect(page).not_to have_content numero_um
  expect(page).not_to have_content numero_dois
  expect(page).not_to have_content numero_tres
  expect(page).not_to have_content numero_quatro
end

Quando("eu realizar a pesquisa por Data de Emissão") do
  @data_emissao = @certificados.last.data_emissao
  fill_in "term", with: @data_emissao
  select 'Data', :from => "type"
  click_button "Pesquisar"
end

Então("eu devo ver somente o certificado com Data de Emissão pesquisada") do
  numero_um = @certificados.first.id
  numero_dois = @certificados.second.id
  numero_tres = @certificados.third.id
  numero_quatro = @certificados.fourth.id
  expect(page).to have_content @certificados.last.id
  expect(page).not_to have_content numero_um
  expect(page).not_to have_content numero_dois
  expect(page).not_to have_content numero_tres
  expect(page).not_to have_content numero_quatro
end

Quando("eu realizar a pesquisa por Data de Emissão com valor inválido") do
  @data_emissao = 'yyyy-mm-dd'
  fill_in "term", with: @data_emissao
  select 'Data', :from => "type"
  click_button "Pesquisar"
end
