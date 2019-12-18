--  表复制
create  table hobby select s.name,s.age,i.hobby from cls as s,interest as i where s.name=i.name;

-- 不是sql语句，在命令行执行
导出
mysqldump -u root -p stu > stu.sql

导入
mysql -u root -p student < stu.sql

-- 用户管理
delete from mysql.user where user='zs';