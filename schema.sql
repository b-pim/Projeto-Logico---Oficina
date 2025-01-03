-- Criação do banco de dados
CREATE DATABASE OS_Oficina;
USE OS_Oficina;

-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    CPF_CNPJ VARCHAR(14) NOT NULL UNIQUE,
    Endereco VARCHAR(100),
    Telefone VARCHAR(15)
);

-- Tabela Veículo
CREATE TABLE Veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    Placa VARCHAR(10) NOT NULL UNIQUE,
    Modelo VARCHAR(45),
    Marca VARCHAR(45),
    Ano VARCHAR(4),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela Equipe
CREATE TABLE Equipe (
    idEquipe INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Equipe VARCHAR(45) NOT NULL
);

-- Tabela Mecânico
CREATE TABLE Mecanico (
    idMecanico INT AUTO_INCREMENT PRIMARY KEY,
    idEquipe INT NOT NULL,
    Nome VARCHAR(45) NOT NULL,
    Endereco VARCHAR(100),
    Especialidade VARCHAR(45),
    FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe)
);

-- Tabela Ordem de Serviço (OS)
CREATE TABLE Ordem_Servico (
    idOS INT AUTO_INCREMENT PRIMARY KEY,
    Data_Emissao DATE NOT NULL,
    Data_Conclusao DATE,
    Data_Autorizacao DATE,
    Valor_Total FLOAT DEFAULT 0,
    Status enum('Aberto', 'Concluído') DEFAULT 'Aberto',
    idVeiculo INT NOT NULL,
    idCliente INT NOT NULL,
    idEquipe INT,
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe)
);

-- Tabela Peça
CREATE TABLE Peca (
    idPeca INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Valor FLOAT NOT NULL
);

-- Tabela Peça_OS
CREATE TABLE Peca_OS (
    idOrdem_Servico INT NOT NULL,
    idPeca INT NOT NULL,
    Quantidade INT NOT NULL,
    Subtotal_Peca FLOAT NOT NULL,
    PRIMARY KEY (idOrdem_Servico, idPeca),
    FOREIGN KEY (idOrdem_Servico) REFERENCES Ordem_Servico(idOS),
    FOREIGN KEY (idPeca) REFERENCES Peca(idPeca)
);

-- Tabela Serviço
CREATE TABLE Servico (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(45) NOT NULL,
    Valor_Mao_de_Obra FLOAT NOT NULL
);

-- Tabela Serviço_OS
CREATE TABLE Servico_OS (
    idServico INT NOT NULL,
    idOrdem_Servico INT NOT NULL,
    Quantidade INT NOT NULL,
    Subtotal_Servico FLOAT NOT NULL,
    PRIMARY KEY (idServico, idOrdem_Servico),
    FOREIGN KEY (idServico) REFERENCES Servico(idServico),
    FOREIGN KEY (idOrdem_Servico) REFERENCES Ordem_Servico(idOS)
);
