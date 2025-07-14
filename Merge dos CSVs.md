### Realizando o Merge dos Arquivos CSV

```python
import pandas as pd

#Carregando os arquivos
clientes = pd.read_csv('dados/dados_clientes.csv')
produtos = pd.read_csv('dados/dados_produtos.csv')
vendas = pd.read_csv('dados/dados_vendas.csv')

#Renoemando as colunas pra não dar b.o no merge
produtos.rename(columns={'nome': 'nome_produto', 'categoria': 'categoria_produto', 'subcategoria': 'subcategoria_produto'}, inplace=True)

#Realizando o merge entre vendas e clientes
vendas_clientes = pd.merge(vendas, clientes, on='cliente_id', how='left')

#Realizando o merge entre o resultado anterior e produtos
vendas_clientes_produtos = pd.merge(vendas_clientes, produtos, on='produto_id', how='left')

#Salvo o dataframe depois do merge em um CSV
vendas_clientes_produtos.to_csv('dados/dados_merge.csv', index=False)
```
