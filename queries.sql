/*1*/
SELECT name
FROM Retailer 
WHERE
SELECT Count(DISTINCT name_categ) 
FROM responsible_for >= ALL (
SELECT Count(DISTINCT name_categ)
FROM responsible_for)

/* TESTAR QUAL FUNCIONA*/

SELECT name
FROM Retailer 
WHERE
SELECT Count(DISTINCT name_categ) 
FROM retailer NATURAL JOIN responsible_for >= ALL (
SELECT Count(DISTINCT name_categ)
FROM responsible_for)


SELECT name
FROM Retailer 
WHERE 
SELECT COUNT (DISTINCT name_categ) == 
SELECT COUNT(
SELECT name_categ 
FROM categoria_simples)


SELECT ean
FROM product
MINUS 
SELECT ean
FROM replenishment_event


SELECT ean
FROM replenishment_event
HAVING COUNT(DISTINCT tin) == 1
