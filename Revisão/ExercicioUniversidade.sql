CREATE DATABASE bd_universidade
GO
USE bd_universidade		

CREATE TABLE tbCampus (
	codCampus INT PRIMARY KEY IDENTITY(1,1)
	,nomeCampus VARCHAR(200)
	,logradouro VARCHAR(50)
	,numero VARCHAR(5)
	,complemento VARCHAR(20)
	,cep VARCHAR(9)
	,bairro VARCHAR(50)
	,cidade VARCHAR(50)
	,estado VARCHAR(20)
	,telefone VARCHAR(14)
);

CREATE TABLE tbCurso (
	codCurso INT PRIMARY KEY IDENTITY(1,1)
	,nomeCurso VARCHAR(120)
	,descricao VARCHAR(200)
	,codCampus INT FOREIGN KEY REFERENCES tbCampus(codCampus)
);

CREATE TABLE tbDisciplina (
	codDisciplina INT PRIMARY KEY IDENTITY(1,1)
	,nomeDisciplina VARCHAR(120)
	,descricao VARCHAR(200)
);

CREATE TABLE tbProfessor (
	codProfessor INT PRIMARY KEY IDENTITY(1,1)
	,nome VARCHAR(200)
	,email VARCHAR(100)
);

CREATE TABLE tbAluno (
	codAluno INT PRIMARY KEY IDENTITY(1,1)
	,nome VARCHAR(200)
	,email VARCHAR(100)
)

CREATE TABLE tbTurma (
	codTurma INT PRIMARY KEY IDENTITY(1,1)
	,anoFormacao VARCHAR(4)
	,nomeTurma VARCHAR(50)
	,numeroSala VARCHAR(4)
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