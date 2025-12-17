from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
import psycopg2

def etl_customers():
    conn = psycopg2.connect(host="postgres", database="DataWarehouse", user="postgres", password="root")
    cursor = conn.cursor()
    cursor.execute("INSERT INTO dim_customer (customer_name, email, city, country) VALUES ('ETL Customer', 'etl@test.com', 'City', 'Country')")
    conn.commit()
    cursor.close()
    conn.close()

def etl_products():
    conn = psycopg2.connect(host="postgres", database="DataWarehouse", user="postgres", password="root")
    cursor = conn.cursor()
    cursor.execute("INSERT INTO dim_product (product_name, category, price, supplier) VALUES ('ETL Product', 'Category', 100, 'Supplier')")
    conn.commit()
    cursor.close()
    conn.close()

def etl_sales():
    conn = psycopg2.connect(host="postgres", database="DataWarehouse", user="postgres", password="root")
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO sales_fact (customer_id, product_id, time_id, amount, quantity, discount)
        VALUES (1, 1, 1, 100, 2, 5)
    """)
    conn.commit()
    cursor.close()
    conn.close()

with DAG(
    'data_warehouse_full_etl',
    description='Full ETL for Data Warehouse',
    schedule_interval='@daily',
    start_date=datetime(2024, 1, 1),
    catchup=False
) as dag:

    task_customers = PythonOperator(task_id='etl_customers', python_callable=etl_customers)
    task_products = PythonOperator(task_id='etl_products', python_callable=etl_products)
    task_sales = PythonOperator(task_id='etl_sales', python_callable=etl_sales)

    # ترتيب تنفيذ المهام
    task_customers >> task_products >> task_sales
