
-- ==========================================================
-- Projeto: Sistema de Gerenciamento de Filmes
-- Banco de Dados: Oracle Database
-- Arquivo: 01_criacao_tabelas.sql
-- Descrição: Criação das tabelas e definição das restrições.
-- ==========================================================

-- ==========================================================
-- Tabela: Ator
-- ==========================================================
CREATE TABLE Ator(
	Cod_Ator INT,
	Nome_Ator VARCHAR(50) NOT NULL,
	Cidade_Ator VARCHAR(50) NOT NULL,
	Pais_Ator VARCHAR(10) NOT NULL,
	Genero_Ator VARCHAR(1) NOT NULL,
	PRIMARY KEY(Cod_Ator)
);

-- ==========================================================
-- Tabela: Diretor
-- ==========================================================

CREATE TABLE Diretor(
	Cod_Diretor INT,
	Nome_Diretor VARCHAR(50) NOT NULL,
	Cidade_Diretor VARCHAR(50) NOT NULL,
	Pais_Diretor VARCHAR(10) NOT NULL,
	PRIMARY KEY(Cod_Diretor)
);

-- ==========================================================
-- Tabela: Filme
-- ==========================================================

CREATE TABLE Filme(
	Cod_Filme INT,
	Titulo VARCHAR(50) NOT NULL,
	Cod_Diretor INT NOT NULL,
	PRIMARY KEY(Cod_Filme),
	FOREIGN KEY(Cod_Diretor) REFERENCES Diretor(Cod_Diretor)
);


-- ==========================================================
-- Tabela: Premio
-- ==========================================================

CREATE TABLE Premio(
	Cod_Premio INT,
	Descricao_Premio VARCHAR(50) NOT NULL,
	PRIMARY KEY(Cod_Premio)
);


-- ==========================================================
-- Tabela: Participacao
-- ==========================================================

CREATE TABLE Participacao(
	A_Cod_Ator INT,
	F_Cod_Filme INT,
	PRIMARY KEY(A_Cod_Ator, F_Cod_Filme),
	FOREIGN KEY(A_Cod_Ator) REFERENCES Ator(Cod_Ator),
	FOREIGN KEY(F_Cod_Filme) REFERENCES Filme(Cod_Filme)
);


-- ==========================================================
-- Tabela: Premiacao
-- ==========================================================

CREATE TABLE Premiacao(
	F_Cod_Filme INT,
	P_Cod_Premio INT,
	Ano INT NOT NULL,
	PRIMARY KEY(F_Cod_Filme, P_Cod_Premio),
	FOREIGN KEY(F_Cod_Filme) REFERENCES Filme(Cod_Filme),
	FOREIGN KEY(P_Cod_Premio) REFERENCES Premio(Cod_Premio)
);
