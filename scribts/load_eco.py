import pyspark 
from pyspark.sql import SparkSession 

spark= (SparkSession.builder
        .appName("firs_load")
        .config("spark.jars", "/opt/airflow/data/postgresql-42.2.5.jar")
        .getOrCreate()        

   )

fact_orders=spark.read.csv("/opt/airflow/data/fact_orders",header=True,inferSchema=True)
fact_reviews=spark.read.csv("/opt/airflow/data/fact_reviews",header=True,inferSchema=True)
dim_users=spark.read.csv("/opt/airflow/data/dim_users",header=True,inferSchema=True)
dim_products=spark.read.csv("/opt/airflow/data/dim_products",header=True,inferSchema=True)

dim_products.show(10)
# connect with postgres and add df_users_clean to dim_usres 
dim_users.write.jdbc(
    url="jdbc:postgresql://postgres:5432/ecommerce_dw",
    table="dim_users",
    mode="append",
    properties={
        "user": "admin",
        "password": "admin",
        "driver": "org.postgresql.Driver"
    }
)

# connect with postgres and add df_products to dim_products 

dim_products.write.jdbc(
   url="jdbc:postgresql://postgres:5432/ecommerce_dw",
    table="dim_products",
    mode="append",
    properties={
        "user": "admin",
        "password": "admin",
        "driver": "org.postgresql.Driver"
    }    
)


#-------------------------------------------------------------------------------
dim_users_db = spark.read.jdbc(
    url="jdbc:postgresql://postgres:5432/ecommerce_dw",
    table="dim_users",
    properties={
        "user": "admin",
        "password": "admin",
        "driver": "org.postgresql.Driver"
    }
)

dim_products_db = spark.read.jdbc(
    url="jdbc:postgresql://postgres:5432/ecommerce_dw",
    table="dim_products",
    properties={
        "user": "admin",
        "password": "admin",
        "driver": "org.postgresql.Driver"
    }
)


# هنعمل جوين بقا لل الفاكت اوردر  مع الدايمنشنز التانيه 
fact_order_db = fact_orders.join(
    dim_users_db.select("user_id", "user_key"),
    on="user_id",
    how="left"
).join(
    dim_products_db.select("product_id","product_key"),
    on="product_id",
    how="left"    
)

# هنختار الاعمده الي تتناسب اكتر مع الجدول الي صممناه في الداتا وير هاوس 
fact_order_final = fact_order_db.select(
    "user_key",
    "product_key",
    "order_id",
    "quantity",
    "total",
)


# connect with postgres and fact_order 

fact_order_final.write.jdbc(
    url="jdbc:postgresql://postgres:5432/ecommerce_dw",
    table="fact_orders",
    mode="append",
    properties={
        "user": "admin",
        "password": "admin",
        "driver": "org.postgresql.Driver"
    }
)

#-----------------------------------------------------------------------

#هنعمل جوين بقا لل الفاكت رفيو  مع الدايمنشنز التانيه 
fact_reviews_db =fact_reviews.join(
    dim_users_db.select("user_id", "user_key"),
    on="user_id",
    how="left"
).join(
    dim_products_db.select("product_id","product_key"),
    on="product_id",
    how="left"    
)

# هنختار الاعمده الي تتناسب اكتر مع الجدول الي صممناه في الداتا وير هاوس 
fact_review_final = fact_reviews_db.select(
    "user_key",
    "product_key",
    "review_id",
    "rating",
    "comment",
)


# connect with postgres and fact_order 

fact_review_final.write.jdbc(
    url="jdbc:postgresql://postgres:5432/ecommerce_dw",
    table="fact_reviews",
    mode="append",
    properties={
        "user": "admin",
        "password": "admin",
        "driver": "org.postgresql.Driver"
    }
)






print("the etl is finish congratulations ")