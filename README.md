# sistema-certificado
<p>
    <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/adrianoavelino/sistema-certificado">
    <a href="https://github.com/my-study-area">
        <img alt="Made by" src="https://img.shields.io/badge/made%20by-adriano%20avelino-gree">
    </a>
    <img alt="Repository size" src="https://img.shields.io/github/repo-size/adrianoavelino/sistema-certificado">
    <a href="https://github.com/EliasGcf/readme-template/commits/master">
    <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/adrianoavelino/sistema-certificado">
    </a>
</p>

<image src="app/assets/images/print-app.png" alt="Imagem da aplicação">

## Começando
### Configuração do ambiente de desenvolvimento
> A configuração do ambiente deve ser executada somente na primeira vez

Execute os passos abaixo para configurar o ambiente de desenvolvimento:
```bash
#clona o projeto
git clone https://github.com/adrianoavelino/sistema-certificado.git

#entra no diretório
cd sistema-certificado

#constrói o container app
docker-compose build

#atualiza o yarn no container app
docker-compose run --rm app yarn install --check-files

#instala as dependências
docker-compose run --rm app bundle install

#configura o banco de dados
docker-compose run --rm app bundle exec rails db:setup
```

### Inicialização da aplicação
```bash
#inicia a aplicação
docker-compose up -d
```

Após incializar os containers, acesse o endereço [http://localhost:3000/users/sign_in](http://localhost:3000/users/sign_in) para ter acesso à aplicação.

Usuário e senha para o primeiro acesso:
| Usuário         | Senha  |
| --------------- | ------ |
| email@email.com | 123123 |

Outros comandos úteis:
```bash
#inicia a aplicação
docker-compose up -d

#para a aplicação
docker-compose stop

#reinicia a aplicação
docker-compose restart

#para os containers e remove os containers, networks, volumes e images criadas pelo comando docker-compose up
docker-compose down
```
