## Consultas com GROUP BY e HAVING ##

Em nossas consultas, usaremos como base a tabela FUNCIONARIO, conforme imagem a seguir.

![00053_30_9db0d2bd8a](https://github.com/user-attachments/assets/6c64b8ed-858a-4f5a-a8f7-a3db4e490277)

Dados tabela [Funcionario](https://github.com/FlaysonSantos/SQL-Database-Specialist/tree/main/TREINAMENTO/Consultas%20com%20o%20comando%20SELECT/Agrupamento%20de%20dados%20GROUP%20BY/dados.sql)

- podemos utilizar o código a seguir para exibir todo o seu conteúdo

    >> SELECT * FROM FUNCIONARIO;

 - Consulta 01 > retornar o número de funcionários por sexo

   >> SELECT SEXO, COUNT(*) AS QUANTIDADE FROM FUNCIONARIO
   >> GROUP BY SEXO;

- Consulta 02 > Retornar a média salarial por sexo

  >> SELECT SEXO,
    >> AVG(SALARIO) AS MEDIASALARIAL
  >> FROM FUNCIONARIO
  >> GROUP BY SEXO;

- Consulta 03 > retornar, por mês de aniversário, a quantidade de colaboradores, o menor salário, o maior salário e o salário médio, ordene os resultados por mês de aniversário.

  >> SELECT EXTRACT(MONTH FROM DTNASCIMENTO) AS MES,
    >> COUNT(*) AS QUANTIDADE,
   >> MIN(SALARIO) AS MENORSALARIO,
    >> ROUND(AVG(SALARIO)::NUMERIC,0) AS SALARIOMEDIO,
    >> MAX(SALARIO) AS MAIORSALARIO
  >> FROM FUNCIONARIO
  >> GROUP BY EXTRACT(MONTH FROM DTNASCIMENTO)
  >> ORDER BY EXTRACT(MONTH FROM DTNASCIMENTO);

- Consulta 04 >  retornar, por mês de aniversário, o mês, o sexo e a quantidade de colaboradores.

  >> SELECT EXTRACT(MONTH FROM DTNASCIMENTO) AS MES,
     >> SEXO,
     >> COUNT(*) AS QUANTIDADE
  >> FROM FUNCIONARIO
  >> GROUP BY EXTRACT(MONTH FROM DTNASCIMENTO), SEXO
  >> ORDER BY EXTRACT(MONTH FROM DTNASCIMENTO);

  
