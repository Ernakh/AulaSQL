--postgresql

CREATE TABLE produtos (
id integer NOT NULL unique,
	nome varchar(50) not null,
estoque integer
);

CREATE SEQUENCE produtos_id_seq
INCREMENT BY 1
NO MAXVALUE
NO MINVALUE
CACHE 1;

ALTER SEQUENCE produtos_id_seq OWNED BY produtos.id;
ALTER TABLE produtos ALTER COLUMN id SET DEFAULT nextval('produtos_id_seq'::regclass);
--------

CREATE TABLE vendas (
id integer NOT NULL,
produto integer,
quantidade integer,
	CONSTRAINT fk_produto
      FOREIGN KEY(produto) 
  REFERENCES produtos(id)
);

CREATE SEQUENCE vendas_id_seq
INCREMENT BY 1
NO MAXVALUE
NO MINVALUE
CACHE 1;

ALTER SEQUENCE vendas_id_seq OWNED BY vendas.id;
ALTER TABLE vendas ALTER COLUMN id SET DEFAULT nextval('vendas_id_seq'::regclass);



--------------------------

insert into produtos (nome, estoque) 
values ('item 1', 30)

select * from produtos

-------------------------


CREATE OR REPLACE FUNCTION verificarestoque() RETURNS TRIGGER AS $BODY$
DECLARE
   estoqueatual integer := 0;
BEGIN
	estoqueatual := (select produtos.estoque from produtos where produtos.id = NEW.produto);

	IF(estoqueatual>=NEW.quantidade) THEN
		update produtos set estoque = (estoqueatual - NEW.quantidade) where produtos.id = NEW.produto;
	ELSE
		RAISE EXCEPTION 'Estoque insuficiente para a venda';
	END IF;
	RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql VOLATILE;


 CREATE TRIGGER trigger_estoque_vendas AFTER INSERT OR UPDATE ON vendas
    FOR EACH ROW EXECUTE PROCEDURE verificarestoque();
	
	
	
	-------------------------------
	
	-- VERIFICA DATA NASCIMENTO
CREATE OR REPLACE FUNCTION verifica_data_nascimento() RETURNS trigger as $BODY$
DECLARE anoAtual integer := EXTRACT(YEAR FROM now());
anoNascimento integer := EXTRACT(YEAR FROM new.data_nascimento);
BEGIN
IF ((anoAtual - anoNascimento) >= 18 )
THEN
RAISE exception 'maior de idade';
ELSE
RAISE exception 'menor idade';
END IF;

RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE;

--CRIA TRIGGER QUE CHAMA A FUNÇÃO verifica_estoque
CREATE TRIGGER t_verifica_data_nascimento AFTER INSERT OR UPDATE ON PESSOA
FOR EACH ROW EXECUTE PROCEDURE verifica_data_nascimento();