from pymongo import MongoClient

client = MongoClient('mongodb://mongodb:27017/')
db = client.mydatabase

sample_data = [
    {"name": "Alice", "age": 30, "department": "Engineering", "salary": 90000, "hire_date": "2020-01-15"},
    {"name": "Bob", "age": 25, "department": "Marketing", "salary": 70000, "hire_date": "2019-03-10"},
    {"name": "Charlie", "age": 35, "department": "Sales", "salary": 80000, "hire_date": "2018-07-22"},
    {"name": "David", "age": 40, "department": "HR", "salary": 75000, "hire_date": "2017-05-30"},
    {"name": "Eva", "age": 28, "department": "Engineering", "salary": 95000, "hire_date": "2021-11-01"},
    {"name": "Frank", "age": 32, "department": "Marketing", "salary": 72000, "hire_date": "2020-09-12"},
    {"name": "Grace", "age": 26, "department": "Sales", "salary": 68000, "hire_date": "2022-04-18"},
    {"name": "Hank", "age": 37, "department": "HR", "salary": 77000, "hire_date": "2016-03-05"},
    {"name": "Ivy", "age": 29, "department": "Engineering", "salary": 91000, "hire_date": "2020-08-24"},
    {"name": "Jack", "age": 34, "department": "Marketing", "salary": 74000, "hire_date": "2019-12-13"},
    {"name": "Karen", "age": 31, "department": "Sales", "salary": 81000, "hire_date": "2018-06-27"},
    {"name": "Leo", "age": 38, "department": "HR", "salary": 76000, "hire_date": "2017-08-14"},
    {"name": "Mona", "age": 27, "department": "Engineering", "salary": 93000, "hire_date": "2021-05-09"},
    {"name": "Nina", "age": 33, "department": "Marketing", "salary": 71000, "hire_date": "2020-01-29"},
    {"name": "Oscar", "age": 24, "department": "Sales", "salary": 69000, "hire_date": "2022-09-03"},
    {"name": "Paul", "age": 36, "department": "HR", "salary": 78000, "hire_date": "2015-11-22"},
    {"name": "Quinn", "age": 28, "department": "Engineering", "salary": 92000, "hire_date": "2020-07-11"},
    {"name": "Rita", "age": 35, "department": "Marketing", "salary": 75000, "hire_date": "2019-04-30"},
    {"name": "Sam", "age": 39, "department": "Sales", "salary": 82000, "hire_date": "2018-10-17"},
    {"name": "Tina", "age": 30, "department": "HR", "salary": 77000, "hire_date": "2017-01-06"},
    {"name": "Uma", "age": 29, "department": "Engineering", "salary": 94000, "hire_date": "2021-03-21"},
    {"name": "Vince", "age": 32, "department": "Marketing", "salary": 73000, "hire_date": "2020-06-18"},
    {"name": "Wendy", "age": 26, "department": "Sales", "salary": 70000, "hire_date": "2022-02-14"},
    {"name": "Xander", "age": 41, "department": "HR", "salary": 76000, "hire_date": "2016-09-01"},
    {"name": "Yara", "age": 30, "department": "Engineering", "salary": 92000, "hire_date": "2020-05-27"},
    {"name": "Zane", "age": 34, "department": "Marketing", "salary": 74000, "hire_date": "2019-08-09"},
    {"name": "Aaron", "age": 25, "department": "Sales", "salary": 68000, "hire_date": "2022-06-23"},
    {"name": "Bella", "age": 38, "department": "HR", "salary": 79000, "hire_date": "2015-12-05"},
    {"name": "Cathy", "age": 27, "department": "Engineering", "salary": 91000, "hire_date": "2021-08-30"},
    {"name": "Derek", "age": 36, "department": "Marketing", "salary": 72000, "hire_date": "2018-11-10"},
    {"name": "Elena", "age": 31, "department": "Sales", "salary": 71000, "hire_date": "2021-01-16"},
    {"name": "Fred", "age": 39, "department": "HR", "salary": 78000, "hire_date": "2016-07-21"},
    {"name": "Gina", "age": 28, "department": "Engineering", "salary": 93000, "hire_date": "2020-10-14"},
    {"name": "Holly", "age": 32, "department": "Marketing", "salary": 75000, "hire_date": "2019-05-03"},
    {"name": "Ian", "age": 26, "department": "Sales", "salary": 69000, "hire_date": "2022-11-11"},
    {"name": "Jill", "age": 40, "department": "HR", "salary": 77000, "hire_date": "2017-03-19"},
    {"name": "Karl", "age": 29, "department": "Engineering", "salary": 95000, "hire_date": "2021-07-25"},
    {"name": "Lara", "age": 35, "department": "Marketing", "salary": 73000, "hire_date": "2020-12-08"},
    {"name": "Mike", "age": 24, "department": "Sales", "salary": 68000, "hire_date": "2022-05-29"}
]

db.mycollection.insert_many(sample_data)
print("Data inserted successfully")
