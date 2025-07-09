### Análise de Vendas e Previsão de Demanda para Varejo

<hr>

### Sobre o Projeto

Este relatório apresenta uma análise completa do projeto de Análise de Vendas e Previsão de Demanda para Varejo, com base nos dados fornecidos. O objetivo principal é compreender o desempenho atual das vendas, identificar padrões de consumo e criar um modelo de previsão de demanda que auxilie na tomada de decisões estratégicas. O projeto é completo, desde a criação do Staging (Data Lake) até a ingestão e criação do DataWarehouse, terminando em uma visualização de dados com o PowerBI.

<hr>

### Dores Sanadas pelo Projeto

- <b>Falta de visibilidade sobre padrões de venda:</b> Com a análise dos dados, foi possível identificar tendências sazonais e padrões de comportamento dos clientes.
- <b>Dificuldade em prever demanda:</b> O desenvolvimento do modelo de previsão ajuda a antecipar necessidades de estoque e planejar melhor as operações.
- <b>Ausência de segmentação de clientes:</b> A clusterização de clientes permite personalizar estratégias de marketing e atendimento.
- <b>Ineficiência no uso de recursos:</b> A análise de performance por canal e produto ajuda a otimizar investimentos e recursos.

<hr>

### Objetivos da Análise

#### Problema de Negócio ou Oportunidade Identificada

O varejista enfrentava dificuldades em gerenciar estoques eficientemente e estava perdendo oportunidades de aumento de receita devido à falta de insights sobre padrões de consumo.

#### Perguntas-Chave que Motivaram a Análise

- Quais são os principais produtos e categorias que impulsionam as vendas?
- Como se distribui a demanda ao longo do ano (sazonalidade)?
- Quais canais de venda são mais eficazes?
- Como podemos prever a demanda futura com maior precisão?
- Quais segmentos de clientes são mais valiosos?

<hr>

<table>
  <thead>
    <tr>
      <th>KPI</th>
      <th>Valor Atual</th>
      <th>Tendência</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Faturamento Mensal Médio</td>
      <td>R$ 2.874.130,00</td>
      <td>Aumento de 18% no último trimestre</td>
    </tr>
    <tr>
      <td>Margem de Lucro Bruta</td>
      <td>37,5%</td>
      <td>Estável no último semestre</td>
    </tr>
    <tr>
      <td>Ticket Médio</td>
      <td>R$ 1.123,50</td>
      <td>Aumento de 9% em relação a 2023</td>
    </tr>
    <tr>
      <td>Crescimento de Clientes</td>
      <td>12% mês</td>
      <td>Desaceleração em 2025</td>
    </tr>
    <tr>
      <td>Retenção de Clientes</td>
      <td>68%</td>
      <td>Melhora de 5 pontos percentuais em 2024</td>
    </tr>
    <tr>
      <td>Índice de Cancelamento</td>
      <td>2,3%</td>
      <td>Redução de 1 ponto percentual no último trimestre</td>
    </tr>
  </tbody>
</table>

<hr>

### Gráficos e Visualizações

#### Vendas Totais por Mês

<b>Padrões observados:</b>

- Picos nas vendas durante os meses de dezembro e junho (promocões e festas)
- Declínio constante em janeiro após picos de final de ano
- Crescimento sustentado desde meados de 2024

<b>Implicações:</b> Sugere a importância de estratégias focadas em retenção pós-promoção

#### Vendas Totais por Categoria de Produto

<b>esultados:</b>

- Alimentos: 28% do faturamento total
- Esportes: 22%
- Beleza: 18%
- Eletrônicos: 15%
- Livros: 10%
- Outras categorias: 7%

<b>Anomalias:</b> Queda de 12% nas vendas de brinquedos no último trimestre

#### Vendas Totais por Canal de Venda

<b>esultados:</b>

- Marketplace: 45% das vendas
- Online: 35%
- Loja física: 20%

<b>Tendência:</b> Crescimento consistente do canal online (+22% em 2024)

#### Clusterização de Clientes

<b>Características dos clusters:</b>

- Cluster 1 (25%): Clientes altamente engajados, compram frequentemente, alta LTV
- Cluster 2 (50%): Clientes ocasionais, média frequência, baixo ticket
- Cluster 3 (25%): Clientes recentes, alto potencial de crescimento

<hr>

### Insights

#### Desempenho Atual

- O portfólio de produtos está bem diversificado, mas há espaço para aprimorar a gama de eletrônicos
- O canal online está crescendo aceleradamente e merece investimento adicional
- Clientes do cluster 1 representam 40% do faturamento total

#### Oportunidades de Melhoria

- <b>Expansão do catálogo de eletrônicos:</b> Representam apenas 15% do faturamento, mas têm margens elevadas
- <b>Personalização de ofertas:</b> Os clientes do cluster 3 respondem melhor a promoções específicas
- <b>Otimização de estoque:</b> Previsões indicam possíveis excessos em categorias de decoração

#### Riscos

- <b>Dependência do marketplace:</b> 45% do faturamento depende desse único canal
- <b>Volatilidade de vendas de brinquedos:</b> Queda de 12% no último trimestre pode continuar
- <b>Custo elevado de aquisição de clientes:</b> Necessário melhorar a taxa de conversão

<hr>

### Análise por Segmentos

#### Por Canais de Vendas
<table>
  <thead>
    <tr>
      <th>Canal</th>
      <th>% do Faturamento</th>
      <th>Crescimento Anual</th>
      <th>Margem de Lucro</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Markteplace</td>
      <td>45%</td>
      <td>+22%</td>
      <td>38%</td>
    </tr>
    <tr>
      <td>Online</td>
      <td>35%</td>
      <td>+35%</td>
      <td>36%</td>
    </tr>
    <tr>
      <td>Loja Física</td>
      <td>20%</td>
      <Td>+5%</Td>
      <td>34%</td>
    </tr>
  </tbody>
</table>

#### Por Categoria de Produto

<table>
  <thead>
    <tr>
      <th>Categoria</th>
      <th>% do Faturamento</th>
      <th>Crescimento Anual</th>
      <th>Margem de Lucro</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Alimentos</td>
      <td>28%</td>
      <td>+12%</td>
      <td>35%</td>
    </tr>
    <tr>
      <td>Esportes</td>
      <td>22%</td>
      <td>+18%</td>
      <td>40%</td>
    </tr>
    <tr>
      <td>Beleza</td>
      <td>18%</td>
      <Td>+8%</Td>
      <td>39%</td>
    </tr>
    <tr>
      <td>Eletrônicos</td>
      <td>15%</td>
      <td>+25%</td>
      <td>45%</td>
    </tr>
    <tr>
      <td>Livros</td>
      <td>10%</td>
      <td>+5%</td>
      <td>33%</td>
    </tr>
  </tbody>
</table>

#### Por Segmento de Clientes

<table>
  <thead>
    <tr>
      <th>Segmento</th>
      <th>% do Faturamento</th>
      <th>Ticket Médio</th>
      <th>Frequência Média</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Alta Renda</td>
      <td>35%</td>
      <td>R$1.800</td>
      <td>1 Vez/Semana</td>
    </tr>
    <tr>
      <td>Média Renda</td>
      <td>45%</td>
      <td>R$1.100</td>
      <td>1 Vez/Mês</td>
    </tr>
    <tr>
      <td>Baixa Renda</td>
      <td>20%</td>
      <Td>R$600</Td>
      <td>1 Vez/Trimestre</td>
    </tr>
  </tbody>
</table>

<hr>

### Recomendações Que eu Sugiro

#### Ações Para Realizar em  Curto Prazo 

#### Campanha de retenção para clientes do cluster 1:</b>

- Programa de fidelidade com benefícios exclusivos
- Métricas a monitorar: Taxa de retenção, LTV

#### Ajuste de estoque para produtos sazonais:

- Uso do modelo SARIMA para prever necessidades de decoração e artigos de Natal
- Métricas a monitorar: Rotatividade de estoque, custo de armazenagem

#### Personalização de ofertas para clientes do cluster 3:

- Campanhas direcionadas com cupons de primeiro acesso
- Métricas a monitorar: Taxa de conversão, CAC

#### Ações Para Realizar em Médio Prazo 

#### Expansão do catálogo de eletrônicos :

- Inclusão de novas linhas de smartphones e TVs
- Métricas a monitorar: Participação de mercado, margem de contribuição

#### Otimização do canal online:

- Melhorias no site e aplicativo mobile
- Métricas a monitorar: Taxa de conversão, tempo médio de navegação

### Treinamento de equipes de vendas:

- Foco em cross-selling e up-selling
- Métricas a monitorar: Produtividade por vendedor, ticket médio

#### Ações Para Realizar em Longo Prazo 

#### Desenvolvimento de nova estratégia omnichannel:

- Integração completa entre canais físico e digital
- Métricas a monitorar: Experiência do cliente, custo de serviço

#### Investimento em automação de processos:

- Implementação de chatbots e sistemas de recomendação
- Métricas a monitorar: Tempo de atendimento, satisfação do cliente

#### Desenvolvimento de produtos próprios:

- Lançamento de marcas próprias em categorias promissoras
- Métricas a monitorar: Margem de lucro, participação de mercado

<hr>

### Conclusão do Projeto

#### Principais Insights

- O negócio mostra crescimento sustentado, especialmente no canal online
- Há grandes oportunidades de melhoria na diversificação do portfólio e na experiência do cliente
- O modelo de previsão demonstra precisão suficiente para apoiar decisões estratégicas
- A segmentação de clientes revela oportunidades claras de personalização de ofertas

### Impacto Esperado

#### Com a implementação das recomendações propostas, esperamos:

- Aumento de 15-20% no faturamento anual nos próximos 12 meses
- Redução de 10% nos custos de estoque através de previsões mais precisas
- Melhora de 25% na taxa de retenção de clientes valiosos

<b>Este relatório fornece uma visão abrangente do desempenho atual e sugere um caminho claro para o crescimento e otimização do negócio. Com base nos insights apresentados, recomenda-se formar uma equipe multidisciplinar para implementar as ações prioritárias e acompanhar seus resultados.</b>
