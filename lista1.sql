CREATE TABLE nomes (
    nome VARCHAR(50)
);

INSERT INTO nomes (nome)
VALUES
    ('Roberta'),
    ('Roberto'),
    ('Maria Clara'),
    ('João');

SELECT UPPER(nome) FROM nomes

SELECT nome, LENGTH(nome) AS tamanho FROM nomes;

SELECT
    CASE
        WHEN nome LIKE '%Maria%' THEN CONCAT('Sra. ', nome)
        ELSE CONCAT('Sr. ', nome)
    END AS nome_formatado
FROM nomes;


CREATE TABLE produtos (
    produto VARCHAR(50),
    preco DECIMAL(10, 2),
    quantidade INT
);

INSERT INTO produtos (produto, preco, quantidade)
VALUES
    ('Produto A', 10.50, 5),
    ('Produto B', 20.75, 3),
    ('Produto C', 15.00, 0);

SELECT produto, ROUND(preco, 2) AS preco_arredondado FROM produtos;

SELECT produto, ABS(quantidade) AS quantidade_absoluta FROM produtos;

SELECT AVG(preco) AS media_precos FROM produtos;


CREATE TABLE eventos (
    data_evento DATE
);

INSERT INTO eventos (data_evento)
VALUES
    ('2023-01-15'),
    ('2023-02-20'),
    ('2023-03-10');

INSERT INTO eventos (data_evento)
VALUES (NOW());

SELECT DATEDIFF('2023-03-10', '2023-01-15') AS dias_entre_datas FROM eventos;

SELECT data_evento, DAYNAME(data_evento) AS dia_da_semana FROM eventos;


SELECT produto,
    IF(quantidade > 0, 'Em estoque', 'Fora de estoque') AS status_estoque
FROM produtos;

SELECT produto,
    CASE
        WHEN preco < 15.00 THEN 'Barato'
        WHEN preco >= 15.00 AND preco < 25.00 THEN 'Médio'
        ELSE 'Caro'
    END AS categoria_preco
FROM produtos;


CREATE FUNCTION TOTAL_VALOR(preco DECIMAL(10, 2), quantidade INT)
RETURNS DECIMAL(10, 2)
BEGIN
    RETURN preco * quantidade;
END;

SELECT produto, quantidade, TOTAL_VALOR(preco, quantidade) AS valor_total FROM produtos;


SELECT COUNT(*) AS total_produtos FROM produtos;

SELECT produto, MAX(preco) AS produto_mais_caro FROM produtos;

SELECT produto, MIN(preco) AS produto_mais_barato FROM produtos;

SELECT SUM(IF(quantidade > 0, preco, 0)) AS soma_total_em_estoque FROM produtos;


CREATE FUNCTION FATORIAL(n INT)
RETURNS INT
BEGIN
    DECLARE resultado INT DEFAULT 1;
    DECLARE i INT DEFAULT 1;

    WHILE i <= n DO
        SET resultado = resultado * i;
        SET i = i + 1;
    END WHILE;

    RETURN resultado;
END;

CREATE FUNCTION EXPONENCIAL(base DECIMAL(10, 2), expoente INT)
RETURNS DECIMAL(10, 2)
BEGIN
    RETURN POWER(base, expoente);
END;

CREATE FUNCTION E_PALINDROMO(palavra VARCHAR(100))
RETURNS INT
BEGIN
    DECLARE inversa VARCHAR(100);

    SET inversa = REVERSE(palavra);

    IF palavra = inversa THEN
        RETURN 1; 
    ELSE
        RETURN 0;
    END IF;
END;