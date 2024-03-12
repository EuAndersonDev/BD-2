CREATE DATABASE db_ong
GO

USE db_ong

CREATE TABLE tbStatus (
	idStatus INT PRIMARY KEY IDENTITY(1,1)
	,descricaoStatus VARCHAR(100)
);

CREATE TABLE tbGenero (
	idGenero INT PRIMARY KEY IDENTITY(1,1)
	,descricaoGenero VARCHAR(100)
);

CREATE TABLE tbCrianca (
	idCrianca INT PRIMARY KEY IDENTITY(1,1)
	,nomeCrianca VARCHAR(150)
	,dtNascCrianca DATE
    ,idStatus INT REFERENCES tbStatus(idStatus)
    ,idGenero INT REFERENCES tbGenero(idGenero)
);

CREATE TABLE tbGenitor (
	idGenitor INT PRIMARY KEY IDENTITY(1,1)
	,nomeGenitor VARCHAR(150)
	,cpfGenitor VARCHAR(14)
);

CREATE TABLE tbFiliacao (
	idFiliacao INT PRIMARY KEY IDENTITY(1,1)
	,idCrianca INT REFERENCES tbCrianca(idCrianca)
	,idGenitor INT REFERENCES tbGenitor(idGenitor)
);

CREATE TABLE tbPadrinho (
	idPadrinho INT PRIMARY KEY IDENTITY(1,1)
	,nomePadrinho VARCHAR(150)
	,cpfPadrinho VARCHAR(14)
	,logradouro VARCHAR(50)
	,numero VARCHAR(5)
	,complemento VARCHAR(20)
	,cep VARCHAR(9)
	,bairro VARCHAR(50)
	,cidade VARCHAR(50)
	,estado VARCHAR(20)
);

CREATE TABLE tbApadrinhamento (
	idApadrinhamento INT PRIMARY KEY IDENTITY(1,1)
	,idCrianca INT REFERENCES tbCrianca(idCrianca)
	,idPadrinho INT REFERENCES tbPadrinho(idPadrinho)
	,dataApadrinhamento DATE
);

CREATE TABLE tbProntuario (
	idProntuario INT PRIMARY KEY IDENTITY(1,1)
	,dataAbertura DATE
	,idCrianca INT REFERENCES tbCrianca(idCrianca)
);

CREATE TABLE tbDoenca (
	idDoenca INT PRIMARY KEY IDENTITY(1,1)
	,cid VARCHAR(9)
	,nomeDoenca VARCHAR(50)
);

CREATE TABLE tbProntuarioDoenca (
	idProntDoenca INT PRIMARY KEY IDENTITY(1,1)
	,idProntuario INT REFERENCES tbProntuario(idProntuario)
	,idDoenca INT REFERENCES tbDoenca(idDoenca)
	,dataProntuario DATE
);

CREATE TABLE tbObservacoes (
	idObs INT PRIMARY KEY IDENTITY(1,1)
	,descricaoObs VARCHAR(200)
	,idCrianca INT REFERENCES tbCrianca(idCrianca)
);