--================================================================================================= DDL
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
Garante o fim do escopo, e a quantidade de vezes desejada que o escopo seja executado.

SOBRE LOTE (batch):
Um lote de instru��es SQL � um grupo de duas ou mais instru��es SQL ou uma �nica instru��o SQL
que tem o mesmo efeito de um grupo de duas ou mais instru��es SQL*/

--Seleciona o banco a ser utilizado
USE atividadeBancodeDados


/*						-------------------ATEN��O------------------------

PRIMEIRAMENTE EXECUTAR A CRIA��O DA TABELA DE PAIS>ESTADO>CIDADE nesta ordem indicada para inciar com a -Normaliza��o- j� estabelicida. Tabela a ser criada contida no arquivo: 02dbBrasilAtivadadeBancodeDados */

--Sitaxe para criar tabela
CREATE TABLE alunos(
	idRA			INT IDENTITY(10000,100) NOT NULL,
	nome			VARCHAR(100),

	idCidade_aluno	INT,
	CONSTRAINT		pk_aluno PRIMARY KEY(idRA),
	CONSTRAINT		fk_idCidade_aluno FOREIGN KEY(idCidade_aluno)
							REFERENCES cidades	 (idCidade)
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
--================================================================================================= DDL

--================================================================================================= DML
--Data Manipulation Language - Linguagem de Manipula��o de Dados

/*2. Inserir informa��es em todas as tabelas (10 alunos, 4 disciplinas - Banco de dados, Sistemas Operacionais,
Rede de Computadores e Estrutura de dados, 3 professores e 15 hist�ricos)*/
INSERT INTO alunos (nome, idCidade_aluno) VALUES
('Joa da silva', 5053),
('Maria da silva', 1),
('Pedro Pereira', 2),
('Amelia Reis', 25),
('Ana Aparecida',	101);

INSERT INTO alunos (nome, idCidade_aluno) VALUES
('Arthur Barbosa', 33),
('Carlos filho', 66),
('Fernando Moreira', 99),
('Julio Santos', 115),
('Luana Batista', 199),
('Alexandro C',	5053),
('Jose Pedrosa', 999),
('Jose Pedrosa', 999);

INSERT INTO disciplinas (disciplina, cargaHoraria) VALUES
('Banco de Dados',100.00),
('Sistemas Operacionais',100.00),
('Rede de Computadores',100.00),
('Estrutura de Dados',100.00);

INSERT INTO professores (nome, idCidade_prof) VALUES
('Sandro',5053),
('Nava',5052),
('Rita',200);

INSERT INTO historicos(semestre, falta, nota, idRA_hist, idProf_hist, idDisc_hist, ano) VALUES
(1, 2, 8.0, 1, 1, 1, 2017),
(1, 4, 5.0, 2, 1, 1, 2017),
(1, 2, 6.0, 3, 1, 1, 2017),
(1, 4, 7.0, 4, 1, 1, 2017),
(1, 8, 4.0, 5, 1, 1, 2017),
(1, 0, 9.0, 1, 2, 4, 2017),
(1, 2, 6.0, 2, 2, 4, 2017),
(1, 4, 5.0, 3, 2, 4, 2017),
(1, 4, 8.0, 4, 2, 4, 2017),
(1, 4, 3.1, 5, 2, 4, 2017),
(2, 2, 8.0, 6, 3, 3, 2016),
(2, 0, 8.0, 7, 3, 3, 2016),
(2, 2, 5.0, 8, 3, 3, 2016),
(2, 4, 6.0, 9, 3, 3, 2016),
(2, 4, 7.0, 10, 3, 3, 2016),
(2, 2, 7.2, 6, 1, 2, 2016),
(2, 0, 6.1, 7, 1, 2, 2016),
(2, 6, 5.9, 8, 1, 2, 2016),
(2, 2, 7.8, 9, 1, 2, 2016),
(2, 4, 6.3, 10, 1, 2, 2016),
(1, 1, 2, NULL, 1, 1, 2018),
(2, 0, 9, 12, 2, 3, 2016),
(2, 0, 5, 13, 2, 3, 2018);
--fim exercicio 2 --------------
--================================================================================================= DML

--================================================================================================= DQL
--Data Query Language - Linguagem de Consulta de dados

/*3. Encontre o nome e RA dos alunos com nota na disciplina de Banco de Dados no 1� semestre menor que 7.*/
SELECT A.idRA AS 'RA', A.nome AS 'NOME ALUNO', H.nota AS 'NOTA', D.disciplina AS 'DISCIPLINA',
H.semestre as 'SEMETESTRE'
FROM alunos A
INNER JOIN historicos H ON A.idRA = H.idRA_hist
INNER JOIN disciplinas D ON H.idDisc_hist = D.idDisciplina
WHERE H.idDisc_hist = 1 AND H.semestre = 1 AND H.nota < 7

/*4. Alterar a tabela hist�rico e incluir um campo inteiro chamado ano, com o objetivo de armazenar o ano e semestre do registro
 de hist�rico dos alunos. */
 --ADICONAR COLUNA SINTAXE:
 --ALTER TABLE tabela ADD colunaNova TIPO
ALTER TABLE historicos ADD ano INT

/*5. Alterar a tabela de hist�rico definindo o ano para cada um dos registros de hist�rico da tabela. Para n�o registrar um 
ano para cada registro, pode ser utilizado na clausula �where� e modificar o ano de v�rios registros ao mesmo tempo*/
--SINTAXE:
--UPDATE tabela SET colunaRecebe = valor WHERE colunaCompara = valor
UPDATE historicos SET ano = 2017 WHERE semestre = 1 --DML
UPDATE historicos SET ano = 2016 WHERE semestre = 2 --DML

/*6. Apresente o nome dos professores de Banco de dados que ministraram aulas em 2017.*/
--
SELECT DISTINCT P.nome PROFESSOR, D.disciplina DISCIPLINA,   H.ano ANO
FROM  professores P
INNER JOIN historicos H ON P.idProfessor = H.idProf_hist
INNER JOIN disciplinas D ON H.idDisc_hist = D.idDisciplina
WHERE d.disciplina = 'Banco de Dados' AND h.ano = 2017

/*7. Apresente a quantidade e nome das disciplinas que cada professor ministrou em de 2017.*/
SELECT D.disciplina, H.ano, COUNT(H.idDisc_hist) AS 'Qtnd/Ano Aula Ministrada'
FROM disciplinas D
INNER JOIN historicos H ON D.idDisciplina = H.idDisc_hist
GROUP BY D.disciplina, H.ano
HAVING ano = 2017 --N�O UTILIZA-SE WHERE PARA GRUPOS DE LINHAS, USA-SE HAVING

/*8. Encontre o nome, cidade dos alunos, c�digo das disciplinas e nome da disciplina onde os alunos tiveram nota menor que 5 no
 1� semestre de 2018. */
SELECT a.nome 'ALUNO', c.nome AS 'CIDADE', d.idDisciplina, d.disciplina, h.nota
FROM alunos a
INNER JOIN historicos h ON a.idRA = h.idRA_hist
INNER JOIN disciplinas d ON  h.idDisc_hist = d.idDisciplina
INNER JOIN cidades c ON a.idCidade_aluno = c.idCidade
WHERE h.nota < 7 AND h.semestre = 1 AND h.ano = 2017

/*9. Apresente o nome e RA dos alunos que frequentaram a disciplina de Estrutura de Dados com o professor Nava em 2017*/
SELECT A.idRA, A.nome AS 'ALUNO', H.idDisc_hist, D.disciplina, P.nome, H.ano
FROM alunos A
INNER JOIN historicos H ON A.idRA = H.idRA_hist
INNER JOIN disciplinas D ON D.idDisciplina = H.idDisc_hist AND H.ano = 2017
INNER JOIN professores P ON H.idProf_hist = P.idProfessor
WHERE H.idDisc_hist = 4 AND P.idProfessor = 2

/*10. Localize o nome e RA dos alunos do professor Sandro em 2016 ou 2017 que tiveram aulas com o professor Nava em outro per�odo
 de qualquer semestre ou ano. */
SELECT A.idRA, A.nome AS 'ALUNO', P.nome AS PROFESSOR, H.ano
FROM alunos A
INNER JOIN historicos H ON A.idRA = H.idRA_hist
INNER JOIN professores P ON	H.idProf_hist = P.idProfessor
WHERE (H.idProf_hist = 1 AND (H.ano = 2016 OR H.ano = 2017)) OR H.idProf_hist = 2
ORDER BY P.idProfessor

/*11. Apresentar o hist�rico escolar do aluno CARLOS com informa��es do seu RA, nome, disciplinas, faltas, nota, ano e 
semestre.*/
SELECT A.*, P.nome AS 'PROFESSOR(a)',  D.disciplina AS 'DISCIPLINA', H.falta AS 'FALTAS', H.nota AS 'NOTA',
H.ano AS 'ANO LETIVO', H.semestre AS 'SEMESTRE'
FROM alunos A
LEFT JOIN historicos H ON A.idRA = H.idRA_hist
INNER JOIN disciplinas D ON D.idDisciplina = H.idDisc_hist
INNER JOIN professores P ON P.idProfessor = H.idProf_hist
WHERE H.idRA_hist = 7

/*12. Encontre o nome dos alunos e professores que reside em Mogi Mirim. Essas informa��es devem ser apresentadas em apenas um 
resultado. */
SELECT A.nome AS 'ALUNO', P.nome AS 'PROFESSOR', C.nome AS 'CIDADE'
FROM professores P
INNER JOIN (cidades C INNER JOIN alunos A ON C.idCidade = A.idCidade_aluno) ON P.idCidade_prof = C.idCidade
WHERE A.idCidade_aluno = 5053 AND P.idCidade_prof = 5053
--OU
SELECT A.nome AS 'ALUNO', P.nome AS 'PROFESSOR', C.nome AS 'CIDADE'
FROM professores P
INNER JOIN cidades C ON P.idCidade_prof = C.idCidade
INNER JOIN alunos A ON C.idCidade = A.idCidade_aluno
WHERE A.idCidade_aluno = 5053 AND P.idCidade_prof = 5053

/*
13. Forne�a o nome dos alunos e nome das disciplinas com carga hor�ria menor que 60 horas. Apresentar nesta consulta o nome dos
respectivos professores respons�veis pelas disciplinas.
*/
--CONCATENANDO DISCIPLINA E PROFESSOR
SELECT A.nome AS 'ALUNO', P.nome + ' - ' + D.disciplina AS 'PROFESSOR MINISTRA DISCP.', D.cargaHoraria
FROM disciplinas D
INNER JOIN historicos H ON D.idDisciplina = H.idDisc_hist
INNER JOIN alunos A ON A.idRA = H.idRA_hist
INNER JOIN professores P ON H.idProf_hist = P.idProfessor
WHERE D.cargaHoraria < 60

/*
14. Localize o nome dos professores que lecionaram mat�rias nas quais o aluno �ANA APARECIDA� foi reprovado com nota inferior
a < 5.
*/
SELECT A.nome AS 'ALUNO', P.nome AS 'PROFESSOR', D.disciplina AS 'DISCIPLINA', H.nota AS 'NOTA'
FROM historicos H
INNER JOIN alunos A ON  H.idRA_hist = A.idRA
INNER JOIN professores P ON H.idProf_hist = P.idProfessor
INNER JOIN disciplinas D ON H.idDisc_hist = D.idDisciplina
WHERE A.idRA = 5 AND H.nota < 5

/*
15. Apresente o RA e nome dos alunos dos alunos que frequentaram disciplinas lecionadas pelo prof. Sandro. 
*/
SELECT A.idRA AS 'RA', A.nome AS 'ALUNO', P.nome AS 'PROFESSOR'
FROM alunos A
INNER JOIN historicos H ON A.idRA = H.idRA_hist
INNER JOIN professores P ON H.idProf_hist = P.idProfessor
WHERE P.idProfessor = 1

/*
16. Encontre o Ra, nome e m�dia das notas dos alunos que cursaram todas as mat�rias lecionadas por professores de Mogi Mirim. 
*/
SELECT A.idRA AS 'RA', A.nome AS 'ALUNO', AVG(H.nota) AS 'MEDIA DA NOTA', P.nome AS 'PROFESSOR', C.nome AS 'CIDADE PROF'
FROM alunos A
INNER JOIN historicos H ON A.idRA = H.idRA_hist
INNER JOIN professores P ON H.idProf_hist = P.idProfessor
INNER JOIN cidades C ON P.idCidade_prof = C.idCidade
WHERE P.idCidade_prof = 5053
GROUP BY A.idRA, A.nome, P.nome, C.nome

/*
17. Apresente uma consulta com o Ra, nome e m�dia das notas por alunos.
*/
SELECT A.idRA, A.nome, AVG(H.nota) AS 'MEDIA DO ALUNO'
FROM alunos A
INNER JOIN historicos H ON A.idRA = H.idRA_hist
GROUP BY A.idRA, A.nome
ORDER BY A.nome

/*18. Encontre o nome dos alunos que n�o foram reprovados em nenhuma mat�ria*/
SELECT A.idRA, A.nome AS 'ALUNO'
FROM alunos A
INNER JOIN historicos H ON A.idRA = H.idRA_hist
GROUP BY A.idRA, A.nome
HAVING AVG (H.nota) > 6
ORDER BY A.nome

/*19. Forne�a o n�mero de alunos que fizeram Banco de dados e sitemas operacionais em 2017 no primeiro semestre*/
SELECT COUNT(A.idRA) AS 'QUANTIDADE DE ALUNOS'
FROM alunos A
INNER JOIN historicos H ON A.idRA = H.idRA_hist
--INNER JOIN disciplinas D ON H.idDisc_hist = D.idDisciplina
WHERE H.idDisc_hist = 1 OR H.idDisc_hist = 2 AND H.ano = 2017 AND H.semestre = 1

/*20. Apresente a m�dia de notas por disciplina. Ordenar o resultado por DISCIPLINA decrescente*/
SELECT D.disciplina AS 'DISCIPLINA', AVG(H.nota) AS 'Media Nota'
FROM disciplinas D
INNER JOIN historicos H ON D.idDisciplina = H.idDisc_hist
GROUP BY D.disciplina
ORDER BY D.disciplina DESC

/*21. Apresentar o nome do aluno, cidade, c�digo das disciplinas e nome da disciplina onde os alunos tiveram nota superior a 5 no
1� semestre de 2017. Ordenar o resultado por nome da disciplina.*/
SELECT A.nome AS 'NOME', C.nome AS 'CIDADE DO ALUNO', D.idDisciplina AS 'ID DISCP.', D.disciplina  AS 'DISCP.',
H.semestre AS 'SEMESTRE', H.nota AS 'NOTA'
FROM alunos A
INNER JOIN historicos H ON A.idRA = H.idRA_hist
INNER JOIN cidades C ON A.idCidade_aluno = C.idCidade
INNER JOIN disciplinas D ON D.idDisciplina = H.idDisc_hist
WHERE H.nota > 5 AND H.semestre = 1
ORDER BY D.disciplina

/*22. Apresente o hist�rico escolar do aluno de nome Alex. A consulta deve apresentar seu RA, nome, a lista de disciplinas que 
ele j� cursou contendo o c�digo e nome da disciplina, faltas, nota, ano e semestre. */
SELECT A.idRA AS 'RA', A.nome AS 'ALUNO', H.*, D.*
FROM alunos A
LEFT JOIN historicos H ON A.idRA = H.idRA_hist
LEFT JOIN disciplinas D ON D.idDisciplina = H.idDisc_hist
WHERE A.nome LIKE '%ALEX%' --SQL SERVER N�O TEM CamelCase, por isso a string pode ser upper ou lower case
--COMO ALEX COTEM SOMENTE DADOS NULOS OUTRO EXEMPLO ABAIXO
SELECT A.idRA AS 'RA', A.nome AS 'ALUNO', H.*, D.*
FROM alunos A
LEFT JOIN historicos H ON A.idRA = H.idRA_hist
LEFT JOIN disciplinas D ON D.idDisciplina = H.idDisc_hist
WHERE A.nome LIKE '%MA%'

/*23. Apresente a quantidade que o aluno �Jos� Pedrosa� cursou a disciplina de Banco de Dados.*/
SELECT COUNT(D.disciplina) AS 'QNT VZS ALUNO CURSOU', A.nome AS 'NOME'
FROM disciplinas D
INNER JOIN historicos H ON D.idDisciplina = H.idDisc_hist
INNER JOIN alunos A ON A.idRA = H.idRA_hist
WHERE A.nome LIKE '%JOSE%'
GROUP BY A.nome

/*24. Apresentar a quantidade de alunos cursaram a disciplina de Banco de Dados em 2016 e 2017.*/
SELECT COUNT(H.idRA_hist) AS 'QNTD ALUNOS'
FROM alunos A
INNER JOIN historicos H ON A.idRA = H.idRA_hist
WHERE (H.idDisc_hist = 1 AND (ANO = 2016 OR ANO = 2017))

/*25. Insira todos os alunos da disciplina de BD (Banco de Dados) em 2017 e que tiveram nota > 5, cursando a disciplina TBD
(T�picos em Banco de Dados) em 2015 com o mesmo professor, mas com frequ�ncia e nota desconhecidas (nulo).*/

SELECT * FROM historicos

--------------
--INSERINDO DADO, PS: Nome escrito errado atualizar no proximo comando
INSERT INTO disciplinas VALUES ('TOPICOS BANCO DE DADOS', 125)

--Atulalizar nome topico banco de dados para topicos em banco de dados
UPDATE disciplinas SET disciplina = 'TOPICOS EM BANCO DE DADOS' WHERE idDisciplina = 5

SELECT disciplinas.* FROM disciplinas
--------------

SELECT *
FROM historicos H
WHERE H.idDisc_hist = 1 AND nota > 5

INSERT INTO historicos VALUES
( 1, NULL, NULL, 1, 1, 5, 2015 ),
( 1, NULL, NULL, 3, 1, 5, 2015 ),
( 1, NULL, NULL, 4, 1, 5, 2015 )

SELECT H.*
FROM historicos H
WHERE H.idDisc_hist = 1 OR H.idDisc_hist = 5

SELECT A.*, H.*, D.*
FROM alunos A
INNER JOIN historicos H ON A.idRA = H.idRA_hist
INNER JOIN disciplinas D ON H.idDisc_hist = D.idDisciplina
WHERE H.idDisc_hist = 1 OR H.idDisc_hist = 5

/*26. Altere as notas dos alunos de Banco de Dados (BD) em 2012 com o professor Sandro atrav�s da seguinte regra:
A- notas entre [4.0 e 5.0] devem ser alteradas para 4.0.
B - notas entre [5.0 e 9.0] ter�o acr�scimo de 0.5 e
C - Notas acima de 9.5, inclusive ficar�o com 10.0. */

--PS: select com case precisa de virgula, update n�o!
SELECT A.idRA, A.nome, H.nota, P.idProfessor, P.idProfessor,
CASE
	WHEN ( H.nota = 4 AND H.nota < 5 ) THEN '4'
	WHEN ( H.nota > 4.9 AND H.nota <= 9 ) THEN nota + 0.5
	WHEN ( H.nota > 9.5 ) THEN '10'
	ELSE nota
END AS 'UPDATE NOTA'
FROM alunos A
INNER JOIN historicos H ON A.idRA = H.idRA_hist
INNER JOIN professores P ON H.idProf_hist = P.idProfessor
INNER JOIN disciplinas D ON H.idDisc_hist = D.idDisciplina
WHERE ( H.idDisc_hist = 1 AND H.ano = 2017 AND H.idProf_hist = 1 )

--PS: update N�O faz uso do END AS 'DESCRICAO'
UPDATE historicos
SET nota =
CASE
	WHEN ( H.nota = 4 AND H.nota < 5 ) THEN 4
	WHEN ( H.nota > 4.9 AND H.nota <= 9 ) THEN nota + 0.5
	WHEN ( H.nota >= 9.5 ) THEN 10
	ELSE nota
END 
FROM alunos A
INNER JOIN historicos H ON A.idRA = H.idRA_hist
INNER JOIN professores P ON H.idProf_hist = P.idProfessor
INNER JOIN disciplinas D ON H.idDisc_hist = D.idDisciplina
WHERE ( H.idDisc_hist = 1 AND H.ano = 2017 AND H.idProf_hist = 1 )

SELECT A.idRA, A.nome, H.nota, P.idProfessor, P.idProfessor
FROM alunos A
INNER JOIN historicos H ON A.idRA = H.idRA_hist
INNER JOIN professores P ON H.idProf_hist = P.idProfessor
INNER JOIN disciplinas D ON H.idDisc_hist = D.idDisciplina
WHERE ( H.idDisc_hist = 1 AND H.ano = 2017 AND H.idProf_hist = 1 )

/*27. Apresente uma consulta com o nome do aluno, nome da disciplina, faltas, notas e uma informa��o de �reprovado� ou aprovado 
com base na sua nota. Nota superior ou igual a 7,0 deve considerar o resultado de �aprovado� e caso contr�rio �reprovado�.*/

SELECT A.nome, D.disciplina, H.falta, H.nota,
CASE
	WHEN ( H.nota >= 7 ) THEN 'APROVADO'
	WHEN ( H.nota < 7 ) THEN 'REPROVADO'
	ELSE 'N/A'
END AS 'STATUS'
FROM alunos A
INNER JOIN historicos H ON A.idRA = H.idRA_hist
INNER JOIN disciplinas D ON H.idDisc_hist = D.idDisciplina

/*28. Apresente como resultado a m�dia das notas dos alunos por disciplina somente dos alunos que foram reprovados, ou seja, 
apresentem m�dia inferior a 7.0.*/
SELECT D.disciplina, AVG( H.nota ) AS 'MEDIA DE NOTA', 
CASE
	WHEN AVG(H.nota) < 7 THEN 'Baixo'
END AS 'INDICE PROGR. CURSO'
FROM disciplinas D
INNER JOIN historicos H ON D.idDisciplina = H.idRA_hist
GROUP BY D.disciplina
HAVING AVG( H.nota ) < 7

/*29. Apresente o comando SQL necess�rio para acrescentar 0,5 pontos a todas as notas < 5.5 da disciplina de banco de dados 
cadastrado no banco, independente do aluno.*/
SELECT H.nota
FROM historicos H
WHERE H.nota < 5.5 AND H.nota IS NOT NULL
ORDER BY nota

UPDATE historicos SET nota = nota + 0.5 WHERE nota < 5.5 AND nota IS NOT NULL

SELECT H.nota
FROM historicos H
WHERE H.nota < 6 OR H.nota IS NULL
ORDER BY nota

/*30. Apresente o comando SQL necess�rio para apresentar a quantidade de alunos matriculado em cada disciplina. Outra coluna deve
 apresentar o total de alunos cadastrados no total de disciplinas e uma terceira coluna deve calcular a porcentagem que cada 
 disciplina representa do total de alunos matriculados.*/
SELECT Total.qntd_alunos_disc, SUM(Total.qntd_alunos_disc) AS TOTAL
FROM (
	SELECT D.idDisciplina, D.disciplina,  COUNT(H.idRA_hist) AS qntd_alunos_disc
	FROM disciplinas D
	INNER JOIN historicos H ON D.idDisciplina = H.idDisc_hist
	GROUP BY D.idDisciplina,  D.disciplina
	) AS Total
GROUP BY Total.qntd_alunos_disc

SELECT * FROM historicos
WHERE historicos.idDisc_hist = 3
--================================================================================================= DQL