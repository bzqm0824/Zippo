"""
mysql.py
pymysql 数据库读操作
"""
import pymysql

# 连接数据库
db = pymysql.connect(host='localhost',
                     port=3306,
                     user='root',
                     password='123456',
                     database='stu',
                     charset='utf8')

# 生产游标对象 （操作数据库执行sql语句获取结果的对象）
cur = db.cursor()

# 利用游标对象执行读操作 select语句
# 读操作 --》 fetch
name = input("Name:")

# 组合sql语句
# sql="select name,hobby from interest where name='%s';"%name
# print(sql)
# cur.execute(sql)

# 通过execute第二个参数为sql语句传递参量
sql="select name,age from cls where age>%s or sex=%s;"
cur.execute(sql,[17,'m'])


# 遍历游标对象获取查询记录
# for i in cur:
#     print(i)

# 获取一个查询结果
# print(cur.fetchone())

# 获取多个查询结果
# print(cur.fetchmany(2))

# 获取所有查询结果
print(cur.fetchall())

# 关闭游标和数据库
cur.close()
db.close()
