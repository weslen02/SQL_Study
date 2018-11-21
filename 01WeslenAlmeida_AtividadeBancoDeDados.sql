-- DDL -----------------------------------------------------------------------------------
--Data Definition Language - Linguagem de Defini��o de Dados


/* EXERCICIOS

1. Criar o banco um novo banco de dados e elaborar as tabelas, definindo chave prim�ria, chave secund�ria e
relacionamentos. Para os campos chave prim�ria de cada tabela definir como Identity (autonumera��o).
*/


--Cria o Banco
CREATE DATABASE atividadeBancodeDados
GO 

/*SOBRE GO :
� um n�mero inteiro positivo. O lote que precede GO ser� executado pelo n�mero de vezes especificado.
Grante o fim do escopo, e a quantidade de vezes desejada que o escopo seja executado.*/

/*SOBRE LOTE (batch):
Um lote de instru��es SQL � um grupo de duas ou mais instru��es SQL ou uma �nica instru��o SQL
que tem o mesmo efeito de um grupo de duas ou mais instru��es SQL*/

--Troca do default que estamos MASTER passando para uso do banco criado aqui (atividadeBancodeDados)
USE atividadeBancodeDados


/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
											
							--------------------ATEN��O------------------------

PRIMEIRAMENTE EXECUTAR A CRIA��O DA TABELA DE >>>>>>>>>>>>>>>> PAIS>ESTADO>CIDADE nesta ordem indicada,
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

				--tentando criar rela��o entre outro db, no caso aqui o db de Brasil com nomes de cidade e estados
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

--ADICIONA A PORRA DA COLUNA cargaHoraria, n�o precisa column nessa merda
ALTER TABLE disciplinas ADD cargaHoraria FLOAT

ALTER TABLE historicos 
-- DDL -----------------------------------------------------------------------------------

--=================================================================================================

-- DML -----------------------------------------------------------------------------------
--Data Manipulation Language - Linguagem de Manipula��o de Dados


/*2. Inserir informa��es em todas as tabelas (10 alunos, 4 disciplinas - Banco de dados, Sistemas Operacionais,
Rede de Computadores e Estrutura de dados, 3 professores e 15 hist�ricos)*/

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

SELECT *FROM alunos
SELECT *FROM professores
SELECT *FROM disciplinas
SELECT *FROM historicos
SELECT *FROM estados
SELECT nome, c.idCidade FROM cidades c WHERE nome LIKE '%moji%'
UPDATE cidades SET nome = 'Mogi Mirim' WHERE idCidade = 5053

/*3. Encontre o nome e RA dos alunos com nota na disciplina de Banco de Dados no 2� semestre menor que 7.*/

SELECT alunos.idRA AS 'RA', alunos.nome AS 'NOME ALUNO', historicos.nota AS 'NOTA', disciplinas.disciplina AS 'DISCIPLINA'
	FROM alunos, disciplinas, historicos
	WHERE disciplina = 'Banco de Dados' AND semestre = 2 AND nota < 7

/*4. Alterar a tabela hist�rico e incluir um campo inteiro chamado ano, com o objetivo de armazenar o ano e semestre do registro
 de hist�rico dos alunos. */
 ALTER TABLE historicos ADD ano INT

/*5. Alterar a tabela de hist�rico definindo o ano para cada um dos registros de hist�rico da tabela. Para n�o registrar um an para cada registro, pode ser utilizado na clausula �where� o �in� e modificar o ano de v�rios registros ao mesmo tempo*/
UPDATE historicos SET ano = 2017 WHERE semestre = 1
UPDATE historicos SET ano = 2016 WHERE semestre = 2

/*6. Apresente o nome dos professores de Banco de dados que ministraram aulas em 2017.*/
--Abrevia��o COM ALIAS???
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

/*8. Encontre o nome, cidade dos alunos, c�digo das disciplinas e nome da disciplina onde os alunos tiveram nota menor que 5 no
 1� semestre de 2018. */



-- DQL -----------------------------------------------------------------------------------

------------------------------------------testes
SELECT COUNT(disciplina) disciplina
FROM disciplinas

SELECT COUNT(disciplina) AS 'DISCIPLINA'
FROM disciplinas

SELECT COUNT(d.disciplina) disciplina
FROM disciplinas d

sp_help [disciplinas]


SELECT cidades.nome, estados.uf
	FROM cidades, estados
	ORDER BY uf
------------------------------------------testes