# Junção Externo

# 🧠 Exercício Prático – Junção Externa em SQL

Este repositório contém uma atividade prática utilizando junções externas no contexto de um banco de dados da empresa fictícia **EMPRESA**. O objetivo é aplicar conhecimentos de SQL para manipulação e recuperação de dados com diferentes tipos de junção.

---

## 📘 Modelo Lógico
![00414_16_2_22191f6c79](https://github.com/user-attachments/assets/6971acb6-5b54-4d8b-8488-cf6ca931a91b)

Utilize o modelo lógico fornecido do banco de dados **EMPRESA**, contendo as entidades `Cliente` e `Empregado`, com relacionamento entre elas.


---

## 🚀 Objetivo
[] [CLICK](https://github.com/FlaysonSantos/SQL-Database-Specialist/blob/main/TREINAMENTO/Consultas%20envolvendo%20jun%C3%A7%C3%B5es%20interior%20e%20exterior/dados/museu.sql) AQUI PARA CONTRUIR SEU BANCO DE DADOS PARA O EXERCICIO 
Executar as seguintes consultas SQL:

---

## ✅ Tarefas do Exercício

Para realizar o exercício, faça conexão com o banco de dados e execute as seguintes consultas:

- [ ] **Listar** o `ID` e `nome do cliente` e o `ID`, `ULT_NOME` e `cargo do empregado` que o atende.

```sql
SELECT C.ID, C.NOME, E.ID, E.ULT_NOME,E.CARGO 
FROM EMPREGADO E   INNER JOIN  CLIENTE C  ON  C.VENDEDOR = E.ID
```

- [ ] **Listar** o `ID`, `ULT_NOME` e `cargo do empregado` que **não atende nenhum cliente**.

```sql
SELECT  E.ID, E.ULT_NOME,E.CARGO 
FROM EMPREGADO E   LEFT JOIN  CLIENTE C  ON  C.VENDEDOR = E.ID
WHERE C.ID IS NULL
```

- [ ] **Listar** o `ID` e `nome do cliente` que **não é atendido por nenhum empregado**.

```sql
SELECT C.ID, C.NOME, E.ID, E.ULT_NOME,E.CARGO 
FROM EMPREGADO E  RIGHT JOIN  CLIENTE C  ON  C.VENDEDOR = E.ID
WHERE E.ID IS NULL


```

- [ ] **Listar** o `ID` e `nome do cliente` e o `ID`, `ULT_NOME` e `cargo do empregado` para os **empregados que se relacionam com clientes e para os que não se relacionam**.

```sql
SELECT C.ID, C.NOME, E.ID, E.ULT_NOME,E.CARGO 
FROM EMPREGADO E  FULL JOIN  CLIENTE C  ON  C.VENDEDOR = E.ID

```


## 📚 O que são LEFT JOIN, RIGHT JOIN e FULL JOIN?

Em SQL, junções (joins) são usadas para combinar registros de duas ou mais tabelas com base em uma condição lógica. As junções externas são particularmente úteis quando você quer incluir registros mesmo que não haja correspondência entre as tabelas.

🔹 LEFT JOIN (Junção Externa à Esquerda)
O LEFT JOIN retorna todos os registros da tabela à esquerda (a primeira tabela) e os registros correspondentes da tabela à direita (a segunda tabela).
Se não houver correspondência, os campos da tabela da direita serão preenchidos com NULL.

Exemplo:

```sql
SELECT *
FROM EMPREGADO E
LEFT JOIN CLIENTE C ON C.VENDEDOR = E.ID;
```
📌 Usado quando: você quer todos os empregados, mesmo que não atendam nenhum cliente.

🔸 RIGHT JOIN (Junção Externa à Direita)
O RIGHT JOIN faz o oposto do LEFT JOIN: retorna todos os registros da tabela à direita e os correspondentes da tabela à esquerda.
Se não houver correspondência, os campos da tabela da esquerda serão preenchidos com NULL.

Exemplo:
```sql
SELECT *
FROM EMPREGADO E
RIGHT JOIN CLIENTE C ON C.VENDEDOR = E.ID;
```
📌 Usado quando: você quer todos os clientes, mesmo que não tenham empregado associado.

🔁 FULL JOIN (Junção Externa Completa)
O FULL JOIN combina o comportamento do LEFT e do RIGHT JOIN: retorna todos os registros de ambas as tabelas, e combina os que têm correspondência.
Quando não há correspondência, os campos da tabela que não tem o dado são preenchidos com NULL.

Exemplo:
```sql
SELECT *
FROM EMPREGADO E
FULL JOIN CLIENTE C ON C.VENDEDOR = E.ID;
```
📌 Usado quando: você quer ver todos os empregados e todos os clientes, independentemente de terem vínculo entre si.




✍️ Autor
Flayson Santos
GitHub: [FlaysonSantos](https://github.com/FlaysonSantos/)
Especialista em Ciência de Dados e Machine Learning
