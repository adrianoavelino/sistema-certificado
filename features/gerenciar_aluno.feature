# language:pt
@gerenciar_aluno
Funcionalidade: Gerenciar alunos
  Gerenciar os alunos do sistema
  Como usuário administrador do sistema
  Eu quero gerenciar as informações dos cadastros dos alunos
  Para colocar as informações corretas no cadastro de certificados

  Cenário de Fundo:
    Dado que eu sou um usuário cadastrado
    E que eu sou um usuário autenticado

  Cenário: Adicionando um novo aluno
    Dado que eu visito a página de cadastro de alunos
    Quando eu enviar as informações do cadastro do aluno
    Então eu devo ver uma notificação de aluno cadastrado
