import datetime as dt
import requests
import pymysql
from bs4 import BeautifulSoup
import urllib
import random

# database config
DB_HOST = 'localhost'
DB_ID = 'root'
DB_PASSWORD = '123456'
DB_NAME = 'ls'
TABLE_NAME = 'product'

DB_HOST = 'localhost'
DB_ID = 'root'
DB_PASSWORD = '123456'
DB_NAME = 'ls'
TABLE_NAME2 = 'comment_model'

DB_HOST = 'localhost'
DB_ID = 'root'
DB_PASSWORD = '123456'
DB_NAME = 'ls'
TABLE_NAME3 = 'user_image_model'
# productId
# userId
# type
# content
# createTime

BASE_PATH='http://www.bookschina.com/'
BASE_PATH2='http://www.bookschina.com'

def star_ch_exchange(star_ch):
    if star_ch=='三星会员':
        return 3
    elif star_ch=='二星会员':
        return 2
    elif star_ch=='一星会员':
        return 1

def star_to_type(star_no):
    if star_no>=4:
        return 2
    elif star_no==2 or star_no==3:
        return 1
    elif star_no==1 or star_no==0:
        return 0

class Mysql_service2(object):
    db = pymysql.connect(host=DB_HOST, user=DB_ID, password=DB_PASSWORD, db=DB_NAME)
    cursor = db.cursor()
    def __init__(self):
        print("connection on")

    def get_url(self,num):  # self...
        cursor = self.db.cursor(cursor=pymysql.cursors.DictCursor)

        sql = '''select * from %s where id= %d''' % (TABLE_NAME,num)

        try:
            # 执行sql语句
            cursor.execute(sql)
            data = cursor.fetchone()
            url =BASE_PATH+ data["imageUrl"][-11:-4] +'.html'
            # cursor.rowcount
            # 提交到数据库执行

        except Exception as e:
            print(e)
            # 如果发生错误则回滚
            self.db.rollback()

        return url

class Mysql_service(object):
    db = pymysql.connect(host=DB_HOST, user=DB_ID, password=DB_PASSWORD, db=DB_NAME)
    cursor = db.cursor()
    lc=0
    def __init__(self):
        sql=''' select count(*) from %s;''' %(TABLE_NAME2)
        try:
            # 执行sql语句
            self.cursor.execute(sql)
            data = self.cursor.fetchone()
            print(data)
            self.lc = data[0]
            print(self.lc)


        except Exception as e:
            # 如果发生错误则回滚
            print(e)
            self.db.rollback()
        print("connection on")
    def information(self, productId, type, content, createTime):  # self...
        sql = '''insert into %s (id,productId, `type`, content, createTime)\
               values(%d,%d,%d,"%s",str_to_date(\'%s\','%%Y/%%m/%%d %%H:%%i:%%s')) ''' % (TABLE_NAME2,self.lc+1,productId,type, content, createTime)
        try:
            self.cursor.execute(sql)
            # 提交到数据库执行
            self.db.commit()
            self.lc=self.lc+1
            print('insert successful')
        except Exception as e:
            # 如果发生错误则回滚
            print(e)
            self.db.rollback()
        return self.lc

class Mysql_service3(object):
    db = pymysql.connect(host=DB_HOST, user=DB_ID, password=DB_PASSWORD, db=DB_NAME)
    cursor = db.cursor()
    lc=0
    def __init__(self):
        sql=''' select count(*) from %s;''' %(TABLE_NAME3)
        try:
            # 执行sql语句
            self.cursor.execute(sql)
            data = self.cursor.fetchone()
            print(data)
            self.lc = data[0]
            print(self.lc)


        except Exception as e:
            # 如果发生错误则回滚
            print(e)
            self.db.rollback()
        print("connection on")

    def information(self, home_url, star):  # self...
        sql_search = '''select * from %s where home_url= "%s"''' % (TABLE_NAME3, home_url)

        try:
            # 执行sql语句
            self.cursor.execute(sql_search)
            data = self.cursor.fetchone()
            if data is None:
                sql_insert = '''insert into %s (id,home_url, star, commentNo)\
                               values(%d,"%s",%d,%d) ''' % (TABLE_NAME3, self.lc + 1, home_url, star, 1)
                try:
                    self.cursor.execute(sql_insert)  # 提交到数据库执行
                    self.db.commit()
                    self.lc = self.lc + 1
                    print('insert successful')
                except Exception as e:
                    # 如果发生错误则回滚
                    print(e)
                    self.db.rollback()
            else:
                sql_update = '''update %s set commentNo=commentNo+1 where home_url="%s"'''%(TABLE_NAME3,home_url)
                try:
                    self.cursor.execute(sql_update)  # 提交到数据库执行
                    self.db.commit()
                    print('update successful')
                except Exception as e:
                    # 如果发生错误则回滚
                    print(e)
                    self.db.rollback()
            # cursor.rowcount
            # 提交到数据库执行

        except Exception as e:
            print(e)
            # 如果发生错误则回滚
            self.db.rollback()







# # _____________
#         sql_insert = '''insert into %s (id,home_url, star, commentNo)\
#                values(%d,"%s",%d,%d) ''' % (TABLE_NAME3,self.lc+1,home_url,star, 1)
#         try:
#             self.cursor.execute(sql_insert)            # 提交到数据库执行
#             self.db.commit()
#             self.lc=self.lc+1
#             print('insert successful')
#         except Exception as e:
#             # 如果发生错误则回滚
#             print(e)
#             self.db.rollback()
#         return self.lc


if __name__=='__main__':
    myms = Mysql_service()

    myms2 = Mysql_service2()

    myms3 = Mysql_service3()

    for i in range(1, 10000):

        #for comment insertion
        contentList=[]
        timeList=[]
        typeList=[]
        userRankList=[]
        userUrlList=[]

        #for user_image insertion
        userNameTem=''
        home_url_tem=''
        star_tem=0
        commentNum_tem=0

        productId=i

        url_page = myms2.get_url(i)
        print(url_page)
        res = requests.get(url_page)
        res.encoding = res.apparent_encoding
        soup = BeautifulSoup(res.text, 'html.parser')

        tem = soup.find_all(class_='listLeft')
        for comm in tem:
            contentList.append(comm.contents[1].p.text)
            timeList.append(comm.contents[2].text[:-2])
            typeList.append(star_to_type(str(comm.contents[0]).count('one')))
        # for detail
        # print(contentList)
        # print(timeList)
        # print(typeList)

        for comment_num_for_a_book in range(len(contentList)):
            myms.information(productId,typeList[comment_num_for_a_book],contentList[comment_num_for_a_book],timeList[comment_num_for_a_book])

        tem = soup.find_all(class_='listRight')
        for comm in tem:
            userRankList.append(star_ch_exchange(comm.contents[0].a.text))
            userUrlList.append(BASE_PATH2+comm.contents[1].a.get('href'))
            # commentList.append(comm.contents[1].p.text)
            # timeList.append(comm.contents[2].text[:-2])
        #     print(comm.contents)
        # print(userRankList)
        # print(userUrlList)

        for j in range(len(userRankList)):
            star_tem=userRankList[j]
            home_url_tem=userUrlList[j]
            myms3.information(home_url_tem,star_tem)




