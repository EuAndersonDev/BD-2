USE db_EscolaIdiomas

--1

CREATE VIEW vwPreco_Baixo AS
    SELECT codCurso, nomeCurso, cargaHorariaCurso, valorCurso 
    FROM tbl_curso
    WHERE valorCurso < (SELECT AVG(valorCurso) FROM tbl_curso);

--2

SELECT * FROM vwPreco_Baixo
ORDER BY cargaHorariaCurso

--3

CREATE VIEW vwAlunos_Turma AS
	SELECT tbl_turma.nomeTurma, tbl_curso.nomeCurso, COUNT(tbl_matricula.codAluno) AS quantidadeAlunos
	FROM tbl_turma
		INNER JOIN tbl_curso ON tbl_turma.codCurso = tbl_curso.codCurso
			INNER JOIN tbl_matricula ON tbl_turma.codTurma = tbl_matricula.codTurma
	GROUP BY 
		tbl_turma.nomeTurma,
		tbl_curso.nomeCurso;

--4

SELECT nomeTurma, nomeCurso, quantidadeAlunos
FROM vwAlunos_Turma
WHERE quantidadeAlunos = (
    SELECT MAX(quantidadeAlunos)
    FROM vwAlunos_Turma
);

--5

CREATE VIEW vwTurma_Curso AS
	SELECT tbl_Curso.nomeCurso, COUNT(tbl_turma.codTurma) AS qtdTurmas 
	FROM tbl_curso
		LEFT JOIN tbl_turma ON tbl_curso.codCurso = tbl_turma.codCurso --leftjoin pra mostrar caso tenha algum curso sem turma
	GROUP BY
		tbl_curso.nomeCurso;

--6

SELECT nomeCurso, qtdTurmas
FROM vwTurma_Curso
WHERE qtdTurmas = (
	SELECT MIN(qtdTurmas)
	FROM vwTurma_Curso
);
