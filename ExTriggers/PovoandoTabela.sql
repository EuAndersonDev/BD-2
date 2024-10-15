USE triggers

INSERT INTO tbMotorista (nomeMotorista, dataNascimento, cpfMotorista, CNHMotorista, pontuacaoAcumulada)
VALUES
('João Silva', '1980-06-15', '12345678901', 'CNH12345', 0),
('Maria Souza', '1990-08-22', '23456789012', 'CNH54321', 0),
('Carlos Pereira', '1975-11-05', '34567890123', 'CNH98765', 0);

INSERT INTO tbVeiculo (modeloVeiculo, placa, renavam, anoVeiculo, idMotorista)
VALUES
('Fiat Uno', 'ABC1234', '00123456789', 2015, 1),  
('Honda Civic', 'DEF5678', '00987654321', 2018, 2),  
('Toyota Corolla', 'GHI9012', '00543218765', 2020, 3);  

INSERT INTO tbMultas (dataMulta, horaMulta, pontosMulta, idVeiculo)
VALUES
('2024-10-15', '12:30', 5, 1),  
('2024-10-16', '15:45', 3, 2),  
('2024-10-17', '09:10', 7, 3);  

/*EX2*/

INSERT INTO tbCliente (nomeCliente, cpfCliente)
VALUES 
('João Silva', '12345678901'),
('Maria Oliveira', '98765432100'),
('Carlos Souza', '45678912300');


INSERT INTO tbContaCorrente (saldoConta, codCliente)
VALUES 
(1000.00, 1), 
(2500.50, 2), 
(1500.75, 3); 


INSERT INTO tbDeposito (valorDeposito, numConta, dataDeposito, horaDeposito)
VALUES
(500.00, 1, '2024-10-15', '10:30'),  
(1000.00, 2, '2024-10-15', '11:00'), 
(200.00, 3, '2024-10-15', '11:15');  


INSERT INTO tbSaque (valorSaque, numConta, dataSaque, horaSaque)
VALUES
(300.00, 1, '2024-10-15', '12:30'),  
(500.00, 2, '2024-10-15', '12:45'),  
(100.00, 3, '2024-10-15', '13:00');  
