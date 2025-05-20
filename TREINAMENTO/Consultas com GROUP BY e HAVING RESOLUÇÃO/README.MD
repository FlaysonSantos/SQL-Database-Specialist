# Resolução GOUP BY e HAVING #

"Iremos utilizar o banco de dados da empresa cujo modelo lógico é:"

![00053_12_2bf019fc06](https://github.com/user-attachments/assets/c31ae0c1-823c-4d90-8c2f-e4453cc09ea9)

## Roteiro de prática ##

Execute comandos seguindo as seguintes diretrizes:


- Retornando cargos de emprego.
-  Uso de DISTINCT.
-  Uso de GROUP BY.
-  Filtrar grupo com WHERE.
-  Filtrar grupo com HAVING.
- Ordenando a consulta.

Consulte os dados da criação da [Tabela aqui](https://github.com/FlaysonSantos/SQL-Database-Specialist/blob/main/TREINAMENTO/Consultas%20com%20GROUP%20BY%20e%20HAVING%20RESOLU%C3%87%C3%83O/DADOS%20SQL/dados.sql)

## Resolução codigo ##

- Retornando cargos de emprego

SELECT CARGO  FROM EMPREGADO

- Uso de DISTINCT

SELECT DISTINCT CARGO  
FROM EMPREGADO

SELECT DISTINCT CARGO, ULT_NOME
FROM EMPREGADO


- Uso de GROUP BY

SELECT  COUNT(*), AVG(SALARIO), SUM(SALARIO), ID_DEPTO
FROM EMPREGADO
GROUP BY ID_DEPTO

SELECT  COUNT(*), AVG(SALARIO), SUM(SALARIO), ID_DEPTO
FROM EMPREGADO

SELECT  ID_DEPTO, CARGO,COUNT(*), AVG(SALARIO), SUM(SALARIO), ID_DEPTO
FROM EMPREGADO
GROUP BY ID_DEPTO, CARGO


- Filtrando grupos

SELECT  COUNT(*), AVG(SALARIO), SUM(SALARIO)
FROM EMPREGADO
WHERE ID_DEPTO = 20


SELECT  COUNT(*), AVG(SALARIO), SUM(SALARIO), ID_DEPTO
FROM EMPREGADO
GROUP BY ID_DEPTO
HAVING COUNT(*) > 1


- Ordenando a consulta

SELECT ID, ULT_NOME, ID_DEPTO, SALARIO
FROM EMPREGADO
ORDER BY ID_DEPTO DESC, SALARIO 


SELECT ID, ULT_NOME, ID_DEPTO, SALARIO
FROM EMPREGADO
ORDER BY 3 DESC, 4 





