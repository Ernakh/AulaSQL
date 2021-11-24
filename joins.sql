


CREATE TABLE java(
  professor varchar(20) NULL
)

CREATE TABLE dotnet(
  professor varchar(20) NULL
)

INSERT INTO java VALUES('Fabrício')
INSERT INTO java VALUES('Sylvio')
INSERT INTO java VALUES('Reiner')

INSERT INTO dotnet VALUES('Fabrício')
INSERT INTO dotnet VALUES('Ricardo')

--inner join
select * from java
inner join dotnet
on java.professor = dotnet.professor

--left join
select * from java
left join dotnet
on java.professor = dotnet.professor

--left join exclusivo
select * from java
left join dotnet
on java.professor = dotnet.professor
where dotnet.professor is null

--right join
select * from java
right join dotnet
on java.professor = dotnet.professor

--right join exclusivo
select * from java
right join dotnet
on java.professor = dotnet.professor
where java.professor is null

--outer join
select * from java
full outer join dotnet
on java.professor = dotnet.professor

--outer join exclusivo
select * from java
full outer join dotnet
on java.professor = dotnet.professor
where java.professor is null or dotnet.professor is null


