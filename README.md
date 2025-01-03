# Desafio de Projeto: Banco de Dados para Oficina Mecânica

## Contexto do Projeto
O objetivo deste projeto é a criação de um banco de dados relacional para o gerenciamento de uma oficina mecânica. O esquema lógico foi projetado para organizar informações essenciais relacionadas a clientes, veículos, ordens de serviço, peças e pagamentos, com foco na eficiência de operações, rastreabilidade de serviços e análise de dados.

## Esquema Lógico do Banco de Dados
O banco de dados é composto pelas seguintes entidades e relacionamentos:

### 1. Entidades Principais
- **Cliente**: Contém dados cadastrais dos clientes, como nome, telefone e endereço.
- **Veículo**: Armazena informações dos veículos dos clientes, incluindo modelo, marca e ano.
- **Ordem_Servico**: Registra as ordens de serviço, com detalhes como descrição, status e valor total.
- **Peca**: Representa as peças disponíveis para os serviços, com informações como nome, preço e estoque.

### 2. Relacionamentos
- **Peca_OS**: Relaciona peças às ordens de serviço, indicando as quantidades utilizadas.
- **Cliente_Veiculo**: Relaciona os clientes aos veículos que possuem.

### 3. Métodos de Pagamento
- **Pagamento**: Registra informações sobre os pagamentos realizados pelos clientes, como método, valor e data.

### Diagrama Lógico
O banco de dados segue uma estrutura que garante a integridade referencial com chaves primárias e estrangeiras. Foi projetado para minimizar redundâncias e permitir consultas eficientes.

## Funcionalidades Suportadas
- Registro e gerenciamento de clientes e seus veículos.
- Emissão e acompanhamento de ordens de serviço.
- Controle de peças utilizadas em cada serviço.
- Registro de pagamentos realizados pelos clientes.
- Relatórios e consultas analíticas para gestão do negócio.

## Queries de Análise de Dados
O projeto suporta diversas consultas para análise e tomada de decisões, como:
- Quantidade de vezes que cada peça foi utilizada em ordens de serviço.
- Valor total gasto pelos clientes em serviços e peças.
- Ordens de serviço pendentes e concluídas.
- Estoque de peças com necessidade de reposição.
- Clientes que possuem mais veículos registrados.

## Estrutura do Repositório
- **`schema.sql`**: Arquivo contendo o esquema lógico do banco de dados.
- **`populate.sql`**: Script para inserir dados fictícios no banco de dados.
- **`queries.sql`**: Conjunto de queries SQL para análise e exploração dos dados.
- **`README.md`**: Este arquivo, com a descrição completa do projeto.
