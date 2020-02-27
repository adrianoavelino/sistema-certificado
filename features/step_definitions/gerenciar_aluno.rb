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

def preencher_form_aluno(aluno)
  fill_in "aluno_nome", with: aluno.nome
  fill_in "aluno_ra", with: aluno.ra
end
