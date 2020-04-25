Dado("que eu visito a página de cadastro de eventos") do
  page.find('a', text: "Evento").click
  page.find('a', text: "Adicionar Evento").click
end

Quando("eu enviar as informações do cadastro do evento") do
  event = FactoryBot.build(:event)
  fill_event_form(event)
  click_button "Criar Evento"
end

Então("eu devo ver uma notificação de evento cadastrado") do
  expect(page).to have_content "Evento cadastrado com sucesso!"
end

Quando("eu enviar as informações do cadastro do evento com a descrição repetida") do
  event = FactoryBot.create(:event)
  fill_event_form(event)
  fill_in "event_description", with: event.description
  click_button "Criar Evento"
end

Então("eu devo ver uma notificação de descrição do evento em uso") do
  expect(page).to have_content "Descrição já está em uso"
end

Dado("que eu tenho {int} eventos") do |qtd|
  FactoryBot.create_list(:event, qtd)
  expect(Event.count).to eq qtd
end

Quando("eu acessar a página de eventos") do
  page.find('a', text: "Evento").click
end

Então("eu devo visualizar {int} eventos na lista de eventos") do |int|
  event_um = Event.first
  event_dois = Event.second
  event_tres = Event.third
  event_quatro = Event.fourth
  expect(page).to have_content event_um.description
  expect(page).to have_content event_dois.description
  expect(page).to have_content event_tres.description
  expect(page).to have_content event_quatro.description
end

Quando("deletar um evento") do
  @deleted_event = Event.last
  all('[data-toggle="modal"]').last.click
  all('a.btn-danger').last.click
end

Então("eu não devo visualizar as informações desse evento") do
  expect(page).not_to have_content @deleted_event.description
  expect(page).to have_content 'Evento excluído com sucesso!'
end

Dado("que eu acesso a página de atualização do evento") do
  FactoryBot.create(:event)
  visit events_path
  all('.edit_event').last.click
end

Quando("eu alterar as informações do evento") do
  @updated_event = FactoryBot.build(:event)
  fill_event_form(@updated_event)
  click_button "Atualizar Evento"
end

Então("eu devo visualizar as informações atualizadas desse evento") do
  expect(page).to have_content @updated_event.description
end

def fill_event_form(event)
  fill_in "event_description", with: event.description
end
