-- DDL -----------------------------------------------------------------------------------
--Data Definition Language - Linguagem de Definição de Dados


/* EXERCICIOS

1. Criar o banco um novo banco de dados e elaborar as tabelas, definindo chave primária, chave secundária e
relacionamentos. Para os campos chave primária de cada tabela definir como Identity (autonumeração).
*/


--Cria o Banco
CREATE DATABASE atividadeBancodeDados
GO 

/*SOBRE GO :
É um número inteiro positivo. O lote que precede GO será executado pelo número de vezes especificado.
Grante o fim do escopo, e a quantidade de vezes desejada que o escopo seja executado.*/

/*SOBRE LOTE (batch):
Um lote de instruções SQL é um grupo de duas ou mais instruções SQL ou uma única instrução SQL
que tem o mesmo efeito de um grupo de duas ou mais instruções SQL*/

--Troca do default que estamos MASTER passando para uso do banco criado aqui (atividadeBancodeDados)
USE atividadeBancodeDados


/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
											
							--------------------ATENÇÃO------------------------

PRIMEIRAMENTE EXECUTAR A CRIAÇÃO DA TABELA DE >>>>>>>>>>>>>>>> PAIS>ESTADO>CIDADE nesta ordem indicada,
seguindo no arquivo >>02dbBrasilAtivadadeBancodeDados<<

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/

--Cria tabela
CREATE TABLE alunos(
	idRA			INT IDENTITY(10000,100) NOT NULL,
	nome			VARCHAR(100),

	idCidade_aluno	INT,
	CONSTRAINT		pk_aluno PRIMARY KEY(idRA),
	CONSTRAINT		fk_idCidade_aluno FOREIGN KEY(idCidade_aluno)
							REFERENCES cidades	 (idCidade)

				--tentando criar relação entre outro db, no caso aqui o db de Brasil com nomes de cidade e estados
				--REFERENCES dbBrasil.dbo.cidades(idCidade)
)

CREATE TABLE professores(
	idProfessor		INT IDENTITY(1,1) NOT NULL,
	nome			VARCHAR(100),

	idCidade_prof	INT,
	CONSTRAINT		pk_professor PRIMARY KEY(idProfessor),
	CONSTRAINT		fk_idCidade_prof FOREIGN KEY(idCidade_prof)
						REFERENCES cidades		(idCidade)
)

CREATE TABLE disciplinas(
	idDisciplina	INT IDENTITY(1,1) NOT NULL,
	disciplina		VARCHAR(200),
	cargaHoraria	FLOAT,

	CONSTRAINT		pk_idDisciplina PRIMARY KEY(idDisciplina)
)



CREATE TABLE historicos(
	idHistorico		INT IDENTITY(1,1) NOT NULL,
	semestre		INT,
	falta			INT,
	nota			FLOAT,

	idRA_hist		INT,
	idProf_hist		INT,
	idDisc_hist		INT,
	CONSTRAINT		pk_idHistorico PRIMARY KEY(idHistorico),
	CONSTRAINT		fk_idRA_hist FOREIGN KEY(idRA_hist)
						REFERENCES alunos	(idRA),
	CONSTRAINT		fk_idProf_hist FOREIGN KEY (idProf_hist)
						REFERENCES professores (idProfessor),
	CONSTRAINT		fk_idDisc_hist FOREIGN KEY (idDisc_hist)
						REFERENCES disciplinas (idDisciplina)
)

--deleta a coluna cargaHoraria da tablea de historicos
ALTER TABLE historicos DROP COLUMN cargaHoraria

--ADICIONA A PORRA DA COLUNA cargaHoraria, não precisa column nessa merda
ALTER TABLE disciplinas ADD cargaHoraria FLOAT

ALTER TABLE historicos 
-- DDL -----------------------------------------------------------------------------------

--=================================================================================================

-- DML -----------------------------------------------------------------------------------
--Data Manipulation Language - Linguagem de Manipulação de Dados


/*2. Inserir informações em todas as tabelas (10 alunos, 4 disciplinas - Banco de dados, Sistemas Operacionais,
Rede de Computadores e Estrutura de dados, 3 professores e 15 históricos)*/

--insere dados
INSERT INTO alunos (nome, idCidade_aluno) VALUES
('Joa da silva', 5053),
('Maria da silva', 1),
('Pedro Pereira', 2),
('Amelia Reis', 25),
('Ana Aparecida', 101);

INSERT INTO alunos (nome, idCidade_aluno) VALUES
('Arthur Barbosa', 33),
('Carlos filho', 66),
('Fernando Moreira', 99),
('Julio Santos', 115),
('Luana Batista', 199);

INSERT INTO disciplinas (disciplina, cargaHoraria) VALUES
('Banco de Dados',100.00),
('Sistemas Operacionais',100.00),
('Rede de Computadores',100.00),
('Estrutura de Dados',100.00);

INSERT INTO professores (nome, idCidade_prof) VALUES
('Sandro',5053),
('Nava',5052),
('Rita',200);

INSERT INTO historicos(semestre, falta, nota, idRA_hist, idProf_hist, idDisc_hist) VALUES
--semestre 1
(1, 2, 8.0, 1, 1, 1),
(1, 4, 5.0, 2, 1, 1),
(1, 2, 6.0, 3, 1, 1),
(1, 4, 7.0, 4, 1, 1),
(1, 8, 4.0, 5, 1, 1),
(1, 0, 9.0, 1, 2, 4),
(1, 2, 6.0, 2, 2, 4),
(1, 4, 5.0, 3, 2, 4),
(1, 4, 8.0, 4, 2, 4),
(1, 4, 3.1, 5, 2, 4),
(2, 2, 8.0, 6, 3, 3),
(2, 0, 8.0, 7, 3, 3),
(2, 2, 5.0, 8, 3, 3),
(2, 4, 6.0, 9, 3, 3),
(2, 4, 7.0, 10, 3, 3),
(2, 2, 7.2, 6, 1, 2),
(2, 0, 6.1, 7, 1, 2),
(2, 6, 5.9, 8, 1, 2),
(2, 2, 7.8, 9, 1, 2),
(2, 4, 6.3, 10, 1, 2);
--fim exercicio 2 --------------
-- DML -----------------------------------------------------------------------------------

--=================================================================================================

-- DQL -----------------------------------------------------------------------------------
--Data Query Language - Linguagem de Consulta de dados

/*3. Encontre o nome e RA dos alunos com nota na disciplina de Banco de Dados no 2º semestre menor que 7.*/

SELECT alunos.idRA AS 'RA', alunos.nome AS 'NOME ALUNO', historicos.nota AS 'NOTA', disciplinas.disciplina AS 'DISCIPLINA'
	FROM alunos, disciplinas, historicos
	WHERE disciplina = 'Banco de Dados' AND semestre = 2 AND nota < 7

/*4. Alterar a tabela histórico e incluir um campo inteiro chamado ano, com o objetivo de armazenar o ano e semestre do registro
 de histórico dos alunos. */
 ALTER TABLE historicos ADD ano INT

/*5. Alterar a tabela de histórico definindo o ano para cada um dos registros de histórico da tabela. Para não registrar um an para cada registro, pode ser utilizado na clausula “where” o “in” e modificar o ano de vários registros ao mesmo tempo*/
UPDATE historicos SET ano = 2017 WHERE semestre = 1
UPDATE historicos SET ano = 2016 WHERE semestre = 2

/*6. Apresente o nome dos professores de Banco de dados que ministraram aulas em 2017.*/
--Abreviação COM ALIAS???
SELECT p.nome, d.disciplina,  h.ano
	FROM  professores p, historicos h, disciplinas d
	WHERE d.disciplina = 'Banco de Dados' AND h.ano = 2017

SELECT professores.nome AS 'NOME PROFESSOR', disciplinas.disciplina AS 'DISCIPLINA', historicos.ano
	FROM professores, disciplinas, historicos
	WHERE disciplina = 'Banco de Dados' AND ano = 2017

/*7. Apresente a quantidade e nome das disciplinas que cada professor ministrou em de 2017.*/
SELECT disciplinas.disciplina, historicos.ano, COUNT(disciplinas.disciplina) AS 'Qtnd/Ano Aula Ministrada'
FROM disciplinas, historicos
GROUP BY disciplina, ano
HAVING ano = 2017

SELECT d.disciplina, h.ano, COUNT(d.disciplina) AS 'Qtnd/Ano Aula Ministrada'
FROM disciplinas d, historicos h
GROUP BY disciplina, ano
HAVING ano = 2017

/*8. Encontre o nome, cidade dos alunos, código das disciplinas e nome da disciplina onde os alunos tiveram nota menor que 5 no
 1º semestre de 2018. */
SELECT a.nome 'ALUNO', c.nome AS 'CIDADE', d.idDisciplina, d.disciplina, h.nota
FROM alunos a
INNER JOIN historicos h ON a.idRA = h.idRA_hist
INNER JOIN disciplinas d ON  h.idDisc_hist = d.idDisciplina
INNER JOIN cidades c ON a.idCidade_aluno = c.idCidade
WHERE h.nota < 7 AND h.semestre = 1 AND h.ano = 2017
GROUP BY a.nome, c.nome , d.idDisciplina, d.disciplina, h.nota

/*9. Apresente o nome e RA dos alunos que frequentaram a disciplina de Estrutura de Dados com o professor Nava em 2017*/
SELECT A.idRA, A.nome AS 'ALUNO', H.idDisc_hist, D.disciplina, P.nome, H.ano
FROM alunos A
INNER JOIN historicos H ON A.idRA = H.idRA_hist
INNER JOIN disciplinas D ON D.idDisciplina = H.idDisc_hist AND H.ano = 2017
INNER JOIN professores P ON H.idProf_hist = P.idProfessor
WHERE H.idDisc_hist = 4 AND P.idProfessor = 2

SELECT * FROM professores

 /*30. Apresente o comando SQL necessário para apresentar a quantidade de alunos matriculado em cada disciplina. Outra coluna 
 deve apresentar o total de alunos cadastrados no total de disciplinas e uma terceira coluna deve calcular a porcentagem que cada
 disciplina representa do total de alunos matriculados. */

 --#30.1 FORMA 1


-- DQL -----------------------------------------------------------------------------------

--==============================================================================================================UTILITARIO
SELECT *FROM alunos
SELECT *FROM professores
SELECT *FROM disciplinas
SELECT *FROM historicos
order by idDisc_hist
SELECT *FROM estados

SELECT COUNT(disciplina) disciplina
FROM disciplinas

SELECT COUNT(disciplina) AS 'DISCIPLINA'
FROM disciplinas

SELECT COUNT(d.disciplina) disciplina
FROM disciplinas d

sp_help [alunos]


SELECT cidades.nome, estados.uf
	FROM cidades, estados
	ORDER BY uf

SELECT nome, c.idCidade FROM cidades c WHERE nome LIKE '%moji%'
UPDATE cidades SET nome = 'Mogi Mirim' WHERE idCidade = 5053

--==============================================================================================================UTILITARIO

--==============================================================================================================STUDY
----------------------------------------------------------------------------------------------INNER
/*
INNER JOIN:
Retorna dados apenas quando as duas tabelas tem chaves correspondentes na cláusula ON do JOIN.

SINTAXE:
SELECT tabelaA.*, tabelaB.* FROM tabelaA INNER JOIN tabelaB ON tabelaA.chave = tabelaB.chave
*/
--QUERY:
SELECT alunos.*, historicos.*
FROM alunos
INNER JOIN historicos ON alunos.idRA = historicos.idRA_hist
--ou
SELECT *
FROM alunos
INNER JOIN historicos ON alunos.idRA = historicos.idRA_hist
--ou
SELECT *
FROM alunos a
INNER JOIN historicos h ON a.idRA = h.idRA_hist
----------------------------------------------------------------------------------------------INNER

----------------------------------------------------------------------------------------------LEFT
/*
LEFT JOIN:
Retorna a Tabela A inteira e apenas os registros que coincidirem com a igualdade do JOIN na Tabela B (ou campos nulos para os
campos sem correpondência).

SINTAXE:
SELECT tabelaA.*, tabelaB.* FROM tabelaA LEFT JOIN tabelaB ON tabelaA.chave = tabelaB.chave
*/
--QUERY:
SELECT alunos.*, historicos.*
FROM alunos
LEFT JOIN historicos ON alunos.idRA = historicos.idRA_hist
--ou
SELECT *
FROM alunos
LEFT JOIN historicos ON alunos.idRA = historicos.idRA_hist
----------------------------------------------------------------------------------------------LEFT

----------------------------------------------------------------------------------------------RIGHT
/*
RIGHT JOIN:
Segue o mesmo racicínio do left join, mas se aplicando à tabela B em vez da A,
Retorna a Tabela B inteira e apenas os registros que coincidirem com a igualdade do JOIN na Tabela A (ou campos nulos para os
campos sem correpondência).

SINTAXE:
SELECT tabelaA.*, tabelaB.* FROM tabelaA RIGHT JOIN tabelaB ON tabelaA.chave = tabelaB.chave
*/
--QUERY:
SELECT alunos.*, historicos.* FROM alunos RIGHT JOIN historicos ON alunos.idRA = historicos.idRA_hist
----------------------------------------------------------------------------------------------RIGHT

----------------------------------------------------------------------------------------------FULL
/*
Conhecido como OUTER JOIN ou simplesmente FULL JOIN, este retorna todos os registros de amabas as tabelas
SINTAXE:
SELECT TabelaA.*, TabelaB.* FROM TabelaA FULL OUTER JOIN TabelaB ON TabelaA.chave = TabelaB.chave
ou
SELECT TabelaA.*, TabelaB.* FROM TabelaA FULL JOIN TabelaB ON TabelaA.chave = TabelaB.chave
*/
--QUERY:
SELECT alunos.*, historicos.* FROM alunos FULL OUTER JOIN historicos ON alunos.idRA = historicos.idRA_hist
--ou
SELECT alunos.*, historicos.* FROM alunos FULL JOIN historicos ON alunos.idRA = historicos.idRA_hist
----------------------------------------------------------------------------------------------FULL

----------------------------------------------------------------------------------------------CROSS
/*
Basicamente é o produto cartesiano entre as duas tabelas. Para cada linha de TabelaA, são retornadas todas as linhas da tabelaB.
É mais fácil entender o Cross Join como um "Join sem cláusula ON", ou seja, todas as combinações de linhas de A e B são 
devolvidads.

Inclusive, se você fizer um CROSS JOIN com cláusula ON, ele "vira" um mero INNER JOIN.
SINTAXE:
SELECT TabelaA.*, TabelaB.* FROM TabelaA CROSS JOIN TabelaB
ou
SELECT TabelaA.*, TabelaB.* FROM TabelaA, TabelaB
*/
--QUERY:
SELECT alunos.*, historicos.* FROM alunos CROSS JOIN historicos
--ou
SELECT alunos.*, historicos.* FROM alunos, historicos
----------------------------------------------------------------------------------------------CROSS
--REFERÊNCIA: https://pt.stackoverflow.com/questions/6441/qual-%C3%A9-a-diferen%C3%A7a-entre-inner-join-e-outer-join

--==============================================================================================================STUDY