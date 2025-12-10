# E-commerce Data Pipeline

## 🚀 Overview
End-to-end data pipeline for e-commerce analytics built from scratch.

## 🏗 Architecture
![Architecture Diagram](docs/architecture.png)

## 🔧 Tech Stack
- **Data Processing:** Apache Spark (PySpark)
- **Orchestration:** Apache Airflow
- **Databases:** MongoDB, PostgreSQL
- **Infrastructure:** Docker, Ubuntu
- **Visualization:** Power BI, Excel

## 📊 Features
- Extracts data from MongoDB and CSV files
- Processes data using PySpark (explode arrays, joins)
- Loads into PostgreSQL data warehouse (star schema)
- Automated daily workflows with Airflow
- Interactive dashboards with Power BI

## 🚀 Quick Start
```bash
git clone https://github.com/yourusername/ecommerce-data-pipeline
cd ecommerce-data-pipeline
docker-compose up -d
