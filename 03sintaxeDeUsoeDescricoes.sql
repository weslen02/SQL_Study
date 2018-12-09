/*__________________________________________________________________________________________________________________________

							------------------------------------------------------------------
					  		|		       SOBRE ALGUNS PAR�MENTROS DE USO/ESTUDO			 |		
							------------------------------------------------------------------
____________________________________________________________________________________________________________________________*/


--================================================================================================= JOIN BY STACKOVERFLOW
----------------------------------------------------------------------------------------------INNER
/*
INNER JOIN:
Retorna dados apenas quando as duas tabelas tem chaves correspondentes na cl�usula ON do JOIN.

SINTAXE:
SELECT tabelaA.*, tabelaB.* FROM tabelaA INNER JOIN tabelaB ON tabelaA.pk = tabelaB.fk
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
campos sem correpond�ncia).

SINTAXE:
SELECT tabelaA.*, tabelaB.* FROM tabelaA LEFT JOIN tabelaB ON tabelaA.pk = tabelaB.fk
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
Segue o mesmo racic�nio do left join, mas se aplicando � tabela B em vez da A,
Retorna a Tabela B inteira e apenas os registros que coincidirem com a igualdade do JOIN na Tabela A (ou campos nulos para os
campos sem correpond�ncia).

SINTAXE:
SELECT tabelaA.*, tabelaB.* FROM tabelaA RIGHT JOIN tabelaB ON tabelaA.pk = tabelaB.fk
*/
--QUERY:
SELECT alunos.*, historicos.* FROM alunos RIGHT JOIN historicos ON alunos.idRA = historicos.idRA_hist
----------------------------------------------------------------------------------------------RIGHT

----------------------------------------------------------------------------------------------FULL
/*
Conhecido como OUTER JOIN ou simplesmente FULL JOIN, este retorna todos os registros de amabas as tabelas
SINTAXE:
SELECT TabelaA.*, TabelaB.* FROM TabelaA FULL OUTER JOIN TabelaB ON TabelaA.pk = TabelaB.fk
ou
SELECT TabelaA.*, TabelaB.* FROM TabelaA FULL JOIN TabelaB ON TabelaA.pk = TabelaB.fk
*/
--QUERY:
SELECT alunos.*, historicos.* FROM alunos FULL OUTER JOIN historicos ON alunos.idRA = historicos.idRA_hist
--ou
SELECT alunos.*, historicos.* FROM alunos FULL JOIN historicos ON alunos.idRA = historicos.idRA_hist
----------------------------------------------------------------------------------------------FULL

----------------------------------------------------------------------------------------------CROSS
/*
Basicamente � o produto cartesiano entre as duas tabelas. Para cada linha de TabelaA, s�o retornadas todas as linhas da tabelaB.
� mais f�cil entender o Cross Join como um "Join sem cl�usula ON", ou seja, todas as combina��es de linhas de A e B s�o 
devolvidads.

Inclusive, se voc� fizer um CROSS JOIN com cl�usula ON, ele "vira" um mero INNER JOIN.
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
--REFER�NCIA: https://pt.stackoverflow.com/questions/6441/qual-%C3%A9-a-diferen%C3%A7a-entre-inner-join-e-outer-join
--================================================================================================= JOIN BY STACKOVERFLOW


--================================================================================================= JOIN COM 3 TABELAS OU MAIS
--SINTAXE:
/*
SELECT TabelaA.*, TabelaB.*, TabelaC.*
FROM TabelaB
INNER JOIN (TabelaC INNER JOIN TabelaA ON TabelaC.pk = TabelaA.fk) ON TabelaB.fk = TabelaC.pk
ou
SELECT TabelaA.*, TabelaB.*, TabelaC.*
FROM TabelaB
INNER JOIN TabelaC ON TabelaB.fk = TabelaC.pk
INNER JOIN TabelaA ON TabelaC.pk = TabelaA.fk
*/
--QUERY:
--EX: 12
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
--================================================================================================= JOIN COM 3 TABELAS OU MAIS


--================================================================================================= COUNT & DISTINC
--EXEMPLOS

--SELECIONA O NUMERO DE LINHAS, NO CASO DO EXEMPLO, NUMEROS DE LINHAS DA TABELA disciplinas REFERENTE A COLUMN cargaHoraria
SELECT COUNT(disciplinas.cargaHoraria) AS 'NUM DE LINHAS' FROM disciplinas

--LISTA O N�MERO E CARAGA HORARIA DIFERENTES (DISTINTOS), N�O REPETINDO OS DADOS
SELECT DISTINCT(disciplinas.cargaHoraria) FROM disciplinas

/*CONTA O NUMERO DE LINHAS N�O REPETIDOS (DISTINTOS), NO CASO O NUMERO DE LINHAS DISTINTOS DA TABELA disciplinas REFERENTE A
COLUMN cargaHoraria*/
SELECT COUNT(DISTINCT disciplinas.cargaHoraria) AS 'APELIDO -> NUM DE LINHAS' FROM disciplinas
--================================================================================================= COUNT & DISTINCT

--================================================================================================= ISERIR E DELETAR COLUNA
/*
DELETAR COLUNA DE UMA TABELA
ALTER TABLE nomeTabela DROP COLUMN nomeColunaQueSeraDeletada

ADICIONAR UMA NOVA COLUNA  EM UMA TABELA EXISTENTE
ALTER TABLE nomeTabela ADD nomeNovaColunaQueSeraInserida TIPAGEM
*/
--================================================================================================= ISERIR E DELETAR COLUNA

--================================================================================================= GROUP BY
/*
A instru��o GROUP BY � frequentemente usada com as fun��es agregadas (COUNT, MAX, MIN, SUM, AVG) para agrupar o conjunto
de resultados em uma ou mais colunas.
SINTAXE:
SELECT column_nome(s)
FROM table_name
WHERE condition
GROUP BY column_name(s) 
ORDER BY column_name(s);

--REFER�NCIA: w3schools
*/
--================================================================================================= GROUP BY

--================================================================================================= GROUP BY + HAVING
/*
A instru��o HAVING foi incl�da no SQL porque a palavra-chave WHERE n�o pode ser usa com as fun��es agregadas (COUNT, MAX, MIN,
SUM, AVG)
SINTAXE:
SELECT column_nome(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);

Exempo:

SINTAXE:
SELECT TabelaA.colunaNome, AVG(TavelaB.colunaNome) AS 'PSEUD�NIMO'
FROM TabelaA
INNER JOIN TabelaB ON Tabela.pk = TabelaB.fk
GROUP BY TabelaA.colunaNome

--REFER�NCIA: w3schools
*/
--================================================================================================= GROUP BY + HAVING


--CONCATENANDO
/*
13. Forne�a o nome dos alunos e nome das disciplinas com carga hor�ria menor que 60 horas. Apresentar nesta consulta o nome dos
respectivos professores respons�veis pelas disciplinas.
*/

--SINTAXE:
--SELECT coluna1 + ' char ' + coluna2 FROM tabela

SELECT A.nome AS 'ALUNO', P.nome + ' - ' + D.disciplina AS 'PROFESSOR MINISTRA DISCP.', D.cargaHoraria
FROM disciplinas D
INNER JOIN historicos H ON D.idDisciplina = H.idDisc_hist
INNER JOIN alunos A ON A.idRA = H.idRA_hist
INNER JOIN professores P ON H.idProf_hist = P.idProfessor
WHERE D.cargaHoraria < 60