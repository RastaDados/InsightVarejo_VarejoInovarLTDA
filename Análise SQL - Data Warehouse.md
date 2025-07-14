### Análise com Querys SQL - Direto do Data Warehouse 

<hr>

### Conectando ao DataWarehouse - SQL Server

```python
import pyodbc
import pandas as pd
import warnings
warnings.filterwarnings("ignore")

#Configurando a conexão com o SQL Server (via atuenticação do Windows, pois já estou conectado como localhost)
conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};'
                      'SERVER=DESKTOP-U623P07;'
                      'DATABASE=vendas_demanda_dw;'
                      'Trusted_Connection=yes;')

#Função para executar consultas e retornar um dataframe
def run_query(query):
    return pd.read_sql(query, conn)
```

### Análise Geral de Vendas

#### Vendas Totais Por Período

```python
query_vendas_periodo = """
SELECT 
    t.data_venda,
    SUM(f.valor_total) AS valor_total_vendas
FROM fato_vendas f
JOIN dim_tempo t ON f.data_venda = t.data_venda
GROUP BY t.data_venda
ORDER BY t.data_venda
"""

df_vendas_periodo = run_query(query_vendas_periodo)
print(df_vendas_periodo)
```

<img width="331" height="281" alt="image" src="https://github.com/user-attachments/assets/22dbaf9b-f16a-4987-8179-809ccd21275a" />

#### Vendas por Categoria de Produto

```python
query_vendas_categoria = """
SELECT 
    p.categoria_produto,
    SUM(f.valor_total) AS valor_total_vendas
FROM fato_vendas f
JOIN dim_produto p ON f.produto_id = p.produto_id
GROUP BY p.categoria_produto
ORDER BY valor_total_vendas DESC
"""

df_vendas_categoria = run_query(query_vendas_categoria)
print(df_vendas_categoria)
```

<img width="336" height="173" alt="image" src="https://github.com/user-attachments/assets/c1d1b982-89e4-41b7-b684-abd6d56ba9cd" />

<hr>

### Análise de Clientes

#### Distribuição de Clientes por Gênero 

```python
query_clientes_genero = """
SELECT 
    c.genero,
    COUNT(*) AS numero_clientes
FROM dim_cliente c
GROUP BY c.genero
ORDER BY numero_clientes DESC
"""

df_clientes_genero = run_query(query_clientes_genero)
print(df_clientes_genero)
```

<img width="244" height="99" alt="image" src="https://github.com/user-attachments/assets/5923bdef-3b51-4205-9e06-1525d854379c" />

#### Clientes por Faixa Etária

```python
query_clientes_idade = """
SELECT 
    CASE 
        WHEN c.idade < 18 THEN 'Menor de 18'
        WHEN c.idade BETWEEN 18 AND 24 THEN '18-24'
        WHEN c.idade BETWEEN 25 AND 34 THEN '25-34'
        WHEN c.idade BETWEEN 35 AND 44 THEN '35-44'
        WHEN c.idade BETWEEN 45 AND 54 THEN '45-54'
        WHEN c.idade BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65+'
    END AS faixa_etaria,
    COUNT(*) AS numero_clientes
FROM dim_cliente c
GROUP BY 
    CASE 
        WHEN c.idade < 18 THEN 'Menor de 18'
        WHEN c.idade BETWEEN 18 AND 24 THEN '18-24'
        WHEN c.idade BETWEEN 25 AND 34 THEN '25-34'
        WHEN c.idade BETWEEN 35 AND 44 THEN '35-44'
        WHEN c.idade BETWEEN 45 AND 54 THEN '45-54'
        WHEN c.idade BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65+'
    END
ORDER BY faixa_etaria
"""

df_clientes_idade = run_query(query_clientes_idade)
print(df_clientes_idade)
```

<img width="271" height="150" alt="image" src="https://github.com/user-attachments/assets/fa7d828a-5b8e-4819-8be6-998ae93f3658" />

#### Clientes Ativos vs Inativos

```python
query_clientes_ativos = """
SELECT 
    CASE 
        WHEN DATEDIFF(DAY, c.data_cadastro, GETDATE()) < 30 THEN 'Ativo'
        ELSE 'Inativo'
    END AS status_cliente,
    COUNT(*) AS numero_clientes
FROM dim_cliente c
GROUP BY 
    CASE 
        WHEN DATEDIFF(DAY, c.data_cadastro, GETDATE()) < 30 THEN 'Ativo'
        ELSE 'Inativo'
    END
"""

df_clientes_ativos = run_query(query_clientes_ativos)
print(df_clientes_ativos)
```

<img width="286" height="84" alt="image" src="https://github.com/user-attachments/assets/dfd9dabe-f03c-4b21-8f48-80054c092467" />

<hr>

### Análise de Produtos

#### Top 10 Produtos mais Vendidos

```python
query_top_produtos = """
SELECT TOP 10
    p.nome_produto,
    SUM(f.quantidade) AS quantidade_vendida
FROM fato_vendas f
JOIN dim_produto p ON f.produto_id = p.produto_id
GROUP BY p.nome_produto
ORDER BY quantidade_vendida DESC
"""

df_top_produtos = run_query(query_top_produtos)
print(df_top_produtos)
```

<img width="467" height="234" alt="image" src="https://github.com/user-attachments/assets/2fe9b811-3b94-4b8a-8de6-df650b8c35d0" />

#### Produtos por Categoria e SubCategoria

```python
query_produtos_categoria = """
SELECT 
    p.categoria_produto,
    p.subcategoria_produto,
    COUNT(*) AS numero_produtos
FROM dim_produto p
GROUP BY p.categoria_produto, p.subcategoria_produto
ORDER BY p.categoria_produto, numero_produtos DESC
"""

df_produtos_categoria = run_query(query_produtos_categoria)
print(df_produtos_categoria)
```

<img width="480" height="576" alt="image" src="https://github.com/user-attachments/assets/89870df5-b919-478b-bacc-1177fa1d1b3e" />

<hr>

### Análise de Canais de Vendas

#### Vendas Por Canais de Vendas

```python
query_vendas_canal = """
SELECT 
    l.canal_venda,
    SUM(f.valor_total) AS valor_total_vendas
FROM fato_vendas f
JOIN dim_loja l ON f.loja_id = l.loja_id
GROUP BY l.canal_venda
ORDER BY valor_total_vendas DESC
"""

df_vendas_canal = run_query(query_vendas_canal)
print(df_vendas_canal)
```

<img width="284" height="89" alt="image" src="https://github.com/user-attachments/assets/c5a53e8d-a2d1-457f-9566-659d0c3fae70" />

#### Vendas Por Método de Pagamento

```python
query_vendas_pagamento = """
SELECT 
    l.metodo_pagamento,
    COUNT(*) AS numero_vendas,
    SUM(f.valor_total) AS valor_total_vendas
FROM fato_vendas f
JOIN dim_loja l ON f.loja_id = l.loja_id
GROUP BY l.metodo_pagamento
ORDER BY valor_total_vendas DESC
"""

df_vendas_pagamento = run_query(query_vendas_pagamento)
print(df_vendas_pagamento)
```

<img width="445" height="109" alt="image" src="https://github.com/user-attachments/assets/4b2f7ad2-f83b-4fea-9cb6-aee5b5604073" />

<hr>

### Análise de Sazonalidade

#### Vendas Por Dia da Semana

```python
query_vendas_dia_semana = """
SELECT 
    t.dia_semana,
    SUM(f.valor_total) AS valor_total_vendas
FROM fato_vendas f
JOIN dim_tempo t ON f.data_venda = t.data_venda
GROUP BY t.dia_semana
ORDER BY 
    CASE t.dia_semana
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END
"""

df_vendas_dia_semana = run_query(query_vendas_dia_semana)
print(df_vendas_dia_semana)
```

<img width="279" height="170" alt="image" src="https://github.com/user-attachments/assets/78f99d4f-dde9-421e-81ed-95bb6f29163c" />

#### Vendas Por Mês

```python
query_vendas_mes = """
SELECT 
    t.mes,
    SUM(f.valor_total) AS valor_total_vendas
FROM fato_vendas f
JOIN dim_tempo t ON f.data_venda = t.data_venda
GROUP BY t.mes
ORDER BY t.mes
"""

df_vendas_mes = run_query(query_vendas_mes)
print(df_vendas_mes)
```

<img width="233" height="257" alt="image" src="https://github.com/user-attachments/assets/3f562c24-832e-49f6-bea9-030c3e00f655" />

<hr>

### Análise de Performance

#### Top 10 Clientes Por Valor Gasto

```python
query_top_clientes = """
SELECT TOP 10
    c.cliente_id,
    c.nome,
    SUM(f.valor_total) AS valor_total_gasto
FROM fato_vendas f
JOIN dim_cliente c ON f.cliente_id = c.cliente_id
GROUP BY c.cliente_id, c.nome
ORDER BY valor_total_gasto DESC
"""

df_top_clientes = run_query(query_top_clientes)
print(df_top_clientes)
```

<img width="477" height="225" alt="image" src="https://github.com/user-attachments/assets/6846acd9-6dd8-478a-90c4-a1e57b815432" />

#### Margem de Lucro por Categoria de Produto

```python
query_margem_categoria = """
SELECT 
    p.categoria_produto,
    SUM(f.valor_total - (f.quantidade * p.custo)) AS lucro_total
FROM fato_vendas f
JOIN dim_produto p ON f.produto_id = p.produto_id
GROUP BY p.categoria_produto
ORDER BY lucro_total DESC
"""

df_margem_categoria = run_query(query_margem_categoria)
print(df_margem_categoria)
```

<img width="274" height="178" alt="image" src="https://github.com/user-attachments/assets/cdee98ab-d33f-4216-b5d8-b58c024bb067" />

