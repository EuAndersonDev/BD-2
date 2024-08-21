CREATE DATABASE bdEscolaIdiomas
GO

USE bdEscolaIdiomas

CREATE TABLE tbAluno (
	codAluno INT IDENTITY(1,1) PRIMARY KEY
	,nomeAluno VARCHAR(100) NOT NULL
	,dataNascAluno DATE NOT NULL
	,rgAluno VARCHAR(9) NOT NULL
	,naturalidadeAluno VARCHAR(2) NOT NULL
);

CREATE TABLE tbCurso (
	codCurso INT IDENTITY(1,1) PRIMARY KEY
	,nomeCurso VARCHAR(30) NOT NULL
	,cargahorariaCurso INT NOT NULL
	,valorCurso FLOAT NOT NULL
);

CREATE TABLE tbTurma (
	codTurma INT IDENTITY(1,1) PRIMARY KEY
	,nomeTurma VARCHAR(10) NOT NULL
	,codCurso INT NOT NULL
	,horarioTurma TIME NOT NULL
	,FOREIGN KEY (codCurso) REFERENCES tbCurso (codCurso)
);

CREATE TABLE tbMatricula (
	codMatricula INT IDENTITY(1,1) PRIMARY KEY
	,dataMatricula DATE NOT NULL
	,codAluno INT NOT NULL
	,codTurma INT NOT NULL
	,FOREIGN KEY (codAluno) REFERENCES tbAluno (codAluno)
	,FOREIGN KEY (codTurma) REFERENCES tbTurma (codTurma)
);