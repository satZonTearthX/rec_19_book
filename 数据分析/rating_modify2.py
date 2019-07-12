import requests
from bs4 import BeautifulSoup
from bs4 import element
import pymysql
# database config
DB_HOST = 'localhost'
DB_ID = 'root'
DB_PASSWORD = 'root'
DB_NAME = 'ls1'
TABLE_NAME = 'bx_book_ratings_copy1'
TABLE_NAME3= 'book_info'

DB_HOST = 'localhost'
DB_ID = 'root'
DB_PASSWORD = 'root'
DB_NAME2 = 'ls_final'
TABLE_NAME2 = 'pro_final'

result=[]

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






# settings = {
#     "ip":'127.0.0.1',   #ip
#     "port":27017,           #端口
#     "db_name" : "Recommendation",    #数据库名字
#     "set_name" : "books"   #集合名字
# }


class Mysql_service(object):
    db = pymysql.connect(host=DB_HOST, user=DB_ID, password=DB_PASSWORD, db=DB_NAME)
    cursor = db.cursor()
    lc=0
    def __init__(self):
        print("connection on")

    def all_books(self):  # self...
        """
            :param:
            :return:list of all books
            """
        cursor = self.db.cursor(cursor=pymysql.cursors.DictCursor)
        sql_all_books = '''select book_id from %s'''%(TABLE_NAME3)
        all_book_list=[]
        try:
            # print(id)

            cursor.execute(sql_all_books)
            data = cursor.fetchall()
            print(len(data))
            # print(data)
            # print(data[0])
            for i in range(len(data)):
                # print(data[i])
                all_book_list.append(data[i]['book_id'])

            # book_new_id = data["bookid"]
            # print(book_new_id)




        except Exception as e:
            self.db.rollback()
            print(e)

        return all_book_list

    def delete_result(self,id):  # self...
        """
            :param:id:num of index to deal with
            :return:
            """
        cursor = self.db.cursor(cursor=pymysql.cursors.DictCursor)
        clear_all_books = '''delete from %s where bookid=%d'''%(TABLE_NAME,result[id])
        try:
            # print(id)

            cursor.execute(clear_all_books)
            # print(result[id])
            print(cursor.rowcount)
            # print(data[0])
            self.db.commit()
            # book_new_id = data["bookid"]
            # print(book_new_id)




        except Exception as e:
            self.db.rollback()
            print(e)


class Mysql_service2(object):
    db = pymysql.connect(host=DB_HOST, user=DB_ID, password=DB_PASSWORD, db=DB_NAME2)
    cursor = db.cursor()
    def __init__(self):
        print("connection on")

    def my_all_books(self):  # self...
        """
            :param:
            :return:list of all books
            """
        cursor = self.db.cursor(cursor=pymysql.cursors.DictCursor)
        sql_all_books = '''select id from %s'''%(TABLE_NAME2)
        my_all_book_list=[]
        try:
            # print(id)

            cursor.execute(sql_all_books)
            data = cursor.fetchall()
            print(len(data))
            # print(data)
            print(data[0])
            for i in range(len(data)):
                # print(data[i])
                my_all_book_list.append(data[i]['id'])

            # book_new_id = data["bookid"]
            # print(book_new_id)




        except Exception as e:
            self.db.rollback()
            print(e)

        return my_all_book_list


if __name__ == '__main__':
    myss=Mysql_service()
    myss2=Mysql_service2()


    book_list=myss.all_books()
    # print(len(book_list))

    my_book_list=myss2.my_all_books()
    # print(len(my_book_list))

    result = list(set(book_list) - set(my_book_list))
    # print(len(result))

    result=sorted(result,reverse=True)
    # print(result)
    # print(result[246])
    for i in range(46513,len(result)):
        print('id=',i)
        myss.delete_result(i)
    # for i in range(46,634):
    #     no_tem,ch_tem=myss.categorize(i)
    #     ch_tuple.append(ch_tem)
    #     no_tuple.append(no_tem)
    #
    #
    #
    # for i in range(1,65342):
    #     myss2.get_cat_ch(i)
    #
