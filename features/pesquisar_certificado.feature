# language:pt
@javascript

@pesquisar_certficado
Funcionalidade: Pesquisar certificados
  Pesquisar os certificados cadastrados
  Como usuário administrador do sistema
  Eu quero pesquisar os certificados
  Para ter acesso as informações do certificado de forma rápida

  Cenário de Fundo:
    Dado que eu sou um usuário cadastrado
    E que eu sou um usuário autenticado
    E que eu tenho 5 certificados cadastrados

  Cenário: Pesquisando certificado por Título
    Dado que eu visito a página de pesquisa de certificados
    Quando eu realizar a pesquisa por Título
    Então eu devo ver somente o certificado com Título pesquisado

  Cenário: Pesquisando certificado por Número
    Dado que eu visito a página de pesquisa de certificados
    Quando eu realizar a pesquisa por Número
    Então eu devo ver somente o certificado com Número pesquisado

  Cenário: Pesquisando certificado por ano
    Dado que eu visito a página de pesquisa de certificados
    Quando eu realizar a pesquisa por ano
    Então eu devo ver somente o certificado com ano pesquisado

  Cenário: Pesquisando certificado por Nome
    Dado que eu visito a página de pesquisa de certificados
    Quando eu realizar a pesquisa por Nome
    Então eu devo ver somente o certificado com Nome pesquisado

  Cenário: Pesquisando certificado por Evento
    Dado que eu visito a página de pesquisa de certificados
    Quando eu realizar a pesquisa por Evento
    Então eu devo ver somente o certificado com Evento pesquisado

  Cenário: Pesquisando certificado por Data de Emissão
    Dado que eu visito a página de pesquisa de certificados
    Quando eu realizar a pesquisa por Data de Emissão
    Então eu devo ver somente o certificado com Data de Emissão pesquisada

  Cenário: Pesquisando certificado por Data de Emissão com valor inválido
    Dado que eu visito a página de pesquisa de certificados
    Quando eu realizar a pesquisa por Data de Emissão com valor inválido
    Então devo ver uma notificação de "Data inválida. Exemplo: yyyy-mm-dd"
