SELECT 
    t.dia_semana,
    SUM(f.valor_total) AS valor_total_vendas
FROM fato_vendas f
JOIN dim_tempo t ON f.data_venda = t.data_venda
GROUP BY t.dia_semana
ORDER BY 
    CASE t.dia_semana
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END