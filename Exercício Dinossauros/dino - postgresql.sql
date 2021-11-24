/*
 Navicat Premium Data Transfer

 Source Server         : PostgreSQL Localhost
 Source Server Type    : PostgreSQL
 Source Server Version : 120003
 Source Host           : localhost:5432
 Source Catalog        : dino
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120003
 File Encoding         : 65001

 Date: 14/12/2020 18:35:30
*/


-- ----------------------------
-- Sequence structure for descobridores_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."descobridores_id_seq";
CREATE SEQUENCE "public"."descobridores_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for dinossauros_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."dinossauros_id_seq";
CREATE SEQUENCE "public"."dinossauros_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for eras_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."eras_id_seq";
CREATE SEQUENCE "public"."eras_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for grupos_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."grupos_id_seq";
CREATE SEQUENCE "public"."grupos_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for paises_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."paises_id_seq";
CREATE SEQUENCE "public"."paises_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for descobridores
-- ----------------------------
DROP TABLE IF EXISTS "public"."descobridores";
CREATE TABLE "public"."descobridores" (
  "id" int8 NOT NULL DEFAULT nextval('descobridores_id_seq'::regclass),
  "nome" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of descobridores
-- ----------------------------
INSERT INTO "public"."descobridores" VALUES (1, 'Maryanska');
INSERT INTO "public"."descobridores" VALUES (2, 'John Bell Hatcher');
INSERT INTO "public"."descobridores" VALUES (3, 'Cientistas Alemães');
INSERT INTO "public"."descobridores" VALUES (4, 'Museu Americano de
História Natural');
INSERT INTO "public"."descobridores" VALUES (5, 'Othniel Charles
Marsh');
INSERT INTO "public"."descobridores" VALUES (6, 'Barnum Brown');

-- ----------------------------
-- Table structure for dinossauros
-- ----------------------------
DROP TABLE IF EXISTS "public"."dinossauros";
CREATE TABLE "public"."dinossauros" (
  "id" int8 NOT NULL DEFAULT nextval('dinossauros_id_seq'::regclass),
  "nome" text COLLATE "pg_catalog"."default" NOT NULL,
  "grupos_id" int8 NOT NULL,
  "toneladas" numeric(8,2) NOT NULL,
  "ano_descoberta" int4 NOT NULL,
  "descobridores_id" int8 NOT NULL,
  "eras_id" int8 NOT NULL,
  "paises_id" int8 NOT NULL,
  "inicio" int8,
  "fim" int8
)
;

-- ----------------------------
-- Records of dinossauros
-- ----------------------------
INSERT INTO "public"."dinossauros" VALUES (1, 'Saichania', 1, 4.00, 1977, 1, 3, 1, 145, 66);
INSERT INTO "public"."dinossauros" VALUES (2, 'Tricerátops', 2, 6.00, 1887, 2, 3, 2, 70, 66);
INSERT INTO "public"."dinossauros" VALUES (3, 'Kentrossauro', 3, 2.00, 1909, 3, 2, 3, 200, 145);
INSERT INTO "public"."dinossauros" VALUES (4, 'Pinacossauro', 1, 6.00, 1999, 4, 1, 4, 85, 75);
INSERT INTO "public"."dinossauros" VALUES (5, 'Torossauro', 5, 8.00, 1891, 5, 3, 5, 67, 65);

-- ----------------------------
-- Table structure for eras
-- ----------------------------
DROP TABLE IF EXISTS "public"."eras";
CREATE TABLE "public"."eras" (
  "id" int8 NOT NULL DEFAULT nextval('eras_id_seq'::regclass),
  "nome" text COLLATE "pg_catalog"."default" NOT NULL,
  "inicio" int4 NOT NULL,
  "fim" int4 NOT NULL
)
;

-- ----------------------------
-- Records of eras
-- ----------------------------
INSERT INTO "public"."eras" VALUES (1, 'Triássico', 245, 208);
INSERT INTO "public"."eras" VALUES (2, 'Jurássico', 208, 144);
INSERT INTO "public"."eras" VALUES (3, 'Cretáceo', 144, 65);

-- ----------------------------
-- Table structure for grupos
-- ----------------------------
DROP TABLE IF EXISTS "public"."grupos";
CREATE TABLE "public"."grupos" (
  "id" int8 NOT NULL DEFAULT nextval('grupos_id_seq'::regclass),
  "nome" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of grupos
-- ----------------------------
INSERT INTO "public"."grupos" VALUES (1, 'Anquilossauros');
INSERT INTO "public"."grupos" VALUES (2, 'Ceratopsídeos');
INSERT INTO "public"."grupos" VALUES (3, 'Estegossauros');
INSERT INTO "public"."grupos" VALUES (4, 'Terápodes');
INSERT INTO "public"."grupos" VALUES (5, 'Ceratopsídeos');

-- ----------------------------
-- Table structure for paises
-- ----------------------------
DROP TABLE IF EXISTS "public"."paises";
CREATE TABLE "public"."paises" (
  "id" int8 NOT NULL DEFAULT nextval('paises_id_seq'::regclass),
  "nome" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of paises
-- ----------------------------
INSERT INTO "public"."paises" VALUES (1, 'Mongólia');
INSERT INTO "public"."paises" VALUES (2, 'Canadá');
INSERT INTO "public"."paises" VALUES (3, 'Tanzânia');
INSERT INTO "public"."paises" VALUES (4, 'China');
INSERT INTO "public"."paises" VALUES (5, 'USA');

-- ----------------------------
-- Function structure for checkera
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."checkera"();
CREATE OR REPLACE FUNCTION "public"."checkera"()
  RETURNS "pg_catalog"."trigger" AS $BODY$ DECLARE
	ano_inicial INTEGER := 0;
ano_final INTEGER := 0;
BEGIN
	SELECT
		inicio 
	FROM
		eras 
	WHERE
		ID = NEW.eras_id INTO ano_inicial;
	SELECT
		fim 
	FROM
		eras 
	WHERE
		ID = NEW.eras_id INTO ano_final;
	IF
		( NEW.inicio < NEW.fim ) THEN
			RAISE EXCEPTION 'ano incorreto';
-- exercicio 5
		
	END IF;
	IF
		( NEW.inicio < ano_inicial ) 
		AND ( NEW.fim > ano_final ) THEN
			RAISE EXCEPTION 'ano incorreto da era';
-- exercicio 6
		
	END IF;
	RETURN NEW;
	
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."descobridores_id_seq"
OWNED BY "public"."descobridores"."id";
SELECT setval('"public"."descobridores_id_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."dinossauros_id_seq"
OWNED BY "public"."dinossauros"."id";
SELECT setval('"public"."dinossauros_id_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."eras_id_seq"
OWNED BY "public"."eras"."id";
SELECT setval('"public"."eras_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."grupos_id_seq"
OWNED BY "public"."grupos"."id";
SELECT setval('"public"."grupos_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."paises_id_seq"
OWNED BY "public"."paises"."id";
SELECT setval('"public"."paises_id_seq"', 6, true);

-- ----------------------------
-- Primary Key structure for table descobridores
-- ----------------------------
ALTER TABLE "public"."descobridores" ADD CONSTRAINT "descobridores_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Triggers structure for table dinossauros
-- ----------------------------
CREATE TRIGGER "t_checkera" AFTER INSERT OR UPDATE ON "public"."dinossauros"
FOR EACH ROW
EXECUTE PROCEDURE "public"."checkera"();

-- ----------------------------
-- Primary Key structure for table dinossauros
-- ----------------------------
ALTER TABLE "public"."dinossauros" ADD CONSTRAINT "dinossauros_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table eras
-- ----------------------------
ALTER TABLE "public"."eras" ADD CONSTRAINT "eras_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table grupos
-- ----------------------------
ALTER TABLE "public"."grupos" ADD CONSTRAINT "grupos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table paises
-- ----------------------------
ALTER TABLE "public"."paises" ADD CONSTRAINT "paises_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table dinossauros
-- ----------------------------
ALTER TABLE "public"."dinossauros" ADD CONSTRAINT "dinossauros_descobridores_id_foreign" FOREIGN KEY ("descobridores_id") REFERENCES "public"."descobridores" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "public"."dinossauros" ADD CONSTRAINT "dinossauros_eras_id_foreign" FOREIGN KEY ("eras_id") REFERENCES "public"."eras" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "public"."dinossauros" ADD CONSTRAINT "dinossauros_grupos_id_foreign" FOREIGN KEY ("grupos_id") REFERENCES "public"."grupos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "public"."dinossauros" ADD CONSTRAINT "dinossauros_paises_id_foreign" FOREIGN KEY ("paises_id") REFERENCES "public"."paises" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
