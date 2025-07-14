SELECT 
    CASE 
        WHEN DATEDIFF(DAY, c.data_cadastro, GETDATE()) < 30 THEN 'Ativo'
        ELSE 'Inativo'
    END AS status_cliente,
    COUNT(*) AS numero_clientes
FROM dim_cliente c
GROUP BY 
    CASE 
        WHEN DATEDIFF(DAY, c.data_cadastro, GETDATE()) < 30 THEN 'Ativo'
        ELSE 'Inativo'
    END