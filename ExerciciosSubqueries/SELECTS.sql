USE bdEstoque
GO

--Exercicio 1
SELECT 
    tbProduto.codProduto,
    tbProduto.descricaoProduto,
    tbFabricante.nomeFabricante
FROM 
    tbProduto
INNER JOIN 
    tbFabricante ON tbProduto.codFabricante = tbFabricante.codFabricante
WHERE 
    tbProduto.valorProduto = (SELECT MAX(valorProduto) FROM tbProduto);

--Exercicio 2
SELECT
	tbProduto.descricaoProduto,
	tbFabricante.nomeFabricante,
	tbProduto.valorProduto
FROM
	tbProduto
INNER JOIN
	tbFabricante ON tbProduto.codFabricante = tbFabricante.codFabricante
WHERE
	tbProduto.valorProduto > (SELECT AVG(valorProduto) FROM tbProduto);

--Exercicio 3
SELECT
	tbCliente.nomeCliente,
	tbVenda.valorTotalVenda
FROM
	tbCliente
INNER JOIN
	tbVenda ON tbCliente.codCliente = tbVenda.codCliente
WHERE
	tbVenda.valorTotalVenda > (SELECT AVG(valorTotalVenda) FROM tbVenda);

--Exercicio 4
--oque e classificado como produtos caros?
SELECT 
    descricaoProduto, 
    valorProduto
FROM 
    tbProduto
ORDER BY 
    valorProduto DESC;

--Exercicio 5
--O que é classificado como produtos baratos?
SELECT 
    descricaoProduto, 
    valorProduto
FROM 
    tbProduto
ORDER BY 
    valorProduto ASC;


SELECT * FROM tbProduto
SELECT * FROM tbVenda