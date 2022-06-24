-------------------------------------------------------------
/*OLAP*/
-------------------------------------------------------------

/* num dado período (i.e. entre duas datas), por dia da semana,
 por concelho e no total*/
SELECT dia_semana, concelho, SUM(unidades) AS nmr_artigos_vendidos
FROM vendas AS v
WHERE v.ano = 2022 AND 
v.mes BETWEEN 1 AND 5 AND 
dia_mes BETWEEN 1 AND 31
GROUP BY CUBE (dia_semana, concelho)
ORDER BY dia_semana, concelho, nmr_artigos_vendidos DESC;

/* num dado distrito (i.e. “Lisboa”), por concelho, categoria, 
dia da semana e no total*/
SELECT concelho, nome_cat, dia_semana, SUM(unidades) AS nmr_artigos_vendidos
FROM vendas AS v
WHERE v.distrito = 'Lisboa'
GROUP BY CUBE (concelho, nome_cat, dia_semana)
ORDER BY ean, concelho, nome_cat, dia_semana, nmr_artigos_vendidos DESC;
