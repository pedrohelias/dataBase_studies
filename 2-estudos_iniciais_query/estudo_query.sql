use minhadatabase; /*selecionado a base de dados que será utilizada*/

/*
O comando SELECT é o mais tradicinal do sql. Ele irá selecionar e buscar as colunas que desejamos observar e consultar. O * indica que todas colunas serão selecionadas. Utilizável em Oracle, Postgree, mySQL, sqlServer... É possível buscar colunas específicas apenas inserindo o nome da coluna, como SELECT coluna1.
O comando FROM indica em qual tabela estaremos selecionando dada coluna. se a base de dados for inicializada, então podemos apenas utilizar FROM nome_da_tabela. Caso contrário, utilizaremos FROM nome_da_base_de_dados.nome_da_tabela
O comando DISTINCT é utilizado para omissão de dados duplicados da tabela. Ou seja, é bastante interessante e útil para separar e filtrar certos tipos de grupo, por exemplo, com muitas inserções para nomes iguais. A sintaxe se da por:  SELECT DISTINCT firstName
O comando WHERE fará condições na busca dos dados, como valores maiores que x, ou colunas com um nome específico, enfim. Para o uso do WHERE, utiliza-se operadores chaves como:

=	IGUAL
>	MAIOR
< 	MENOR
>= 	MAIOR OU IGUAL
<=	MENOR OU IGUAL
<>	DIFERENTE DE
AND	AND lógico
OR	OR	lógico

O comando COUNT vai retornar o número de linhas que respeitam tais condições solicitadas na query


*/

/*selecionando apenas a coluna name da tabela GAME*/
SELECT name 
FROM GAME;

/*selecionado as colunas name e developer da tabela GAME*/
SELECT name, developer
FROM GAME;

/*selecionando a coluna de ano de lançamento, porém evitando duplicatas de ano e verificando todos os possíveis anos de lançamento.*/
SELECT DISTINCT year_of_release
FROM GAME;

/*selecionando as plataformas existentes*/
SELECT DISTINCT platform
FROM GAME;

/*selecionado as colunas de nome e de ano de lançamento para todos os jogos lançados desde 2015 em diante */
SELECT name, year_of_release 
FROM GAME
WHERE year_of_release >= 2015;

/*selecionado as colunas de nome e de ano de lançamento e plataforma, para todos os jogos lançados desde 2015 em diante para a plataforma PS3*/
SELECT name, year_of_release, platform
FROM GAME
WHERE year_of_release >= 2015 AND platform = 'PS3';

/*Verificar quantas linhas existem na tabela GAME utilizada, resultando em 12044 linhas*/
SELECT count(*)
FROM GAME;

/*Verificar quantos estúdios de desenvolvimento distintos há nessa tabela*/
SELECT count(DISTINCT developer)
FROM GAME;

/*Descobrir quantos jogos foram lançados a partir de 2010*/
SELECT count(DISTINCT name)
FROM GAME
WHERE year_of_release >= 2010;
/*foram lançados 2356 jogos*/





/*
A seleção abaixo é utilização quando não se inicia a base de dados a ser utilizada, como o 'use minhadatabase', como está sendo utilizado acima.

SELECT *
FROM minhadatabase.GAME

*/



