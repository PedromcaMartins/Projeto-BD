#!/usr/bin/python3
from wsgiref.handlers import CGIHandler
from flask import Flask
from flask import render_template, request
import psycopg2
import psycopg2.extras

## SGBD configs
DB_HOST = "db.tecnico.ulisboa.pt"
DB_USER = "ist199303"
DB_DATABASE = DB_USER
DB_PASSWORD = "zzzb1382"
DB_CONNECTION_STRING = "host=%s dbname=%s user=%s password=%s" % (
    DB_HOST,
    DB_DATABASE,
    DB_USER,
    DB_PASSWORD,
)

app = Flask(__name__)

app.debug = True

## main menu
@app.route("/")
def main_menu():
    return render_template("main_menu.html")


## metodos para a 1a funcionalidade
@app.route("/ins_rem_cat")
def insert_remove_cat():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        query = "SELECT * FROM categoria;"
        cursor.execute(query)
        return render_template("insert_remove_cat.html", cursor=cursor)
    except Exception as e:
        return str(e)
    finally:
        cursor.close()
        dbConn.close()


@app.route("/remove_category")
def remove_category():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        category_name = request.args["category_name"]


        query = "SELECT ean FROM produto AS p WHERE p.nome_cat=%s"
        cursor.execute(query, (category_name,))
        cat_table = cursor.fetchall()

        for line in cat_table:
            query = "DELETE FROM evento_reposicao WHERE ean=%s"
            cursor.execute(query, (line[0],))
            
            query = "DELETE FROM planograma WHERE ean=%s"
            cursor.execute(query, (line[0],))


        query = "SELECT nro FROM prateleira AS p WHERE p.nome_cat=%s"
        cursor.execute(query, (category_name,))
        prat_has_nro_table = cursor.fetchall()

        for line in prat_has_nro_table:
            query = "DELETE FROM evento_reposicao WHERE nro=%s"
            cursor.execute(query, (line[0],))
            
            query = "DELETE FROM planograma WHERE nro=%s"
            cursor.execute(query, (line[0],))


        query = "DELETE FROM prateleira WHERE nome_cat=%s"
        cursor.execute(query, (category_name,))

        query = "DELETE FROM tem_categoria WHERE nome_cat=%s"
        cursor.execute(query, (category_name,))

        query = "DELETE FROM produto WHERE nome_cat=%s"
        cursor.execute(query, (category_name,))

        query = "DELETE FROM responsavel_por WHERE nome_cat=%s"
        cursor.execute(query, (category_name,))

        query = "DELETE FROM tem_outra WHERE nome_cat=%s"
        cursor.execute(query, (category_name,))

        query = "DELETE FROM tem_outra WHERE nome_cat_super=%s"
        cursor.execute(query, (category_name,))

        query = "DELETE FROM categoria_simples WHERE nome_cat=%s"
        cursor.execute(query, (category_name,))

        query = "DELETE FROM super_categoria WHERE nome_cat=%s"
        cursor.execute(query, (category_name,))
        
        query = "DELETE FROM categoria WHERE nome_cat=%s"
        cursor.execute(query, (category_name,))

        return render_template("confirmation.html")
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()


@app.route("/insert_cat")
def insert_category():
    try:
        return render_template("insert_cat.html")
    except Exception as e:
        return str(e)


@app.route("/create_cat", methods=["POST"])
def create_category():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        category_name = request.form["category_name"]
        query = "INSERT INTO categoria VALUES (%s);"
        data = (category_name,)
        cursor.execute(query, data)
        return render_template("confirmation.html")
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()


## metodos para a 2a funcionalidade
@app.route("/ins_rem_retailer")
def insert_remove_retailer():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        query = "SELECT nome FROM retalhista;"
        cursor.execute(query)

        return render_template("insert_remove_retailer.html", cursor=cursor)
    except Exception as e:
        return str(e)
    finally:
        cursor.close()
        dbConn.close()


@app.route("/remove_retailer")
def remove_retailer():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        retailer_name = request.args["retailer_name"]

        query = "DELETE FROM responsavel_por AS rp WHERE rp.tin=(SELECT tin FROM retalhista AS r WHERE r.nome=%s)"
        cursor.execute(query, (retailer_name,))
        query = "DELETE FROM evento_reposicao AS rp WHERE rp.tin=(SELECT tin FROM retalhista AS r WHERE r.nome=%s)"
        cursor.execute(query, (retailer_name,))
        query = "DELETE FROM retalhista WHERE nome=%s"
        cursor.execute(query, (retailer_name,))

        return render_template("confirmation.html")
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()


@app.route("/insert_retailer")
def insert_retailer():
    try:
        return render_template("insert_retailer.html")
    except Exception as e:
        return str(e)


@app.route("/create_retailer", methods=["POST"])
def create_retailer():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        retailer_name = request.form["retailer_name"]
        retailer_id = request.form["retailer_id"]
        query = "INSERT INTO retalhista VALUES (%s, %s);"
        data = (retailer_id, retailer_name)

        cursor.execute(query, data)
        return render_template("confirmation.html")
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()


## metodos para a 3a funcionalidade
@app.route("/list_ivms")
def list_ivms():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        query = "SELECT num_serie FROM IVM;"
        cursor.execute(query)

        return render_template("list_ivms.html", cursor=cursor)
    except Exception as e:
        return str(e)
    finally:
        cursor.close()
        dbConn.close()


@app.route("/list_ivm_events")
def list_ivm_events():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        ivm_sn = request.args["ivm_sn"]
        query = "SELECT ean, SUM(unidades) FROM evento_reposicao WHERE num_serie=%s GROUP BY ean;"
        cursor.execute(query, (ivm_sn,))

        return render_template("list_ivm_events.html", cursor=cursor)
    except Exception as e:
        return str(e)
    finally:
        cursor.close()
        dbConn.close()


## metodos para a 4a funcionalidade
@app.route("/list_cat")
def list_cat():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        query = "SELECT * FROM categoria;"
        cursor.execute(query)

        return render_template("list_cat.html", cursor=cursor)
    except Exception as e:
        return str(e)
    finally:
        cursor.close()
        dbConn.close()


@app.route("/list_all_subcat")
def list_all_subcat():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        category_names = []
        total_record = []

        ## fixme criar 2 buffers, adicionar 2 loops:
        #  while(len != 0), for para fazer execute da categoria
        #  no buffer e fazer um for para cada record, 
        # guarda o record num buffer, envia o buffer 
        # como argumento para a pagina html ;)
        category_name = request.args["category_name"]
        category_names.append(category_name)


        while(len(category_names) != 0):
            query = "SELECT nome_cat FROM tem_outra WHERE nome_cat_super=%s;"
            cursor.execute(query, (category_names.pop(0),))

            for record in cursor.fetchall():
                total_record.append(record)
                category_names.append(record[0])

        return render_template("list_all_subcat.html", cursor=total_record)
    except Exception as e:
        return str(e)
    finally:
        cursor.close()
        dbConn.close()

CGIHandler().run(app)
