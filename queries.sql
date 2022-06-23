/*1*/ 
SELECT nome
FROM retalhista 
WHERE
(SELECT Count(DISTINCT nome_cat) 
FROM responsavel_por) >= ALL (
SELECT Count(DISTINCT nome_cat)
FROM responsavel_por)

/* TESTAR QUAL FUNCIONA*/
--FIXME
CREATE OR REPLACE VIEW aux 
AS
SELECT Count(DISTINCT nome_cat) as c
FROM retalhista 

SELECT nome
FROM retalhista 
WHERE
aux.c >= ALL (
SELECT Count(DISTINCT nome_cat)
FROM responsavel_por)

/*2*/ --FIXME
SELECT nome
FROM retalhista NATURAL JOIN responsavel_por
WHERE 
SELECT COUNT (DISTINCT nome_cat) == 
SELECT COUNT(
SELECT nome_cat 
FROM categoria_simples)

/*3*/ 
(SELECT ean
FROM produto
EXCEPT 
SELECT ean
FROM evento_reposicao)

/*4*/ --FIXME
SELECT ean
FROM evento_reposicao
GROUP BY DISTINCT tin
HAVING COUNT(*) = 1