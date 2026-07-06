--- ==========================================================
-- Projeto: Sistema de Gerenciamento de Filmes
-- Banco de Dados: Oracle Database
-- Arquivo: 03_testes_restricoes.sql
-- Descrição: Testes das restrições de integridade e validação
-- ==========================================================


-- ==========================================================
-- Teste 1 - Chave Primária (PRIMARY KEY)
-- ==========================================================

INSERT INTO Ator VALUES (1, 'Teste', 'SP', 'BRA', 'M');

-- Resultado esperado:
-- O Oracle deve impedir a inserção por duplicidade da chave primária.

-- Resultado obtido:
-- ORA-00001: violação de restrição exclusiva (PRIMARY KEY).


INSERT INTO Premio VALUES (1, 'Outro Premio');

-- Resultado esperado:
-- O Oracle deve impedir a inserção por duplicidade da chave primária.

-- Resultado obtido:
-- ORA-00001: violação de restrição exclusiva (PRIMARY KEY).


-- ==========================================================
-- Teste 2 - Chave Estrangeira (FOREIGN KEY)
-- ==========================================================

INSERT INTO Participacao VALUES (999, 1);

-- Resultado esperado:
-- O Oracle deve impedir a inserção, pois o ator informado não existe.

-- Resultado obtido:
-- ORA-02291: restrição de integridade violada (FOREIGN KEY).


-- ==========================================================
-- Teste 3 - Restrição NOT NULL
-- ==========================================================

INSERT INTO Ator VALUES (101, 'Lazaro Ramos', 'Salvador', NULL, 'M');

-- Resultado esperado:
-- O Oracle deve impedir a inserção devido ao campo PAIS_ATOR ser obrigatório.

-- Resultado obtido:
-- ORA-01400: não é possível inserir NULL em PAIS_ATOR.


INSERT INTO Ator VALUES (NULL, 'Fabio Porchat', 'Rio de Janeiro', 'BRA', 'M');

-- Resultado esperado:
-- O Oracle deve impedir a inserção devido ao campo COD_ATOR ser obrigatório.

-- Resultado obtido:
-- ORA-01400: não é possível inserir NULL em COD_ATOR.


-- ==========================================================
-- Teste 4 - Restrição CHECK (Domínio)
-- ==========================================================

INSERT INTO Ator VALUES (200, 'Teste', 'SP', 'BRA', 'X');

-- Resultado esperado:
-- O Oracle deve rejeitar o valor informado para o campo Genero_Ator.

-- Resultado obtido:
-- ORA-02290: violação da restrição CHECK (CHK_GENERO).


-- ==========================================================
-- Teste 5 - Integridade Referencial
-- ==========================================================

DELETE FROM Diretor
WHERE Cod_Diretor = 25;

-- Resultado esperado:
-- O Oracle deve impedir a exclusão do diretor,
-- pois existe um filme vinculado a esse registro.

-- Resultado obtido:
-- ORA-02292: restrição de integridade violada - registro filho localizado.


-- ==========================================================
-- Teste 6 - Chave Composta
-- ==========================================================

INSERT INTO Premiacao VALUES (5, 3, 2013);

-- Resultado esperado:
-- O Oracle deve impedir a inserção,
-- pois a combinação da chave composta já existe.

-- Resultado obtido:
-- ORA-00001: violação de restrição exclusiva.


INSERT INTO Premiacao VALUES (8, 2, 2014);

-- Resultado esperado:
-- O Oracle deve impedir a inserção,
-- pois a combinação da chave composta já existe.

-- Resultado obtido:
-- ORA-00001: violação de restrição exclusiva.


-- ==========================================================
-- Teste 7 - Chave Primária da Tabela Premio
-- ==========================================================

INSERT INTO Premio VALUES (5, 'Melhor Roteiro');

-- Resultado esperado:
-- O Oracle deve impedir a inserção,
-- pois o código do prêmio já existe.

-- Resultado obtido:
-- ORA-00001: violação de restrição exclusiva.


INSERT INTO Premio VALUES (6, 'Melhor Ator Coadjuvante');

-- Resultado esperado:
-- O Oracle deve impedir a inserção,
-- pois o código informado já existe.

-- Resultado obtido:
-- ORA-00001: violação de restrição exclusiva.


-- ==========================================================
-- Teste 8 - Operações válidas
-- ==========================================================

INSERT INTO Ator VALUES (300, 'Teste Valido', 'SP', 'BRA', 'M');

-- Resultado esperado:
-- Registro inserido com sucesso.


UPDATE Ator
SET Nome_Ator = 'Bryan Cranston'
WHERE Cod_Ator = 300;

-- Resultado esperado:
-- Atualização realizada com sucesso.

-- Resultado obtido:
-- 1 linha atualizada.


INSERT INTO Participacao VALUES (1, 2);

-- Resultado esperado:
-- Inserção realizada com sucesso,
-- pois o ator e o filme existem.


-- ==========================================================
-- Consulta para verificação das constraints da tabela PREMIACAO
-- ==========================================================

SELECT
    c.constraint_name,
    c.constraint_type,
    col.column_name,
    c.r_constraint_name
FROM user_constraints c
JOIN user_cons_columns col
    ON c.constraint_name = col.constraint_name
WHERE c.table_name = 'PREMIACAO';
