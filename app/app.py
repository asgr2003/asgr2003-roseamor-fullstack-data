from flask import Flask, render_template, request
import sqlite3

app = Flask(__name__)

DATABASE = "../database/roseamor.db"

@app.route("/", methods=["GET", "POST"])
def index():

    if request.method == "POST":

        order_id = request.form["order_id"]
        customer_id = request.form["customer_id"]
        sku = request.form["sku"]
        quantity = request.form["quantity"]
        unit_price = request.form["unit_price"]
        order_date = request.form["order_date"]
        channel = request.form["channel"]

        conn = sqlite3.connect(DATABASE)
        cursor = conn.cursor()

        cursor.execute("""
        INSERT INTO fact_orders
        (order_id, customer_id, sku, quantity, unit_price, order_date, channel)
        VALUES (?, ?, ?, ?, ?, ?, ?)
        """, (order_id, customer_id, sku, quantity, unit_price, order_date, channel))

        conn.commit()
        conn.close()

    return render_template("index.html")

if __name__ == "__main__":
    app.run(debug=True)