# language:pt
@gerenciar_evento
Funcionalidade: Gerenciar eventos
  Gerenciar os eventos do sistema
  Como usuário administrador do sistema
  Eu quero gerenciar as informações dos cadastros dos eventos
  Para gerenciar os cadastro de eventos

  Cenário de Fundo:
    Dado que eu sou um usuário cadastrado
    E que eu sou um usuário autenticado

  Cenário: Adicionando um novo evento
    Dado que eu visito a página de cadastro de eventos
    Quando eu enviar as informações do cadastro do evento
    Então eu devo ver uma notificação de evento cadastrado

  Cenário: Adicionando um novo evento com descrção repetida
    Dado que eu visito a página de cadastro de eventos
    Quando eu enviar as informações do cadastro do evento com a descrição repetida
    Então eu devo ver uma notificação de descrição do evento em uso

  Cenário: Visualizando lista de eventos
    Dado que eu tenho 4 eventos
    Quando eu acessar a página de eventos
    Então eu devo visualizar 4 eventos na lista de eventos

  Cenário: Deletando evento
    Dado que eu tenho 2 eventos
    Quando eu acessar a página de eventos
    E deletar um evento
    Então eu não devo visualizar as informações desse evento

  Cenário: Atualizando evento
    Dado que eu acesso a página de atualização do evento
    Quando eu alterar as informações do evento
    Então eu devo visualizar as informações atualizadas desse evento
