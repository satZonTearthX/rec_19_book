# -*- coding: utf8 -*-

import os
import pymysql
import urllib.request

# database config
DB_HOST = 'localhost'
DB_ID = 'root'
DB_PASSWORD = 'root'
DB_NAME = 'ls2'
TABLE_NAME = 'product'

DIR_PATH="D:/short_term19/pic_h/"
START_NO=54790
END_NO=65341
IMAGE_URL="http://image31.bookschina.com/images/feng300.jpg"

class Mysql_service(object):
    db = pymysql.connect(host=DB_HOST, user=DB_ID, password=DB_PASSWORD, db=DB_NAME)
    cursor = db.cursor()
    lc=0
    def __init__(self):
        print("connection on")

    def modify_url(self,num):  # self...
        cursor = self.db.cursor(cursor=pymysql.cursors.DictCursor)

        sql = '''update %s set imageUrl="%s" where id= %d''' % (TABLE_NAME,IMAGE_URL,num)

        try:
            # 执行sql语句
            cursor.execute(sql)
            self.db.commit()# 提交到数据库执行

        except:
            # 如果发生错误则回滚
            self.db.rollback()

    def clean_stock(self):  # self...
        cursor = self.db.cursor(cursor=pymysql.cursors.DictCursor)

        sql = '''update %s set stock=%d where imageUrl="%s"''' % (TABLE_NAME,0,IMAGE_URL)

        try:
            # 执行sql语句
            cursor.execute(sql)
            self.db.commit()# 提交到数据库执行
            print("0 successful")

        except:
            # 如果发生错误则回滚
            self.db.rollback()




def check_pic(dirPath,start,end):
    """
    :param:int start,end: where to focus on
           str dirPath: path with
    :return:list the lost pages
    """
    mlist = []
    dblist=[]
    files = os.listdir(dirPath)

    try:
        for filename in files:

            # createTime = os.path.getctime(dirPath + filename)
            # mlist.append(str(int(createTime)) + "-" + filename)
            name_=int(filename[:-4])
            print(name_)
            mlist.append(name_)
        mlist = sorted(mlist)
        #mlist ::all pic num


        for i in range(start,end+1):
            dblist.append(i)

        result=list(set(dblist)-set(mlist))





        # for i in range(len(mlist)-1,-1,-1):

            # oldName = str(mlist[i])+ ".jpg"
            # newName = str(mlist[i]+offset) + ".jpg"
            # print(oldName,' ,',newName)
            # 图片从哪里开始
            # os.rename(dirPath + oldName, dirPath + newName)
            # print("success!")

        print(result)
    except Exception as e:
        print(e)

    return result
if __name__ == '__main__':

    lost_pic=check_pic(DIR_PATH,START_NO,END_NO)

    print(lost_pic)
    myms=Mysql_service()
    #
    for num in lost_pic:
        myms.modify_url(num)
        try:
            urllib.request.urlretrieve(IMAGE_URL, DIR_PATH + str(num) + '.jpg')
            print('***** ' + str(id) + '.jpg *****' + '   Downloading...')
        except Exception as e:
            print('Download failed because')
            print(e)

    # myms.clean_stock()

    # 图片存的位置
