
import pandas as pd
from pyspark.sql   import SparkSession
from pyspark.sql.functions import col, explode
from pyspark.sql.types import StructType, StructField, ArrayType, IntegerType, DoubleType



# create  sparksession 

spark = (
    SparkSession.builder
    .appName("firt_DAG")
    .config("spark.jars", "/opt/airflow/data/postgresql-42.2.5.jar")
    .getOrCreate()
)



# تحديد شكل الاسكيما ل ملف الجيسون 
orders_schema = StructType([
    StructField("order_id", IntegerType(), True),
    StructField("user_id", IntegerType(), True),
    StructField("products", ArrayType(StructType([
        StructField("product_id", IntegerType(), True),
        StructField("quantity", IntegerType(), True)
    ])), True),
    StructField("total", DoubleType(), True)
])
# read files and convert every file to dataframe in pyspark

df_users_csv = spark.read.csv("/opt/airflow/data/users_sql.csv", header=True, inferSchema=True)
df_products_csv = spark.read.csv("/opt/airflow/data/products_sql.csv", header=True, inferSchema=True)
df_orders_csv = spark.read.csv("/opt/airflow/data/orders_sql.csv", header=True, inferSchema=True)
df_reviews_csv = spark.read.csv("/opt/airflow/data/reviews_sql.csv", header=True, inferSchema=True)

df_orders_mongo = spark.read.schema(orders_schema).option("multiline", True)\
    .json("/opt/airflow/data/mongo_orders.json")

df_products_mongo= spark.read.csv("/opt/airflow/data/mongo_products.csv", header=True, inferSchema=True)
df_users_mongo= spark.read.csv("/opt/airflow/data/mongo_users.csv", header=True, inferSchema=True)


# عمليه دمج الداتا فريمز المتشابها في داتا فريم واحده عن طريق حذف المكرر وعمل جوين عليهم 
csv_df_clean = df_users_csv.drop("name", "email")

dim_users = df_users_mongo.join(
    csv_df_clean,
    on="user_id",
    how="left"
)

# دمج جداول المنتجات 
# لما جيت اجرب لقيت الاتنين نفس الحاجه ف هنشتغل علي الجدول الي جي من مونجو دي بي وخلاص 
dim_products= df_products_mongo


# دمج جدولين ال orders 
# بس هيظهر قدمنا مشكله ان الجدول الي جي من المونجو فيه مشكله 
# وتحديدا ان في عمود اسمه برودكت جواه list 


#------------------------------------------------------------------
#create explode to the column of product in df_orders == mongodb

df_explode= (df_orders_mongo.withColumn("product",explode("products")))

fact_orders=(
  df_explode
  .withColumn("product_id",col("product")["product_id"])
  .withColumn("quantity",col("product")["quantity"])
  .drop("product", "products")

)

fact_orders.show(5)

# create fact_dim
fact_reviews=df_reviews_csv 

#  data warehouse  هنحول بقا الداتا فريمز الجهازه لرفع في ال 


fact_orders.write.mode("overwrite").csv("/opt/airflow/data/fact_orders", header=True)
fact_reviews.write.mode("overwrite").csv("/opt/airflow/data/fact_reviews", header=True)
dim_products.write.mode("overwrite").csv("/opt/airflow/data/dim_products", header=True)
dim_users.write.mode("overwrite").csv("/opt/airflow/data/dim_users", header=True)






