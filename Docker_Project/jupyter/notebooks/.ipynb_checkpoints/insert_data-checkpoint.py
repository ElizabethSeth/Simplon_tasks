from pymongo import MongoClient

client = MongoClient('mongodb://mongodb:27017/')
db = client.mydatabase

sample_data = [
    {"name": "Alice", "age": 30},
    {"name": "Bob", "age": 25},
    {"name": "Charlie", "age": 35}
]

db.mycollection.insert_many(sample_data)
print("Data inserted successfully")
