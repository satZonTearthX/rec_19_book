import pymysql
# database config
DB_HOST = 'localhost'
DB_ID = 'root'
DB_PASSWORD = 'root'
DB_NAME = 'ls1'
# TABLE_NAME = 'bx_book_ratings_copy1'
TABLE_NAME3= 'bx_book_ratings_copy3'

DB_HOST = 'localhost'
DB_ID = 'root'
DB_PASSWORD = 'root'
DB_NAME2 = 'ls_final'
TABLE_NAME2 = 'top_1'

sum={}
number={}
result={}



class Mysql_service(object):
    db = pymysql.connect(host=DB_HOST, user=DB_ID, password=DB_PASSWORD, db=DB_NAME)
    cursor = db.cursor()
    lc=0
    def __init__(self):
        # cursor = self.db.cursor(cursor=pymysql.cursors.DictCursor)
        # sql_count = '''select count(*) from %s''' % (TABLE_NAME3)
        # try:
        #     # print(id)
        #
        #     cursor.execute(sql_count)
        #     data = cursor.fetchone()
        #     print(data)
        #     self.lc=data["count(*)"]
        #
        #     # book_new_id = data["bookid"]
        #     # print(book_new_id)
            print("connection on")



        # except Exception as e:
        #     self.db.rollback()
        #     print(e)







    def count(self,id):  # self...
        """
            :param:id:num of index to deal with
            :return:
        """

        cursor = self.db.cursor(cursor=pymysql.cursors.DictCursor)
        sql = '''select * from %s limit %d,1;''' % (TABLE_NAME3,id)
        try:
            cursor.execute(sql)
            data = cursor.fetchone()
            book_id = data["bookid"]
            score= data["score"]
            if sum.get(book_id,-1)==-1:
                sum[book_id]=score
                number[book_id]=1
            else:
                sum[book_id]=sum[book_id]+score
                number[book_id]=number[book_id]+1
            # print(book_id)
            # if book_id in result:
            #     insert_right_books = '''insert into %s values (%d,%d,%d) ''' % (TABLE_NAME3,data["userid"],book_id,data["score"])
            #     try:
            #         # print(id)
            #
            #         cursor.execute(insert_right_books)
            #         # print(result[id])
            #         # print(cursor.rowcount)
            #         # print(data[0])
            #         self.db.commit()
            #         # book_new_id = data["bookid"]
            #         # print(book_new_id)
            #
            #
            #
            #
            #     except Exception as e:
            #         self.db.rollback()
            #         print(e)

            # sql_delete = '''delete  from %s limit 1;''' % (TABLE_NAME)
            # try:
            #     cursor.execute(sql_delete)
            #     self.db.commit()
            #
            #
            #
            # except Exception as e:
            #     self.db.rollback()
            #     print(e)


        except Exception as e:
            print(e)


    def top_insert(self,bookid,score):
        sql_insert = '''insert into %s (bookid,score)\
                       values(%d,%f) ''' % (TABLE_NAME2, bookid,score)
        try:
            self.cursor.execute(sql_insert)
            # 提交到数据库执行
            self.db.commit()
            print('insert rating successful')
        except Exception as e:
            # 如果发生错误则回滚
            print(e)
            self.db.rollback()
        return self.lc







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
    # last_count=myss.lc
    # print(last_count)
    # myss2=Mysql_service2()


    # book_list=myss.all_books()
    # print(len(book_list))

    # my_book_list=myss2.my_all_books()
    # result=my_book_list
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
    for i in range(119101):
        # print(i)
        if i%1000==0:
            print('id=',i)
        myss.count(i)


    print(sum)
    print(number)
    for key in number:
        if number[key]>5:
            result[key]=sum[key]/number[key]
    print(result)

    for key in result:
        myss.top_insert(key,result[key])
    #
