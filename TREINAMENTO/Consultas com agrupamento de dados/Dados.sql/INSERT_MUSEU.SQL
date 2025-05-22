-- Populando TURNOS
INSERT INTO TURNOS (CODTURNO, NOMETURNO) VALUES
('M', 'Manhã'),
('T', 'Tarde'),
('N', 'Noite');

-- Populando FUNCIONARIOS
INSERT INTO FUNCIONARIOS (CPF, TURNO, FUNCAO, NOME, SALARIO) VALUES
('12345678901', 'M', 'Guia', 'Ana Souza', 2500.00),
('23456789012', 'T', 'Conservador', 'Carlos Lima', 3200.50),
('34567890123', 'N', 'Segurança', 'Beatriz Alves', 2000.75);

-- Populando AUTORES
INSERT INTO AUTORES (CODIGO, NOME, NACIONALIDADE) VALUES
(1, 'Vincent van Gogh', 'Holandesa'),
(2, 'Pablo Picasso', 'Espanhola'),
(3, 'Tarsila do Amaral', 'Brasileira');

-- Populando SALOES
INSERT INTO SALOES (NUMERO, AREA, ANDAR) VALUES
(101, 120.50, 1),
(102, 90.00, 1),
(201, 150.75, 2);

-- Populando OBRAS
INSERT INTO OBRAS (CODIGO, TITULO, ANO, SALAO, AUTOR) VALUES
(1, 'Noite Estrelada', 1889, 101, 1),
(2, 'Guernica', 1937, 102, 2),
(3, 'Abaporu', 1928, 201, 3),
(4, 'O Pensador', 1904, 101, 2);

-- Populando PINTURAS
INSERT INTO PINTURAS (CODIGO, ESTILO, AREA) VALUES
(1, 'Pós-Impressionismo', 24.00),
(2, 'Cubismo', 30.00),
(3, 'Modernismo', 18.50);

-- Populando ESCULTURAS
INSERT INTO ESCULTURAS (CODIGO, MATERIAL, PESO, ALTURA) VALUES
(4, 'Bronze', 150.00, 1.80);

-- Populando ALOCACOES
INSERT INTO ALOCACOES (NUMERO, CPF, HORA_ENTRADA, HORA_SAIDA) VALUES
(101, '12345678901', '08:00', '14:00'),
(102, '23456789012', '14:00', '20:00'),
(201, '34567890123', '20:00', '02:00');