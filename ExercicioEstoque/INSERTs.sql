USE bdEstoque;
GO

INSERT INTO tbCliente(nomeCliente, cpfCliente, emailCliente, senhaCliente, sexoCliente, dataNascimentoCliente) 
VALUES 
	('Armando Jose Santana', '12345678900', 'armandojsantana@outlook.com', 'senha123', 'M', '1961-02-21')
	,('Shela Carvalho Leal', '45678909823', 'acarvalho@ig.com.br', 'senha456', 'F', '1978-09-13')
	,('Carlos Henrique Souza', '76598278299', 'chenrique@ig.com.br', 'senha789', 'M', '1981-09-08')
	,('Maria Aparecida Souza', '87365309899', 'mapdasouza@outlook.com', 'senha101112', 'F', '1962-07-07')
	,('Adriana Nogueira Silva', '76354309388', 'drica1977@ig.com.br', 'senha131415', 'F', '1977-04-09')
	,('Paulo Henrique Silva', '87390123111', 'phaiva80@hotmail.com', 'senha161718', 'M', '1987-02-02');


INSERT INTO tbFabricante (nomeFabricante) 
VALUES 
	('Uniever')
	,('P&G')
	,('Bunge');

INSERT INTO tbFornecedor (nomeFornecedor, contatoFornecedor) 
VALUES 
	('Atacadão', 'Carlos Santos')
	,('Asaa', 'Maria Stella')
	,('Roldão', 'Paulo Céear');

INSERT INTO tbProduto (valorProduto, quantidadeProduto, codFabricante, codFornecedor) 
VALUES 
	('Amaciante Downy', 5.76, 1500, 2,1)
	,('Amaciante Confort', 4.45, 2300,1,1)
	,('Sabão em pó OMO', 5.99, 1500, 1, 2)
	,('Margaina Qualy', 4.76, 2500, 3,1)
	,('Salsicha Hot Dog Sadia', 6.78, 2900, 3, 2)
	,('Mortadela Perdigão', 2.50, 1200, 3, 3)
	,('Hamburguer Sadia', 9.89, 1600, 3,1)
	,('Fralda Pampers', 36.00, 340, 2, 3)
	,('Xampu Seda', 5.89, 800, 1,2)
	,('Condicionador Seda', 6.50, 700, 1, 3);

INSERT INTO tbVenda (dataVenda, valorTotalVenda, codCliente) 
VALUES 
	('01-02-2014', 4500.00, 1)
	,('03-02-2014', 3400, 1)
	,('10-02-2014', 2100, 2)
	,('15-02-2014', 2700, 3)
	,('17-03-2014', 560, 3)
	,('09-04-2014', 1200, 4)
	,('07-05-2014', 3500, 5)
	,('07-05-2014', 3400, 1)
	,('05-05-2014', 4000, 2);

INSERT INTO tbItensVenda (codVenda, codProduto, quantidadeItensVenda)
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
	,(8, 1, 300, 2500)
	,(8, 2, 200, 1000)
	,(9, 6, 250, 1700)
	,(9, 5, 200, 1700)
	,(10, 4, 1000, 4000);
