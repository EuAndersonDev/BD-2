USE dbEstoque
GO

INSERT INTO tbCliente(nomeCliente, cpfCliente, emailCliente, sexoCliente, dataNascimentoCliente) 
VALUES
	('Amanda José Santana', '12345678900', 'amandojsantana@outlook.com', 'M', '1961-02-21')
	,('Sheila Carvalho Real', '45678909823', 'scarvalho@ig.com.br', 'F', '1978-09-13')
	,('Carlos Henrique Souza', '76598278299', 'chenrique@ig.com.br', 'M', '1981-09-08')
	,('Maria Aparecida Souza', '87365309899', 'mapdasouza@outlook.com', 'F', '1962-07-07')
	,('Adriana Nogueira Silva', '76354309388', 'drica1977@ig.com.br', 'F', '1977-04-09')
	,('Paulo Henrique Silva', '87390123111', 'phsilva@hotmail.com', 'M', '1987-02-02');

INSERT INTO tbFabricante(nomeFabricante) 
VALUES
	('Unilever')
	,('P&G')
	,('Bunge');

INSERT INTO tbFornecedor(nomeFornecedor, contatoFornecedor) 
VALUES
	('Atacadão', 'Carlos Santos')
	,('Assai', 'Maria Stella')
	,('Roldão', 'Paulo César');

INSERT INTO tbProduto(descricaoProduto, valorProduto, quantidadeProduto, codFabricante, codFornecedor) 
VALUES
	('Amaciante Downy', 5.56, 1500, 2, 1)
	,('Amaciante Comfort', 5.45, 2300, 1, 1)
	,('Sabão em pó OMO', 5.99, 1280, 1, 2)
	,('Margarina Qually', 4.76, 2500, 3, 1)
	,('Salsicha Hot Dog Sadia', 6.78, 2900, 3, 2)
	,('Mortadela Perdigão', 2.50, 1200, 3, 3)
	,('Hamburguer Sadia', 9.98, 1600, 3, 1)
	,('Fralda Pampers', 36.00, 340, 2, 3)
	,('Xampu Seda', 5.89, 800, 1, 1)
	,('Condicionador Seda', 6.50, 700, 1, 3);

INSERT INTO tbVenda(codCliente, dataVenda, valorTotalVenda) 
VALUES
	(1, '2014-02-01', 4500)
	,(1, '2014-02-03', 3400)
	,(2, '2014-02-10', 2100)
	,(3, '2014-02-15', 2700)
	,(3, '2014-03-17', 560)
	,(4, '2014-04-09', 1200)
	,(5, '2014-05-07', 3500)
	,(1, '2014-05-07', 3400)
	,(2, '2014-05-05', 4000);

INSERT INTO tbItensVenda(codVenda, codProduto, quantidadeItensVenda, subTotalItensVenda) 
VALUES
	(1, 1, 200, 1500)
	,(1, 2, 300, 3000)
	,(2, 4, 120, 1400)
	,(2, 2, 200, 1000)
	,(2, 3, 130, 1000)
	,(3, 5, 200, 2100)
	,(4, 4, 120, 1000)
	,(4, 5, 450, 700)
	,(5, 5, 200, 560)
	,(6, 7, 200, 600)
	,(6, 6, 300, 600)
	,(7, 1, 300, 2500)
	,(7, 2, 200, 1000)
	,(8, 6, 250, 1700)
	,(8, 5, 200, 1700)
	,(9, 4, 1000, 4000);
