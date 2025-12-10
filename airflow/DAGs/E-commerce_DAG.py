from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator
from airflow.operators.email import EmailOperator
from airflow.operators.empty import EmptyOperator
from datetime import datetime, timedelta 

import sys 
import os




def start_task():
    print("🚀 Pipeline Started...")


def end_task():
    print("🏁 Pipeline Finished Successfully!")


default_args = {
    "owner": "Ahmed_refat",
    "retries": 1,
    "retry_delay": timedelta(seconds=10)
}

with DAG(
    dag_id="Ecommerce_DAG",
    start_date=datetime(2025, 12, 2),
    schedule_interval="@daily",
    catchup=False
) as dag:

    #task 1
    start = PythonOperator(
        task_id="start_pipeline",
        python_callable=start_task
    )
    
    # task 2
    extract_data = BashOperator(
    task_id="extract_data",
    bash_command="python /opt/airflow/scripts/extract_eco.py"
    )

    # task 3 
    transform_data = BashOperator(
    task_id="transform_data",
    bash_command="python /opt/airflow/scripts/transform_eco.py"
    )

    # task 4
    load_data = BashOperator(
    task_id="load_data",
    bash_command="python /opt/airflow/scripts/load_eco.py"
    )

    # tsak 5 
    end = PythonOperator(
        task_id="end_pipeline",
        python_callable=end_task
    )

    start >> extract_data >>transform_data >> load_data >> end
