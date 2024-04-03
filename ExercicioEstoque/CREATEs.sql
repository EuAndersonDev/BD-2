CREATE DATABASE bdEstoque
GO

USE bdEstoque

CREATE DATABASE teste
USE teste

DROP DATABASE bdEstoque

CREATE TABLE tbCliente (
	codCliente INT PRIMARY KEY IDENTITY(1,1)
	,nomeCliente VARCHAR(100) NOT NULL
	,cpfCliente VARCHAR(11) NOT NULL
	,emailCliente VARCHAR(150) NOT NULL
	,sexoCliente CHAR NOT NULL
	,dataNascimentoCliente DATE NOT NULL
);

CREATE TABLE tbVenda (
	codVenda INT PRIMARY KEY IDENTITY(1,1)
	,dataVenda DATE NOT NULL
	,valorTotalVenda FLOAT NOT NULL
	,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
);

CREATE TABLE tbFabricante(
	codFabricante INT PRIMARY KEY IDENTITY(1,1)
	,nomeFabricante VARCHAR(100) NOT NULL
	,contatoFornecedor VARCHAR(100) NOT NULL
);

CREATE TABLE tbFornecedor(
	codFornecedor INT PRIMARY KEY IDENTITY(1,1)
	,contatoFornecedor VARCHAR(100) NOT NULL
);

CREATE TABLE tbProduto(
	codProduto INT PRIMARY KEY IDENTITY(1,1)
	,descricaoProduto VARCHAR(100) NOT NULL
	,valorProduto FLOAT NOT NULL
	,quantidadeProduto INT NOT NULL
	,codFabricante INT FOREIGN KEY REFERENCES tbFabricante(codFabricante)
	,codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(codFornecedor)
);

CREATE TABLE tbItensVenda(
	codItensVenda INT PRIMARY KEY IDENTITY(1,1)
	,codVenda INT FOREIGN KEY REFERENCES tbVenda(codVenda)
	,codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto)
	,quantidadeItensVenda INT NOT NULL
	,subTotalItensVenda INT NOT NULL
);