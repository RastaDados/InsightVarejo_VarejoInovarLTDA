### Conexão e Carga no MongoDB

```python
from pymongo import MongoClient
import pandas as pd

#Carrego os arquivos e salvo em um df
df = pd.read_csv("dados/dados_merge.csv")

#Conectando ao Mongodb pelo localhost padrão (27017, localhost)
client = MongoClient("mongodb://localhost:27017/")
db = client["varejo_demanda_staging"]
collection = db["dados_brutos"]

#Converto o df para JSON e faço a ingestão dos dados no MongoDB
data = df.to_dict(orient="records")
collection.insert_many(data)
```

<hr>

### Criação e Carga no DataWarehouse - SQLServer

```python
from pymongo import MongoClient
import pandas as pd
import pyodbc

#Realizo a conexão com o MongoDB novamente
client = MongoClient("mongodb://localhost:27017/")
db = client["varejo_demanda_staging"]
collection = db["dados_brutos"]

#Extraio os dados do MongoDB para o dataframe df
cursor = collection.find()
df = pd.DataFrame(list(cursor))

#Removo os campos de id que são gerados automaticamente pelo MongoDB
df.drop(columns=["_id"], inplace=True)  

#Faço a conexão com o SQLServer com autenticação do Windows (já estou conectado na minha máquina, é localhost)
conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=DESKTOP-U623P07;DATABASE=vendas_demanda_dw;Trusted_Connection=yes;')
cursor = conn.cursor()


#Insiro os dados nas tabelas de dimensão
for index, row in df.iterrows():
    #Insiro dados na tabela dim_produto se ela não tiver dados
    cursor.execute("""
        IF NOT EXISTS (SELECT * FROM dim_produto WHERE produto_id = ?)
        BEGIN
            INSERT INTO dim_produto (produto_id, nome_produto, categoria_produto, subcategoria_produto, custo, preco, marca)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        END
    """, row['produto_id'], row['produto_id'], row['nome_produto'], row['categoria_produto'], row['subcategoria_produto'], row['custo'], row['preco'], row['marca'])
    
    #Insiro dados na tabela dim_cliente se ela não tiver dados
    cursor.execute("""
        IF NOT EXISTS (SELECT * FROM dim_cliente WHERE cliente_id = ?)
        BEGIN
            INSERT INTO dim_cliente (cliente_id, nome, idade, genero, cep, data_cadastro, frequencia_compra)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        END
    """, row['cliente_id'], row['cliente_id'], row['nome'], row['idade'], row['genero'], row['cep'], row['data_cadastro'], row['frequencia_compra'])
    
    #Insiro dados na tabela dim_tempo se ela não tiver dados
    cursor.execute("""
        IF NOT EXISTS (SELECT * FROM dim_tempo WHERE data_venda = ?)
        BEGIN
            INSERT INTO dim_tempo (data_venda, dia_semana, mes, ano, trimestre)
            VALUES (?, ?, ?, ?, ?)
        END
    """, row['data_venda'], row['data_venda'], row['dia_semana'], row['mes'], row['ano'], row['trimestre'])
    
    #Insiro dados na tabela dim_loja se ela não tiver dados
    cursor.execute("""
    IF NOT EXISTS (SELECT * FROM dim_loja WHERE loja_id = ?)
    BEGIN
        INSERT INTO dim_loja (loja_id, canal_venda, metodo_pagamento)
        VALUES (?, ?, ?)
    END
    """, row['loja_id'], row['loja_id'], row['canal_venda'], row['metodo_pagamento'])
    
    # Insiro dados na tabela fato_vendas se ela não tiver dados
    cursor.execute("""
        INSERT INTO fato_vendas (venda_id, data_venda, produto_id, cliente_id, loja_id, quantidade, preco_unitario, desconto, valor_total)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    """, row['venda_id'], row['data_venda'], row['produto_id'], row['cliente_id'], row['loja_id'], row['quantidade'], row['preco_unitario'], row['desconto'], row['valor_total'])

conn.commit()
```
