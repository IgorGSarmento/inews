# Inews


## Instalação

### Requisitos

- Node 
- NPM ou Yarn
- Flutter

### Instalando o projeto

Entre na pasta **backend** e execute o seguinte comando no terminal:

- ```npm install``` ou ```yarn install```


## Executando o projeto

### Configurando o banco de dados

O banco de dados que foi utilizado nesse projeto, foi o **Postgres**.

Primeiro crie uma database e adicione as informações da conexão no arquivo ```knexfile.ts```, que está na raiz do projeto **backend**.

Para configurar o banco de dados, é só executar os seguintes comandos:

- ```npm run knex:migrate``` ou ```yarn knex:migrate```
(Esse comando executará as migrations que criará as tabelas e os campos no banco)

- ```npm run knex:seed``` ou ```yarn knex:seed```
(Esse comando executará as seeds, que é usada para popular o banco)



### Executando o backend

Para rodar o backend, é só executar os seguintes comandos:

- ```cd backend```
- ```npm run dev``` ou ```yarn dev```


### Executando o mobile

Para rodar o frontend é só executar o seguinte comando:

- ```cd mobile```
- ```flutter run```
