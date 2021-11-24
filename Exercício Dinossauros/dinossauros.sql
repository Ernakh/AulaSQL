create database dinossauros
create table grupo(
id int not null primary key identity,
nome varchar(50)
)
create table descobridor(
id int not null primary key identity,
nome varchar(50)
)
create table era(
id int not null primary key identity,
nome varchar(50),
)
create table pais(
id int not null primary key identity,
nome varchar(50)
)
create table dinossauro(
id int not null primary key identity,
nome varchar(50) not null,
fk_grupo int not null,
fk_descobridor int not null,
toneladas int,
ano_descoberta date,
inicio int,
fim int,
fk_era int,
fk_pais int,
foreign key (fk_grupo) references grupo(id),
foreign key (fk_descobridor) references descobridor(id),
foreign key (fk_era) references era(id),
foreign key (fk_pais) references pais(id) 
)
insert into grupo values('Anquilossauros')
insert into grupo values('Ceratops�deos')
insert into grupo values('Estegossauros')
insert into grupo values('Ter�podes')
insert into descobridor values('Maryanska')
insert into descobridor values('John Bell Hatcher')
insert into descobridor values('Cientistas Alem�es')
insert into descobridor values('Museu Americano de Hist�ria Natural')
insert into descobridor values('Othniel Charles Marsh')
insert into descobridor values('Barn Brown')
insert into era values('Cret�ceo')
insert into era values('Jur�ssico')
insert into pais values('Mong�lia')
insert into pais values('Canad�')
insert into pais values('Tanz�nia')
insert into pais values('China')
insert into pais values('USA')
insert into dinossauro values('Saichania',1,1,4,'1977',145,66,1,1)
insert into dinossauro values('Tricer�tops',2,2,6,'1887',70,66,1,2)
insert into dinossauro values('Kentrossauro',3,3,2,'1909',201,145,2,3)
insert into dinossauro values('Pinacossauro',1,4,6,'1877',85,75,1,4)
insert into dinossauro values('Alossauro',4,5,3,'1999',155,150,2,5)
insert into dinossauro values('Torossauro',1,2,8,'1891',67,65,1,5)
insert into dinossauro values('Anquilossauro',1,6,8,'1906',67,63,1,5)
select *from dinossauro order by dinossauro.nome
select dinossauro.nome, grupo.nome as [nome do grupo], descobridor.nome as [nome do descobridor], 
       dinossauro.toneladas as [peso em toneladas], dinossauro.ano_descoberta,era.nome as [era] ,pais. nome as[pais] from dinossauro
inner join grupo on grupo.id = dinossauro.fk_grupo
inner join descobridor on descobridor.id = dinossauro.fk_descobridor
inner join era on era.id = dinossauro.fk_era
inner join pais on pais.id = dinossauro.fk_pais
order by dinossauro.nome
select *from dinossauro
inner join grupo on grupo.id = dinossauro.fk_grupo
where grupo.nome = 'Anquilossauros' order by dinossauro.ano_descoberta
select *from dinossauro
inner join grupo on grupo.id = dinossauro.fk_grupo
where grupo.nome = 'Ceratops�deos' or grupo.nome ='Anquilossauros' and dinossauro.ano_descoberta >= '1900' and dinossauro.ano_descoberta <='1999'
select pais.nome, count(*) as [N� de dinossauros por pais] from dinossauro
inner join pais on pais.id = dinossauro.fk_pais
group by pais.nome
select avg(dinossauro.toneladas) as [M�dia de toneladas] from dinossauro
where dinossauro.fk_pais = 5
select descobridor.nome, COUNT(*) as [N� de dinossauros por descobridor] from dinossauro
inner join descobridor on descobridor.id = dinossauro.fk_descobridor
group by descobridor.nome









select * from dinossauro
join descobridor on descobridor.id = dinossauro.fk_descobridor
order by descobridor.nome

--Crie uma consulta para relacionar todos os dados disponiveis de todos os dinossauros existentes em ordem alfabetica de descobridor
select dinossauro.id, dinossauro.nome, grupo.nome as 'grupo', descobridor.nome as 'descobridor',
	dinossauro.toneladas, dinossauro.ano_descoberta, dinossauro.inicio, dinossauro.fim, era.nome,
	pais.nome
from dinossauro
inner join descobridor on descobridor.id = dinossauro.fk_descobridor
inner join grupo on grupo.id = dinossauro.fk_grupo
inner join era on era.id = dinossauro.fk_era
inner join pais on pais.id = dinossauro.fk_pais
order by descobridor.nome


--Crie uma consulta para relacionar todos os dados disponiveis dos dinossauros do 
--grupo anquilossauros em ordem de ano de descoberta.
select * from dinossauro
inner join grupo on grupo.id = dinossauro.fk_grupo
where grupo.nome = 'Anquilossauros'
order by dinossauro.ano_descoberta

select dinossauro.id, dinossauro.nome, grupo.nome as 'grupo', descobridor.nome as 'descobridor',
	dinossauro.toneladas, dinossauro.ano_descoberta, dinossauro.inicio, dinossauro.fim, era.nome,
	pais.nome
from dinossauro
inner join descobridor on descobridor.id = dinossauro.fk_descobridor
inner join grupo on grupo.id = dinossauro.fk_grupo
inner join era on era.id = dinossauro.fk_era
inner join pais on pais.id = dinossauro.fk_pais
where grupo.nome = 'Anquilossauros'
order by dinossauro.ano_descoberta

--Crie uma consulta para relacionar todos os dados disponiveis dos dinossaruos 
--ceratopsideos ou anquilossauros com ano de descoberta entre 1900 e 1999

select * from dinossauro
inner join grupo on grupo.id = dinossauro.fk_grupo
--where (grupo.nome = 'Anquilossauros' or grupo.nome = 'Ceratops�deos')
where grupo.nome in ('Anquilossauros', 'Ceratops�deos')
	--and dinossauro.ano_descoberta > '1900' and dinossauro.ano_descoberta < '1999'
	and dinossauro.ano_descoberta between '1900' and '1999'


	
select dinossauro.id, dinossauro.nome, grupo.nome as 'grupo', descobridor.nome as 'descobridor',
	dinossauro.toneladas, dinossauro.ano_descoberta, dinossauro.inicio, dinossauro.fim, era.nome,
	pais.nome
from dinossauro
inner join descobridor on descobridor.id = dinossauro.fk_descobridor
inner join grupo on grupo.id = dinossauro.fk_grupo
inner join era on era.id = dinossauro.fk_era
inner join pais on pais.id = dinossauro.fk_pais
where grupo.nome in ('Anquilossauros', 'Ceratops�deos')
	and dinossauro.ano_descoberta between '1900' and '1999'





--1. Fa�a uma trigger que valide os anos iniciais e finais da exist�ncia do dinossauro 
--inserido ou atualizado. Caso os anos n�o estejam corretos, cancele a opera��o e mostre 
--uma mensagem ao usu�rio.

create trigger exercicio1
on dinossauro
after insert, update
as 
begin
	declare @ini int
	declare @fim int

	select @ini = (select inserted.inicio from inserted)
	select @fim = (select inserted.fim	  from inserted)

	if(@fim < @ini)
	begin
		PRINT('Dinossauro cadastrado com sucesso!')
	end
	else
	begin
		ROLLBACK;
		RAISERROR('Datas inv�lidas!', 14, 1);
		return;
	end
end

select * from dinossauro
select * from era

update era set inicio = 300, fim = 200 where nome = 'Jur�ssico'

insert into dinossauro values ('Giganotossauro2', 1, 2, 6, '1983', 70, 50, 1, 1)

--2. Atualize a trigger anterior, para validar a inser��o e altera��o do dinossauro, 
--conforme as eras (verificar se os anos de exist�ncia do dinossauro condizem com a era informada), 
--informando que os valores de anos est�o errados ou n�o condizem com a era informada.
drop trigger exercicio2
create trigger exercicio2
on dinossauro
after insert, update
as
begin
	declare @dinoIni Int
	declare @dinoFim Int
	declare @eraIni Int
	declare @eraFim Int

	select @dinoIni = (select inserted.inicio from inserted)
	select @dinoFim = (select inserted.fim from inserted)
	select @eraIni = (select era.inicio from era inner join inserted on inserted.fk_era = era.id)
	select @eraFim = (select era.fim from era inner join inserted on inserted.fk_era = era.id)

	if (@dinoIni < @eraIni) and (@dinoFim > @eraFim)
	begin
		print('Dinossauro cadastrado!');
	end
	else
	begin
		rollback;
		raiserror('Datas do dinosauro n�o conferem com a Era informada!', 14, 1);
		return;
	end
end


insert into dinossauro values ('Giganotossauro3', 1, 2, 6, '1983', 190, 130, 1, 1)

select * from dinossauro
select * from era
1 - Cret�ceo	200	110
2 - Jur�ssico	300	200




