import requests
from bs4 import BeautifulSoup
from bs4 import element
import pymysql
# database config
DB_HOST = 'localhost'
DB_ID = 'root'
DB_PASSWORD = 'root'
DB_NAME = 'ls'
TABLE_NAME = 'product_category'

DB_HOST = 'localhost'
DB_ID = 'root'
DB_PASSWORD = 'root'
DB_NAME = 'ls'
TABLE_NAME2 = 'product_copy4'

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

    def categorize(self,id):
        """
             :param: id /
             :return: ch_tuple ,id_tuple
        """
        cursor = self.db.cursor(cursor=pymysql.cursors.DictCursor)
        first_ch = ''
        second_ch = ''
        first_no = 0
        second_no = 0

        sql1='''select * from %s where id= %d''' % (TABLE_NAME,id)
        try:
            # 执行sql语句
            cursor.execute(sql1)
            data = cursor.fetchone()
            first_no = data["parentId"]
            second_no = data["id"]
            second_ch = data["name"]

            sql2='''select * from %s where id= %d''' % (TABLE_NAME,first_no)
            try:
                # 执行sql语句
                cursor.execute(sql2)
                data = cursor.fetchone()
                first_ch = data["name"]

                # 提交到数据库执行

            except:
                # 如果发生错误则回滚
                self.db.rollback()
            # 关闭数据库连接
            # cursor.rowcount
            # 提交到数据库执行

        except:
            # 如果发生错误则回滚
            self.db.rollback()

        return (first_no,second_no),(first_ch,second_ch)

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
        sql = '''select * from %s where id=%d;''' %(TABLE_NAME2,id)
        try:
            print(id)
            cursor.execute(sql)
            data = cursor.fetchone()
            sstr = data["productCategory"]
            first_c_tem= sstr.split(',',1)[0]
            second_c_tem = sstr.split(',', 1)[1]
            ll=[]
            ll.append(first_c_tem)
            ll.append(second_c_tem)
            index=ch_tuple.index(tuple(ll))
            a_no=no_tuple[index][0]
            b_no=no_tuple[index][1]
            final_tags=str(a_no)+','+str(b_no)

            print(b_no,' ',final_tags)


            sql2 = '''update %s set productCategoryId=%d ,tags="%s" where id= %d''' % (TABLE_NAME2,b_no,final_tags,id)

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
        return self.lc

    def information(self, productId, type, content, createTime):  # self...
        sql = '''insert into %s (id,productId, `type`, content, createTime)\
               values(%d,%d,%d,"%s",str_to_date(\'%s\','%%Y/%%m/%%d %%H:%%i:%%s')) ''' % (TABLE_NAME2,self.lc+1,productId,type, content, createTime)
        try:
            self.cursor.execute(sql)
            # 提交到数据库执行
            self.db.commit()
            self.lc=self.lc+1
            print(sql)
            print('insert COMMENT successful')
        except Exception as e:
            # 如果发生错误则回滚
            print(e)
            self.db.rollback()
        return self.lc

if __name__ == '__main__':
    myss=Mysql_service()
    myss2=Mysql_service2()
    cat_sum=0
    cat2_sum=0



    for i in range(46,634):
        no_tem,ch_tem=myss.categorize(i)
        ch_tuple.append(ch_tem)
        no_tuple.append(no_tem)



    for i in range(11278,42351):
        myss2.get_cat_ch(i)

