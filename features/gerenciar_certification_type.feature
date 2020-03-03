# language:pt
@gerenciar_tipo_certificacao
Funcionalidade: Gerenciar tipo de certificação
  Gerenciar os tipos de certificação do sistema
  Como usuário administrador do sistema
  Eu quero gerenciar as informações dos cadastros dos tipos de certificação
  Para gerenciar os cadastro dos tipos de certificação

  Cenário de Fundo:
    Dado que eu sou um usuário cadastrado
    E que eu sou um usuário autenticado

  Cenário: Adicionando um novo tipo de certificação
    Dado que eu visito a página de cadastro de tipo de certificação
    Quando eu enviar as informações do cadastro do tipo de certificação
    Então eu devo ver uma notificação de tipo de certificação cadastrado

  Cenário: Adicionando um novo tipo de certificação com descrção repetida
    Dado que eu visito a página de cadastro de tipo de certificação
    Quando eu enviar as informações do cadastro do tipo de certificação com a descrição repetida
    Então eu devo ver uma notificação de descrição do tipo de certificação em uso

  Cenário: Visualizando lista de tipo de certificação
    Dado que eu tenho 4 tipos de certificação
    Quando eu acessar a página de tipo de certificação
    Então eu devo visualizar 4 tipos de certificação na lista de tipo de certificação

  Cenário: Deletando tipo de certificação
    Dado que eu tenho 2 tipos de certificação
    Quando eu acessar a página de tipo de certificação
    E deletar um tipo de certificação
    Então eu não devo visualizar as informações desse tipo de certificação

  Cenário: Atualizando tipo de certificação
    Dado que eu acesso a página de atualização do tipo de certificação
    Quando eu alterar as informações do tipo de certificação
    Então eu devo visualizar as informações atualizadas desse tipo de certificação
