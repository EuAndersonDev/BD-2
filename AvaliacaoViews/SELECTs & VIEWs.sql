USE bdRecursosHumanos

GO
--a) Criar uma view para exibir a quantidade de funcionários por nome de departamento;
CREATE VIEW vwFuncionariosDepartamento AS 
	SELECT tbDepartamento.nomeDepartamento, COUNT(codFuncionario) AS qtdeFuncionarios 
	FROM tbDepartamento
		INNER JOIN tbFuncionario ON tbDepartamento.codDepartamento = tbFuncionario.codDepartamento
	GROUP BY
		tbDepartamento.nomeDepartamento;

GO
--b)Usando a view anterior, exibir somente o nome do departamento que possui o menor número de funcionários
SELECT nomeDepartamento 
FROM vwFuncionariosDepartamento 
WHERE qtdeFuncionarios = (SELECT MIN(qtdeFuncionarios) FROM vwFuncionariosDepartamento);

GO
--c) Criar uma view para exibir a soma dos salários por nome de departamento
CREATE VIEW vwSalarioDepartamento AS
    SELECT tbDepartamento.nomeDepartamento, SUM(tbFuncionario.salarioFuncionario) AS somaSalario
    FROM tbDepartamento
		INNER JOIN tbFuncionario ON tbDepartamento.codDepartamento = tbFuncionario.codDepartamento
    GROUP BY tbDepartamento.nomeDepartamento;

GO
--d) Utilizando a view do exercício anterior, mostrar somente a maior soma dentre os departamentos

SELECT nomeDepartamento, somaSalario
FROM vwSalarioDepartamento
WHERE somaSalario = (SELECT MAX(somaSalario) FROM vwSalarioDepartamento);

GO
--e)Criar uma view para exibir somente o nome dos funcionários e o nome dos departamentos daqueles funcionários que não possuem dependentes

CREATE VIEW vwFuncionarios AS
	SELECT tbFuncionario.nomeFuncionario, tbDepartamento.nomeDepartamento 
	FROM tbFuncionario
		INNER JOIN tbDepartamento ON tbFuncionario.codDepartamento = tbDepartamento.codDepartamento
			LEFT JOIN tbDependente ON tbFuncionario.codFuncionario = tbDependente.codFuncionario
	WHERE tbDependente.codDependente IS NULL
	GROUP BY tbFuncionario.nomeFuncionario, tbDepartamento.nomeDepartamento;

GO
--f)Criar uma view que exiba a quantidade de dependentes por nome de funcionário

CREATE VIEW vwQtdeDependentesFuncionarios AS
	SELECT tbFuncionario.nomeFuncionario, COUNT(tbDependente.codDependente) AS qtdeDependentes
	FROM tbFuncionario 
		LEFT JOIN tbDependente ON tbFuncionario.codFuncionario = tbDependente.codFuncionario
	GROUP BY tbFuncionario.nomeFuncionario;

GO
--g)Utilizando a view anterior, mostrar somente o nome do funcionário que possui mais dependentes

SELECT TOP 1 nomeFuncionario
	FROM vwQtdeDependentesFuncionarios
	ORDER BY qtdeDependentes DESC;

GO
--h) Criar uma view para exibir a quantidade de dependentes por departamento

CREATE VIEW vwQtdeDependentesDepartamento AS 
	SELECT tbDepartamento.nomeDepartamento, COUNT(tbDependente.codDependente) AS qtdeDependentes
	FROM tbDepartamento
		INNER JOIN tbFuncionario ON tbDepartamento.codDepartamento = tbFuncionario.codDepartamento
			LEFT JOIN tbDependente ON tbFuncionario.codFuncionario = tbDependente.codFuncionario
		GROUP BY
			tbDepartamento.nomeDepartamento
GO

--i)Utilizando a view do exercício anterior, apresentar a soma geral dos dependentes
SELECT SUM(qtdeDependentes) AS 'Soma geral dependentes' 
FROM vwQtdeDependentesDepartamento

SELECT * FROM tbDepartamento
SELECT * FROM tbFuncionario
SELECT * FROM tbDependente
