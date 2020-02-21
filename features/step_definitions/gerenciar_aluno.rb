Dado("que eu visito a página de cadastro de alunos") do
  visit new_aluno_path
end

Quando("eu enviar as informações do cadastro do aluno") do
  preencher_form_aluno
  click_button "Criar Aluno"
end

Então("eu devo ver uma notificação de aluno cadastrado") do
  expect(page).to have_content "Aluno cadastrado com sucesso!"
end

def preencher_form_aluno
  aluno = FactoryBot.build(:aluno)
  fill_in "aluno_nome", with: aluno.nome
  fill_in "aluno_ra", with: aluno.ra
end
