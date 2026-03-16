import sqlite3

# conectar a la base de datos
conn = sqlite3.connect("database/roseamor.db")

# leer archivo SQL
with open("sql/warehouse.sql", "r") as file:
    sql_script = file.read()

# ejecutar script
conn.executescript(sql_script)

print("Data warehouse creado correctamente")

conn.close()