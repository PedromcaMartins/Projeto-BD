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


@app.route("/list_accounts")
def list_accounts():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        query = "SELECT * FROM account;"
        cursor.execute(query)
        return render_template("index.html", cursor=cursor)
    except Exception as e:
        return str(e)  # Renders a page with the error.
    finally:
        cursor.close()
        dbConn.close()


@app.route("/accounts")
def list_accounts_edit():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        query = "SELECT account_number, branch_name, balance FROM account;"
        cursor.execute(query)
        return render_template("accounts.html", cursor=cursor)
    except Exception as e:
        return str(e)
    finally:
        cursor.close()
        dbConn.close()


@app.route("/balance")
def change_balance():
    try:
        return render_template("balance.html", params=request.args)
    except Exception as e:
        return str(e)


@app.route("/update", methods=["POST"])
def update_balance():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        balance = request.form["balance"]
        account_number = request.form["account_number"]
        query = "UPDATE account SET balance=%s WHERE account_number = %s"
        data = (balance, account_number)
        cursor.execute(query, data)
        return query
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()

##-------------------------------------------------------------------
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

        ## fixme corrigir os delete's
        ## eliminar a conta de todas as tabelas
        query = "DELETE FROM prateleira WHERE nome_cat=%s"
        cursor.execute(query, (category_name,))
        query = "DELETE FROM responsavel_por WHERE nome_cat=%s"
        cursor.execute(query, (category_name,))
        query = "DELETE FROM produto WHERE nome_cat=%s"
        cursor.execute(query, (category_name,))
        query = "DELETE FROM tem_categoria WHERE nome_cat=%s"
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

        ## fixme mudar os WHERE dos deletes
        ## eliminar o retailer de todas as tabelas
        query = "DELETE FROM responsavel_por WHERE nome=%s"
        cursor.execute(query, (retailer_name,))
        query = "DELETE FROM evento_reposicao WHERE nome=%s"
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
        ## fixme adicionar um id (dado pelo sistema) ao retalhista
        retailer_id = 123456704
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
@app.route("/list_ivm_events", methods=["POST"])
def list_ivm_events():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        ## fixme meter o endereco ivm_sn a funcionar
        ivm_sn = request.form["ivm_sn"]
        query = "SELECT unidades FROM evento_reposicao GROUP BY ean WHERE num_serie=%ld;"
        cursor.execute(query, (ivm_sn,))

        return render_template("list_ivm_events.html", cursor=cursor)
    except Exception as e:
        return str(e)
    finally:
        cursor.close()
        dbConn.close()


## TODO
@app.route("/list_all_subcat")
def list_all_subcat():
    return render_template("list_all_subcat.html")


CGIHandler().run(app)
