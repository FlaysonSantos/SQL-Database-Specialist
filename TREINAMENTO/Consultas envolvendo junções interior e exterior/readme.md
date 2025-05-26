# Praticando as Junções Internas no Banco de Dados do Museu

Neste projeto, você vai praticar comandos SQL usando junções internas (`INNER JOIN`) em um cenário realista: o banco de dados de um museu. Vamos criar o banco, entender seu modelo lógico e executar consultas fundamentais para análise de dados relacionais.

---

## 📂 Modelo do Banco de Dados

- Veja o código SQL para criação e popularização do banco de dados:  
  [Museu.sql](https://github.com/FlaysonSantos/SQL-Database-Specialist/blob/main/TREINAMENTO/Consultas%20envolvendo%20jun%C3%A7%C3%B5es%20interior%20e%20exterior/dados/museu.sql)

- **Modelo lógico do minimundo MUSEU:**  
  ![Modelo Lógico](https://github.com/user-attachments/assets/aac78765-2316-4e81-a9ab-dc14e21ad5eb)

---

## 📝 Consultas Exemplos para Praticar

### 1. Listar todos os dados dos autores e de suas obras

```sql
SELECT * FROM AUTORES A
INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR;
```

### 2. Listar o código, o título e o nome do autor das obras de 1965 a 1975 no salão 36

```sql
SELECT O.CODIGO, O.TITULO, A.NOME
FROM AUTORES A
INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR
WHERE SALAO = 36 AND ANO BETWEEN 1965 AND 1975;
```

### 3. Listar o nome e a nacionalidade dos autores que possuem obras expostas

```sql
SELECT A.NOME, A.NACIONALIDADE
FROM AUTORES A
INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR;
```

#### Evitar duplicidade (usando DISTINCT):

```sql
SELECT DISTINCT A.NOME, A.NACIONALIDADE
FROM AUTORES A
INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR;
```

### 4. Listar o código e o título das obras do autor Pablo Picasso no terceiro andar do museu

```sql
SELECT O.CODIGO, O.TITULO
FROM AUTORES A
INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR
INNER JOIN SALOES S ON S.NUMERO = O.SALAO
WHERE UPPER(A.NOME) = 'PABLO PICASSO' AND S.ANDAR = 3;
```

### 5. Listar o nome, nacionalidade dos autores, título da obra e estilo da pintura

```sql
SELECT A.NOME, A.NACIONALIDADE, O.TITULO, P.ESTILO
FROM AUTORES A
INNER JOIN OBRAS O ON A.CODIGO = O.AUTOR
INNER JOIN PINTURAS P ON P.CODIGO = O.CODIGO;
```

### 6. Listar o título da obra e o estilo da pintura usando `USING`

```sql
SELECT O.TITULO, P.ESTILO
FROM OBRAS O
INNER JOIN PINTURAS P USING(CODIGO);
```

### 7. Listar o título da obra e o estilo da pintura usando junção tradicional (`WHERE`)

```sql
SELECT O.TITULO, P.ESTILO
FROM OBRAS O, PINTURAS P
WHERE P.CODIGO = O.CODIGO;
```

---

## 🧑‍🏫 Explicação Didática dos Comandos SQL

Cada consulta acima foi desenhada para demonstrar o uso prático de `INNER JOIN` e operações relacionadas. Veja como cada comando funciona:

- **INNER JOIN:** Junta tabelas quando existe correspondência entre os campos relacionados.
- **DISTINCT:** Elimina linhas duplicadas do resultado.
- **USING:** Simplifica a junção quando o nome do campo é igual nas tabelas.
- **WHERE:** Filtra linhas conforme condições especificadas.
- **BETWEEN:** Filtra valores dentro de um intervalo.

Esses comandos são essenciais para extrair, combinar e analisar dados em bancos relacionais, seja para museus, bibliotecas ou qualquer sistema com múltiplas tabelas conectadas.

---

💡 Pratique, explore diferentes filtros e amplie seu domínio em SQL com base neste projeto!
