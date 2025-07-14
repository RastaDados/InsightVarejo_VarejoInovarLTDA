SELECT TOP 10
    p.nome_produto,
    SUM(f.quantidade) AS quantidade_vendida
FROM fato_vendas f
JOIN dim_produto p ON f.produto_id = p.produto_id
GROUP BY p.nome_produto
ORDER BY quantidade_vendida DESC