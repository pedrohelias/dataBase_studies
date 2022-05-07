# <center>Banco de Dados - Recovery e Backup 


## Histórico de Versão

| Data       | Versão | Descrição                | Autor(es)     | 
| ---------- | ------ | ------------------------ | ------------- | 
| 07/05/2022 | 0.1    | Criação do documento     | Pedro Helias | 

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

A expressão acima indica <i>base-de-dados</i>