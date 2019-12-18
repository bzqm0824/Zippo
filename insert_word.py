import pymysql
import re

# 连接数据库
db = pymysql.connect(host='localhost',
                     port=3306,
                     user='root',
                     password='123456',
                     database='dict',
                     charset='utf8')

# 生产游标对象 （操作数据库执行sql语句获取结果的对象）
cur = db.cursor()

# 插入单词
f = open('dict.txt')
args_list = []
for line in f:
    # 获取单词和解释
    result = re.findall(r"(\S+)\s+(.*)",line)
    args_list.extend(result) # 合并为一个列表
f.close()

sql="insert into words (word,mean) values (%s,%s);"
try:
    cur.executemany(sql,args_list)
    db.commit()
except:
    db.rollback()


# 关闭游标和数据库
cur.close()
db.close()


