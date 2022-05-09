# <center>Banco de Dados - Recovery e Backup 


## Histórico de Versão

| Data       | Versão | Descrição                | Autor(es)     | 
| ---------- | ------ | ------------------------ | ------------- | 
| 07/05/2022 | 0.1    | Criação do documento     | Pedro Helias | 
| 09/05/2022 | 0.2    | Complemetando o conteúdo e add imagens    | Pedro Helias | 

<div align="justify">

# 1. Introdução

Uma cópia de segurança ou backup é uma cópia de informações ou
dados, que é realizada para que os mesmos não sejam perdidos. Quando há
informações importantes ou dados sensíveis que são de total relevância e
impacto para o sistema, e que não podem ser corrompidos ou perdidos, se
fazer necessário o procedimento de backup desses dados. Esse procedimento
se da pelo armazenamento desses dados num local reservado e seguro. Dessa
forma, seja qual for o caso ou desastre no sistema, os dados vitais vão estar
seguros e protegidos.

Somente dessa forma é possível garantir a integridade das informações e
a disponibilidade da mesma. Toda instituição eficiente precisa garantir que
seus dados importantes possuam backups, assim dando mais segurança e
disponibilidade para os dados.

# 2. Desenvolvimento

## 2.1 Ítens que serão utilizados no desenvolvimento desse estudo.

### 2.1.1 Base de Dados

Para esse projeto, será utilizada a base de dados sobre jogos, <b>Metacritic</b>, encontrada em <a h='../bases/baseDados_metacritic/baseDados_metacritic_jogos.sql'>base de dados</a>. 

### 2.1.2 MySQL

Será utilizando o MySQL, para criação de bases, recovery, backup e estruturação de bases. 

## 2.2 Execução

Como se trata de uma base de dados recebida e que sofreu backup anteriormente, é necessário executar um processo de <b>Recovery</b>. Para isso, utiliza-se a expressão: 

```
mysql -u root -p base-de-dados < nome-do-arquivo.sql

```

A expressão acima indica <i>base-de-dados</i> como a base utilizada para armazenar o recovery da base de dados exterior, criada por processos internos presentes ao mysql, como na figura 1 disposta abaixo. A estrutura <i>nome-do-arquivo</i> representa a base de dados que será realizado o recovery e proverá os dados, encontrada em <a href='bases/baseDados_metacritic/baseDados_metacritic_jogos.sql'>base</a>.

A partir disso, é possível executar o processo de recovery e obter uma base pronta para uso e estudo. Um espelho da execução dessa parte do projeto, encontra-se abaixo:


<div align="center">

 <div>
      <div align="center">
      <b>Figura 1: </b> Criação da base dados
      </div>
   </div>


<img src="https://github.com/pedrohelias/dataBase_studies/blob/main/imagens/recovery_backup_in_mysql/criacao_base.png?raw=true" style="width: 500px;"/>


 <div>
      <div align="center">
      <b>Fonte: </b> Própria Autoria.
      </div>
   </div>
</div>

<br>



<br>

<div align="center">

 <div>
      <div align="center">
      <b>Figura 2: </b> Execução do processo de recovery. 
      </div>
   </div>

<img src="https://github.com/pedrohelias/dataBase_studies/blob/main/imagens/recovery_backup_in_mysql/exec_recovery.png?raw=true" style="width: 500px;"/>


 <div>
      <div align="center">
      <b>Fonte: </b> Própria Autoria.
      </div>
   </div>
</div>

<br>


Após esses passos iniciais, será verificada a inserção de dados nessa nova base.  

## 2.3 Insert

Para exemplificação dessa parte do projeto, serão adicionadas informações fictícias e aleatórias (respeitando as regras de negócio da estrutura previamente construída no banco) a respeito do jogo <i>Rainbow Six</i>. Para se obter as regras de negócio de cada tabela do banco de dados, basta verificar suas informações e metadados. Os inserts são demonstrados abaixo:


(Inserir Imagens)

## 2.4 Processo de Backup da Base