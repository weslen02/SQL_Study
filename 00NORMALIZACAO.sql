CREATE DATABASE exercicioVeiculo --Cria o banco
GO

USE exercicioVeiculo --Seleciona-o para usar
GO

--Cria a tabela
CREATE TABLE veiculos(
	renavam			INT IDENTITY(1000,1) NOT NULL,
	placa			varchar(7),
	marca			varchar(20),
	modelo			varchar(20),
	ano				int,
	cor				varchar(10),
	valor			float,
	municipio		varchar(20),
	
	CONSTRAINT		pk_veiculo PRIMARY KEY(renavam)
)

--Insere os valores
INSERT INTO veiculos VALUES
('AYR8712','GM','Cruze',2016,'Branco', 60000,'Mogi Mirim'),
('BIT1222','Volks','Gol',2012,'Amarelo', 28000,'Mogi Guaçu'),
('OUT1933','Ford','Fusion',2018,'Prata', 110000,'Campinas'),
('KKL5534','Ford','Fusion',2013,'Branco', 65000,'São Paulo'),
('AYR8777','GM','Cruze',2018,'Preto', 68229,'Cuiaba'),
('FBP1222','Volks','Gol',2019,'Vermelho', 46996,'Curitiba'),
('AAB1933','Ford','Fusion',2017,'Chumbo', 99453,'Serra Negra'),
('FBI5534','Ford','Fusion',2005,'Cinza', 53895,'Rio de Janeiro'),
('WWW1270','GM','VIRTUS',2019,'Preto', 123456,'Hortolandia');

--NORMALIZAÇÃO ---------------------------------------------------------
--Cria a tabela a partir da coluna a ser normalizada com valores DISTINTOS(não se repetindo)
--1:
SELECT DISTINCT veiculos.municipio INTO municipios
FROM veiculos

--2:
SELECT *
FROM municipios

SELECT *
FROM veiculos
--3:
--Altera a tabela criando uma chave primaria PK não nula auto-identavel
ALTER TABLE municipios ADD
idMunicipio			INT IDENTITY(1,1) NOT NULL,
CONSTRAINT			pk_municipios PRIMARY KEY(idMunicipio)

--4:
--Altera a tabela adicionando uma coluna de FK municipios na tabela veiculos
ALTER TABLE veiculos ADD
idMun_veiculos		INT,
CONSTRAINT			fk_Mun_veiculos FOREIGN KEY(idMun_veiculos)
					REFERENCES municipios(idMunicipio)

--5:
--Altera a tabela veiculos inserindo os valores de FK da tabela municipio onde os campos são equivalentes
UPDATE veiculos SET veiculos.idMun_veiculos = 
    (SELECT municipios.idMunicipio FROM municipios
	 WHERE municipios.municipio = veiculos.municipio)

--6:
--Deleta a coluna que já não é mais necessaria, pois foi normalizada como uma nova tabela
ALTER TABLE veiculos DROP COLUMN municipio

SELECT *
FROM veiculos V
--NORMALIZAÇÃO ---------------------------------------------------------

/*######################################################################
Legenda:
tableA		> Tabela que contém a coluna a ser Normalizada;
tableBName	> Nome que a tabela receberá ao ser criada no primeiro STEP, após o 1º Step chamaremos apenas de tableB;
tableB		> Coluna transformada em tabela carregando os dados, que está sendo ou é normalizada;
columnN		> Coluna com os dados a ser normalizada;
PKtableB	> Nome que a chave primaria irá ter na tabela Normalizada;
pk_tableB	> Apelido que a PK recebe ao ser criada, se não criado é referenciada por Alfanumérico;
FKtableB	> Nome que a FK da tableB recebe na tableA. (Nome independe do funcionamento, meu padrão para FK é:
idNomeDaTabelaQueVem_NomeDaTabelaQueEsta);
fk_tableB_tableA > Apelido para FK como o Apelido de PK, segue os mesmo padrão anterior para mim.

---------------------------SINTAXE NORMALIZAÇÃO-----------------------------
SETEP 1:
SELECT DISTINCT tableA.columnN INTO tabelaBName
FROM tableA

STEP 2: (OPCIONAL) Apenas para verificar se a tabela foi criada
SELECT tableB.*
FROM tableB


STEP 3:
ALTER TABLE tableB ADD
PKtableB				INT IDENTITY(1,1) NOT NULL,
CONSTRAINT				pk_tableB PRIMARY KEY(PKtableB)

STEP 4:
ALTER TABLE tableA ADD
FKtableB				INT,
CONSTRAINT				fk_tableB_tableA FOREIGN KEY(FKtableB)
						REFERENCES tableB(PKtableB)

STEP 5:
UPDATE tableA SET tableA.FKtableB =
	(SELECT tableB.PKtableB FROM tableB
	 WHERE tableB.columnN = tableA.columnN)


STEP 6:
ALTER TABLE tableA DROP COLUMN columnN
---------------------------SINTAXE NORMALIZAÇÃO-----------------------------
#######################################################################*/