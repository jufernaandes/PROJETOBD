-- ==========================================================
-- Projeto: Sistema de Gerenciamento de Filmes
-- Banco de Dados: Oracle Database
-- Arquivo: 04_consultas.sql
-- Descrição: Consultas SQL para exploração e análise dos dados.
-- ==========================================================

-- Este arquivo será atualizado conforme a evolução do projeto.

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
-- CONSULTAS SQL - PROJETO BANCO DE DADOS
-- ============================================================


-- ============================================================
-- 1. CONSULTA SIMPLES - LISTAR TODOS OS FILMES
-- ============================================================

SELECT * FROM filme;

-- ============================================================
-- 2. CONSULTA COM FILTRO (WHERE)
-- Buscar diretores de um determinado país
-- ============================================================

SELECT *
FROM DIRETOR
WHERE PAIS_DIRETOR = 'USA';

-- ============================================================
-- 3. ORDENAÇÃO DOS RESULTADOS (ORDER BY)
-- Listar filmes do mais recente para o mais antigo
-- ============================================================

SELECT * FROM premiacao;

SELECT P_COD_PREMIO, ANO
FROM PREMIACAO
ORDER BY ANO DESC;

-- ============================================================
-- 4. BUSCA POR TEXTO (LIKE)
-- Buscar filmes que possuem determinada palavra no título
-- ============================================================

SELECT * FROM FILME;

SELECT * FROM FILME
WHERE TITULO LIKE '%Cisn%';

-- ============================================================
-- 5. CONTAGEM DE REGISTROS (COUNT)
-- Quantidade total de filmes cadastrados
-- ============================================================

SELECT COUNT (*) AS TOTAL_FILMES
FROM FILME;

-- ============================================================
-- 6. AGRUPAMENTO (GROUP BY)
-- Quantidade de filmes por diretor
-- ============================================================

SELECT * FROM DIRETOR; 

SELECT 
    COD_DIRETOR,
    COUNT(*) AS QUANTIDADE_FILMES
    FROM FILME 
    GROUP BY COD_DIRETOR;
    
-- ============================================================
-- 7. FILTRO DE AGRUPAMENTO (HAVING)
-- Diretores com mais de um filme cadastrado
-- ============================================================

SELECT 
    COD_DIRETOR,
    COUNT(*) AS QUANTIDADE_FILMES
    FROM FILME
    GROUP BY COD_DIRETOR
    HAVING COUNT (*)> 1;
    
-- ============================================================
-- 8. INNER JOIN
-- Exibir filmes e seus respectivos diretores
-- ============================================================

SELECT * FROM DIRETOR;
SELECT * FROM FILME;

SELECT 
   F.TITULO,
   D.NOME_DIRETOR AS DIRETOR
   FROM FILME F
   INNER JOIN DIRETOR D
   ON F.COD_DIRETOR = D.COD_DIRETOR;

-- ============================================================
-- 9. INNER JOIN COM 3 TABELAS
-- Exibir filmes e seus respectivos atores
-- ============================================================

SELECT * FROM PARTICIPACAO;
SELECT * FROM FILME;
SELECT * FROM ATOR;

SELECT
    F.TITULO,
    A.NOME_ATOR AS ATOR
    FROM FILME F
    INNER JOIN PARTICIPACAO P 
    ON F.COD_FILME = P.F_COD_FILME 
    INNER JOIN ATOR A
    ON P.A_COD_ATOR = A.COD_ATOR;
    
-- ============================================================
-- 10. LEFT JOIN
-- Exibir filmes com ou sem premiações
-- ============================================================

SELECT * FROM FILME;
SELECT * FROM PREMIO;
SELECT * FROM PREMIACAO;

SELECT 
    F.TITULO,
    PR.DESCRICAO_PREMIO AS PREMIO
    FROM FILME F
    LEFT JOIN PREMIACAO PE
    ON F.COD_FILME = PE. F_COD_FILME
    LEFT JOIN PREMIO PR
    ON PE.P_COD_PREMIO = PR.COD_PREMIO;


    
    










