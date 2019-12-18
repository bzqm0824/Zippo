"""
 通过程序描述登录注册过程，将其各封装为一个函数

       def login(name,passwd):
           pass

       def register(name,passwd):
           pass
"""
"""
User --> user   id  name  passwd
db 数据库对象
cur 游标对象
"""


def register(name,passwd):
    # 判断名是否重复
    sql="select name from user where name='%s'"%name
    cur.execute(sql)
    result = cur.fetchone() # 查不到返回None
    if result:
        return False
    try:
        sql="insert into user (name,passwd) values (%s,%s);"
        cur.execute(sql,[name,passwd])
        db.commit()
        return True
    except:
        db.rollback()
        return False

def login(name,passwd):
    sql = "select name from user " \
          "where name=%s and passwd=%s;"
    cur.execute(sql,[name,passwd])
    result = cur.fetchone() # 如果查到说明用户存在
    if result:
        return True
    else:
        return False







