# 🛒 E-commerce Data Engineering Pipeline

A production-style end-to-end Data Engineering pipeline designed to ingest, process, and analyze e-commerce data from multiple sources, enabling scalable analytics and business insights.

---

##  Project Overview

This project builds a complete data platform that integrates **NoSQL data (MongoDB)** with **structured CSV datasets** to generate a fully modeled analytical layer.

The pipeline seamlessly handles data ingestion from multiple sources, performs distributed data processing using PySpark, and structures the data into a Star Schema for analytical querying. It is fully orchestrated using Apache Airflow to ensure reliable workflow automation, while Power BI is used to deliver interactive dashboards and business insights.

---

## 🏗️ Architecture

![Architecture](https://github.com/AhmedRefat1412/ecommerce-data-pipeline/blob/main/docs/E-commerce%20Data%20piplines.drawio.png)

---

## 📊 Dashboard

![Dashboard](https://github.com/AhmedRefat1412/ecommerce-data-pipeline/blob/main/docs/Sales%20Dashboard.png)

Interactive dashboard built using:

- Power BI → Business insights & reporting  

---

##  Data Lake Design (Local Storage)

The pipeline follows a layered data architecture:

- **Raw Layer (/data/raw/)**  
  Stores ingested data from MongoDB & CSV in original format  

- **Processed Layer (/data/processed/)**  
  Cleaned, transformed, and enriched data using PySpark  

---

##  Data Pipeline

- Orchestrated using Apache Airflow  
- Data ingestion from MongoDB & CSV  
- Stored as raw files  
- Processing using PySpark  
- Transformation into Fact & Dimension tables  

---

##  Data Warehouse Design (Star Schema)

![Star Schema](https://github.com/AhmedRefat1412/ecommerce-data-pipeline/blob/main/docs/Data%20Warehouse%20Schema.png)

Designed a **Star Schema** for analytical querying:

### Dimensions:
- dim_users  
- dim_products  
- dim_date  
- dim_location  

### Facts:
- fact_orders  

This design enables:
- Fast analytical queries  
- Simplified BI reporting  
- Scalable data modeling  

---

##  Deployment (Dockerized Environment)

The entire pipeline runs inside containerized services:

- Ubuntu  
- Apache Airflow  
- Apache Spark  
- PostgreSQL  

Ensuring:
- Reproducibility  
- Easy deployment  
- Environment consistency  

---

##  Data Scale

- Handles large-scale datasets (designed for scalability)  
- Optimized transformations using PySpark  

---

## 🛠️ Tech Stack

- MongoDB (Data Source)  
- CSV Files  
- Apache Airflow  
- Apache Spark (PySpark)  
- PostgreSQL  
- Docker  
- Ubuntu  
- Power BI  

---
## 🤝 Feedback

I would really appreciate your feedback and suggestions to improve this project.
