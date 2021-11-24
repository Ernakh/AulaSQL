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
insert into grupo values('Ceratopsídeos')
insert into grupo values('Estegossauros')
insert into grupo values('Terápodes')
insert into descobridor values('Maryanska')
insert into descobridor values('John Bell Hatcher')
insert into descobridor values('Cientistas Alemães')
insert into descobridor values('Museu Americano de História Natural')
insert into descobridor values('Othniel Charles Marsh')
insert into descobridor values('Barn Brown')
insert into era values('Cretáceo')
insert into era values('Jurássico')
insert into pais values('Mongólia')
insert into pais values('Canadá')
insert into pais values('Tanzânia')
insert into pais values('China')
insert into pais values('USA')
insert into dinossauro values('Saichania',1,1,4,'1977',145,66,1,1)
insert into dinossauro values('Tricerátops',2,2,6,'1887',70,66,1,2)
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
where grupo.nome = 'Ceratopsídeos' or grupo.nome ='Anquilossauros' and dinossauro.ano_descoberta >= '1900' and dinossauro.ano_descoberta <='1999'
select pais.nome, count(*) as [Nº de dinossauros por pais] from dinossauro
inner join pais on pais.id = dinossauro.fk_pais
group by pais.nome
select avg(dinossauro.toneladas) as [Média de toneladas] from dinossauro
where dinossauro.fk_pais = 5
select descobridor.nome, COUNT(*) as [Nº de dinossauros por descobridor] from dinossauro
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
--where (grupo.nome = 'Anquilossauros' or grupo.nome = 'Ceratopsídeos')
where grupo.nome in ('Anquilossauros', 'Ceratopsídeos')
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
where grupo.nome in ('Anquilossauros', 'Ceratopsídeos')
	and dinossauro.ano_descoberta between '1900' and '1999'





--1. Faça uma trigger que valide os anos iniciais e finais da existência do dinossauro 
--inserido ou atualizado. Caso os anos não estejam corretos, cancele a operação e mostre 
--uma mensagem ao usuário.

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
		RAISERROR('Datas inválidas!', 14, 1);
		return;
	end
end

select * from dinossauro
select * from era

update era set inicio = 300, fim = 200 where nome = 'Jurássico'

insert into dinossauro values ('Giganotossauro2', 1, 2, 6, '1983', 70, 50, 1, 1)

--2. Atualize a trigger anterior, para validar a inserção e alteração do dinossauro, 
--conforme as eras (verificar se os anos de existência do dinossauro condizem com a era informada), 
--informando que os valores de anos estão errados ou não condizem com a era informada.
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
		raiserror('Datas do dinosauro não conferem com a Era informada!', 14, 1);
		return;
	end
end


insert into dinossauro values ('Giganotossauro3', 1, 2, 6, '1983', 190, 130, 1, 1)

select * from dinossauro
select * from era
1 - Cretáceo	200	110
2 - Jurássico	300	200




