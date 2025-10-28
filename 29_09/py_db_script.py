import pymysql.cursors

conn = pymysql.connect(
    host = 'localhost',
    user = 'root',
    password = '',
    database = 'shoes_sells',
    port = 3306
)

with conn:
    with conn.cursor() as cursor:
        query = """INSERT INTO providers VALUES ('company1', 'beato', 'mattia', 'salzano', 'secret', current_timestamp())"""
        #query = """select * from providers"""
        cursor.execute(query)
        result = cursor.fetchall()
        print (result)
