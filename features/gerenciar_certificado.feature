# language:pt

@gerenciar_certificado
Funcionalidade: Gerenciar certificados
  Gerenciar os certificados do sistema
  Como usuário administrador do sistema
  Eu quero gerenciar as informações dos cadastros dos certificados
  Para gerenciar os cadastro de certificados

  Cenário de Fundo:
    Dado que eu sou um usuário cadastrado
    E que eu sou um usuário autenticado
    E tenho um aluno, um evento, um certification_type e um emission_sector cadastrado

  Cenário: Adicionando um novo certificado
    Dado que eu visito a página de cadastro de certificados
    Quando eu enviar as informações do cadastro do certificado
    Então eu devo ver uma notificação de certificado cadastrado

  Cenário: Visualizando lista de certificados
    Dado que eu tenho 4 certificados
    E eu acessar a página de certificados
    Então eu devo visualizar 4 certificados na lista de certificados

  Cenário: Deletando certificado
    Dado que eu tenho 1 certificado cadastrado
    Quando eu acessar a página de certificados
    E deletar um certificado
    Então eu não devo visualizar as informações desse certificado

  Cenário: Atualizando certificado
    Dado que eu acesso a página de atualização do certificado
    Quando eu alterar as informações do certificado
    Então eu devo visualizar as informações atualizadas desse certificado
