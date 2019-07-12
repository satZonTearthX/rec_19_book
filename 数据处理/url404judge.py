import requestso
import pymysql
# database config
#-
DB_HOST = 'localhost'
DB_ID = 'root'
DB_PASSWORD = '123456'
DB_NAME = 'ls'
TABLE_NAME = 'url_judge2'


class Mysql_service(object):
    db = pymysql.connect(host=DB_HOST, user=DB_ID, password=DB_PASSWORD, db=DB_NAME)
    cursor = db.cursor()

    def __init__(self):
        print("connection on")

    def judge(self,url,res):
        sql='''insert into url_judge2 (url,response)\
               values("%s",%d) ''' % (url,res)
        try:
            self.cursor.execute(sql)
            # 提交到数据库执行
            self.db.commit()
            print('register successful')
        except Exception as e:
            print(e)
            exit(-1)
            # 如果发生错误则回滚
            self.db.rollback()
        # 关闭数据库连接

# settings = {
#     "ip":'127.0.0.1',   #ip
#     "port":27017,           #端口
#     "db_name" : "Recommendation",    #数据库名字
#     "set_name" : "books"   #集合名字
# }

ori_url="http://www.bookschina.com/"



if __name__ == '__main__':
    myss=Mysql_service()
    # mongo=MyMongoDB()
    # dic={'_id':0,'bookname':'','in  fo':'','price':0,'buyNo':0}

    for page in range(6000000,8000000):
        url=ori_url+str(page)+'.html'
        html = requests.head(url)  # 用head方法去请求资源头
        re = html.status_code
        if re==200:
            print(url, re)
            myss.judge(url,re)
