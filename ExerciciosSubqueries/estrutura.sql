create database bdEscolaDeIdiomas
use bdEscolaDeIdiomas
go

create table tbAluno(
	codAluno int primary key identity (1,1)
	, nomeAluno varchar (70) not null
	, rgAluno varchar (12) not null
	, cpfAluno varchar (15) not null
	, logradouro varchar (70) not null
	, numero varchar (20) not null
	, complemento varchar (50)
	, cep varchar (9) not null
	, bairro varchar (50) not null
	, cidade varchar (50) not null
	, dataNascAluno smalldatetime not null
)

create table tbTelefoneAluno(
	codTelAlu int primary key identity (1,1)
	, numTelAlu varchar (12) not null
	, codAluno int foreign key references tbAluno(codAluno)
)

create table tbCurso(
	codCurso int primary key identity (1,1)
	, nomeCurso varchar (50) not null
	, valorCurso smallmoney not null
)

create table tbNivel(
	codNivel int primary key identity (1,1)
	, descNivel varchar (50)
)

create table tbPeriodo(
	codPeriodo int primary key identity (1,1)
	, descPeriodo varchar (50) not null
)

create table tbTurma(
	codTurma int primary key identity (1,1)
	, descTurma varchar (50) not null
	, codCurso int foreign key references tbCurso(codCurso)
	, codNivel int foreign key references tbNivel(codNivel)
	, codPeriodo int foreign key references tbPeriodo(codPeriodo)
	, horario smalldatetime not null
	, diaSemana varchar (15) not null
)

create table tbMatricula(
	codMatricula int primary key identity (1,1)
	, dataMatricula smalldatetime not null
	, codAluno int foreign key references tbAluno(codAluno)
	, codTurma int foreign key references tbTurma(codTurma)
)