Dado("que eu visito a página de cadastro de setor de emissão") do
  visit new_emission_sector_path
end

Quando("eu enviar as informações do cadastro do setor de emissão") do
  setor_emissao = FactoryBot.build(:emission_sector)
  preencher_form_setor_emissao(setor_emissao)
  click_button "Criar Setor de Emissão"
end

Então("eu devo ver uma notificação de setor de emissão cadastrado") do
  expect(page).to have_content "Setor de Emissão cadastrado com sucesso!"
end

Quando("eu enviar as informações do cadastro do setor de emissão com a descrição repetida") do
  setor_emissao = FactoryBot.create(:emission_sector)
  preencher_form_setor_emissao(setor_emissao)
  fill_in "emission_sector_description", with: setor_emissao.description
  click_button "Criar Setor de Emissão"
end

Então("eu devo ver uma notificação de descrição do setor de emissão em uso") do
  expect(page).to have_content "Descrição já está em uso"
end

Dado("que eu tenho {int} setores de emissão") do |qtd|
  FactoryBot.create_list(:emission_sector, qtd)
  expect(EmissionSector.count).to eq qtd
end

Quando("eu acessar a página de setor de emissão") do
  visit emission_sectors_path
end

Então("eu devo visualizar {int} setores de emissão na lista de setor de emissão") do |int|
  setor_emissao_um = EmissionSector.first
  setor_emissao_dois = EmissionSector.second
  setor_emissao_tres = EmissionSector.third
  setor_emissao_quatro = EmissionSector.fourth
  expect(page).to have_content setor_emissao_um.description
  expect(page).to have_content setor_emissao_dois.description
  expect(page).to have_content setor_emissao_tres.description
  expect(page).to have_content setor_emissao_quatro.description
end

Quando("deletar um setor de emissão") do
  @setor_emissao_deletado = EmissionSector.last
  all('[data-toggle="modal"]').last.click
  all('a.btn-danger').last.click
end

Então("eu não devo visualizar as informações desse setor de emissão") do
  expect(page).not_to have_content @setor_emissao_deletado.description
  expect(page).to have_content 'Setor de Emissão excluído com sucesso!'
end

Dado("que eu acesso a página de atualização do setor de emissão") do
  FactoryBot.create(:emission_sector)
  visit emission_sectors_path
  all('.edit_emission_sector').last.click
end

Quando("eu alterar as informações do setor de emissão") do
  @setor_emissao_atualizado = FactoryBot.build(:emission_sector)
  preencher_form_setor_emissao(@setor_emissao_atualizado)
  click_button "Atualizar Setor de Emissão"
end

Então("eu devo visualizar as informações atualizadas desse setor de emissão") do
  expect(page).to have_content @setor_emissao_atualizado.description
end

def preencher_form_setor_emissao(setor_emissao)
  fill_in "emission_sector_description", with: setor_emissao.description
end
