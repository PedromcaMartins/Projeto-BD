/*OLAP*/

-- num dado período (i.e. entre duas datas), por dia da semana, por concelho e no total ??
SELECT COUNT(ean) AS nmr_artigos_vendidos
FROM vendas AS v
INNER JOIN evento_reposicao AS er ON (er.ean = v.ean)
WHERE er.instante >= {1} AND er.instante <= {2} AND v.dia_semana = {3} AND concelho = {4}
GROUP BY ean
/*1,2,3 e 4 referem-se a um dado instante (1,2) ao dia da semana (3) e ao conselho (4)*/

-- num dado distrito (i.e. “Lisboa”), por concelho, categoria, dia da semana e no total ??
SELECT COUNT(ean) AS nmr_artigos_vendidos
FROM vendas AS v
INNER JOIN evento_reposicao AS er ON (er.ean = v.ean)
WHERE distrito = {1} AND concelho = {2} AND v.nome_cat = {3} AND v.dia_semana = {4}
GROUP BY ean
/*1,2,3 e 4 referem-se ao distrito (1) concelho (2) categoria (3) e dia da semana (4)*/