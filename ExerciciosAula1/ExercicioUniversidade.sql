CREATE DATABASE db_universidades
GO

USE db_universidades

CREATE TABLE tbCampus (
	codCampus INT PRIMARY KEY IDENTITY(1,1)
	,nomeCampus VARCHAR(200) NOT NULL
	,logradouro VARCHAR(50) NOT NULL
	,numero VARCHAR(5) NOT NULL
	,complemento VARCHAR(20) NOT NULL
	,cep VARCHAR(9) NOT NULL
	,bairro VARCHAR(50) NOT NULL
	,cidade VARCHAR(50) NOT NULL
	,estado VARCHAR(20) NOT NULL
	,telefone VARCHAR(14) NOT NULL
);

CREATE TABLE tbCurso (
	codCurso INT PRIMARY KEY IDENTITY(1,1)
	,nomeCurso VARCHAR(120) NOT NULL
	,descricao VARCHAR(200) NOT NULL
	,codCampus INT FOREIGN KEY REFERENCES tbCampus(codCampus)
);

CREATE TABLE tbDisciplina (
	codDisciplina INT PRIMARY KEY IDENTITY(1,1)
	,nomeDisciplina VARCHAR(120) NOT NULL
	,descricao VARCHAR(200) NOT NULL
);

CREATE TABLE tbProfessor (
	codProfessor INT PRIMARY KEY IDENTITY(1,1)
	,nome VARCHAR(200) NOT NULL
	,email VARCHAR(100) NOT NULL
);

CREATE TABLE tbAluno (
	codAluno INT PRIMARY KEY IDENTITY(1,1)
	,nome VARCHAR(200) NOT NULL
	,email VARCHAR(100) NOT NULL
)

CREATE TABLE tbTurma (
	codTurma INT PRIMARY KEY IDENTITY(1,1)
	,anoFormacao VARCHAR(4) NOT NULL
	,nomeTurma VARCHAR(50) NOT NULL
	,numeroSala VARCHAR(4) NOT NULL
	,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso)
);

CREATE TABLE tbMatricula (
	codMatricula INT PRIMARY KEY IDENTITY(1,1)
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
);

CREATE TABLE tbAtribuicao (
	codAtribuicao INT PRIMARY KEY IDENTITY (1,1)
	,codProfessor INT FOREIGN KEY REFERENCES tbProfessor(codProfessor)
	,codDisciplina INT FOREIGN KEY REFERENCES tbDisciplina(codDisciplina) 
	,codTurma INT FOREIGN KEY  REFERENCES tbTurma(codTurma)
);
