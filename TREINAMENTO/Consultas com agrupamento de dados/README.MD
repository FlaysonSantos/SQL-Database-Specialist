# Vamos executar uma atividade prática utilizando o banco de dados do museu cujo modelo lógico é: #
![00053_40_a60d26c808](https://github.com/user-attachments/assets/aed18a87-c02b-43fa-89a3-a1335668995e)


### [Modelagem do banco de dados "MUSEU"](https://github.com/FlaysonSantos/SQL-Database-Specialist/blob/main/TREINAMENTO/Consultas%20com%20agrupamento%20de%20dados/Dados.sql/MUSEU.SQL) ###

### [Comando de Insert de dados para o modelo "Insert"](https://github.com/FlaysonSantos/SQL-Database-Specialist/blob/main/TREINAMENTO/Consultas%20com%20agrupamento%20de%20dados/Dados.sql/INSERT_MUSEU.SQL) ###

## Iremos execultar os seguintes comandos de consulta:

 - 'Listar a área média com o alias 'Área média', e número de salões com o alias 'Total de salões’'
 
 >>SELECT * FROM SALOES
 >>SELECT AVG(AREA) AS "Área média", COUNT(*) AS "Total de salões" FROM SALOES

- 'Listar o estilo e o total de pinturas do estilo com o alias 'Quantidade de pinturas'.

>> SELECT * FROM PINTURAS
>> SELECT ESTILO, COUNT(*) AS "Quantidade de pinturas" FROM PINTURAS GROUP BY ESTILO

- Listar o estilo e o total de pinturas do estilo com o alias 'Quantidade de pinturas' para os estilos diferentes de cubista.'

>> SELECT ESTILO, COUNT(*) AS "Quantidade de pinturas" FROM PINTURAS WHERE (ESTILO) <> 'CUBISTA' GROUP BY ESTILO

- Listar o estilo e o total de pinturas do estilo com o alias 'Quantidade de pinturas' para os estilos diferentes de cubista e com pelo menos duas pinturas.

>> SELECT ESTILO, COUNT(*) AS "Quantidade de pinturas" FROM PINTURAS WHERE (ESTILO) <> 'CUBISTA' GROUP BY ESTILO  HAVING COUNT(*) >=2


- Listar os diferentes estilos de pintura.'

>> SELECT DISTINCT ESTILO FROM PINTURAS 

