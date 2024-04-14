import mysql.connector as mysql

def connect_to_mysql():
    # MySQL connection setting
    config = {
        'user': 'root',
        'password': '1111',
        'host': 'localhost',
        'database': 'SlayTheSpire',
        'raise_on_warnings': True
    }

    # MySQL connect
    try:
        conn = mysql.connect(**config)
        print("connect successful.")
        return conn
    except mysql.connector.Error as err:
        print(f"err: {err}")
        return None

# MySQL connect
conn = connect_to_mysql()
