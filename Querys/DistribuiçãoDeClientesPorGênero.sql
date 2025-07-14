SELECT 
    c.genero,
    COUNT(*) AS numero_clientes
FROM dim_cliente c
GROUP BY c.genero
ORDER BY numero_clientes DESC