
USE dbEstoque;
GO


/* 1- Lista as descrições dos produtos ao lado do nome dos fabricantes */
SELECT tbProduto.descricaoProduto, tbFabricante.nomeFabricante
FROM tbProduto
	INNER JOIN tbFabricante 
		ON tbProduto.codFabricante = tbFabricante.codFabricante;

/* 2- Lista as descrições dos produtos ao lado do nome dos fornecedores */
SELECT tbProduto.descricaoProduto, tbFornecedor.nomeFornecedor
FROM tbProduto
	INNER JOIN tbFornecedor	
		ON tbProduto.codFornecedor = tbFornecedor.codFornecedor;

/* 3- Lista a soma das quantidades dos produtos agrupadas pelo nome do fabricante */
SELECT SUM(tbProduto.quantidadeProduto) as Valor_Produtos, tbFabricante.nomeFabricante  
	FROM tbProduto 
		INNER JOIN tbFabricante 
			ON tbProduto.codFabricante = tbFabricante.codFabricante
	GROUP BY tbFabricante.nomeFabricante
	ORDER BY Valor_Produtos DESC;

/* 4- Lista o total das vendas ao lado do nome do cliente */
SELECT SUM(tbVenda.valorTotalVenda) as Valor_Total, tbCliente.nomeCliente 
	FROM tbVenda
		INNER JOIN tbCliente 
			ON tbVenda.codCliente = tbCliente.codCliente
	GROUP BY tbCliente.nomeCliente
	ORDER BY Valor_Total DESC;

/* 5- Lista a média dos preços dos produtos agrupados pelo nome do fornecedor */ 
SELECT AVG(tbProduto.valorProduto) as Valor_Media, tbFornecedor.nomeFornecedor 
	FROM tbProduto
		INNER JOIN tbFornecedor 
			ON tbProduto.codFornecedor = tbFornecedor.codFornecedor
	GROUP BY tbFornecedor.nomeFornecedor
	ORDER BY Valor_Media DESC;

/* 6- Lista todas a soma das vendas agrupadas pelo nome do cliente em ordem alfabética */ 
SELECT SUM(tbVenda.valorTotalVenda) as Valor_Total_Venda, tbCliente.nomeCliente as nomes_Cliente
	FROM tbVenda
		INNER JOIN tbCliente 
			ON tbVenda.codCliente = tbCliente.codCliente	
	GROUP BY tbCliente.nomeCliente
	ORDER BY nomes_Cliente ASC;

/* 7- Lista a soma dos preços dos produtos agrupados pelo nome do fabricante */
SELECT SUM(tbProduto.valorProduto) as Valor_Total_Produtos, tbFabricante.nomeFabricante as fabricante
	FROM tbProduto
		INNER JOIN tbFabricante 
			ON tbProduto.codFabricante = tbFabricante.codFabricante
	GROUP BY tbFabricante.nomeFabricante
	ORDER BY Valor_Total_Produtos DESC;

/* 8- Lista a média dos preços dos produtos agrupados pelo nome do fornecedor */
SELECT AVG(tbProduto.valorProduto) as Valor_Total_Produtos, tbFornecedor.nomeFornecedor as fornecedor
	FROM tbProduto
		INNER JOIN tbFornecedor 
			ON tbProduto.codFornecedor = tbFornecedor.codFornecedor
	GROUP BY tbFornecedor.nomeFornecedor
	ORDER BY Valor_Total_Produtos DESC;

/* 9- Lista a soma das vendas agrupadas pelo nome do produto */
SELECT AVG(tbProduto.valorProduto) as Valor_Total_Produtos, tbFornecedor.nomeFornecedor as fornecedor
	FROM tbProduto
		INNER JOIN tbFornecedor 
			ON tbProduto.codFornecedor = tbFornecedor.codFornecedor
	GROUP BY tbFornecedor.nomeFornecedor
	ORDER BY Valor_Total_Produtos DESC;

/* 10 - Lista a soma das vendas pelo nome do cliente somente das vendas realizadas em fevereiro de 2014 */

SELECT c.nomeCliente, SUM(v.valorTotalVenda) AS totalSales
	FROM tbCliente c
		INNER JOIN tbVenda v ON c.codCliente = v.codCliente
	WHERE MONTH(v.dataVenda) = 2 AND YEAR(v.dataVenda) = 2014
	GROUP BY c.nomeCliente;