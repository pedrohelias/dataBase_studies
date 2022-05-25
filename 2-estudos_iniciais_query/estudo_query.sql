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

----------------------------------------------------------------------------------------------------------

MIN MAX SUM AVG
São funções utilizadas para agregação. Essas funções agregam ou combinam dados de uma tabela em um resultado só. As funções são alto explicativas

----------------------------------------------------------------------------------------------------------

o AS vai apelidar a coluna criada na query

----------------------------------------------------------------------------------------------------------

o GROUP BY divide o resultado da pesquisa em grupos

----------------------------------------------------------------------------------------------------------

o HAVING é utilizado juntamente(ou junção) do GROUP BY para filtrar os dados que já estão agrupados. Se o WHERE filtra dados que não estão agrupados, ou HAVING é um filtro um pouco mais profundo, funcionando em dados agrupados. Ex de aplicação:

SELECT coluna1, funcaoAgregacao(coluna2)
FROM nomeTabela
GROUP BY coluna1
HAVING condicao;


----------------------------------------------------------------------------------------------------------

JOINS: Unir informçaões de uma tabela com a outra. Utiliza-se de Chaves estrangeiras. Então o primeiro passo é encontrar uma columa em comum e realizar o join em cima dela, no caso a chave estrangeira
Há 3 tipos de JOINS: INNER JOIN, OUTER JOIN e SELF-JOIN. 

O USO DO AS COMO APELIDO NOS JOIN É OPCIONAL

INNER-JOIN: JUNÇÂO DE INFORMAÇÔES EM COMUM

SELECT C.ClienteID, C.Nome, E.Rua, E.Cidade
FROM Cliente C
INNER JOIN Endereco E on E.EnderecoID = C.EnderecoID

OUTER-JOIN: Retorna um conjunto com todos os registros de uma tabela A e B quando são iguais, e além disso se não houver valores correspondentes, ele irá preencher como null. 

SELECT * 
FROM tabelaA
FULL OUTER JOIN TabelaB ON TabelaA.nome = TabelaB.nome

LEFT-JOIN
----------------------------------------------------------------------------------------------------------
O operador UNION permite com que seja combinado dois ou mais resultados de um select em um resultado apenas. O UNION remove as duplicatas. Ja o UNION ALL não remove. UNION geralmente é usado em tabelas que não tem muita consistencia. Te permite fazer pesquisas mais densas


----------------------------------------------------------------------------------------------------------
DATEPART (ajuda extrair dados do tipo TimeStamp, com datas)



----------------------------------------------------------------------------------------------------------

Manipulando Strings

Há diversas funções com strings que podem ser usadas com sql. 
Concatenar -> CONCAT
Tudo maiusculo -> UPPER
Tudo minúsculo -> LOWER
Descobrir o comprimento da string -> LEN
Extrair um pedaço da string -> SUBSTRING
Substituir partes de uma string
----------------------------------------------------------------------------------------------------------

Operações matemáticas. 
Média - AVG
valor maximo - MAX
valor minimo - MIN
arredondando - ROUND(coluna a ser arredondada, precisão)
raiz - SQRT

----------------------------------------------------------------------------------------------------------
SELF-JOIN só é possivel ser utilizado usando o Alias com o AS. Comparar dentro da mesma tabela

SELECT nome_coluna
FROM tabela A, tabela B
WHERE condicacao
----------------------------------------------------------------------------------------------------------

Tipos de dados: 
Booleanos -> iniciado como nulo, por default. Pode receber tanto 1 quanto 0
Caractere -> Tamanho fixo de caracteres, queremos utilizar o tipo char. Independente se for usado a quantidade definida de caracteres, ou não, ele vai usar o espaço definio. Difernetemente do VARCHAR que vai economizar os espaços que nao foram preenchidos, utilizando apenas o que foi preenchido. 
Numeros -> TINYINT - não tem valores fracionados, apenas valores inteiros
		-> SMALLINT - não tem valores fracionados, mas com limite maior
        -> INT - Não tem valores fracionados, porém com limite maior
		-> BIGINT - mesma coisa.
        -> NUMERIC OU DECIMAL -> Valores exatos, com valores fracionados, com precisão e escala.
        
Valores aproximados -> REAL - aproximadamente 15 digitos (numeros apos a virgula)
					-> FLOAT - mesmo conceito do real
                    
Temporais			-> DATE - Armazena data em formato de ano, mês e dia
					-> DATETIME - armaezna data e tempo no formato, ano/ mes/ dia :h/min/s
                    -> DATETIME2 - mesmo do DATETIME com milisegundos
                    -> SMALLDATETIME. possui um certo limite
                    -> TIME - Armazena apenas tempo. 
                    -> DATETIMEOFFSET -> Data com fuso horário
                    
----------------------------------------------------------------------------------------------------------
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

/*Selecionando o total de rendimento em vendas de jogo no mercado japones eno ano de 2012*/

SELECT sum(jp_sales) AS "Total em 2012" /*com o AS no query para apelidar a coluna */
FROM GAME
WHERE year_of_release = 2012; 

/*selecionado o jogo com pior nota em 2012*/
SELECT MIN(critic_score) AS "pior jogo em 2012"
FROM GAME
WHERE year_of_release = 2012; 

/*somando o total de vendas para todos os jogos de 2012 e os ordenando por nome - nome é uma espécie de ID, vai somar tudo de todas aparições do ID na tabela. Se eu tenho 3 versões diferentes de COD para 3 consoles, vai somar as vendas de todas as versões*/

SELECT name, sum(na_sales + eu_sales + jp_sales + other_sales) AS "TOTAL", year_of_release
FROM GAME
WHERE year_of_release = 2012
GROUP BY name;

/*seleciona quantas veszes o jogo Call of Duty aparece na tabela GAME*/

SELECT name, COUNT(name) AS "quantas vezes aparece"
FROM GAME
WHERE name = 'Call of Duty: Black Ops II';

/*seleciona quantas vezes se repetiu o jogo na tabela.*/

SELECT name, COUNT(name) AS "quantas vezes aparece"
FROM GAME
WHERE year_of_release = 2012
GROUP BY name;

/*A quantidade de jogos lançados por desenvolvedora*/

SELECT developer, COUNT(name)
FROM GAME
GROUP BY developer;

/*Selecionar a quantidade de jogos lançado por produtora que comça com as letras "co" em diante */
SELECT developer, COUNT(name) AS 'quantidade'
FROM GAME
GROUP BY developer
HAVING developer LIKE "co%"
LIMIT 100;

/*Verificar as empresas que lançaram mais de 50 jogos nesse espaço de tempo*/
SELECT developer, COUNT(name) AS 'quantidade'
FROM GAME
GROUP BY developer
HAVING COUNT(name) >=50
LIMIT 100;

/*Selecionando as produtoras que produziram entre 60 a 100 jogos nesse período, ordenado do maior para o menor*/
SELECT developer, COUNT(name) AS 'quantidade'
FROM GAME
GROUP BY developer
HAVING COUNT(name) between 60 AND 100
ORDER BY COUNT(name) desc
LIMIT 100;

/*Realizando o Join entre tabelas, columa em comum: id_genre*/
SELECT mg.name, mg.year_of_release, mge.description /*inicializando a base de dados posteiromente e colocando apelidos como mg e mge que serão descritos nas linhas abaixo*/
FROM minhadatabase.GAME AS mg /*definido o apelido ou ALIAS de "minhadatabase.GAME" como mg*/
INNER JOIN minhadatabase.GENRE AS mge on mge.id_genre = mg.id_genre; /*relizando o inner join entre a chave estrangeira presente nas duas tabelas, e juntamente a isso definido que "minhadatabase.GENRE" será descrita como mge. */

/*Realizando a união de todas informações de uma tabela com outra tabela, sem definir colunas*/
SELECT *
FROM minhadatabase.GAME mg 
INNER JOIN minhadatabase.GENRE mge on mge.id_genre = mg.id_genre
LIMIT 100;


/*Serão duas pesquisar realizadas numa mesma. Note que a tabela RATING naõ aparece lista como tabela, mas mostra dados onde deveria estar escrito year_of_release*/

SELECT name, year_of_release
FROM GAME
WHERE name like "cal%"
UNION
SELECT name, rating
FROM GAME
WHERE name like "fif%";

/*Concatenando o nome + o ano de lançamento do jogo*/
SELECT CONCAT(name, '-',year_of_release)
FROM GAME
WHERE name like "Cal%"
LIMIT 100;

/*Reestruturando uma forma de apresentação de produtora + jogo*/
SELECT CONCAT(UPPER(developer), "'s ", name )
FROM GAME
WHERE name like "Cal%"
LIMIT 100;

/*Substituindo o T por Teen na estrutura a seguir, e colocando-as lado a lado*/
SELECT name, rating, REPLACE(rating, 'T', 'Teen') as 'coluna modificada'
FROM GAME
WHERE name like "Cal%"
LIMIT 100;

/*Vai selecionar nomes de jogos que fazem parte da mesma produtora*/

SELECT A.name, A.developer, B.name, B.developer
FROM minhadatabase.GAME A, minhadatabase.GAME B
WHERE A.developer = B.developer
LIMIT 100;

/*Saber nome e nota de jogos que foram lançados no mesmo ano*/
SELECT A.name, A.rating, B.name, B.rating, A.year_of_release, B.year_of_release
FROM minhadatabase.GAME A, minhadatabase.GAME B
WHERE A.year_of_release = B.year_of_release
LIMIT 100;

/*Saber quais jogos tem uma mesma nota*/
SELECT A.name, A.critic_score, B.name, B.critic_score
FROM minhadatabase.GAME A, minhadatabase.GAME B
WHERE A.critic_score = B.critic_score;


/*



A seleção abaixo é utilização quando não se inicia a base de dados a ser utilizada, como o 'use minhadatabase', como está sendo utilizado acima.

SELECT *
FROM minhadatabase.GAME

*/



