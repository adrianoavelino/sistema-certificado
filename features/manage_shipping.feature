# language:pt

@manage_shipping
Funcionalidade: Gerar remessa de certificados
  Gerar remessa de certificados
  Como usuário do sistema
  Eu quero gerar uma remessa de certificados
  Para ter controle dos certificados entregues

  Cenário de Fundo:
    Dado que eu sou um usuário cadastrado
    E que eu sou um usuário autenticado
    E que eu tenho 10 certificados cadastrados

  Cenário: Gerando remessa de certificados por números alternados
    Dado que eu visito a página de Remessa
    Quando eu enviar 2 números alternados de certificados existentes
    Então eu devo ver 2 certificados listados

  Cenário: Gerando remessa de certificados por intervalo de números
    Dado que eu visito a página de Remessa
    Quando eu enviar um intervalo de 5 de certificados
    Então eu devo ver 5 certificados listados

  Cenário: Gerando remessa de certificados por números alternados e intervalo de números
    Dado que eu visito a página de Remessa
    Quando eu enviar 2 números alternados e um intervalo de números 3 de certificados
    Então eu devo ver 5 certificados listados
