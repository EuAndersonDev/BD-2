
USE dbEstoque;
GO


/* Exercício 1 */
SELECT tbProduto.descricaoProduto, tbFabricante.nomeFabricante
FROM tbProduto
	INNER JOIN tbFabricante 
		ON tbProduto.codFabricante = tbFabricante.codFabricante;

/* Exercício 2 */
SELECT tbProduto.descricaoProduto, tbFornecedor.nomeFornecedor
FROM tbProduto
	INNER JOIN tbFornecedor	
		ON tbProduto.codFornecedor = tbFornecedor.codFornecedor;

/* Exercício 3 */
SELECT SUM(tbProduto.quantidadeProduto) as Valor_Produtos, tbFabricante.nomeFabricante  
	FROM tbProduto 
		INNER JOIN tbFabricante 
			ON tbProduto.codFabricante = tbFabricante.codFabricante
	GROUP BY tbFabricante.nomeFabricante
	ORDER BY Valor_Produtos DESC;

/* Exercício 4 */
SELECT SUM(tbVenda.valorTotalVenda) as Valor_Total, tbCliente.nomeCliente 
	FROM tbVenda
		INNER JOIN tbCliente 
			ON tbVenda.codCliente = tbCliente.codCliente
	GROUP BY tbCliente.nomeCliente
	ORDER BY Valor_Total DESC;

/* Exercício 5 */ 
SELECT AVG(tbProduto.valorProduto) as Valor_Media, tbFornecedor.nomeFornecedor 
	FROM tbProduto
		INNER JOIN tbFornecedor 
			ON tbProduto.codFornecedor = tbFornecedor.codFornecedor
	GROUP BY tbFornecedor.nomeFornecedor
	ORDER BY Valor_Media DESC;

/* Exercício 6 */ 
SELECT SUM(tbVenda.valorTotalVenda) as Valor_Total_Venda, tbCliente.nomeCliente as nomes_Cliente
	FROM tbVenda
		INNER JOIN tbCliente 
			ON tbVenda.codCliente = tbCliente.codCliente	
	GROUP BY tbCliente.nomeCliente
	ORDER BY nomes_Cliente ASC;

/* Exercício 7 */
SELECT SUM(tbProduto.valorProduto) as Valor_Total_Produtos, tbFabricante.nomeFabricante as fabricante
	FROM tbProduto
		INNER JOIN tbFabricante 
			ON tbProduto.codFabricante = tbFabricante.codFabricante
	GROUP BY tbFabricante.nomeFabricante
	ORDER BY Valor_Total_Produtos DESC;

/* Exercício 8 */
SELECT AVG(tbProduto.valorProduto) as Valor_Total_Produtos, tbFornecedor.nomeFornecedor as fornecedor
	FROM tbProduto
		INNER JOIN tbFornecedor 
			ON tbProduto.codFornecedor = tbFornecedor.codFornecedor
	GROUP BY tbFornecedor.nomeFornecedor
	ORDER BY Valor_Total_Produtos DESC;

/* Exercício 9 */
SELECT AVG(tbProduto.valorProduto) as Valor_Total_Produtos, tbFornecedor.nomeFornecedor as fornecedor
	FROM tbProduto
		INNER JOIN tbFornecedor 
			ON tbProduto.codFornecedor = tbFornecedor.codFornecedor
	GROUP BY tbFornecedor.nomeFornecedor
	ORDER BY Valor_Total_Produtos DESC;
