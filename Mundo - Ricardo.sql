
create table continente(
id int primary key not null identity,
nome varchar(35)
)

select * from INFORMATION_SCHEMA.TABLES

select * from INFORMATION_SCHEMA.COLUMNS

create table pais (
id int primary key not null identity, 
nome varchar(35) not null, 
fk_continente int, 
pop int,
pib real,
expec_vida real
foreign key (fk_continente) references continente(id)
)

create table cidade(
id int primary key not null identity,
nome varchar(35) not null,
fk_pais int, 
pop real,
capital varchar(1)
foreign key (fk_pais) references pais(id)
)


create table rio(
id int primary key not null identity,
nome varchar(35) not null, 
fk_nascente int,
fk_pais int,
comprimento real, 
foreign key (fk_nascente) references pais(id),
foreign key (fk_pais) references pais(id)
)


insert into continente values ('Am�rica do sul')
insert into continente values ('Am�rica do norte')
insert into continente values ('Am�rica central')
insert into continente values ('Europa')
insert into continente values ('�sia')
insert into continente values ('Oceania')


use master
drop database mundo
create database mundo;

use mundo;

create table continente(
id int primary key not null identity,
nome varchar(35)
)

select * from INFORMATION_SCHEMA.TABLES

select * from INFORMATION_SCHEMA.COLUMNS

create table pais (
id int primary key not null identity, 
nome varchar(35) not null, 
fk_continente int, 
pop int,
pib real,
expec_vida real
foreign key (fk_continente) references continente(id)
)

create table cidade(
id int primary key not null identity,
nome varchar(35) not null,
fk_pais int, 
pop real,
capital varchar(1)
foreign key (fk_pais) references pais(id)
)

insert into cidade values ('Brasilia',2.500,'s',1)

create table rio(
id int primary key not null identity,
nome varchar(35) not null, 
fk_nascente int,
fk_pais int
comprimento real, 
foreign key (fk_nascente) references pais(id),
foreign key (fk_pais) references pais(id)
)


insert into continente values ('Am�rica do sul')
insert into continente values ('Am�rica do norte')
insert into continente values ('Am�rica central')
insert into continente values ('Europa')
insert into continente values ('�sia')
insert into continente values ('Oceania')
select * from continente

select cidade.nome, pais.nome, pais.pop from pais, cidade where cidade.capital = 's' and fk_pais = pais.id and pib < 1000000000000

select rio.nome as Rio, pais.nome as Nascente, rio.comprimento as Comprimento
from rio,pais
where rio.fk_nascente = pais.id

select rio.nome as Rio, pais.nome as Foz, rio.comprimento as Comprimento
from rio,pais
where rio.fk_pais = pais.id 

insert into continente values('Am. Norte')
insert into continente values('Am. Sul')



insert into pais values('Canada',1,30.1,658.0,77.08)
insert into pais values('Mexico',1,107.5,694.0,69.1)
insert into pais values('Brasil',2,183.3,10004.0,65.2)
insert into pais values('USA',1,270.0,8003.0,75.5)



insert into cidade values('Washington',4,3.3,'S')
insert into cidade values('Monterrey',2,2.0,'N')
insert into cidade values('Brasilia',3,1.5,'S')
insert into cidade values('S�o Paulo',3,15.0,'N')
insert into cidade values('Ottawa',1,0.8,'S')
insert into cidade values('Cid. Mexico',2,14.1,'S')



insert into rio values('St. Lawrence',4,4,3.3)
insert into rio values('Grande',4,2,2.0)
insert into rio values('Parana',3,3,1.5)
insert into rio values('Missisipi',4,4,15.0)

insert into cidade values ('Brasilia',2.500,'s',1)



select * from cidade



select cidade.nome from cidade where pib < 1000000000000 group by

select * from rio

select * from pais

select pais.nome, cidade.nome from cidade, pais where cidade.fk_pais = pais.id

select continente.nome, sum(rio.comprimento) as [Soma do comprimento dos rios por continente] from rio, pais, continente where rio.fk_pais = pais.id and pais.fk_continente = continente.id group by continente.nome

Liste todas as cidades que s�o capitais.
Apresente todos os rios que a nascente � no Brasil
Apresente o nome dos pa�ses onde a expectativa de vida � menor que 70 anos.
Liste todas o nome das capitais, os nomes dos pa�ses e as popula��es dos pa�ses cujos PIB � maior que 1 trilh�o de d�lares.
Qual � a m�dia da popula��o das cidades que n�o s�o capitais.
Para cada continente retorne o PIB m�dio de seus pa�ses.
Apresente o menor comprimento de rio
Apredente a m�dia de comprimento dos rios nos EUA
Apresente o somat�rio de comprimento de rios do Brasil
Apresente todos os rios que a nascente (rio.fk_nascente) e a foz (rio.fk_pais) s�o no Brasil
Liste todas as cidades e os pa�ses aos quais pertencem.
Apresente a quantidade de rios por continente.


Apresentar os nomes dos continentes e o somatorio de comprimento dos rios
Apresentar a m�dia de expectativa de vida mundial
Apresentar os nomes dos continentes e sua media da expectativa de vida
