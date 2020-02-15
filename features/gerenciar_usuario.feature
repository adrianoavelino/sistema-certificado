# language:pt

@gerenciar_usuario
Funcionalidade: Gerenciar usuarios
  Gerenciar os usuários do sistema
  Como usuário administrador do sistema
  Eu quero gerenciar as informações dos cadastros dos outros usuários
  Para colocar as informações corretas no cadastro de certificados

  Cenário de Fundo:
    Dado que eu sou um usuário cadastrado
    E que eu sou um usuário autenticado

  Cenário: Usuário administrador adiciona um novo usuario
    Dado que eu visito a página de cadastro de usuários
    Quando eu enviar as informações do cadastro do usuario
    Então eu devo ver as informações do novo usuario

  Cenário: Usuário administrador adiciona um novo usuario com senhas diferente da confirmação de senha
    Dado que eu visito a página de cadastro de usuários
    Quando eu enviar as informações do cadastro do usuario com senhas diferentes
    Então eu devo ver uma mensagem sobre senhas diferentes
