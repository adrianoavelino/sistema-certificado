# language:pt
@autenticar
Funcionalidade: Autenticação de usuários
  Como usuário do sistema
  Eu quero realizar a autenticação
  Para ter acesso ao sistema

  Cenário: Usuário realiza o login
    Dado que eu sou um usuário cadastrado
    E visito a página de login
    Quando eu enviar as informações de login
    Então eu devo ter acesso ao sistema

  Cenário: Usuário realiza o logoff
    Dado que eu sou um usuário autenticado
    Quando eu clico no link de sair
    Então eu devo acessar a página de login
