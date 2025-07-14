SELECT 
    p.categoria_produto,
    SUM(f.valor_total - (f.quantidade * p.custo)) AS lucro_total
FROM fato_vendas f
JOIN dim_produto p ON f.produto_id = p.produto_id
GROUP BY p.categoria_produto
ORDER BY lucro_total DESC