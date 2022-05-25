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
VALUES(12345, 'Canal1', 50000, '1000-01-01 00:00:00');

/*podem ser adicionados quaisquer valores */


/*
O Insert também pode ser realizado da seguinte forma:
INSERT INTO tabela1(coluna1)
SELECT coluna2
FROM tabela2

Inserindo informações de outra tabela existente
*/

