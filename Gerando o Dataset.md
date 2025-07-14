### Criação do Dataset com Random e Fake

```python
import os
import pandas as pd
import numpy as np
from faker import Faker
from datetime import datetime, timedelta
import random

#Configuro o random e o fake
fake = Faker('pt_BR')
np.random.seed(42)
random.seed(42)

#Crio a pasta chamado dados para salvar os arquivos
if not os.path.exists('dados'):
    os.makedirs('dados')
    print("Pasta dados foi criada meu manooo!")

#Gero apenas 10 mil registros
n_records = 10000

#Crio um período dos dados de 2 anos, 730 dias
start_date = datetime.now() - timedelta(days=730)
end_date = datetime.now()

#Crio a ctegorias e subcategoria dos produtos
categorias = ['Eletrônicos', 'Roupas', 'Alimentos', 'Casa', 'Esportes', 'Beleza', 'Brinquedos', 'Livros']
subcategorias = {
    'Eletrônicos': ['Smartphones', 'Notebooks', 'TVs', 'Áudio'],
    'Roupas': ['Masculina', 'Feminina', 'Infantil', 'Esportiva'],
    'Alimentos': ['Perecíveis', 'Não Perecíveis', 'Bebidas', 'Congelados'],
    'Casa': ['Móveis', 'Decoração', 'Utensílios', 'Jardim'],
    'Esportes': ['Fitness', 'Ar Livre', 'Aquáticos', 'Coletivos'],
    'Beleza': ['Cuidados com a Pele', 'Maquiagem', 'Fragrâncias', 'Cabelo'],
    'Brinquedos': ['Educativos', 'Bonecas', 'Carrinhos', 'Jogos'],
    'Livros': ['Ficção', 'Não Ficção', 'Infantil', 'Acadêmicos']
}

#Gero os produtos dessas categorias e subcategorias
produtos = []
for categoria in categorias:
    for sub in subcategorias[categoria]:
        for _ in range(5):  
            custo = round(random.uniform(10, 500), 2)
            margem = random.uniform(0.2, 1.5)
            preco = round(custo * (1 + margem), 2)
            
            produtos.append({
                'produto_id': len(produtos) + 1,
                'nome': f"Produto {fake.word().capitalize()} {fake.word()}",
                'categoria': categoria,
                'subcategoria': sub,
                'custo': custo,
                'preco': preco,
                'marca': fake.company()
            })

#Gero dados para os clientes
clientes = [{
    'cliente_id': i + 1,
    'nome': fake.name(),
    'idade': random.randint(18, 80),
    'genero': random.choice(['M', 'F', 'Outro']),
    'cep': fake.postcode(),
    'data_cadastro': fake.date_between(start_date='-5y', end_date='today'),
    'frequencia_compra': random.choice(['Baixa', 'Média', 'Alta'])
} for i in range(500)]  # 500 clientes

#Gero os dados de vendas
vendas = []
for _ in range(n_records):
    produto = random.choice(produtos)
    cliente = random.choice(clientes)
    data_venda = fake.date_between(start_date=start_date, end_date=end_date)
    quantidade = random.randint(1, 5)
    desconto = round(random.uniform(0, 0.3), 2) if random.random() > 0.7 else 0
    
    vendas.append({
        'venda_id': len(vendas) + 1,
        'data_venda': data_venda.strftime('%Y-%m-%d'),
        'produto_id': produto['produto_id'],
        'cliente_id': cliente['cliente_id'],
        'quantidade': quantidade,
        'preco_unitario': produto['preco'],
        'desconto': desconto,
        'valor_total': round(quantidade * produto['preco'] * (1 - desconto), 2),
        'loja_id': random.randint(1, 10),
        'canal_venda': random.choice(['Loja Física', 'Online', 'Marketplace']),
        'metodo_pagamento': random.choice(['Cartão Crédito', 'Cartão Débito', 'Boleto', 'PIX'])
    })

#Criando os Dataframes
df_vendas = pd.DataFrame(vendas)
df_produtos = pd.DataFrame(produtos)
df_clientes = pd.DataFrame(clientes)

#Adiciono as informações de tempo
df_vendas['data_venda'] = pd.to_datetime(df_vendas['data_venda'])
df_vendas['dia_semana'] = df_vendas['data_venda'].dt.day_name()
df_vendas['mes'] = df_vendas['data_venda'].dt.month
df_vendas['ano'] = df_vendas['data_venda'].dt.year
df_vendas['trimestre'] = df_vendas['data_venda'].dt.quarter

#Salvo na pasta criada anteriormente, dentro de dados
df_vendas.to_csv('dados/dados_vendas.csv', index=False)
df_produtos.to_csv('dados/dados_produtos.csv', index=False)
df_clientes.to_csv('dados/dados_clientes.csv', index=False)

print("\nGerei e salvei os arquivos meu chapa!")
print(f"- dados/dados_vendas.csv: {len(df_vendas)} registros")
print(f"- dados/dados_produtos.csv: {len(df_produtos)} produtos")
print(f"- dados/dados_clientes.csv: {len(df_clientes)} clientes")
```
