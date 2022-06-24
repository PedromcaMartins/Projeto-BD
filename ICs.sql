/*Trigger para verificar se uma categoria não pode estar contida em si própria*/
CREATE OR REPLACE FUNCTION doesnt_contain_itself_proc()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.nome_cat == NEW.nome_cat_super THEN
        RAISE EXCEPTION 'Uma categoria não pode estar contida em si própria'
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER doesnt_contain_itself_trigger
BEFORE INSERT ON tem_outra 
FOR EACH ROW EXECUTE PROCEDURE doesnt_contain_itself_proc()

/*Trigger para verificar se nº unidades do evento de reposicao
excede o do planograma*/
CREATE OR REPLACE FUNCTION check_units_proc()
DECLARE uns NUMBER;
BEGIN
    SELECT unidades INTO uns
    FROM planograma
    WHERE ean := NEW.ean AND nro := NEW.nro; 
    IF NEW.unidades > uns THEN
        RAISE EXCEPTION 'Excedeu o limite de unidades'
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_units_trigger
BEFORE INSERT ON evento_reposicao 
FOR EACH ROW EXECUTE PROCEDURE check_units_proc()

/*Trigger para verificar se se pode colocar produto na prateleira*/
CREATE OR REPLACE FUNCTION is_valid_proc()
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
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER is_valid_proc()
BEFORE INSERT ON planograma 
FOR EACH ROW EXECUTE PROCEDURE is_valid_proc()
