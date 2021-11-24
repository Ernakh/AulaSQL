--postgresql


CREATE TYPE tamanhos AS ENUM ('P', 'M', 'G');


CREATE TABLE roupa (
	nome VARCHAR (30),
	tamanho tamanhos
 );


INSERT INTO roupa (nome, tamanho) VALUES ('teste', 'P')
SELECT * FROM roupa

INSERT INTO roupa (nome, tamanho) VALUES ('teste', 'X')
SELECT * FROM roupa


DROP type endereco
DROP TABLE aluno

CREATE type endereco AS
(
rua VARCHAR(20),
numero numeric(4),
cidade VARCHAR(10)
)


CREATE TABLE aluno
(
nome VARCHAR(30),
ende endereco
)


INSERT INTO aluno (nome, ende) VALUES ('Fabrício', ROW ('Andradas', 1234, 'S. Maria'));






-----------

CREATE TABLE pessoa
(
nome VARCHAR(30),
ende endereco
)WITH OIDS;

CREATE TABLE alunos
(
matricula  VARCHAR(30)
) INHERITS(pessoa) WITH OIDS;

SELECT * FROM alunos

SELECT * FROM pessoa

SELECT * FROM only pessoa


SELECT * FROM only alunos
----------------------------


INSERT INTO alunos (nome, ende, matricula) VALUES ('Fabrício', ROW ('Andradas', 1234, 'S. Maria'), '2020020001');


SELECT REF(alunos) FROM  alunos    .ende WHERE alunos.ende.numero = 1


SELECT ROW(ende) FROM alunos WHERE (ROW(ende)::numero;



INSERT INTO alunos (nome, ende, matricula) VALUES ('Fabrício', endereco ('Andradas', 1234, 'S. Maria'), '2020020001');




-- oracle 11g



--oracle 11g
--create type ENDERECO_TYP as object(rua VARCHAR2(50), cidade VARCHAR2(25), estado CHAR(2), cep  NUMBER);


create table PESSOAS (nome  VARCHAR(25), endereco  ENDERECO_TYP);


insert into pessoas values ('Fabrício', ENDERECO_TYP ('rua tal', 'Santa Maria', 'RS', 97010000))

select * from pessoas 



--Para armazenar dados é necessário a criação de uma tabela a partir de um tipo de objeto.
create type PESSOA_TY as object(Nome VARCHAR2(25), CPF  NUMBER, Endereco ENDERECO_TY);

create table PESSOAS of PESSOA_TY (CPF  primary key );

