
📌 E-commerce Data Engineering Pipeline

This project is a complete end-to-end Data Engineering pipeline built using:

MongoDB (NoSQL source)

CSV files

Apache Airflow (Orchestration)

PySpark (Transformations)

PostgreSQL (Data Warehouse – Star Schema)

Docker + Ubuntu (Deployment)

Power BI (Visualization)
----------------------------------------
🚀 Pipeline Architecture
1. Extract (Task 1 – Airflow DAG)

Fetch orders, users, and products data from MongoDB.

Load additional data from CSV files.

Store everything as CSV files inside /data/raw/.

---------------------------------------------------------
2. Transform (Task 2 – PySpark)

Read raw files.

Apply:

Cleaning

Joins (Users × Orders × Products)

Explode operations

Aggregations

Prepare dataframes for Dimensions & Facts.

Store processed data inside /data/processed/.

----------------------------------------------------
3. Load (Task 3 – PostgreSQL)

Read processed files.

Load dimensions first (Users, Products…).

Retrieve surrogate keys.

Join with Fact tables.

Load final Fact tables into the Star Schema.
------------------------------------------------------------------
4. Visualization

Connect Power BI (Windows) to PostgreSQL in Docker.

Build interactive dashboard.

🐳 Dockerized Environment

The entire pipeline runs inside Docker containers:

Ubuntu

Airflow

PostgreSQL

Spark
-------------------------------------------------------
📊 Star Schema

Dimensions:

dim_users

dim_products

dim_date

dim_location

Facts:

fact_orders

Diagram included in diagram/pipeline_diagram


