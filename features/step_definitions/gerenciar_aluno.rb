Dado("que eu visito a página de cadastro de alunos") do
  visit new_aluno_path
end

Quando("eu enviar as informações do cadastro do aluno") do
  aluno = FactoryBot.build(:aluno)
  preencher_form_aluno(aluno)
  click_button "Criar Aluno"
end

Então("eu devo ver uma notificação de aluno cadastrado") do
  expect(page).to have_content "Aluno cadastrado com sucesso!"
end

Quando("eu enviar as informações do cadastro do aluno com ra repetido") do
  aluno = FactoryBot.create(:aluno)
  preencher_form_aluno(aluno)
  fill_in "aluno_nome", with: aluno.nome
  fill_in "aluno_ra", with: aluno.ra
  click_button "Criar Aluno"
end

Então("eu devo ver uma notificação de ra do aluno em uso") do
  expect(page).to have_content "Ra já está em uso"
end

Dado("que eu tenho {int} alunos") do |qtd|
  FactoryBot.create_list(:aluno, qtd)
  expect(Aluno.count).to eq qtd
end

Quando("eu acessar a página de alunos") do
  visit alunos_path
end

Então("eu devo visualizar {int} alunos na lista de alunos") do |int|
  aluno_um = Aluno.first
  aluno_dois = Aluno.second
  aluno_tres = Aluno.third
  aluno_quatro = Aluno.fourth
  expect(page).to have_content aluno_um.ra
  expect(page).to have_content aluno_dois.ra
  expect(page).to have_content aluno_tres.ra
  expect(page).to have_content aluno_quatro.ra
end

Quando("deletar um aluno") do
  @aluno_deletado = Aluno.last
  all('[data-toggle="modal"]').last.click
  all('a.btn-danger').last.click
end

Então("eu não devo visualizar as informações desse aluno") do
  expect(page).not_to have_content @aluno_deletado.ra
  expect(page).to have_content 'Aluno excluído com sucesso!'
end

Dado("que eu acesso a página de atualização do aluno") do
  FactoryBot.create(:aluno)
  visit alunos_path
  all('.edit_aluno').last.click
end

Quando("eu alterar as informações do aluno") do
  @aluno_atualizado = FactoryBot.build(:aluno)
  preencher_form_aluno(@aluno_atualizado)
  click_button "Atualizar Aluno"
end

Então("eu devo visualizar as informações atualizadas desse aluno") do
  expect(page).to have_content @aluno_atualizado.nome
  expect(page).to have_content @aluno_atualizado.ra
end

def preencher_form_aluno(aluno)
  fill_in "aluno_nome", with: aluno.nome
  fill_in "aluno_ra", with: aluno.ra
end
