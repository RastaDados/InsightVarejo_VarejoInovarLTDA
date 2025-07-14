SELECT 
    t.mes,
    SUM(f.valor_total) AS valor_total_vendas
FROM fato_vendas f
JOIN dim_tempo t ON f.data_venda = t.data_venda
GROUP BY t.mes
ORDER BY t.mes