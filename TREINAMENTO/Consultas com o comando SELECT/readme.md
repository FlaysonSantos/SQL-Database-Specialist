## Consultas básicas com SELECT na prática ##
Vamos agora criar o banco de dados da empresa que utilizaremos como exemplo nas nossas demonstrações e, em seguida, iremos executar alguns comandos básicos de SELECT.

![00053_12_2bf019fc06](https://github.com/user-attachments/assets/c31ae0c1-823c-4d90-8c2f-e4453cc09ea9)

Você pode baixar o script da criação das tabelas e inserção das linhas do banco de dados da empresa.


Link para download do arquivo [empresa.sql](https://github.com/FlaysonSantos/SQL-Database-Specialist/blob/main/TREINAMENTO/Consultas%20com%20o%20comando%20SELECT/modelagem%20banco%20de%20dados/EMPRESA.sql)


O modelo de dados da empresa é apresentado a seguir.

 



Modelo de dados de uma empresa.

## Roteiro de prática ##


Para criar o banco de dados da empresa, siga estes passos:


- Abra o PGAdmin4 e faça conexão no servidor.
- Crie um banco de dados chamado EMPRESA.
- Abra uma janela de consulta.
- Carregue o script da empresa na janela de consulta.
- Execute o script.
- Valide a criação das tabelas na aba tabelas do banco da empresa.

## Execute agora os seguintes comandos: ##


- Retornando empregado
SELECT * FROM EMPREGADO;

- Retornando colunas especÃ­ficas
SELECT ID, PRIM_NOME, ULT_NOME  FROM EMPREGADO;

- Retornando salÃ¡rio anual
SELECT ID, PRIM_NOME,SALARIO, SALARIO * 40 /3  FROM EMPREGADO;

- Retornando o nome completo do empregado
SELECT PRIM_NOME ||ULT_NOME  FROM EMPREGADO

SELECT PRIM_NOME ||' '||ULT_NOME  FROM EMPREGADO

- Criando alias
SELECT PRIM_NOME|| ' ' ||ULT_NOME  AS "NOME COMPLETO"
FROM EMPREGADO

SELECT PRIM_NOME|| ' ' ||ULT_NOME   NOME_COMPLETO
FROM EMPREGADO

- SELECT SEM FROM

SELECT 'ALO', 9 + 5, NOW()

- SELECT COM FROM
- 
SELECT 'ALO', 9 + 5, NOW() FROM EMPREGADO

- Funcoes de grupo

SELECT AVG(SALARIO), SUM(SALARIO), MAX(SALARIO), MIN(SALARIO), COUNT(*)
FROM EMPREGADO

SELECT MAX(SALARIO), MIN(SALARIO), 
       MAX(ULT_NOME), MIN(ULT_NOME),
	 MAX(DT_ADMISSAO), MIN(DT_ADMISSAO)
FROM EMPREGADO

