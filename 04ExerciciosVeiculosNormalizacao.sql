CREATE DATABASE exercicioVeiculo
GO

USE exercicioVeiculo
GO

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

SELECT * FROM veiculos

INSERT INTO veiculos VALUES
('AYR8712','GM','Cruze',2016,'Branco', 60000,'Mogi Mirim'),
('BIT1222','Volks','Gol',2012,'Amarelo', 28000,'Mogi Guaçu'),
('OUT1933','Ford','Fusion',2018,'Prata', 110000,'Campinas'),
('KKL5534','Ford','Fusion',2013,'Branco', 65000,'São Paulo'),
('AYR8777','GM','Cruze',2018,'Preto', 68229,'Cuiaba'),
('FBP1222','Volks','Gol',2019,'Vermelho', 46996,'Curitiba'),
('AAB1933','Ford','Fusion',2017,'Chumbo', 99453,'Serra Negra'),
('FBI5534','Ford','Fusion',2005,'Cinza', 53895,'Rio de Janeiro'),
('WWW1270','Volks','VIRTUS',2019,'Preto', 123456,'Hortolandia');

--Exercicios:
--1 - Selecionar o modelo dos veículos de cor branco e ano maior que 2000.
SELECT veiculos.modelo FROM veiculos WHERE cor = 'branco' and ano > 2000

SELECT V.modelo,V.cor, V.ano
FROM veiculos V
WHERE cor LIKE 'br%' and ano >2000

--2 - Apresentar os veículos da marca ford e com valor entre 60000 e 100000.
SELECT V.*
FROM veiculos V
WHERE marca = 'ford' AND valor BETWEEN 60000 AND 100000

--3 - Apresentar os modelos de veículos com ano entre 2010 e 2015, município Mogi e com inicial da placa 'A'. 
SELECT V.*
FROM veiculos V
WHERE (ano BETWEEN 2010 AND 2017) AND (municipio LIKE 'MOGI%') AND (placa LIKE 'A%')

--4 - Selecionar a placa, renavam e modelo dos veículos com cor Prata, do municipio de mogi mirim e com valor superior a 50000
SELECT renavam, placa, modelo, cor, municipio, valor
FROM veiculos V
WHERE municipio LIKE 'MOGI%' AND valor > 50000
	
--5 - Selecionar o modelo e marca dos veículos com ano entre 2015 e 2018. Ordenar o resultado por renavam decrescente.
SELECT renavam, modelo, marca, cor, ano
FROM veiculos
WHERE ano BETWEEN 2015 AND 2018
ORDER BY renavam DESC

/*6 - Selecionar a marca e modelo dos veículos em ordem crescente por modelo. Filtrar os veículos com cor branca, valor entre
50000 e 89000 do município de são paulo.*/
SELECT V.*
FROM veiculos V
WHERE cor LIKE 'BR%' AND (valor BETWEEN 50000 AND 89000) AND municipio LIKE 'SÃO%'
ORDER BY modelo ASC

--NORMALIZAÇÃO # ---------------------------------------------------------
--Cria a tabela a partir da coluna a ser normalizada com valores DISTINTOS(não se repetindo)
--#1:
SELECT DISTINCT municipio INTO municipios
FROM veiculos

--#2:
SELECT *
FROM municipios

SELECT *
FROM veiculos
--#3:
--Altera a tabela criando uma chave primaria PK não nula auto-identavel
ALTER TABLE municipios ADD
idMunicipio			INT IDENTITY(1,1) NOT NULL,
CONSTRAINT			pk_municipios PRIMARY KEY(idMunicipio)

--#4:
--Altera a tabela adicionando uma coluna de FK municipios na tabela veiculos
ALTER TABLE veiculos ADD
idMun_veiculos		INT,
CONSTRAINT			fk_Mun_veiculo FOREIGN KEY(idMun_veiculos)
					REFERENCES municipios(idMunicipio)

--#5:
--Altera a tabela veiculos inserindo os valores de FK da tabela municipio onde os campos são equivalentes
UPDATE veiculos SET veiculos.idMun_veiculos = 
    (SELECT municipios.idMunicipio FROM municipios
	 WHERE municipios.municipio = veiculos.municipio)

--#6:
--Deleta a coluna que já não é mais necessaria, pois foi normalizada como uma nova tabela
ALTER TABLE veiculos DROP COLUMN municipio

SELECT *
FROM veiculos V
--NORMALIZAÇÃO # ---------------------------------------------------------

--7 - Consultar qtd de veículos cadastrado por município. 
SELECT COUNT(V.renavam) AS 'QNTD VEICULOS', M.idMunicipio, M.municipio
FROM veiculos V
INNER JOIN municipios M ON V.idMun_veiculos = M.idMunicipio
GROUP BY M.idMunicipio, M.municipio

--8 - Consultar a média de ano e valor dos veículos cadastrados. 
SELECT AVG(V.valor) AS 'AVG CUSTO VEIC', AVG(V.ano) AS 'AVG ANO VEIC',
MIN(V.valor) AS 'VALOR MIN', MAX(V.valor) AS 'VALOR MAX', MIN(V.ano) AS 'MENOR ANO', MAX(V.ano) AS 'MAIOR ANO'
FROM veiculos V

--9 - SEleconar o valor total do custo dos veículos. 
SELECT SUM(V.valor) AS 'VALOR TOTAL VEIC', COUNT(V.renavam) AS 'TOTAL DE VEIC'
FROM veiculos V

--10 - Selecionar a quantidade de veículos por marca, modelo e municipio. Ordenar o resultado por modelo. 
SELECT COUNT(V.renavam) AS 'QTND VEIC', V.marca, V.modelo, M.municipio
FROM veiculos V
INNER JOIN municipios M ON V.idMun_veiculos = M.idMunicipio
GROUP BY V.marca, V.modelo, M.municipio
ORDER BY V.modelo

/*11 - Normalizar o campo Marca. PAra isso criar uma nova tabela com nome marca, transferir os valores dos registros já 
cadastrados para esta nova tabela e vincular através de Pk e FK as duas tabelas. */
--1#
SELECT DISTINCT V.marca INTO marcas
FROM veiculos V

--2#
SELECT marcas.*
FROM marcas

--3#
ALTER TABLE marcas ADD
idMarca				INT IDENTITY(1,1) NOT NULL,
CONSTRAINT			pk_marca PRIMARY KEY(idMarca)

--4#
ALTER TABLE veiculos ADD
idMarcas_veiculos	INT,
CONSTRAINT			fk_marcas_veiculos FOREIGN KEY(idMarcas_veiculos)
					REFERENCES marcas(idMarca)

--5#
UPDATE veiculos SET veiculos.idMarcas_veiculos = 
	(SELECT marcas.idMarca FROM marcas
	 WHERE marcas.marca = veiculos.marca)

--6#
ALTER TABLE veiculos DROP COLUMN marca


--12 - Selecionar a quantidade de veículos por marca. 
SELECT COUNT(V.idMarcas_veiculos) AS 'QNDT', M.idMarca, M.marca
FROM veiculos V
INNER JOIN marcas M ON V.idMarcas_veiculos = M.idMarca
GROUP BY idMarcas_veiculos, M.idMarca, M.marca

SELECT * FROM veiculos

--13 - Selecionar o modelo, marca, ano e município dos veículos cadastrados. 
SELECT V.modelo, M.marca, MU.municipio
FROM veiculos V
INNER JOIN marcas M ON V.idMarcas_veiculos = M.idMarca
INNER JOIN municipios MU ON V.idMun_veiculos = MU.idMunicipio


/*
14 - Normalizar o campo Cor. PAra isso criar uma nova tabela com nome Cor, 
   transferir os valores dos registros já cadastrados para esta nova tabela e 
   vincular através de Pk e FK as duas tabelas.
   1º - criar tabela nova com base nas informações do campo.
   2º - criar pk na nova tabela como identity.
   3º - criar o campo codigo na tabela principal. 
   4º - definir fk com a nova tabela. 
   5º - preencher o novo campo campo codigo com base nas informações das 2 tabelas.
   6º - Excluir o campo origem.
*/
--SETEP 1:
SELECT DISTINCT veiculos.cor INTO cores
FROM veiculos

--STEP 2: (OPCIONAL) Apenas para verificar se a tabela foi criada
SELECT cores.*
FROM cores


--STEP 3:
ALTER TABLE cores ADD
idCor					INT IDENTITY(1,1) NOT NULL,
CONSTRAINT				pk_cor PRIMARY KEY(idCor)

--STEP 4:
ALTER TABLE veiculos ADD
idCor_veiculos			INT,
CONSTRAINT				fkCor_veiculos FOREIGN KEY(idCor_veiculos)
						REFERENCES cores(idCor)

--STEP 5:
UPDATE veiculos SET veiculos.idCor_veiculos =
	(SELECT cores.idCor FROM cores
	 WHERE cores.cor = veiculos.cor)

--STEP 6:
ALTER TABLE veiculos DROP COLUMN cor

--15 - Selecionar a qtd de veículos por cor. 
SELECT COUNT(V.idCor_veiculos) AS 'VEIC QTND/COR', C.cor
FROM veiculos V
INNER JOIN cores C ON V.idCor_veiculos = C.idCor
GROUP BY C.cor

--16 - apresentar a média de valor dos veículos por ano e modelo. 
SELECT AVG(DISTINCT V.ano) AS 'AVG ANO', AVG(V.valor) AS 'AVG VALOR'
FROM veiculos V
GROUP BY V.ano

SELECT AVG(DISTINCT V.valor) AS 'AVG ANO', V.modelo
FROM veiculos V
GROUP BY V.modelo