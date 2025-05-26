# Praticando as junções internas #

Vamos criar o banco de dados do museu que utilizaremos nas nossas demonstrações e, em seguida, iremos executar alguns comandos com junção interna.

- confira o codigo do [Modelo aqui "Museu.sql"](https://github.com/FlaysonSantos/SQL-Database-Specialist/blob/main/TREINAMENTO/Consultas%20envolvendo%20jun%C3%A7%C3%B5es%20interior%20e%20exterior/dados/museu.sql)

Vejamos o modelo lógico de banco de dados do minimundo MUSEU!

![00414_09_bb02b29eb1](https://github.com/user-attachments/assets/aac78765-2316-4e81-a9ab-dc14e21ad5eb)

## Escreva os seguintes comandos de consulta:  ##

-- LISTAR TODOS OS DADOS DOS AUTORES E DE SUAS OBRAS

SELECT * FROM AUTORES A INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR



-- Listar o 'código, o título e o nome do autor' das obras de 1965 a 1975 que estão no salão 36.

SELECT O.CODIGO, O.TITULO,A.NOME FROM AUTORES A INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR

WHERE SALAO = 36 AND ANO BETWEEN 1965 AND 1975



-- Listar o nome e a nacionalidade dos autores que possuem obras expostas. Resolver por junção.



SELECT A.NOME, A.NACIONALIDADE

FROM AUTORES A INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR

-- EVITAR DUPLICIDADE "DISTINCT"

SELECT DISTINCT A.NOME, A.NACIONALIDADE FROM AUTORES A INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR



--Listar o código e o título das obras do autor Pablo Picasso que se encontram no terceiro andar do museu.

 

SELECT O.CODIGO, O.TITULO

FROM AUTORES A

     INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR

     INNER JOIN SALOES S ON S.NUMERO = O.SALAO

WHERE UPPER(A.NOME) = 'PABLO PICASSO' AND S.ANDAR = 3



-- Listar o nome e a nacionalidade dos autores, o título da obra e o estilo de pintura.



SELECT A.NOME, A.NACIONALIDADE, O.TITULO, P.ESTILO FROM AUTORES A

INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR

INNER JOIN PINTURAS P ON P.CODIGO = O.CODIGO



-- Listar o título da obra e o estilo da pintura utilizando junção USING.



SELECT  O.TITULO, P.ESTILO

FROM OBRAS O 

     INNER JOIN PINTURAS P USING(CODIGO)



-- Listar o título da obra e o estilo da pintura utilizando junção tradicional.

SELECT  O.TITULO, P.ESTILO

FROM OBRAS O , PINTURAS P 

WHERE P.CODIGO = O.CODIGO

# Explicação Didática dos Comandos SQL

Abaixo estão explicações detalhadas e didáticas para cada comando SQL apresentado. Eles envolvem consultas em bancos de dados relacionais, especialmente usando cláusulas de junção (`JOIN`) para buscar e combinar informações de diferentes tabelas.

---

## 1. Listar Todas as Tabelas do Schema `public`

```sql
SELECT * FROM information_schema.tables WHERE table_schema='public';
```
**Explicação:**  
Este comando retorna todas as tabelas existentes no schema `public` do banco de dados.  
- `information_schema.tables` é uma tabela especial do próprio banco que armazena metadados (informações sobre outras tabelas).
- O filtro `WHERE table_schema='public'` garante que só sejam listadas as tabelas do schema padrão, chamado `public`.

---

## 2. Listar Todos os Dados dos Autores e de Suas Obras

```sql
SELECT * FROM AUTORES A INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR
```
**Explicação:**  
- `AUTORES` e `OBRAS` são tabelas do banco.
- O comando faz uma junção interna (`INNER JOIN`) onde o código do autor em `AUTORES` corresponde ao campo `AUTOR` na tabela `OBRAS`.
- Resultado: todos os dados de cada autor e todas as suas obras, combinados em uma única linha para cada obra.

---

## 3. Listar o código, o título e o nome do autor das obras de 1965 a 1975 que estão no salão 36

```sql
SELECT O.CODIGO, O.TITULO, A.NOME 
FROM AUTORES A 
INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR
WHERE SALAO = 36 AND ANO BETWEEN 1965 AND 1975
```
**Explicação:**  
- Seleciona o código e título das obras (`O.CODIGO`, `O.TITULO`) e o nome do autor (`A.NOME`).
- Só traz obras expostas no salão 36 (`SALAO = 36`) e produzidas entre 1965 e 1975 (`ANO BETWEEN 1965 AND 1975`).

---

## 4. Listar o nome e a nacionalidade dos autores que possuem obras expostas (com e sem duplicidade)

```sql
SELECT A.NOME, A.NACIONALIDADE
FROM AUTORES A 
INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR
```
- Retorna todos os autores que possuem obras, mas pode trazer duplicidade (um autor com várias obras aparece repetido).

```sql
SELECT DISTINCT A.NOME, A.NACIONALIDADE 
FROM AUTORES A 
INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR
```
- O `DISTINCT` elimina duplicidades, listando cada autor apenas uma vez, mesmo que ele tenha várias obras.

---

## 5. Listar o código e o título das obras do autor Pablo Picasso que estão no terceiro andar do museu

```sql
SELECT O.CODIGO, O.TITULO
FROM AUTORES A
INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR
INNER JOIN SALOES S ON S.NUMERO = O.SALAO
WHERE UPPER(A.NOME) = 'PABLO PICASSO' AND S.ANDAR = 3
```
**Explicação:**  
- Junta as tabelas de autores, obras e salões.
- Filtra apenas obras de "PABLO PICASSO" (`UPPER(A.NOME) = 'PABLO PICASSO'`) no terceiro andar (`S.ANDAR = 3`).

---

## 6. Listar o nome e a nacionalidade dos autores, o título da obra e o estilo de pintura

```sql
SELECT A.NOME, A.NACIONALIDADE, O.TITULO, P.ESTILO 
FROM AUTORES A
INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR
INNER JOIN PINTURAS P ON P.CODIGO = O.CODIGO
```
**Explicação:**  
- Junta informações das tabelas de autores, obras e pinturas.
- Mostra os dados do autor, o título da obra e o estilo da pintura.

---

## 7. Listar o título da obra e o estilo da pintura usando `USING` na junção

```sql
SELECT O.TITULO, P.ESTILO
FROM OBRAS O
INNER JOIN PINTURAS P USING(CODIGO)
```
**Explicação:**  
- `USING(CODIGO)` simplifica a sintaxe quando os dois campos (das duas tabelas) têm o mesmo nome.
- Retorna o título da obra e o estilo da pintura.

---

## 8. Listar o título da obra e o estilo da pintura usando junção tradicional (`WHERE`)

```sql
SELECT O.TITULO, P.ESTILO
FROM OBRAS O, PINTURAS P
WHERE P.CODIGO = O.CODIGO
```
**Explicação:**  
- Junção tradicional, listando todas as combinações e filtrando apenas quando o código da obra bate com o da pintura.
- Resultado é o mesmo do exemplo anterior, mas com sintaxe diferente.

---

## RESUMO

- **INNER JOIN**: Junta tabelas onde existe correspondência entre os campos relacionados.
- **DISTINCT**: Elimina linhas duplicadas do resultado.
- **USING**: Simplifica a junção quando o nome do campo é igual nas duas tabelas.
- **WHERE**: Filtra linhas conforme condições.
- **BETWEEN**: Filtra valores entre dois limites.

Esses comandos são úteis para extrair e combinar informações em bancos de dados relacionais, especialmente em contextos como museus, bibliotecas, ou qualquer sistema com múltiplas tabelas relacionadas.

### Explicação Didática dos Comandos SQL estão explicações detalhadas  para cada comando SQL apresentado. Eles envolvem consultas em bancos de dados relacionais, especialmente usando cláusulas de junção (`JOIN`) para buscar e combinar informações de diferentes tabelas. 

--- ## 1. Listar Todas as Tabelas do Schema `public` ```sql SELECT * FROM information_schema.tables WHERE table_schema='public'; ``` **Explicação:** Este comando retorna todas as tabelas existentes no schema `public` do banco de dados. - `information_schema.tables` é uma tabela especial do próprio banco que armazena metadados (informações sobre outras tabelas). - O filtro `WHERE table_schema='public'` garante que só sejam listadas as tabelas do schema padrão, chamado `public`. 

--- ## 2. Listar Todos os Dados dos Autores e de Suas Obras ```sql SELECT * FROM AUTORES A INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR ``` **Explicação:** - `AUTORES` e `OBRAS` são tabelas do banco. - O comando faz uma junção interna (`INNER JOIN`) onde o código do autor em `AUTORES` corresponde ao campo `AUTOR` na tabela `OBRAS`. - Resultado: todos os dados de cada autor e todas as suas obras, combinados em uma única linha para cada obra. 

--- ## 3. Listar o código, o título e o nome do autor das obras de 1965 a 1975 que estão no salão 36 ```sql SELECT O.CODIGO, O.TITULO, A.NOME FROM AUTORES A INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR WHERE SALAO = 36 AND ANO BETWEEN 1965 AND 1975 ``` **Explicação:** - Seleciona o código e título das obras (`O.CODIGO`, `O.TITULO`) e o nome do autor (`A.NOME`). - Só traz obras expostas no salão 36 (`SALAO = 36`) e produzidas entre 1965 e 1975 (`ANO BETWEEN 1965 AND 1975`). 

--- ## 4. Listar o nome e a nacionalidade dos autores que possuem obras expostas (com e sem duplicidade) ```sql SELECT A.NOME, A.NACIONALIDADE FROM AUTORES A INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR ``` - Retorna todos os autores que possuem obras, mas pode trazer duplicidade (um autor com várias obras aparece repetido). ```sql SELECT DISTINCT A.NOME, A.NACIONALIDADE FROM AUTORES A INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR ``` - O `DISTINCT` elimina duplicidades, listando cada autor apenas uma vez, mesmo que ele tenha várias obras. 

--- ## 5. Listar o código e o título das obras do autor Pablo Picasso que estão no terceiro andar do museu ```sql SELECT O.CODIGO, O.TITULO FROM AUTORES A INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR INNER JOIN SALOES S ON S.NUMERO = O.SALAO WHERE UPPER(A.NOME) = 'PABLO PICASSO' AND S.ANDAR = 3 ``` **Explicação:** - Junta as tabelas de autores, obras e salões. - Filtra apenas obras de "PABLO PICASSO" (`UPPER(A.NOME) = 'PABLO PICASSO'`) no terceiro andar (`S.ANDAR = 3`). 

--- ## 6. Listar o nome e a nacionalidade dos autores, o título da obra e o estilo de pintura ```sql SELECT A.NOME, A.NACIONALIDADE, O.TITULO, P.ESTILO FROM AUTORES A INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR INNER JOIN PINTURAS P ON P.CODIGO = O.CODIGO ``` **Explicação:** - Junta informações das tabelas de autores, obras e pinturas. - Mostra os dados do autor, o título da obra e o estilo da pintura. 

--- ## 7. Listar o título da obra e o estilo da pintura usando `USING` na junção ```sql SELECT O.TITULO, P.ESTILO FROM OBRAS O INNER JOIN PINTURAS P USING(CODIGO) ``` **Explicação:** - `USING(CODIGO)` simplifica a sintaxe quando os dois campos (das duas tabelas) têm o mesmo nome. - Retorna o título da obra e o estilo da pintura. 

--- ## 8. Listar o título da obra e o estilo da pintura usando junção tradicional (`WHERE`) ```sql SELECT O.TITULO, P.ESTILO FROM OBRAS O, PINTURAS P WHERE P.CODIGO = O.CODIGO ``` **Explicação:** - Junção tradicional, listando todas as combinações e filtrando apenas quando o código da obra bate com o da pintura. - Resultado é o mesmo do exemplo anterior, mas com sintaxe diferente. 

--- ## RESUMO - **INNER JOIN**: Junta tabelas onde existe correspondência entre os campos relacionados. - **DISTINCT**: Elimina linhas duplicadas do resultado. - **USING**: Simplifica a junção quando o nome do campo é igual nas duas tabelas. - **WHERE**: Filtra linhas conforme condições. - **BETWEEN**: Filtra valores entre dois limites. Esses comandos são úteis para extrair e combinar informações em bancos de dados relacionais, especialmente em contextos como museus, bibliotecas, ou qualquer sistema com múltiplas tabelas relacionadas.
