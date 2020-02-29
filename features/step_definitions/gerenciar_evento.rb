Dado("que eu visito a página de cadastro de eventos") do
  visit new_evento_path
end

Quando("eu enviar as informações do cadastro do evento") do
  evento = FactoryBot.build(:evento)
  preencher_form_evento(evento)
  click_button "Criar Evento"
end

Então("eu devo ver uma notificação de evento cadastrado") do
  expect(page).to have_content "Evento cadastrado com sucesso!"
end

Quando("eu enviar as informações do cadastro do evento com a descrição repetida") do
  evento = FactoryBot.create(:evento)
  preencher_form_evento(evento)
  fill_in "evento_descricao", with: evento.descricao
  click_button "Criar Evento"
end

Então("eu devo ver uma notificação de descrição do evento em uso") do
  expect(page).to have_content "Descrição já está em uso"
end

Dado("que eu tenho {int} eventos") do |qtd|
  FactoryBot.create_list(:evento, qtd)
  expect(Evento.count).to eq qtd
end

Quando("eu acessar a página de eventos") do
  visit eventos_path
end

Então("eu devo visualizar {int} eventos na lista de eventos") do |int|
  evento_um = Evento.first
  evento_dois = Evento.second
  evento_tres = Evento.third
  evento_quatro = Evento.fourth
  expect(page).to have_content evento_um.descricao
  expect(page).to have_content evento_dois.descricao
  expect(page).to have_content evento_tres.descricao
  expect(page).to have_content evento_quatro.descricao
end

Quando("deletar um evento") do
  @evento_deletado = Evento.last
  all('[data-toggle="modal"]').last.click
  all('a.btn-danger').last.click
end

Então("eu não devo visualizar as informações desse evento") do
  expect(page).not_to have_content @evento_deletado.descricao
  expect(page).to have_content 'Evento excluído com sucesso!'
end

Dado("que eu acesso a página de atualização do evento") do
  FactoryBot.create(:evento)
  visit eventos_path
  all('.edit_evento').last.click
end

Quando("eu alterar as informações do evento") do
  @evento_atualizado = FactoryBot.build(:evento)
  preencher_form_evento(@evento_atualizado)
  click_button "Atualizar Evento"
end

Então("eu devo visualizar as informações atualizadas desse evento") do
  expect(page).to have_content @evento_atualizado.descricao
end

def preencher_form_evento(evento)
  fill_in "evento_descricao", with: evento.descricao
end
