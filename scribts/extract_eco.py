import pandas as pd
import pymongo
import os
from pyspark.sql.functions import col, explode
import json

    
# Extract from MongoDB
client = pymongo.MongoClient("mongodb://mongodb:27017/")
db = client["my_database"]
mongodb_users = pd.DataFrame(list(db["users"].find())).drop(columns=["_id"])
mongodb_products = pd.DataFrame(list(db["products"].find())).drop(columns=["_id"])

# convert data frames to csv file in the path /obt/airflow/data
BASE_PATH = "/opt/airflow/data"
users_path = os.path.join(BASE_PATH, "mongo_users.csv")
products_path = os.path.join(BASE_PATH, "mongo_products.csv")



mongodb_users.to_csv(users_path, index=False)
mongodb_products.to_csv(products_path, index=False)


# Path to save the JSON
orders_path = os.path.join(BASE_PATH, "mongo_orders.json")

# Query MongoDB, exclude _id
orders_cursor = db["orders"].find({}, {"_id": 0})

# Convert cursor to list of dicts
orders_list = list(orders_cursor)

# Save directly to JSON
with open(orders_path, "w") as f:
    json.dump(orders_list, f, indent=4)