use minhadatabase; /*selecionado a base de dados que será utilizada*/

/*
O comando SELECT é o mais tradicinal do sql. Ele irá selecionar e buscar as colunas que desejamos observar e consultar. O * indica que todas colunas serão selecionadas. Utilizável em Oracle, Postgree, mySQL, sqlServer... É possível buscar colunas específicas apenas inserindo o nome da coluna, como SELECT coluna1.
----------------------------------------------------------------------------------------------------------
O comando FROM indica em qual tabela estaremos selecionando dada coluna. se a base de dados for inicializada, então podemos apenas utilizar FROM nome_da_tabela. Caso contrário, utilizaremos FROM nome_da_base_de_dados.nome_da_tabela
----------------------------------------------------------------------------------------------------------
O comando DISTINCT é utilizado para omissão de dados duplicados da tabela. Ou seja, é bastante interessante e útil para separar e filtrar certos tipos de grupo, por exemplo, com muitas inserções para nomes iguais. A sintaxe se da por:  SELECT DISTINCT firstName
----------------------------------------------------------------------------------------------------------
O comando WHERE fará condições na busca dos dados, como valores maiores que x, ou colunas com um nome específico, enfim. Para o uso do WHERE, utiliza-se operadores chaves como:

=	IGUAL
>	MAIOR
< 	MENOR
>= 	MAIOR OU IGUAL
<=	MENOR OU IGUAL
<>	DIFERENTE DE
AND	AND lógico
OR	OR	lógico
----------------------------------------------------------------------------------------------------------
O comando COUNT vai retornar o número de linhas que respeitam tais condições solicitadas na query
----------------------------------------------------------------------------------------------------------
O comando TOP vai filtrar a quantidade de dados que é retornada de um SELECT, como por exemplo:

SELECT TOP 10 * -----> vai selecionar todas tabelas das primeiras 10 entradas
no mySQL o TOP será o LIMIT, ex:

SELECT coluna
FROM tabela
LIMIT 10

Pelos estudos, verificou-se que sua adição se dá sempre no fim das execuções
----------------------------------------------------------------------------------------------------------
O comando ORDER BY permite que se ordende os resultados do query em forma crescente ou descrescente. Por ex:
SELECT coluna1, coluna2
FROM nome_tabela
ORDER BY coluna1 
asc/desc;

----------------------------------------------------------------------------------------------------------
o comando between é utilizado para filtrar algum valor(es) entre valor mínimo e um máximo, como por exemplo:

Encontrar valores entre 1 a 100
WHERE numbers between 1 AND 100 

Caso eu queira encontrar valores que não estejam na faixa delimitada, escrevo então NOT between

----------------------------------------------------------------------------------------------------------
O comando IN deve ser utilizando juntamente com o WHERE para verificar se um valor passado corresponde a qualquer valor passado para na lista de valores. Pode ser escrito de forma lógica, mas o IN facilita as coisas, ex:

idade IN(10,12)

É possível verificar subquerys, também, como:

valor IN (SELECT valor FROM nome_da_tabela)

Juntamente do IN, pode ser usado o NOT
----------------------------------------------------------------------------------------------------------

O comando LIKE funciona para lembraças de um certo valor que é desconhecido em sua totalidade, mas é lembrando por pedaços. Por exemplo, se eu quero pesquisar a palavra "Alfabeto", mas eu não lembro exatamente dela completa, apenas do "Alfa". Então o LIKE fará uma filtragem de todos resultados próximos a Alfa. É escrito da seguinte forma

SELECT nome_da_coluna
FROM nome_da_tabela
WHERE name LIKE 'Alfa%'

Se você lembra o final, o porcentagem vai para o inicio

SELECT nome_da_coluna
FROM nome_da_tabela
WHERE name LIKE '%beto'

Se você lembra apenas do meio, o porcentagem carrega os dois lados

SELECT nome_da_coluna
FROM nome_da_tabela
WHERE name LIKE '%fabet%'


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

/*Selecionar os desenvolvedores que arrecadaram mais de 2(milhões?) em vendas, elencando num top10 de inserts, distintos.*/
SELECT DISTINCT developer
FROM GAME
WHERE eu_Sales > 2
LIMIT 10;

/*Selecionando nome do jogo e plataforma que foi lançado, com vendas europeias acima de 3.5, ordenado por plataforma, decrescente e por nome crescente, e limitando a 100 linhas*/
SELECT DISTINCT name, platform
FROM GAME
WHERE eu_Sales > 3.5
ORDER BY platform desc, name asc
LIMIT 100;

/*Selecionado o top10 jogos mais vendidos no japão*/
SELECT DISTINCT name, platform, jp_sales
FROM GAME
ORDER BY jp_sales desc
LIMIT 10;

/*Verificando o top10 piores jogos e suas vendas, ordenadas de forma ascendente por score*/
SELECT DISTINCT name, critic_score, na_sales, jp_sales, eu_sales, other_sales
FROM GAME
WHERE critic_score >= 0
ORDER BY critic_score asc
LIMIT 10;

/*Verificando os jogos lançados entre 2012 e 2016, em ordem de ano*/
SELECT DISTINCT name, year_of_release, platform
FROM GAME
WHERE year_of_release BETWEEN 2012 AND 2016
ORDER BY year_of_release asc
LIMIT 100;

/*Verificando os jogos lançados no ano de 2012 utilizando o comando IN - Nota: pode ser adicionado outro ano, apenas colocando uma virgula depois de 2012 e adicionado outro ano. Isso é mais simples e fácil do que ficar setando anos para pesquisar através do OR lógico*/
SELECT DISTINCT name, year_of_release
FROM GAME
WHERE year_of_release IN (2012)
ORDER BY year_of_release asc
LIMIT 100;

/*Verificar os jogos que se iniciam com o nome citado abaixo, e filtra-los*/
SELECT DISTINCT name
FROM GAME
WHERE name LIKE 'Final F%'
ORDER BY name asc
LIMIT 100;

/*Tentativa de filtrar os melhores jogos segundo a critica nos anos dispostos abaixo, listados em forma decrescente. Como os comandos para tal serão aprendidos, foi utilizado o BETWEEN para defnir um range específico de valores para a busca*/

SELECT DISTINCT name, year_of_release, critic_score
FROM GAME
WHERE year_of_release IN (2012, 2013, 2014 ) AND critic_score BETWEEN 90 AND 100
ORDER BY year_of_release asc, critic_score desc 
LIMIT 100;

/*Procurando todos os jogos que começam com a letra P em frente, e limitando a 100 linhas.*/
SELECT name
FROM GAME
WHERE name like 'p%'
ORDER BY name asc
LIMIT 100;

/*Procurando a quantidade de jogos que foram avaliados em critic_score maior ou igual a 97, ou seja, bons jogos*/
SELECT count(name)
FROM GAME
WHERE critic_score >= 97;


/*
A seleção abaixo é utilização quando não se inicia a base de dados a ser utilizada, como o 'use minhadatabase', como está sendo utilizado acima.

SELECT *
FROM minhadatabase.GAME

*/



