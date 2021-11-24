CREATE TABLE ERA(
	ID_ERA SERIAL primary key not null,
	NOME VARCHAR (30),
	ANO_INICIO int,
	ANO_FIM int
);

CREATE TABLE DINOSSAURO(
	ID_DINOSSAURO INT GENERATED ALWAYS AS IDENTITY,
	NOME VARCHAR(40),
	GRUPO VARCHAR(40),
	TONELADA int,
	ANO_DESCOBERTA int,
	INICIO INT,
	FIM INT,
	DESCOBRIDOR VARCHAR(40),
	PAIS_DESCOBERTO VARCHAR (20),
	ID_ERA int,
	
	PRIMARY KEY(ID_DINOSSAURO),
	CONSTRAINT FK_ID_ERA
	FOREIGN KEY(ID_ERA) 
	REFERENCES ERA(ID_ERA)
);

INSERT INTO public.era(nome, ano_inicio, ano_fim)
	VALUES ('Cretáceo', 145, 65),
		   ('Jurássico', 200, 145), 
		   ('Triássico', 251, 200); 
	
INSERT INTO public.dinossauro(nome, grupo, tonelada, ano_descoberta,inicio,fim, descobridor, pais_descoberto, id_era)
	VALUES ('Saichnia', 'Anquilossauros', 4, 1977,145,66, 'Markanska', 'Mongólia', 1),
			('Triceráptos', 'Ceratopsideos', 6, 1887,70,66, 'John Bell Hatcher', 'Canadá', 1),
			('Kentrossauro', 'Estegossauros', 2, 1909,200,145, 'Cientistas Alemães', 'Tanzânia', 2),
			('Pinacossauro', 'Anquilossauros', 6, 1999,85,75, 'Museu Americano de História nacional', 'China', 3),
			('Alossauro', 'Terápodes', 3, 1877,155 ,150 , 'Othniel Charles Marsh', 'América do Norte', 2),
			('Torossauro', 'Ceratopsideos', 8, 1891,67,65, 'John Bell Hatcher', 'USA', 1);


CREATE OR REPLACE FUNCTION verificar_era() RETURNS trigger as $BODY$
BEGIN

IF(new.ano_inicio < new.ano_fim) THEN
	RAISE exception 'Ano inválido';
END IF;
RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE;

CREATE TRIGGER t_verificar_era AFTER INSERT OR UPDATE ON ERA
FOR EACH ROW EXECUTE PROCEDURE verificar_era();
	
---------------------------

CREATE OR REPLACE FUNCTION verificar_era_2() RETURNS trigger as $BODY$
DECLARE era_ini integer := (SELECT ano_inicio FROM era WHERE id_era = NEW.id_era);
		era_fim integer := (SELECT ano_fim FROM era WHERE id_era = NEW.id_era);
BEGIN
IF(new.inicio > era_ini or new.fim < era_fim ) THEN
	RAISE exception 'As datas não condizem com a era informada!';
END IF;
RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE;

CREATE  TRIGGER t_verificar_era_2 BEFORE INSERT OR UPDATE ON DINOSSAURO
FOR EACH ROW EXECUTE PROCEDURE verificar_era_2();

INSERT INTO public.dinossauro(nome, grupo, tonelada, ano_descoberta,inicio,fim, descobridor, pais_descoberto, id_era)
	VALUES ('Saichnia', 'Anquilossauros', 4, 1977,150,70, 'Markanska', 'Mongólia', 1);



