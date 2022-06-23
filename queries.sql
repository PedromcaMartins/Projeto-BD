/*Qual o nome do retalhista (ou retalhistas) responsáveis pela reposição do maior número de 
categorias?*/ 
SELECT nome, COUNT(DISTINCT nome_cat)
FROM retalhista NATURAL JOIN responsavel_por
GROUP BY tin
HAVING COUNT(DISTINCT nome_cat) >= ALL (
    SELECT COUNT(DISTINCT nome_cat)
    FROM retalhista NATURAL JOIN responsavel_por
    GROUP BY tin
);

/*Qual o nome do ou dos retalhistas que são responsáveis por todas as categorias simples?*/
SELECT nome
FROM retalhista NATURAL JOIN responsavel_por
GROUP BY nome
HAVING COUNT (DISTINCT (nome_cat)) = (SELECT COUNT(nome_cat) 
FROM categoria_simples);

/*Quais os produtos (ean) que nunca foram repostos?*/ 
SELECT ean
FROM produto
EXCEPT 
SELECT ean
FROM evento_reposicao;

/*Quais os produtos (ean) que foram repostos sempre pelo mesmo retalhista?*/ 
SELECT ean
FROM evento_reposicao
GROUP BY ean
HAVING COUNT(DISTINCT tin) = 1;