-- ============================================================
-- CONSULTAS SQL - PROJETO BANCO DE DADOS
-- ============================================================

-- Consultas planejadas:
-- • SELECT com filtros (WHERE)
-- • ORDER BY
-- • GROUP BY
-- • HAVING
-- • INNER JOIN
-- • LEFT JOIN
-- • Funções de agregação (COUNT, SUM, AVG)
-- • Subqueries
-- • Views


-- ============================================================
-- 1. SELECT COM FILTRO (WHERE)
-- ============================================================

-- Listar atores brasileiros

SELECT *
FROM ATOR
WHERE PAIS_ATOR = 'GBR';


-- Listar diretores de uma cidade específica

SELECT *
FROM DIRETOR
WHERE CIDADE_DIRETOR = 'Nova York';


-- ============================================================
-- 2. ORDER BY
-- ============================================================

-- Listar filmes em ordem alfabética

SELECT TITULO
FROM FILME
ORDER BY TITULO;


-- Listar atores em ordem decrescente

SELECT NOME_ATOR
FROM ATOR
ORDER BY NOME_ATOR DESC;


-- ============================================================
-- 3. GROUP BY
-- ============================================================

-- Quantidade de atores por país

SELECT
    PAIS_ATOR,
    COUNT(*) AS TOTAL_ATORES
FROM ATOR
GROUP BY PAIS_ATOR;


-- Quantidade de diretores por país

SELECT
    PAIS_DIRETOR,
    COUNT(*) AS TOTAL_DIRETORES
FROM DIRETOR
GROUP BY PAIS_DIRETOR;


-- ============================================================
-- 4. HAVING
-- ============================================================

-- Países com mais de um ator cadastrado

SELECT
    PAIS_ATOR,
    COUNT(*) AS TOTAL_ATORES
FROM ATOR
GROUP BY PAIS_ATOR
HAVING COUNT(*) > 1;


-- ============================================================
-- 5. INNER JOIN
-- ============================================================

-- Filmes e seus respectivos diretores

SELECT
    F.TITULO,
    D.NOME_DIRETOR
FROM FILME F
INNER JOIN DIRETOR D
ON F.COD_DIRETOR = D.COD_DIRETOR;


-- Filmes e atores participantes

SELECT
    F.TITULO,
    A.NOME_ATOR
FROM PARTICIPACAO P
INNER JOIN FILME F
ON P.F_COD_FILME = F.COD_FILME
INNER JOIN ATOR A
ON P.A_COD_ATOR = A.COD_ATOR;


-- Premiações recebidas por cada filme

SELECT
    F.TITULO,
    PR.DESCRICAO_PREMIO,
    PM.ANO
FROM PREMIACAO PM
INNER JOIN FILME F
ON PM.F_COD_FILME = F.COD_FILME
INNER JOIN PREMIO PR
ON PM.P_COD_PREMIO = PR.COD_PREMIO;


-- ============================================================
-- 6. LEFT JOIN
-- ============================================================

-- Filmes e suas premiações (incluindo filmes sem premiação)

SELECT
    F.TITULO,
    PR.DESCRICAO_PREMIO
FROM FILME F
LEFT JOIN PREMIACAO PM
ON F.COD_FILME = PM.F_COD_FILME
LEFT JOIN PREMIO PR
ON PM.P_COD_PREMIO = PR.COD_PREMIO;


-- ============================================================
-- 7. FUNÇÕES DE AGREGAÇÃO
-- ============================================================

-- COUNT - Total de filmes cadastrados

SELECT COUNT(*) AS TOTAL_FILMES
FROM FILME;


-- AVG - Média do ano das premiações
SELECT * FROM PREMIACAO;

SELECT AVG(ANO) AS MEDIA_ANO_PREMIACAO
FROM PREMIACAO;


-- SUM - Soma dos anos das premiações

SELECT SUM(ANO) AS SOMA_ANOS_PREMIACAO
FROM PREMIACAO;


-- ============================================================
-- 8. SUBQUERIES
-- ============================================================

-- Filmes dirigidos por diretores americanos
SELECT * FROM DIRETOR;

SELECT TITULO
FROM FILME
WHERE COD_DIRETOR IN (
    SELECT COD_DIRETOR
    FROM DIRETOR
    WHERE PAIS_DIRETOR = 'USA'
);


-- Atores que participaram de algum filme

SELECT NOME_ATOR
FROM ATOR
WHERE COD_ATOR IN (
    SELECT A_COD_ATOR
    FROM PARTICIPACAO
);


-- ============================================================
-- 9. VIEW
-- ============================================================

CREATE VIEW VW_FILMES_DIRETORES AS
SELECT
    F.COD_FILME,
    F.TITULO,
    D.NOME_DIRETOR
FROM FILME F
INNER JOIN DIRETOR D
ON F.COD_DIRETOR = D.COD_DIRETOR;


-- Consultar a View

SELECT *
FROM VW_FILMES_DIRETORES;