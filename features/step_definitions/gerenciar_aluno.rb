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

def preencher_form_aluno(aluno)
  fill_in "aluno_nome", with: aluno.nome
  fill_in "aluno_ra", with: aluno.ra
end
