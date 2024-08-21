 USE bdEscolaDeIdiomas
 GO

 --a
SELECT nomeCurso, valorCurso
FROM tbCurso
WHERE valorCurso < (SELECT AVG(valorCurso) FROM tbCurso)

--b
SELECT nomeAluno, rgAluno
FROM tbAluno
WHERE dataNascAluno = (SELECT MAX(dataNascAluno) FROM tbAluno)

--c
SELECT nomeAluno
FROM tbAluno
WHERE dataNascAluno = (SELECT MIN(dataNascAluno) FROM tbAluno)

--d
SELECT nomeCurso, valorCurso
FROM tbCurso
WHERE valorCurso = (SELECT MAX(valorCurso) FROM tbCurso)

--e
SELECT a.nomeAluno, c.nomeCurso
FROM tbMatricula m
	INNER JOIN tbAluno a ON m.codAluno = a.codAluno
		INNER JOIN tbTurma t ON m.codTurma = t.codTurma
			INNER JOIN tbCurso c ON t.codCurso = c.codCurso
WHERE m.dataMatricula = (SELECT MAX(dataMatricula) FROM tbMatricula)

--f
SELECT a.nomeAluno
FROM tbMatricula m
	INNER JOIN tbAluno a ON m.codAluno = a.codAluno
WHERE m.dataMatricula = (SELECT MIN(dataMatricula) FROM tbMatricula)

--g
SELECT a.nomeAluno, a.rgAluno, a.dataNascAluno
FROM tbMatricula m
	INNER JOIN tbAluno a ON m.codAluno = a.codAluno
		INNER JOIN tbTurma t ON m.codTurma = t.codTurma
			INNER JOIN tbCurso c ON t.codCurso = c.codCurso
WHERE c.nomeCurso = 'Inglês'
