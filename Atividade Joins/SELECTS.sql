USE bd_livraria
GO

/*Ex1*/
SELECT tbGenero.nomeGenero, COUNT(tbLivro.codLivro) AS Quantidade_de_Livros
	FROM tbGenero
		LEFT JOIN tbLivro 
			ON tbGenero.codGenero = tbLivro.codGenero
	GROUP BY tbGenero.nomeGenero;

/*Ex2*/
SELECT tbAutor.nomeAutor, SUM(tbLivro.numPaginas) AS Soma_de_Paginas
	FROM tbAutor
		LEFT JOIN tbLivro
			ON tbAutor.codAutor =tbLivro.codAutor
		GROUP BY tbAutor.nomeAutor

/*Ex3*/
SELECT tbAutor.nomeAutor, AVG(tbLivro.numPaginas) AS Media_de_Paginas
	FROM tbAutor
		LEFT JOIN tbLivro
			 ON tbAutor.codAutor = tbLivro.codAutor
	GROUP BY tbAutor.nomeAutor
	ORDER BY tbAutor.nomeAutor ASC;

/*Ex4*/
SELECT tbEditora.nomeEditora, COUNT(tbLivro.codLivro) AS Quantidade_de_Livros
	FROM tbEditora
		LEFT JOIN tbLivro 
			ON tbEditora.codEditora = tbLivro.codEditora
	GROUP BY tbEditora.nomeEditora
	ORDER BY tbEditora.nomeEditora DESC;

/*Ex5*/
SELECT tbAutor.nomeAutor, SUM(tbLivro.numPaginas) AS Soma_de_Paginas
	FROM tbAutor
		LEFT JOIN tbLivro 
			ON tbAutor.codAutor = tbLivro.codAutor
		WHERE tbAutor.nomeAutor LIKE 'C%'
	GROUP BY tbAutor.nomeAutor;

/*Ex6*/
SELECT tbAutor.nomeAutor, COUNT(tbLivro.codLivro) AS Quantidade_de_Livros
	FROM tbAutor
		LEFT JOIN tbLivro 
			ON tbAutor.codAutor = tbLivro.codAutor
	WHERE tbAutor.nomeAutor IN ('Machado de Assis', 'Cora Coralina', 'Graciliano Ramos', 'Clarice Lispector')
	GROUP BY tbAutor.nomeAutor;

/*Ex7*/
SELECT tbEditora.nomeEditora, SUM(tbLivro.numPaginas) AS Soma_de_Paginas
	FROM tbEditora
		LEFT JOIN tbLivro 
			ON tbEditora.codEditora = tbLivro.codEditora
	WHERE tbLivro.numPaginas BETWEEN 200 AND 500
	GROUP BY tbEditora.nomeEditora;

/*Ex8*/
SELECT tbLivro.nomeLivro, tbEditora.nomeEditora, tbAutor.nomeAutor
	FROM tbLivro
		INNER JOIN tbEditora 
			ON tbLivro.codEditora = tbEditora.codEditora
		INNER JOIN tbAutor 
			ON tbLivro.codAutor = tbAutor.codAutor;

/*Ex9*/
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor
	FROM tbLivro
		INNER JOIN tbEditora 
			ON tbLivro.codEditora = tbEditora.codEditora
		INNER JOIN tbAutor 
			ON tbLivro.codAutor = tbAutor.codAutor
	WHERE tbEditora.nomeEditora = 'Cia das Letras';

/*Ex10*/
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor
	FROM tbLivro
		INNER JOIN tbAutor 
			ON tbLivro.codAutor = tbAutor.codAutor
	WHERE tbAutor.nomeAutor <> 'Érico Veríssimo';

/*Ex11*/
SELECT tbAutor.nomeAutor, tbLivro.nomeLivro
	FROM tbAutor
		LEFT JOIN tbLivro 
			ON tbAutor.codAutor = tbLivro.codAutor;

/*Ex12*/
SELECT tbAutor.nomeAutor, tbLivro.nomeLivro
	FROM tbLivro
	LEFT JOIN tbAutor 
		ON tbLivro.codAutor = tbAutor.codAutor;

/*Ex13*/
SELECT COALESCE(tbAutor.nomeAutor, 'Autor não cadastrado') AS Nome_do_Autor, tbLivro.nomeLivro
	FROM tbAutor
		FULL JOIN tbLivro 
			ON tbAutor.codAutor = tbLivro.codAutor;

/*Ex14*/
SELECT tbLivro.nomeLivro, 'Ática' AS Editora
	FROM tbLivro;

/*Ex15*/
SELECT tbAutor.nomeAutor
	FROM tbAutor
		LEFT JOIN tbLivro 
			ON tbAutor.codAutor = tbLivro.codAutor
	WHERE tbLivro.codLivro IS NULL;

/*Ex16*/
SELECT tbGenero.nomeGenero
	FROM tbGenero
		LEFT JOIN tbLivro 
			ON tbGenero.codGenero = tbLivro.codGenero
	WHERE tbLivro.codLivro IS NULL;




