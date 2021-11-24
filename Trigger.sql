


select * from java
select * from dotnet


create table log 
(
	id integer not null primary key identity,
	acao varchar(10) not null,
	descricao varchar(100),
	quando datetime not null
)

drop trigger primeiratrigger

create trigger primeiratrigger
on java
AFTER DELETE 
AS
BEGIN
	insert into log values ('exclus�o', 'foi excluido um professor da academia java', GETDATE());
END 

select * from log
select * from java

drop trigger segundatrigger

create trigger segundatrigger 
on java
after insert
as
begin
	insert into log values ('insers�o', 'foi incluido um professor na academia java', GETDATE());
	PRINT('Dados inseridos!');
end

insert into java values ('Ricardo')

select * from java
select * from log

drop trigger terceiratrigger


create trigger terceiratrigger
on dotnet
after insert 
as 
begin
	declare @contagem int
	select @contagem = (select count(professor) from dotnet)

	print('Quantidade de registros: ' + CONVERT(VARCHAR(10), @contagem))

	IF @contagem < 3
		begin
			insert into log values ('inser��o', 'novo professor na academia dotnet', getdate());
			print('Dados inseridos com sucesso!');
		end
	else
		begin
			ROLLBACK;
			insert into log values ('inser��o', 'tentativa de inser��o de novo professor na academia dotnet', getdate());
			RAISERROR('INVALIDO', 14, 1);
			RETURN;
		end
end


select * from dotnet

drop trigger quartatrigger






create trigger quartatrigger
on dotnet
after update
as
	declare @old varchar(10)
	declare @new varchar(10)

	select @old = (select deleted.professor from deleted)
	select @new = (select inserted.professor from inserted)

	IF(ROWCOUNT_BIG() = 0)--boa pratica, pare interromper a trigger caso nenhum registro tenha sido afetado (where filtrou e trouxe nenhum dado)
		return;
	
	IF @old = @new
	begin
		raiserror('SEM ALTERA��ES! Valores s�o iguais!', 14, 1);
		rollback transaction;
		insert into log values ('ALTERA��O', 'tentativa de altera��o do nome de um professor na academia dotnet, pelo mesmo nome', getdate());
	end
	ELSE
	begin
		insert into log values ('ALTERA��O', 'altera��o do nome de um professor ' + @old + ' na academia dotnet, para o nome ' + @new, getdate());
	end












	select * from dotnet
	select * from log

	update dotnet set professor = 'Fabr�cio'

	insert into dotnet values ('Fabr�cio')




	create trigger quintatrigger
	on dotnet
	after delete
	as
	BEGIN
		declare @nome varchar(10)
		select @nome = (select deleted.professor from deleted)
		insert into log values ('Exclus�o', @nome + ' foi excluido dos professores da academia .net', GETDATE());
	END


select * from log
select * from dotnet
select * from java

delete from dotnet where professor = 'Fabr�cio'

create trigger sextatrigger
on dotnet
instead of insert
as
begin
	insert into log values ('Inclus�o', ' Novo professores na academia .net', GETDATE());
	insert into dotnet values (UPPER((select inserted.professor from inserted)));
end


insert into dotnet values ('Fabr�cio')
select * from dotnet
select * from log



--1. Fa�a uma trigger que valide os anos iniciais e finais da exist�ncia do dinossauro inserido ou atualizado. Caso os anos n�o estejam corretos, cancele a opera��o e mostre uma mensagem ao usu�rio.

create trigger validadinossauro
on dinossauro
after insert
as begin
    declare @inicio int
    declare @fim int
    select @inicio = (select inserted.inicio from inserted)
    select @fim = (select inserted.fim from inserted)
    if @inicio > @fim
    begin
        raiserror('As datas n�o coincidem',14,1);
        rollback transaction;
    end
    else
    begin
    print('Dados inseridos com sucesso!');
    end
end

--2. Atualize a trigger anterior, para validar a inser��o e altera��o do dinossauro, conforme as eras (verificar se os anos de exist�ncia do dinossauro condizem com a era informada), informando que os valores de anos est�o errados ou n�o condizem com a era informada.




select @inicioD = (select inserted.inicio from inserted)
select @fimD = (select inserted.fim from inserted)
select @inicioE = (select era.inicio from era where era.id	= inserted.fk_era)
select @fimE = (select era.fim from era where era.id	= inserted.fk_era)