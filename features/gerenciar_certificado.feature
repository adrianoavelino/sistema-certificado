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
    E tenho um participante, um evento, um certification_type e um emission_sector cadastrado

  Cenário: Adicionando um novo certificado
    Dado que eu visito a página de cadastro de certificados
    Quando eu enviar as informações do cadastro do certificado
    Então eu devo ver uma notificação de certificado cadastrado

  Cenário: Adicionando um novo certificado em branco
    Dado que eu visito a página de cadastro de certificados
    Quando eu enviar as informações do cadastro do certificado com informações inválidas
    Então devo ver uma notificação de "Ano não pode ficar em branco"
    E devo ver uma notificação de "Participante é obrigatório"
    E devo ver uma notificação de "Evento é obrigatório"
    E devo ver uma notificação de "Ano não pode ficar em branco"
    E devo ver uma notificação de "Data de Emissão não pode ficar em branco"
    E devo ver uma notificação de "Participante é obrigatório"
    E devo ver uma notificação de "Evento é obrigatório"
    E devo ver uma notificação de "Título não pode ficar em branco"
    E devo ver uma notificação de "Período Inicial não pode ficar em branco"
    E devo ver uma notificação de "Período Final não pode ficar em branco"
    E devo ver uma notificação de "Carga Horária não pode ficar em branco"
    E devo ver uma notificação de "Tipo de Certificação é obrigatório"
    E devo ver uma notificação de "Setor de Emissão é obrigatório"
    E devo ver uma notificação de "Anexo não pode ficar em branco"

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
