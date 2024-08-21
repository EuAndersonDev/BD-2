CREATE DATABASE bdRecursosHumanos
USE bdRecursosHumanos

CREATE TABLE tbDepartamento (
	codDepartamento INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	nomeDepartamento VARCHAR(45) NOT NULL
);

CREATE TABLE tbFuncionario (
	codFuncionario INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	nomeFuncionario VARCHAR(80) NOT NULL,
	cpfFuncionario VARCHAR(11) NOT NULL,
	sexoFuncionario CHAR NOT NULL,
	dataNascimentoFuncionario DATE NOT NULL,
	salarioFuncionario INT NOT NULL,
	codDepartamento INT FOREIGN KEY REFERENCES tbDepartamento(codDepartamento)
);

CREATE TABLE tbDependente (
	codDependente INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	nomeDependente VARCHAR(45) NOT NULL,
	dataNascimentoDependente DATE NOT NULL,
	sexoDependente CHAR NOT NULL,
	codFuncionario INT FOREIGN KEY REFERENCES tbFuncionario(codFuncionario)
);



INSERT INTO tbDepartamento (nomeDepartamento) VALUES ('Compras');
INSERT INTO tbDepartamento (nomeDepartamento) VALUES ('Vendas');
INSERT INTO tbDepartamento (nomeDepartamento) VALUES ('TI');
INSERT INTO tbDepartamento (nomeDepartamento) VALUES ('Marketing');

INSERT INTO tbFuncionario (nomeFuncionario, cpfFuncionario, sexoFuncionario, dataNascimentoFuncionario, salarioFuncionario, codDepartamento) VALUES 
('Maria Luisa Moura', '12345678900', 'F', '1990-02-10 00:00:00', 3400.00, 1),
('Mariana Goulart', '4567890299', 'F', '1991-04-08 00:00:00', 2800.00, 1),
('Pedro Paulo Vidigal', '64587222388', 'M', '1994-05-07 00:00:00', 5400.00, 2),
('Carlos Calixto', '83738223233', 'M', '1965-03-03 00:00:00', 8900.00, 2),
('Viviane Martins', '77832233399', 'F', '1976-06-06 00:00:00', 4300.00, 3),
('Analice Mendes', '83703383493', 'F', '1981-09-09 00:00:00', 6800.00, 3),
('Patricia Ishikawa', '43356609300', 'F', '1978-05-05 00:00:00', 4900.00, 4);

INSERT INTO tbDependente (nomeDependente, dataNascimentoDependente, sexoDependente, codFuncionario) VALUES 
('Lucas Moura', '2015-01-10', 'M', 1),
('Carlos Calixto Jr', '2000-06-08', 'M', 4),
('Michele Costa Calixto', '2003-09-09', 'F', 4),
('Silvana Costa Calixto', '2006-04-04', 'F', 4),
('Arthur Mendes Silva', '2010-07-07', 'M', 6);

