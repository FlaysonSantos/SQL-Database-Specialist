# Praticando os operadores INTERSECT e EXCEPT

Vamos agora analisar exemplos de uso dos comandos vistos até aqui. Para isso, iremos utilizar o banco de dados do [Museu.sql](https://github.com/FlaysonSantos/SQL-Database-Specialist/blob/main/TREINAMENTO/Consultas%20envolvendo%20jun%C3%A7%C3%B5es%20interior%20e%20exterior/dados/museu.sql).

---

## Modelo lógico do banco de dados do minimundo MUSEU

![Modelo lógico de banco de dados do minimundo MUSEU.](https://github.com/user-attachments/assets/a647eff4-d60e-45c1-bdf8-b3d199d87a1d)

---

# Apresentação: Operadores INTERSECT e EXCEPT em SQL

## O que são operadores INTERSECT e EXCEPT?

Os operadores **INTERSECT** e **EXCEPT** são usados em SQL para comparar conjuntos de resultados (resultados de SELECT) e retornar somente registros específicos baseados na relação entre eles.

---

## INTERSECT

- **O que faz?**
  - Retorna apenas as linhas que aparecem em **ambas** as consultas SELECT.
- **Uso típico:** Encontrar registros que estão em dois conjuntos de dados ao mesmo tempo.

### Sintaxe

```sql
SELECT coluna1, coluna2, ...
FROM tabelaA
INTERSECT
SELECT coluna1, coluna2, ...
FROM tabelaB;
```

### Exemplo Prático

Imagine duas tabelas: `ClientesOnline` e `ClientesLoja`.

```sql
SELECT nome, email FROM ClientesOnline
INTERSECT
SELECT nome, email FROM ClientesLoja;
```

**Resultado:** Lista de clientes que compraram online **e** na loja física.

---

## EXCEPT

- **O que faz?**
  - Retorna apenas as linhas da primeira consulta SELECT que **não aparecem** na segunda consulta.
- **Uso típico:** Encontrar registros exclusivos de um conjunto de dados.

### Sintaxe

```sql
SELECT coluna1, coluna2, ...
FROM tabelaA
EXCEPT
SELECT coluna1, coluna2, ...
FROM tabelaB;
```

### Exemplo Prático

```sql
SELECT nome, email FROM ClientesOnline
EXCEPT
SELECT nome, email FROM ClientesLoja;
```

**Resultado:** Lista de clientes que **só** compraram online (e não na loja física).

---

## Observações Importantes

- Ambas as consultas SELECT devem retornar **o mesmo número de colunas** e tipos de dados compatíveis.
- O resultado padrão desses operadores elimina linhas duplicadas (semelhante ao UNION).
- Nem todos os sistemas de banco de dados SQL suportam INTERSECT e EXCEPT (ex: MySQL não suporta nativamente, mas PostgreSQL, SQL Server e Oracle suportam).

---

## Comparação Visual

| Operador   | Resultado                                    |
|------------|----------------------------------------------|
| INTERSECT  | Elementos comuns aos dois conjuntos          |
| EXCEPT     | Elementos que estão só no primeiro conjunto  |

---
# ATIVIDADE

## Roteiro de Prática: Usando INTERSECT e EXCEPT no Banco do Museu

Para executar a atividade, conecte-se ao banco de dados do museu e escreva os seguintes comandos utilizando os operadores de conjunto **EXCEPT** e **INTERSECT**:

---

## 1. Listar código dos autores que **não possuem obras expostas** no museu

```sql
SELECT CODIGO FROM AUTORES
EXCEPT
SELECT AUTOR FROM OBRAS
```

---

## 2. Listar código dos autores que **possuem obras expostas** no museu

```sql
SELECT CODIGO FROM AUTORES
INTERSECT
SELECT AUTOR FROM OBRAS
```

---

## 3. Listar o código dos autores que **possuem apenas pinturas** no museu

```sql
SELECT AUTOR FROM OBRAS WHERE CODIGO IN (SELECT CODIGO FROM PINTURAS)
EXCEPT 
SELECT AUTOR FROM OBRAS WHERE CODIGO IN (SELECT CODIGO FROM ESCULTURAS
```

---

## 4. Listar o código dos autores que **possuem apenas esculturas** no museu

```sql
SELECT AUTOR FROM OBRAS WHERE CODIGO IN (SELECT CODIGO FROM ESCULTURAS)
EXCEPT
SELECT AUTOR FROM OBRAS WHERE CODIGO IN (SELECT CODIGO FROM PINTURAS)
```

---

## 5. Listar o código dos artistas que possuem **ou apenas esculturas ou apenas pinturas**

```sql
(SELECT AUTOR FROM OBRAS WHERE CODIGO IN (SELECT CODIGO FROM PINTURAS)
EXCEPT 
SELECT AUTOR FROM OBRAS WHERE CODIGO IN (SELECT CODIGO FROM ESCULTURAS))
UNION
(SELECT AUTOR FROM OBRAS WHERE CODIGO IN (SELECT CODIGO FROM ESCULTURAS)
EXCEPT
SELECT AUTOR FROM OBRAS WHERE CODIGO IN (SELECT CODIGO FROM PINTURAS))
```

---

> **Dica:**  
> - Adapte o nome dos campos/tabelas se necessário, conforme o modelo lógico do seu banco de dados.
> - Caso deseje garantir que não haja códigos repetidos, adicione `DISTINCT` nas consultas.

## Resumo

- **INTERSECT**: O que está nos dois conjuntos.
- **EXCEPT**: O que está só no primeiro conjunto.

Use esses operadores para comparar, filtrar e analisar conjuntos de dados de forma eficiente em SQL!

✍️ Autor Flayson Santos GitHub: FlaysonSantos Especialista em Ciência de Dados e Machine Learning
