-------------------------------------------------------------
/*OLAP*/
-------------------------------------------------------------

/* num dado período (i.e. entre duas datas), por dia da semana,
 por concelho e no total*/
SELECT ean, dia_semana, concelho, SUM(unidades) AS nmr_artigos_vendidos
FROM vendas AS v
WHERE v.instante >= '2022-01-01 01:00:00' AND
v.instante < '2022-05-13 23:59:00'
GROUP BY CUBE (ean, dia_semana, concelho)
ORDER BY ean, dia_semana, concelho, nmr_artigos_vendidos DESC;

/* num dado distrito (i.e. “Lisboa”), por concelho, categoria, 
dia da semana e no total*/
SELECT ean, concelho, nome_cat, dia_semana, SUM(unidades) AS nmr_artigos_vendidos
FROM vendas AS v
WHERE v.distrito = 'Lisboa'
GROUP BY CUBE (ean, concelho, nome_cat, dia_semana)
ORDER BY ean, concelho, nome_cat, dia_semana, nmr_artigos_vendidos DESC;
