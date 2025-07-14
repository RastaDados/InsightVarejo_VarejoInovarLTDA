SELECT 
    p.categoria_produto,
    p.subcategoria_produto,
    COUNT(*) AS numero_produtos
FROM dim_produto p
GROUP BY p.categoria_produto, p.subcategoria_produto
ORDER BY p.categoria_produto, numero_produtos DESC