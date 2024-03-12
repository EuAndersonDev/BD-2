CREATE DATABASE db_universidades
GO
USE db_universidades

CREATE TABLE universidades (
	codUniversidade INT PRIMARY KEY IDENTITY(1,1)
	,nomeUniversidade VARCHAR(200)
	,enderecoDaCentral VARCHAR(200)
	,telefone VARCHAR(14)
);

CREATE TABLE campus (
	codCampus INT PRIMARY KEY IDENTITY(1,1)
	,codUniversidade INT REFERENCES universidades(codUniversidade)
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

CREATE TABLE curso (
	codCurso INT PRIMARY KEY IDENTITY(1,1)
	,nomeCurso VARCHAR(120)
	,descricao VARCHAR(200)
	,codCampus INT REFERENCES campus(codCampus)
);

CREATE TABLE disciplina (
	codDisciplina INT PRIMARY KEY IDENTITY(1,1)
	,nomeDisciplina VARCHAR(120)
	,descricao VARCHAR(200)
	,
);

--Criação de tabela curso_disciplina por conta que cada curso possui disciplinas semestrais e uma disciplina pode ser oferecida em mais de um curso

CREATE TABLE curso_disciplina (
	codCursoDisciplina INT PRIMARY KEY IDENTITY(1,1)
	,codCurso INT REFERENCES curso(codCurso)
	,codDisciplina INT REFERENCES disciplina(codDisciplina)
);

CREATE TABLE turma (
	codTurma INT PRIMARY KEY IDENTITY(1,1)
	,anoFormacao VARCHAR(4)
	,numeroSala VARCHAR(4)
	,codCampus INT REFERENCES campus(codCampus)
	,codCurso INT REFERENCES curso(codCurso)
);

CREATE TABLE aluno (
	codAluno INT PRIMARY KEY IDENTITY(1,1)
	,nome VARCHAR(200)
	,email VARCHAR(100)
	,codCampus INT REFERENCES campus(codCampus)
	,codTurma INT REFERENCES turma(codTurma)
)

CREATE TABLE professor (
	codProfessor INT PRIMARY KEY IDENTITY(1,1)
	,nome VARCHAR(200)
	,email VARCHAR(100)
	,codCampus VARCHAR(100)
);

--Tabela de professor e disciplina para resolver essa parte do caso: "Os professores da instituição podem lecionar mais de uma disciplina. Uma mesma disciplina pode ser ministrada por mais de um professor."

CREATE TABLE professor_disciplina (
	codProfessorDisciplina INT PRIMARY KEY IDENTITY(1,1)
	,codProfessor INT REFERENCES professor(codProfessor)
	,codDisciplina INT REFERENCES disciplina(codDisciplina)
	,ano VARCHAR(4)
);
