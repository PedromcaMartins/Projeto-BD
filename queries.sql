/*1*/ 
SELECT nome, COUNT(DISTINCT nome_cat)
FROM retalhista NATURAL JOIN responsavel_por
GROUP BY tin
HAVING COUNT(DISTINCT nome_cat) >= ALL (
    SELECT COUNT(DISTINCT nome_cat)
    FROM retalhista NATURAL JOIN responsavel_por
    GROUP BY tin
);
/*2*/ --FIXME
SELECT nome
FROM retalhista NATURAL JOIN responsavel_por
WHERE NOT EXISTS(
    SELECT COUNT (DISTINCT nome_cat) == 
SELECT COUNT(
SELECT nome_cat 
FROM categoria_simples)

/*3*/ 
SELECT ean
FROM produto
EXCEPT 
SELECT ean
FROM evento_reposicao;

/*4*/ 
SELECT ean
FROM evento_reposicao
GROUP BY ean
HAVING COUNT(DISTINCT tin) = 1;