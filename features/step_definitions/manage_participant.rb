Dado("que eu visito a página de cadastro de participantes") do
  visit new_participant_path
end

Quando("eu enviar as informações do cadastro do participante") do
  participant = FactoryBot.build(:participant)
  full_form_participant(participant)
  click_button "Criar Participante"
end

Então("eu devo ver uma notificação de participante cadastrado") do
  expect(page).to have_content "Participante cadastrado com sucesso!"
end

Quando("eu enviar as informações do cadastro do participante com rg repetido") do
  participant = FactoryBot.create(:participant)
  full_form_participant(participant)
  fill_in "participant_name", with: participant.name
  fill_in "participant_rg", with: participant.rg
  click_button "Criar Participante"
end

Então("eu devo ver uma notificação de rg do participante em uso") do
  expect(page).to have_content "RG já está em uso"
end

Dado("que eu tenho {int} participantes") do |qtd|
  FactoryBot.create_list(:participant, qtd)
  expect(Participant.count).to eq qtd
end

Quando("eu acessar a página de participantes") do
  visit participants_path
end

Então("eu devo visualizar {int} participantes na lista de participantes") do |int|
  participant_one = Participant.first
  participant_two = Participant.second
  participant_three = Participant.third
  participant_four = Participant.fourth
  expect(page).to have_content participant_one.rg
  expect(page).to have_content participant_two.rg
  expect(page).to have_content participant_three.rg
  expect(page).to have_content participant_four.rg
end

Quando("deletar um participante") do
  @deleted_participant = Participant.last
  all('[data-toggle="modal"]').last.click
  all('a.btn-danger').last.click
end

Então("eu não devo visualizar as informações desse participante") do
  expect(page).not_to have_content @deleted_participant.rg
  expect(page).to have_content 'Participante excluído com sucesso!'
end

Dado("que eu acesso a página de atualização do participante") do
  FactoryBot.create(:participant)
  visit participants_path
  all('.edit_participant').last.click
end

Quando("eu alterar as informações do participante") do
  @updated_participant = FactoryBot.build(:participant)
  full_form_participant(@updated_participant)
  click_button "Atualizar Participante"
end

Então("eu devo visualizar as informações atualizadas desse participante") do
  expect(page).to have_content @updated_participant.name
  expect(page).to have_content @updated_participant.rg
end

def full_form_participant(participant)
  fill_in "participant_name", with: participant.name
  fill_in "participant_rg", with: participant.rg
end
