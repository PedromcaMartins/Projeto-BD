/*PROBLEMA DO TEM_OUTRA... :(*/
CREATE OR REPLACE TRIGGER doesnt_contain_itself
BEFORE INSERT ON tem_outra 
FOR EACH ROW
BEGIN
    IF NEW.nome_cat == NEW.nome_cat_super THEN
        RAISE EXCEPTION 'Uma categoria não pode estar contida em si própria'
    END IF;
END;

/*Trigger para verificar se nº unidades do evento de reposicao
excede o do planograma*/
CREATE OR REPLACE TRIGGER check_units
BEFORE INSERT ON evento_reposicao --FIXME #7 CONFIRMAR SE INSERIMOS NO EVENTO D REPOSIÇÂO OU PLANOGRAMA
FOR EACH ROW
DECLARE uns NUMBER;
BEGIN
    SELECT unidades INTO uns
    FROM planograma
    WHERE ean := NEW.ean AND nro := NEW.nro; --FIXME #6 VER SE OS DOIS PONTOS ESTAO BEM
    IF NEW.unidades > uns THEN
        RAISE EXCEPTION 'Excedeu o limite de unidades'
    END IF;
END;

/*Trigger para verificar se se pode colocar produto na prateleira*/
CREATE OR REPLACE TRIGGER is_valid
BEFORE INSERT ON planograma 
FOR EACH ROW
DECLARE cat_prod varchar(255), cat_prat NUMBER;
BEGIN
    SELECT categoria INTO cat_prod
    FROM produto
    WHERE ean := NEW.ean;
    SELECT COUNT(*) INTO cat_prat 
    FROM prateleira
    WHERE nro := NEW.nro AND categoria := cat_prod;
    IF cat_prat == 0 THEN
        RAISE EXCEPTION 'Não existe categoria presente na prateleira'
    END IF;
END;
