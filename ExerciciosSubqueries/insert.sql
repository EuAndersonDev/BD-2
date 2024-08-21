USE bdEscolaDeIdiomas;

INSERT INTO tbAluno(nomeAluno, rgAluno, cpfAluno, logradouro, numero, complemento, cep, bairro, cidade, dataNascAluno)
VALUES
    ('Patrick Lessa Teixeira', '123456789', '12345678900', 'Rua Faultline', '10A', 'casa', '08121210', 'Silverchair Paulista', 'São Paulo', '2002-05-03'),
    ('Igor Morais Da Silva', '123456789', '12345678900', 'Rua Hardwired', '31', 'casa', '08120565', 'Nirvana Paulistano', 'Campo Grande', '2001-02-10'),
    ('Ana Silva', '123456789', '12345678900', 'Rua Blackened', 'Bloco B-10A', 'apartamento', '08121880', 'Bairro do Limoeiro', 'São Paulo', '2003-11-11'),
    ('Icaro Oliva', '123456789', '12345678900', 'Rua Shade', '654', 'casa', '08121770', 'Silverchair Paulista', 'São Paulo', '2001-02-06'),
    ('Beatriz Campos', '123456789', '12345678900', 'Rua Sirens', '789', 'casa', '08121990', 'Vadder Paulista', 'São Paulo', '2001-08-23');

INSERT INTO tbTelefoneAluno(numTelAlu, codAluno)
VALUES 
    ('1125629643', 1),
    ('35962925729', 2),
    ('1186547998', 4);

INSERT INTO tbCurso(nomeCurso, valorCurso)
VALUES
    ('Inglês', 150.99),
    ('Espanhol', 99.99);

INSERT INTO tbNivel(descNivel)
VALUES
    ('Iniciante'),
    ('Intermediário'),
    ('Avançado');

INSERT INTO tbPeriodo(descPeriodo)
VALUES
    ('Manhã'),
    ('Tarde');

INSERT INTO tbTurma(descTurma, codCurso, codNivel, codPeriodo, horario, diaSemana)
VALUES 
    ('Inglês 1A', 1, 1, 1, '07:00:00', 'Sábado'),
    ('Inglês 2A', 1, 2, 2, '13:00:00', 'Sábado'),
    ('Espanhol 1A', 2, 1, 2, '13:00:00', 'Sábado');

INSERT INTO tbMatricula(dataMatricula, codAluno, codTurma)
VALUES
    ('2019-07-18', 1, 1),
    ('2019-01-10', 2, 2),
    ('2019-07-17', 3, 3),
    ('2019-05-24', 4, 1),
    ('2019-01-11', 5, 2);
