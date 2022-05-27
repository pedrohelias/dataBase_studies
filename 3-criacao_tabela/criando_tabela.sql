/*CONSTRAINTS: Regras que são definidas quando estão sendo criadas as chaves*/
/*Sintaxe*/
/*

CREATE TABLE nome_tabela (
	nomeColuna tipoDeDados restricaoColuna,
    nomeColuna tipoDeDados restricaoColuna, 
    ...
);

*/


/*
As principais restrições são:
NOT NULL: Não permite nulos
UNIQUE: Força que todos os valores em uma coluna sejam diferentes - sempre que inserido um termo igual, vai forçar um erro. 
PRIMARY KEY: Chave primária,IDs
FOREIGN KEY: Identifica unicamente uma linha em outra tabela
CHECK: Força uma condição específica em uma coluna, por exemplo, valores acima de 10...
DEFAULT: Força um valor padrão quando nenhum valor é passado.
*/

/*Exemplo:*/

CREATE DATABASE base_teste;

USE base_teste; 

CREATE TABLE Canal(
	CanalId INT PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    ContagemInscritos INT DEFAULT 0,
    DataCriacao	DATETIME NOT NULL
);

CREATE TABLE Video(
	VideoId INT PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    Visualizacoes INT DEFAULT 0,
    Likes INT DEFAULT 0,
    Deslikes INT DEFAULT 0,
    Duracao INT NOT NULL,
    CanalId INT NOT NULL,
    CONSTRAINT FK_Video FOREIGN KEY (CanalId) REFERENCES Canal(CanalId)
);

/*Inserindo dados nas tabelas*/
INSERT INTO Canal(CanalId,Nome,ContagemInscritos,DataCriacao)
VALUES(12345, 'Canal1', 50000, '1000-01-01 00:00:00'),
	  (56483, 'Canal2', 70000, '1001-02-02 01:01:01');

/*podem ser adicionados quaisquer valores */


/*
O Insert também pode ser realizado da seguinte forma:
INSERT INTO tabela1(coluna1)
SELECT coluna2
FROM tabela2

Inserindo informações de outra tabela existente
*/

/*UPDATE - atualizar linhas já inseridas no banco de dados. Pode ser alterado 1 ou mais linhas. 
Sintaxe: 

UPDATE nomeTabela
SET coluna1 = valor1
	coluna2 = valor2
WHERE condicao (vai servir para alterar apenas a linha desejada. Se não utilizar o where, atualizará boa parte do banco e pode dar problema)

*/

SELECT *
FROM base_teste.Canal;

/* Atualizando o canal 1 para canal 3*/
UPDATE base_teste.Canal
SET nome = 'Canal3'
WHERE CanalId = 12345;

/*DELETE - deletar linha. Mesmo caso do update, precisa de condições. Sintaxe:
DELETE FROM nomeTabela
WHERE condicao
*/
/*vai deletar os dados baseado no CanalId*/
DELETE FROM base_teste.Canal
WHERE CanalId = 56483;

/*Alter Table - alterar estruturas de uma tabela. Sintaxe:
ALTER TABLE nomeDaTabela
ACAO a ser realizada

Principais alterações possíveis:
Add, Remover, ou alterar coluna
Setar valores padrões para coluna
Add ou remoever restrições de coluna
Renomar tabela.

*/
/*adicionando uma coluna na tabela Canal*/
ALTER TABLE base_teste.Canal
ADD descricao VARCHAR(100);

SELECT *
FROM base_teste.Canal;

/*DROP TABLE - excluir uma tabela da base de dados*/

DROP TABLE base_teste.Canal;

/*TRUNCATE TABLE - excluir apenas o conteudo de uma tabela*/

TRUNCATE TABLE base_teste.Canal;

/*CHECK CONSTRAINT - Criar restrições sobre valores. Sinteaxe:
CREATE TABLE Tabela
	id INT NOT NULL,
    nome VARCHAR NOT NULL,
    idade INT CHECK (idade >= 18) (VAI REALIZAR A VERIFICACAO)

*/

/*NOT NULL CONSTRAINT - impossivel adicionar informações sem especificar os campos NOT NULL*/

/*UNIQUE CONSTRAINT - Valores únicos que não podem ser replicados na tabela*/

/*VIEWS - São uma forma de extrair informações de tabelas onde não se necessita de toda informação das tabelas. Bom para criar relatorios.*/

CREATE VIEW canalSimplificado AS 
SELECT nome, DataCriacao
FROM base_teste.Canal;

/*Basicamente o comando acima vai criar uma subtabela com dados importantes, imporantes para uma apresentação, talvez. E abaixo selecionando essa tabela e vendo tudo.*/

SELECT *
FROM canalSimplificado;
