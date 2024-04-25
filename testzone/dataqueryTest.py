import mysql.connector

# MySQL connection setting
mydb = mysql.connector.connect(
        host= 'localhost',
        user= 'root',
        password= '@Autopassword',
        database= 'SlayTheSpire',
        raise_on_warnings= True
)

# connection test
def connect_to_mysql(): 
    # MySQL connect
    try:
        conn = mydb
        print("connect successful.")
        return conn
    except mydb.Error as err:
        print(f"err: {err}")
        return None

# insertion test
def insert_to_table():
    mycursor = mydb.cursor()
    insert_query = """INSERT INTO result (result_id, floor_reached, playtime, score, damage_taken_total, character_chosen, gold, victory, relics_obtained)
VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"""
    data = (1, 20, 120, 5000, 100, 'IRONCLAD', 1000, True, '{"relic1": "Ironclad relic", "relic2": "Another relic"}')
    mycursor.execute(insert_query, data)
    mydb.commit()
    print("Data inserted successfully.")


# MySQL connect
conn = insert_to_table()
