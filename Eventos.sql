/*

SCRIPT CRIAÇÃO DAS TABELAS

*/

CREATE TABLE TIPO_EVENTO
(
	id integer primary key identity not null,
	tipo varchar(50)
);

CREATE TABLE EVENTOS
(
	id integer primary key not null identity,
	nome varchar(50) not null,
	data_ini date not null,
	data_fim date not null,
	localizacao varchar(100) not null,
	fk_tipo integer not null,
	foreign key (fk_tipo) references TIPO_EVENTO(id)
);

CREATE TABLE PROGRAMACAO/*atrações*/
(
	id integer primary key not null identity,
	fk_evento integer not null,
	nome varchar(50) not null,
	descricao varchar(500) not null,
	data_ini datetime not null,
	data_fim datetime not null,
	lugar varchar(100) not null,
	responsavel varchar(100) not null, /*ministrante, cantor, grupo...*/
	foreign key (fk_evento) references EVENTOS(id)
);

CREATE TABLE INGRESSOS
(
	id integer primary key not null identity,
	titulo varchar(50) not null,
	lugar varchar(100) not null,
	valor real not null,
	quantidade integer not null,
	fk_evento integer not null,
	foreign key (fk_evento) references EVENTOS(id)
);

CREATE TABLE PESSOAS
(
	cpf varchar(11) not null primary key,
	nome varchar(70) not null,
	email varchar(50) not null,
	fone varchar(15)
);

CREATE TABLE COMPRA /*inscricao*/
(
	id integer primary key not null identity,
	fk_pessoa varchar(11) not null,
	fk_ingresso integer not null,
	quantidade integer not null
	foreign key (fk_ingresso) references INGRESSOS (id),
	foreign key(fk_pessoa) references PESSOAS(cpf)
);




/*

	INSERÇÃO DE DADOS

*/

INSERT INTO TIPO_EVENTO VALUES('MINICURSO');
INSERT INTO TIPO_EVENTO VALUES('Libertadores da América');
INSERT INTO TIPO_EVENTO VALUES('Carnaval');
INSERT INTO TIPO_EVENTO VALUES('Formatura');

SELECT * FROM TIPO_EVENTO;

INSERT INTO EVENTOS VALUES ('RocknSP', '2021-11-30', '2021-12-10', 'SP', 1);

INSERT INTO EVENTOS VALUES ('Carnaval SP', '2022-03-02', '2022-03-06', 'SP', 8);
INSERT INTO EVENTOS VALUES ('GREnal', '2022-03-16', '2022-03-16', 'Arena', 7);

INSERT INTO EVENTOS VALUES ('Formatura Academia .Net', '2022-01-15', '2022-01-15', 'Teams', 9);

select * from EVENTOS

INSERT INTO PESSOAS VALUES ('01311121180', 'Fabrício', 'fabricio.londero@ufn.edu.br','5555558498');
INSERT INTO PESSOAS(cpf, nome, email) VALUES ('01333221180', 'Glauber', 'glauber@ufn.edu.br');
INSERT INTO PESSOAS(cpf, nome, fone) VALUES ('01783221180', 'Elias', '9854556422');
INSERT INTO PESSOAS(cpf, nome, email) VALUES ('01783221180', 'Elias', '');

select * from PESSOAS


INSERT INTO PROGRAMACAO VALUES (
1, 
'Metallica', 
'Show da Metallica com 2hrs de duração', 
'2022-05-7 20:00:00', 
'2022-05-7 23:59:00', 
'Arena Grêmio - POA',
'Metallica'
);

select * from PROGRAMACAO

insert into PROGRAMACAO values(1,'Kiss','show da banda KISS com muita música boa','2022-04-20 20:00:00','2022-04-20 23:00:00','Arena', 'Kiss');
insert into PROGRAMACAO values(1,'Iron Maiden','show da banda com muito rock','2022-04-07 20:00:00','2022-04-07 23:00:00','Barra da Tijuca', 'Iron Maiden');
insert into PROGRAMACAO values(1,'Roling Stones','show de 100 anos do Mick Jagger','2022-04-08 20:00:00','2022-04-08 23:00:00','Barra da Tijuca', 'Roling Stones');
insert into PROGRAMACAO values(1,'Alice Cooper','show do doidão','2022-04-09 20:00:00','2022-04-09 23:00:00','Barra da Tijuca', 'Alice Cooper');
insert into PROGRAMACAO values(1,'Guns N Roses','show da turnê de despedida','2022-04-010 20:00:00','2022-04-10 23:00:00','Barra da Tijuca', 'Guns N Roses');
insert into PROGRAMACAO values(1, 'Elton John', 'Show do Elton Johna com 2hrs de duracao', '2022-05-09 20:00:00', '2022-05-09 23:59:00', 'Palco principal', 'Elton John');


insert into INGRESSOS values ('Full Metal', 'RJ', 5000, 500, 1);
insert into INGRESSOS values ('Pop Rock Only', 'RJ', 1500, 750, 1);
insert into INGRESSOS values ('Black Metal', 'RJ', 750, 600, 1);

select * from INGRESSOS

Insert into COMPRA values ('01211111180', 3, 2);
Insert into COMPRA values ('01222221180', 1, 2);
select * from COMPRA 








