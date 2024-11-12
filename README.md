# Gerenciador de Ordens de Serviço

## Rodando o Sistema

### Passo 1a: Iniciando a API Com Docker

1. Entre na pasta do projeto.
2. Inicie a API com o docker.

```bash
docker-compose up
```

### Passo 1b: Iniciando a API Sem Docker

1. Entre na pasta do projeto.
2. Inicie a API.

```bash
# Instalar as dependências
bundle install

# Configurar o banco
rails db:prepare

# Iniciar a API
rails s
```

## Criando Conta de Diretor e Logando

### Passo 1: Criando Conta de Diretor

1. [Acesse o sistema](http://localhost:3000/directors/sign_up).
2. Preencha os campos obrigatórios com as informações do diretor, incluindo nome, e-mail e senha.
3. Clique em "Sign up" para criar a conta.

### Passo 2: Cadastrando a Empresa

1. Preencha os campos obrigatórios com as informações da empresa, incluindo nome e CNPJ.
2. Clique em "Criar Company".

### Passo 3: Logando

1. Pronto, você foi redirecionado para a página inicial já logado.

## Criando Conta de Funcionário

### Opcional: Logue como Diretor

1. Clique em "Sign in Director" na tela inicial ou acesse o [link direto](http://localhost:3000/directors/sign_in).
2. Preencha os campos obrigatórios com as informações de login do diretor, incluindo e-mail e senha.
3. Clique no botão "Log in".

### Passo 1: Criando a Conta de Funcionário

1. [Acesse o sistema](http://localhost:3000/).
2. Clique em "Create Employee".
3. Preencha os campos as informações do funcionário.
3. Clique em "Criar Employee".

## Criando a Ordem de Serviço

### Passo 1: Logando como Funcionário

1. Clique em "Sign in Employee" na tela inicial ou acesse o [link direto](http://localhost:3000/employees/sign_in).
2. Preencha os campos obrigatórios com as informações de login do funcionário, incluindo e-mail e senha.
3. Clique no botão "Log in".

### Passo 3: Criando a Ordem de Serviço

1. Clique em "Create Service Order" na tela inicial ou acesse o [link direto](http://localhost:3000/service_orders/new).
2. Preencha os campos com as informações da ordem de serviço.
3. Clique em "Criar Service Order".

## Abrindo o Dashboard

### Opcional: Logue como Diretor

1. Clique em "Sign in Director" na tela inicial ou acesse o [link direto](http://localhost:3000/directors/sign_in).
2. Preencha os campos obrigatórios com as informações de login do diretor, incluindo e-mail e senha.
3. Clique no botão "Log in".

### Passo 1: Abrindo o Dashboard

1. Clique em "Open Dashboard" na tela inicial ou acesse o [link direto](http://localhost:3000/dashboard).
3. Você verá os filtros para as métricas de Funcionários e de Ordem de Serviços.

## Criando a Ordem de Serviço via API

### Passo 1: Obtendo o token

```bash
curl --location 'http://localhost:3000/api/v1/login' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email": "e2@e.com",
    "password": "123123"
}'
```

Retorno:
```json
{"authentication_token":"a9f25973da702305914713e5d5f17840e33ddc92","message":"Login successful"}
```

### Passo 2: Criando a Ordem de serviço

```bash
curl --location 'http://localhost:3000/api/v1/service_orders' \
--header 'Authorization: a9f25973da702305914713e5d5f17840e33ddc92' \
--header 'Content-Type: application/json' \
--data '{
    "service_order": {
        "client_name": "Cliente teste",
        "status": "open",
        "description": "exemplo"
    }
}'
```

Retorno:
```json
{
    "data": {
        "id": 5,
        "status": "open",
        "client_name": "Cliente teste",
        "description": "exemplo",
        "completed_at": null,
        "employee_id": 1,
        "company_id": 1,
        "created_at": "2024-11-12T18:34:56.111Z",
        "updated_at": "2024-11-12T18:34:56.111Z"
    }
}
```