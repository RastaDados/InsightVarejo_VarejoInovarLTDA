SELECT 
    t.data_venda,
    SUM(f.valor_total) AS valor_total_vendas
FROM fato_vendas f
JOIN dim_tempo t ON f.data_venda = t.data_venda
GROUP BY t.data_venda
ORDER BY t.data_venda