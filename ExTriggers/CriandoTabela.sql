CREATE DATABASE triggers
USE triggers
/*EX1*/
CREATE TABLE tbMotorista (
    idMotorista INT PRIMARY KEY IDENTITY(1,1),
    nomeMotorista VARCHAR(100) NOT NULL,
    dataNascimento DATE NOT NULL,
    cpfMotorista CHAR(11) NOT NULL,
    CNHMotorista VARCHAR(20) NOT NULL,
    pontuacaoAcumulada INT DEFAULT 0
);
CREATE TABLE tbVeiculo (
    idVeiculo INT PRIMARY KEY IDENTITY(1,1),
    modeloVeiculo VARCHAR(100) NOT NULL,
    placa CHAR(7) NOT NULL,
    renavam VARCHAR(20) NOT NULL,
    anoVeiculo INT NOT NULL,
    idMotorista INT,
    FOREIGN KEY (idMotorista) REFERENCES tbMotorista(idMotorista)
);
CREATE TABLE tbMultas (
    idMulta INT PRIMARY KEY IDENTITY(1,1),
    dataMulta DATE NOT NULL,
    horaMulta TIME NOT NULL,
    pontosMulta INT NOT NULL,
    idVeiculo INT,
    FOREIGN KEY (idVeiculo) REFERENCES tbVeiculo(idVeiculo)
);

/*EX2*/

CREATE TABLE tbCliente (
    codCliente INT PRIMARY KEY IDENTITY(1,1), 
    nomeCliente VARCHAR(100) NOT NULL,
    cpfCliente CHAR(11) NOT NULL
);


CREATE TABLE tbContaCorrente (
    numConta INT PRIMARY KEY IDENTITY(1,1), 
    saldoConta DECIMAL(18, 2) NOT NULL, 
    codCliente INT NOT NULL, 
    CONSTRAINT FK_tbContaCorrente_tbCliente FOREIGN KEY (codCliente) 
    REFERENCES tbCliente(codCliente)
);


CREATE TABLE tbDeposito (
    codDeposito INT PRIMARY KEY IDENTITY(1,1), 
    valorDeposito DECIMAL(18, 2) NOT NULL, 
    numConta INT NOT NULL, 
    dataDeposito DATE NOT NULL,
    horaDeposito TIME(0) NOT NULL, 
    CONSTRAINT FK_tbDeposito_tbContaCorrente FOREIGN KEY (numConta) 
    REFERENCES tbContaCorrente(numConta)
);


CREATE TABLE tbSaque (
    codSaque INT PRIMARY KEY IDENTITY(1,1),
    valorSaque DECIMAL(18, 2) NOT NULL, 
    numConta INT NOT NULL, 
    dataSaque DATE NOT NULL, 
    horaSaque TIME(0) NOT NULL, 
    CONSTRAINT FK_tbSaque_tbContaCorrente FOREIGN KEY (numConta) 
    REFERENCES tbContaCorrente(numConta)
);
