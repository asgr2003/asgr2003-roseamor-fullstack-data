import pandas as pd
import sqlite3

# conectar a la base de datos
conn = sqlite3.connect("database/roseamor.db")

# cargar CSV
orders = pd.read_csv("data/orders.csv")
customers = pd.read_csv("data/customers.csv")
products = pd.read_csv("data/products.csv")

# guardar en tablas
orders.to_sql("orders_raw", conn, if_exists="replace", index=False)
customers.to_sql("customers_raw", conn, if_exists="replace", index=False)
products.to_sql("products_raw", conn, if_exists="replace", index=False)

print("Datos cargados correctamente")

conn.close()