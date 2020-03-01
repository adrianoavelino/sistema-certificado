# language:pt
@gerenciar_setor_emissao
Funcionalidade: Gerenciar setor de emissão
  Gerenciar os setores de emissão do sistema
  Como usuário administrador do sistema
  Eu quero gerenciar as informações dos cadastros dos setor de emissão
  Para gerenciar os cadastro de setor de emissão

  Cenário de Fundo:
    Dado que eu sou um usuário cadastrado
    E que eu sou um usuário autenticado

  Cenário: Adicionando um novo setor de emissão
    Dado que eu visito a página de cadastro de setor de emissão
    Quando eu enviar as informações do cadastro do setor de emissão
    Então eu devo ver uma notificação de setor de emissão cadastrado

  Cenário: Adicionando um novo setor de emissão com descrção repetida
    Dado que eu visito a página de cadastro de setor de emissão
    Quando eu enviar as informações do cadastro do setor de emissão com a descrição repetida
    Então eu devo ver uma notificação de descrição do setor de emissão em uso

  Cenário: Visualizando lista de setor de emissão
    Dado que eu tenho 4 setores de emissão
    Quando eu acessar a página de setor de emissão
    Então eu devo visualizar 4 setores de emissão na lista de setor de emissão

  Cenário: Deletando setor de emissão
    Dado que eu tenho 2 setores de emissão
    Quando eu acessar a página de setor de emissão
    E deletar um setor de emissão
    Então eu não devo visualizar as informações desse setor de emissão

  Cenário: Atualizando setor de emissão
    Dado que eu acesso a página de atualização do setor de emissão
    Quando eu alterar as informações do setor de emissão
    Então eu devo visualizar as informações atualizadas desse setor de emissão
