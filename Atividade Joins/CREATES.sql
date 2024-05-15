CREATE DATABASE bd_livraria
GO
USE bd_livraria

CREATE TABLE tbAutor(
	codAutor INT IDENTITY (1,1)PRIMARY KEY
	,nomeAutor VARCHAR (200) NOT NULL
);

CREATE TABLE tbGenero(
	codGenero INT IDENTITY (1,1) PRIMARY KEY
	,nomeGenero VARCHAR (200) NOT NULL
);

CREATE TABLE tbEditora(
	codEditora INT IDENTITY (1,1) PRIMARY KEY
	,nomeEditora VARCHAR (200) NOT NULL
);

CREATE TABLE tbLivro(
	codLivro INT IDENTITY (1,1) PRIMARY KEY
	,nomeLivro VARCHAR (200) NOT NULL
	,numPaginas INT NOT NULL
	,codGenero INT NOT NULL
	,codAutor INT NOT NULL
	,codEditora INT NOT NULL
	,FOREIGN KEY(codGenero)REFERENCES tbGenero (codGenero)
	,FOREIGN KEY(codAutor)REFERENCES tbAutor (codAutor)
	,FOREIGN KEY(codEditora)REFERENCES tbEditora(codEditora)
);

