import requests
from bs4 import BeautifulSoup
from bs4 import element
import pymysql
# database config
DB_HOST = 'localhost'
DB_ID = 'root'
DB_PASSWORD = 'root'
DB_NAME = 'ls_final'
TABLE_NAME = 'pro_rating_desc'

DB_HOST = 'localhost'
DB_ID = 'root'
DB_PASSWORD = 'root'
DB_NAME = 'ls_final'
TABLE_NAME2 = 'pro_final'

ch_tuple=[]
no_tuple=[]
# product
# ISBN  PK
# bookname
# large_cat
# small_cat
# brief_intro
# author
# publisher
# pub_time
# scale
# page_no
# rating
# sales_price
# ori_price
# img_src
# comments list
# detailed_intro
# barcode
# createTime

# comments
# commentsID PK
# ISBN
# autherID
# createTime

#id
#parentId
#name
#tags
#remarks

class Mysql_service(object):
    db = pymysql.connect(host=DB_HOST, user=DB_ID, password=DB_PASSWORD, db=DB_NAME)
    cursor = db.cursor()
    def __init__(self):
        print("connection on")



# settings = {
#     "ip":'127.0.0.1',   #ip
#     "port":27017,           #端口
#     "db_name" : "Recommendation",    #数据库名字
#     "set_name" : "books"   #集合名字
# }


class Mysql_service2(object):
    db = pymysql.connect(host=DB_HOST, user=DB_ID, password=DB_PASSWORD, db=DB_NAME)
    cursor = db.cursor()
    lc=0
    def __init__(self):
        print("connection on")

    def get_cat_ch(self, id):  # self...
        cursor = self.db.cursor(cursor=pymysql.cursors.DictCursor)
        sql = '''select * from %s limit %d,1;''' %(TABLE_NAME,id-1)
        try:
            print(id)
            cursor.execute(sql)
            data = cursor.fetchone()
            book_new_id = data["bookid"]
            print(book_new_id)


            sql2 = '''update %s set id=%d where id_tem= %d''' % (TABLE_NAME2,book_new_id,id)

            try:
                # 执行sql语句
                cursor.execute(sql2)
                # 提交到数据库执行
                self.db.commit()
            except:
                # 如果发生错误则回滚
                print("insert failed")
                self.db.rollback()
            # 关闭数据库连接
            # cursor.rowcount
            # 提交到数据库执行

        except Exception as e:
            print(e)

    # def information(self, productId, type, content, createTime):  # self...
    #     sql = '''insert into %s (id,productId, `type`, content, createTime)\
    #            values(%d,%d,%d,"%s",str_to_date(\'%s\','%%Y/%%m/%%d %%H:%%i:%%s')) ''' % (TABLE_NAME2,self.lc+1,productId,type, content, createTime)
    #     try:
    #         self.cursor.execute(sql)
    #         # 提交到数据库执行
    #         self.db.commit()
    #         self.lc=self.lc+1
    #         print(sql)
    #         print('insert COMMENT successful')
    #     except Exception as e:
    #         # 如果发生错误则回滚
    #         print(e)
    #         self.db.rollback()
    #     return self.lc

if __name__ == '__main__':
    myss=Mysql_service()
    myss2=Mysql_service2()
    cat_sum=0
    cat2_sum=0



    # for i in range(46,634):
    #     no_tem,ch_tem=myss.categorize(i)
    #     ch_tuple.append(ch_tem)
    #     no_tuple.append(no_tem)



    for i in range(1,65342):
        myss2.get_cat_ch(i)

