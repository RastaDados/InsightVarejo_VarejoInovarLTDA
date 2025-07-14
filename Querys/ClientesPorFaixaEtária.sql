SELECT 
    CASE 
        WHEN c.idade < 18 THEN 'Menor de 18'
        WHEN c.idade BETWEEN 18 AND 24 THEN '18-24'
        WHEN c.idade BETWEEN 25 AND 34 THEN '25-34'
        WHEN c.idade BETWEEN 35 AND 44 THEN '35-44'
        WHEN c.idade BETWEEN 45 AND 54 THEN '45-54'
        WHEN c.idade BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65+'
    END AS faixa_etaria,
    COUNT(*) AS numero_clientes
FROM dim_cliente c
GROUP BY 
    CASE 
        WHEN c.idade < 18 THEN 'Menor de 18'
        WHEN c.idade BETWEEN 18 AND 24 THEN '18-24'
        WHEN c.idade BETWEEN 25 AND 34 THEN '25-34'
        WHEN c.idade BETWEEN 35 AND 44 THEN '35-44'
        WHEN c.idade BETWEEN 45 AND 54 THEN '45-54'
        WHEN c.idade BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65+'
    END
ORDER BY faixa_etaria