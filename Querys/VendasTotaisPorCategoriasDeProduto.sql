SELECT 
    p.categoria_produto,
    SUM(f.valor_total) AS valor_total_vendas
FROM fato_vendas f
JOIN dim_produto p ON f.produto_id = p.produto_id
GROUP BY p.categoria_produto
ORDER BY valor_total_vendas DESC