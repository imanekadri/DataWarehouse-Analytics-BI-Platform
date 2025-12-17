from datetime import datetime
from airflow import DAG
from airflow.operators.python import PythonOperator
import psycopg2

def connect_to_dw():
    """Connect to Data Warehouse (NOT Airflow metadata DB)"""
    return psycopg2.connect(
        host="postgres",           # Docker service name
        database="DataWarehouse",  # Your data warehouse database
        user="postgres",           # Your username
        password="root",           # Your password
        port="5432"                # PostgreSQL port
    )

def daily_etl_task():
    """Daily ETL task that updates the data warehouse"""
    print("Starting daily ETL...")
    
    conn = connect_to_dw()
    cursor = conn.cursor()
    
    try:
        # Simple example: Add a test record
        cursor.execute("""
            INSERT INTO dim_customer (customer_name, email, city, country)
            VALUES ('Airflow Test', 'airflow@test.com', 'Test City', 'Test Country')
        """)
        
        conn.commit()
        print("ETL task completed successfully")
        
    except Exception as e:
        conn.rollback()
        print(f"✗ Error: {e}")
        raise
    finally:
        cursor.close()
        conn.close()

# Create DAG
with DAG(
    'data_warehouse_daily',
    description='Daily ETL for Data Warehouse',
    schedule_interval='@daily',
    start_date=datetime(2024, 1, 1),
    catchup=False
) as dag:
    
    etl_task = PythonOperator(
        task_id='run_daily_etl',
        python_callable=daily_etl_task
    )