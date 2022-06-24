-------------------------------------------------------------
                    --Vista
-------------------------------------------------------------

/*Vista das vendas*/
CREATE OR REPLACE VIEW vendas
AS 
SELECT ean, nome_cat, EXTRACT(YEAR FROM instante) AS ano, 
EXTRACT(QUARTER FROM instante) AS trimestre, EXTRACT(MONTH FROM instante) AS mes, 
EXTRACT(ISODOW FROM instante) AS dia_semana, distrito, concelho, unidades
FROM planograma NATURAL JOIN produto 
NATURAL JOIN categoria
NATURAL JOIN IVM 
NATURAL JOIN ponto_de_retalho
NATURAL JOIN evento_reposicao