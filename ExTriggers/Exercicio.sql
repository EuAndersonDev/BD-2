USE triggers
/*ex1*/
CREATE TRIGGER trAtualizarPontuaçãoMotorista
ON tbMultas
AFTER INSERT
AS
BEGIN
	UPDATE tbMotorista
	SET pontuacaoAcumulada = pontuacaoAcumulada + m.pontosMulta
	FROM tbMotorista AS mot
	INNER JOIN tbVeiculo AS v ON v.idMotorista = mot.idMotorista
	INNER JOIN inserted AS m ON v.idVeiculo = m.idVeiculo;
	DECLARE @pontuacaoAtual INT;

	SELECT @pontuacaoAtual = pontuacaoAcumulada
	FROM tbMotorista AS mot
	INNER JOIN tbVeiculo AS v ON v.idMotorista = mot.idMotorista
	INNER JOIN inserted AS m ON v.idVeiculo = m.idVeiculo;

	IF @pontuacaoAtual >=20
	BEGIN
		PRINT 'Atenção sua habilitação foi suspensa'
	END;
END;

INSERT INTO tbMultas (dataMulta, horaMulta, pontosMulta, idVeiculo)
VALUES ('2024-10-15', '12:41', 10, 1);

/*2*/
CREATE TRIGGER tr_AtualizaSaldoDeposito
ON tbDeposito
AFTER INSERT
AS
BEGIN
    UPDATE tbContaCorrente
    SET saldoConta = saldoConta + inserted.valorDeposito
    FROM tbContaCorrente
    INNER JOIN inserted ON tbContaCorrente.numConta = inserted.numConta;
END;


CREATE TRIGGER tr_AtualizaSaldoSaque
ON tbSaque
AFTER INSERT
AS
BEGIN
    DECLARE @saldoAtual DECIMAL(18, 2);
    DECLARE @valorSaque DECIMAL(18, 2);
    DECLARE @numConta INT;

    SELECT @valorSaque = s.valorSaque, @numConta = s.numConta
    FROM inserted AS s;

    SELECT @saldoAtual = saldoConta
    FROM tbContaCorrente
    WHERE numConta = @numConta;

    IF @saldoAtual >= @valorSaque
    BEGIN
        UPDATE tbContaCorrente
        SET saldoConta = saldoConta - @valorSaque
        WHERE numConta = @numConta;
    END
    ELSE
    BEGIN
        PRINT('Saldo insuficiente para realizar o saque.');
    END;
END;

