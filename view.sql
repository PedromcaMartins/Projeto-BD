/*Vista das vendas*/
CREATE OR REPLACE VIEW vendas
AS 
SELECT ean, nome_cat, EXTRACT(YEAR FROM instante) AS ano, 
EXTRACT( FROM instante) AS trimestre, EXTRACT(MONTH FROM instante) AS mes, --FIXME VER COMO FAZER TRIMESTRE :(
EXTRACT(ISODOW FROM instante) AS dia_semana, distrito, concelho, unidades
FROM planograma NATURAL JOIN produto 
NATURAL JOIN categoria
NATURAL JOIN IVM 
NATURAL JOIN ponto_de_retalho
NATURAL JOIN evento_reposicao