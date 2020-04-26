# language:pt

@manage_participant
Funcionalidade: Gerenciar participantes
  Gerenciar os participantes do sistema
  Como usuário administrador do sistema
  Eu quero gerenciar as informações dos cadastros dos participantes
  Para colocar as informações corretas no cadastro de certificados

  Cenário de Fundo:
    Dado que eu sou um usuário cadastrado
    E que eu sou um usuário autenticado

  Cenário: Adicionando um novo participantes
    Dado que eu visito a página de cadastro de participantes
    Quando eu enviar as informações do cadastro do participante
    Então eu devo ver uma notificação de participante cadastrado

  Cenário: Adicionando um novo participantes com rg repetido
    Dado que eu visito a página de cadastro de participantes
    Quando eu enviar as informações do cadastro do participante com rg repetido
    Então eu devo ver uma notificação de rg do participante em uso

  Cenário: Visualizando lista de participantes
    Dado que eu tenho 4 participantes
    Quando eu acessar a página de participantes
    Então eu devo visualizar 4 participantes na lista de participantes

  Cenário: Deletando participantes
    Dado que eu tenho 2 participantes
    Quando eu acessar a página de participantes
    E deletar um participante
    Então eu não devo visualizar as informações desse participante

  Cenário: Atualizando participantes
    Dado que eu acesso a página de atualização do participante
    Quando eu alterar as informações do participante
    Então eu devo visualizar as informações atualizadas desse participante
