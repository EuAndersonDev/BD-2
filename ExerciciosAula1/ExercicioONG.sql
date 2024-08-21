CREATE DATABASE db_ong
GO

USE db_ong

CREATE TABLE tbStatus (
	idStatus INT PRIMARY KEY IDENTITY(1,1)
	,descricaoStatus VARCHAR(100)  NOT NULL
);

CREATE TABLE tbGenero (
	idGenero INT PRIMARY KEY IDENTITY(1,1)
	,descricaoGenero VARCHAR(100) NOT NULL
);

CREATE TABLE tbCrianca (
	idCrianca INT PRIMARY KEY IDENTITY(1,1)
	,nomeCrianca VARCHAR(150) NOT NULL
	,dtNascCrianca DATE NOT NULL
    	,idStatus INT REFERENCES tbStatus(idStatus)
    	,idGenero INT REFERENCES tbGenero(idGenero)
);

CREATE TABLE tbGenitor (
	idGenitor INT PRIMARY KEY IDENTITY(1,1)
	,nomeGenitor VARCHAR(150) NOT NULL
	,cpfGenitor VARCHAR(14) NOT NULL
);

CREATE TABLE tbFiliacao (
	idFiliacao INT PRIMARY KEY IDENTITY(1,1)
	,idCrianca INT REFERENCES tbCrianca(idCrianca)
	,idGenitor INT REFERENCES tbGenitor(idGenitor)
);

CREATE TABLE tbPadrinho (
	idPadrinho INT PRIMARY KEY IDENTITY(1,1)
	,nomePadrinho VARCHAR(150) NOT NULL
	,cpfPadrinho VARCHAR(14) NOT NULL
	,logradouro VARCHAR(50) NOT NULL
	,numero VARCHAR(5) NOT NULL
	,complemento VARCHAR(20) NOT NULL
	,cep VARCHAR(9) NOT NULL
	,bairro VARCHAR(50) NOT NULL
	,cidade VARCHAR(50) NOT NULL
	,estado VARCHAR(20) NOT NULL
);

CREATE TABLE tbApadrinhamento (
	idApadrinhamento INT PRIMARY KEY IDENTITY(1,1)
	,idCrianca INT REFERENCES tbCrianca(idCrianca)
	,idPadrinho INT REFERENCES tbPadrinho(idPadrinho)
	,dataApadrinhamento DATE NOT NULL
);

CREATE TABLE tbProntuario (
	idProntuario INT PRIMARY KEY IDENTITY(1,1)
	,dataAbertura DATE NOT NULL
	,idCrianca INT REFERENCES tbCrianca(idCrianca)
);

CREATE TABLE tbDoenca (
	idDoenca INT PRIMARY KEY IDENTITY(1,1)
	,cid VARCHAR(9) NOT NULL
	,nomeDoenca VARCHAR(50) NOT NULL
);

CREATE TABLE tbProntuarioDoenca (
	idProntDoenca INT PRIMARY KEY IDENTITY(1,1)
	,idProntuario INT REFERENCES tbProntuario(idProntuario)
	,idDoenca INT REFERENCES tbDoenca(idDoenca)
	,dataProntuario DATE NOT NULL
);

CREATE TABLE tbObservacoes (
	idObs INT PRIMARY KEY IDENTITY(1,1)
	,descricaoObs VARCHAR(200) NOT NULL
	,idCrianca INT REFERENCES tbCrianca(idCrianca)
);
