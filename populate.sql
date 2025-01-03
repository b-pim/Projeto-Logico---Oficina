-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (Nome, CPF_CNPJ, Endereco, Telefone)
VALUES
('João Silva', '12345678901', 'Rua A, 123', '(11) 99999-1111'),
('Maria Oliveira', '98765432100', 'Av. B, 456', '(11) 98888-2222'),
('Carlos Santos', '45612378902', 'Rua C, 789', '(11) 97777-3333'),
('Ana Costa', '32165498701', 'Av. D, 101', '(11) 96666-4444'),
('Fernanda Lima', '78945612300', 'Rua E, 202', '(11) 95555-5555');

-- Inserindo dados na tabela Veiculo
INSERT INTO Veiculo (idCliente, Placa, Modelo, Marca, Ano)
VALUES
(1, 'ABC1234', 'Gol', 'Volkswagen', '2015'),
(2, 'DEF5678', 'Civic', 'Honda', '2020'),
(3, 'GHI9012', 'Corolla', 'Toyota', '2018'),
(4, 'JKL3456', 'Uno', 'Fiat', '2013'),
(5, 'MNO7890', 'Onix', 'Chevrolet', '2019');

-- Inserindo dados na tabela Equipe
INSERT INTO Equipe (Nome_Equipe)
VALUES
('Equipe A'),
('Equipe B'),
('Equipe C'),
('Equipe D'),
('Equipe E');

-- Inserindo dados na tabela Mecanico
INSERT INTO Mecanico (idEquipe, Nome, Endereco, Especialidade)
VALUES
(1, 'José Almeida', 'Rua F, 303', 'Motor'),
(2, 'Lucas Pereira', 'Av. G, 404', 'Suspensão'),
(3, 'Paulo Henrique', 'Rua H, 505', 'Freios'),
(4, 'Rafael Dias', 'Av. I, 606', 'Elétrica'),
(5, 'Pedro Souza', 'Rua J, 707', 'Pneus');

-- Inserindo dados na tabela Ordem_Servico
INSERT INTO Ordem_Servico (Data_Emissao, Data_Conclusao, Data_Autorizacao, Valor_Total, Status, idVeiculo, idCliente, idEquipe)
VALUES
('2024-01-01', '2024-01-03', '2024-01-02', 1200.00, 'Concluído', 1, 1, 1),
('2024-01-05', NULL, NULL, 0.00, 'Aberto', 2, 2, 2),
('2024-01-10', '2024-01-12', '2024-01-11', 800.00, 'Concluído', 3, 3, 3),
('2024-01-15', NULL, NULL, 0.00, 'Aberto', 4, 4, 4),
('2024-01-20', '2024-01-22', '2024-01-21', 1500.00, 'Concluído', 5, 5, 5);

-- Inserindo dados na tabela Peca
INSERT INTO Peca (Nome, Valor)
VALUES
('Filtro de óleo', 50.00),
('Pastilha de freio', 200.00),
('Correia dentada', 300.00),
('Bateria', 400.00),
('Amortecedor', 600.00);

-- Inserindo dados na tabela Peca_OS
INSERT INTO Peca_OS (idOrdem_Servico, idPeca, Quantidade, Subtotal_Peca)
VALUES
(1, 1, 2, 100.00),
(1, 2, 1, 200.00),
(2, 3, 1, 300.00),
(3, 4, 1, 400.00),
(5, 5, 2, 1200.00);

-- Inserindo dados na tabela Servico
INSERT INTO Servico (Descricao, Valor_Mao_de_Obra)
VALUES
('Troca de óleo', 150.00),
('Substituição de pastilha de freio', 250.00),
('Troca de correia dentada', 350.00),
('Troca de bateria', 450.00),
('Troca de amortecedor', 550.00);

-- Inserindo dados na tabela Servico_OS
INSERT INTO Servico_OS (idServico, idOrdem_Servico, Quantidade, Subtotal_Servico)
VALUES
(1, 1, 1, 150.00),
(2, 1, 1, 250.00),
(3, 3, 1, 350.00),
(4, 5, 1, 450.00),
(5, 5, 1, 550.00);
