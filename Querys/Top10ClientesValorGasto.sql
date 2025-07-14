SELECT TOP 10
    c.cliente_id,
    c.nome,
    SUM(f.valor_total) AS valor_total_gasto
FROM fato_vendas f
JOIN dim_cliente c ON f.cliente_id = c.cliente_id
GROUP BY c.cliente_id, c.nome
ORDER BY valor_total_gasto DESC