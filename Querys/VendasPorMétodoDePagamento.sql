SELECT 
    l.metodo_pagamento,
    COUNT(*) AS numero_vendas,
    SUM(f.valor_total) AS valor_total_vendas
FROM fato_vendas f
JOIN dim_loja l ON f.loja_id = l.loja_id
GROUP BY l.metodo_pagamento
ORDER BY valor_total_vendas DESC