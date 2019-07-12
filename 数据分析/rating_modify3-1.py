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
TABLE_NAME3= 'bx_book_ratings_copy3'

DB_HOST = 'localhost'
DB_ID = 'root'
DB_PASSWORD = 'root'
DB_NAME2 = 'ls_final'
TABLE_NAME2 = 'pro_final'

result=[]








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
        cursor = self.db.cursor(cursor=pymysql.cursors.DictCursor)
        sql_count = '''select count(*) from %s''' % (TABLE_NAME)
        try:
            # print(id)

            cursor.execute(sql_count)
            data = cursor.fetchone()
            print(data)
            self.lc=data["count(*)"]

            # book_new_id = data["bookid"]
            # print(book_new_id)
            print("connection on")



        except Exception as e:
            self.db.rollback()
            print(e)


    # def all_books(self):  # self...
    #     """
    #         :param:
    #         :return:list of all books
    #         """
    #     cursor = self.db.cursor(cursor=pymysql.cursors.DictCursor)
    #     sql_all_books = '''select book_id from %s'''%(TABLE_NAME3)
    #     all_book_list=[]
    #     try:
    #         # print(id)
    #
    #         cursor.execute(sql_all_books)
    #         data = cursor.fetchall()
    #         print(len(data))
    #         # print(data)
    #         # print(data[0])
    #         for i in range(len(data)):
    #             # print(data[i])
    #             all_book_list.append(data[i]['book_id'])
    #
    #         # book_new_id = data["bookid"]
    #         # print(book_new_id)



        #
        # except Exception as e:
        #     self.db.rollback()
        #     print(e)
        #
        # return all_book_list

    def delete_result(self):  # self...
        """
            :param:id:num of index to deal with
            :return:
        """

        cursor = self.db.cursor(cursor=pymysql.cursors.DictCursor)
        sql = '''select * from %s limit 5;''' % (TABLE_NAME)
        try:
            cursor.execute(sql)
            data = cursor.fetchmany(5)
            book_id_list=[]
            user_id_list=[]
            score_list=[]
            judge=0
            length=0
            for j in range(5):
                book_id = data[j]["bookid"]
                # print(book_id)
                if book_id in result:
                    book_id_list.append(data[j]['bookid'])
                    user_id_list.append(data[j]['userid'])
                    score_list.append(data[j]["score"])
                    length=length+1
                    judge=1



            if judge==1:
                insert_right_books='''insert into bx_book_ratings_copy3 values (%d,%d,%d); '''
                val=[]
                for j in range(length):
                    val_tem=[user_id_list[j],book_id_list[j],score_list[j]]
                    val_j=tuple(val_tem)
                    print(val_j)
                    # insert_right_books = insert_right_books+ '''insert into %s values (%d,%d,%d); ''' % (TABLE_NAME3,user_id_list[j],book_id_list[j],score_list[j])
                    val.append(val_j)

                val_final=tuple(val)
                print(val_final)
                # print(insert_right_books)
                try:
                    # print(id)
                    cursor.executemany(insert_right_books, val_final)
                    # cursor.execute(insert_right_books)
                    # print(result[id])
                    # print(cursor.rowcount)
                    # print(data[0])
                    self.db.commit()
                    # book_new_id = data["bookid"]
                    # print(book_new_id)




                except Exception as e:
                    self.db.rollback()
                    print(e)

            sql_delete = '''delete  from %s limit 5;''' % (TABLE_NAME)
            try:
                # cursor.execute(sql_delete)
                self.db.commit()



            except Exception as e:
                self.db.rollback()
                print(e)


        except Exception as e:
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
    last_count=myss.lc
    print(last_count)
    myss2=Mysql_service2()


    # book_list=myss.all_books()
    # print(len(book_list))

    my_book_list=myss2.my_all_books()
    result=my_book_list
    # print(len(my_book_list))

    # print(result)
    # print(result[246])

    #__________________________________

    # for i in range(300,len(result)):
    #     print('id=',i)
    #     myss.delete_result(i)
    # for i in range(46,634):
    #     no_tem,ch_tem=myss.categorize(i)
    #     ch_tuple.append(ch_tem)
    #     no_tuple.append(no_tem)
    #
    #
    #
    i=0
    while i <= 15:
        print('id=',i)
        myss.delete_result()
        i=i+5
    #
