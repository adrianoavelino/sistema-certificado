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

  Cenário: Adicionando um novo aluno com ra repetido
    Dado que eu visito a página de cadastro de alunos
    Quando eu enviar as informações do cadastro do aluno com ra repetido
    Então eu devo ver uma notificação de ra do aluno em uso

  Cenário: Visualizando lista de alunos
    Dado que eu tenho 4 alunos
    Quando eu acessar a página de alunos
    Então eu devo visualizar 4 alunos na lista de alunos

  Cenário: Deletando aluno
    Dado que eu tenho 2 alunos
    Quando eu acessar a página de alunos
    E deletar um aluno
    Então eu não devo visualizar as informações desse aluno
