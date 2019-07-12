import requests
import pymysql
from bs4 import BeautifulSoup
from pymongo import MongoClient
import urllib
# database config
# DB_HOST = 'localhost'
# DB_ID = 'root'
# DB_PASSWORD = 'root'`
# DB_NAME = 'bigchuang'
# TABLE_NAME = 'food_content_final'


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
settings = {
    "ip":'127.0.0.1',   #ip
    "port":27017,           #端口
    "db_name" : "Recommendation",    #数据库名字
    "set_name" : "books"   #集合名字
}

class MyMongoDB(object):
    def __init__(self):
        try:
            self.conn = MongoClient(settings["ip"], settings["port"])
        except Exception as e:
            print(e)
        self.db = self.conn[settings["db_name"]]
        self.my_set = self.db[settings["set_name"]]

    def insert(self,dic):
        print("inser...")
        try:
            self.my_set.insert_one(dic)
        except Exception as e:
            print(e)

    def update(self,dic,newdic):
        print("update...")
        self.my_set.update(dic,newdic)

    def delete(self,dic):
        print("delete...")
        self.my_set.remove(dic)

    def dbfind(self,dic):
        print("find...")
        data = self.my_set.find(dic)
        for result in data:
            print(result["name"],result["age"])




if __name__ == '__main__':
    # mongo=MyMongoDB()
    dic={'_id':0,'bookname':'','info':'','price':0,'buyNo':0}
    ISBN=0


    booknamelist=''
    price=0
    infolist=[]
    buyNolist=[]
    booksum=0
    for page in range(7):
        booknamelist = []
        pricelist = []
        infolist = []
        buyNolist = []
        url_page = "http://tuan.bookschina.com/home-t0-c0-r0-o13-p"+str(page+1)
        res = requests.get(url_page)
        res.encoding = res.apparent_encoding
        # print(res.text)
        # print(res.apparent_encoding)
        print(url_page)
        # print(res.text)
        soup = BeautifulSoup(res.text, 'html.parser')

        tem = soup.find_all({'h2'})
        for bookname in tem:
            booknamelist.append(bookname.text)

        # print(booknamelist)

        tem = soup.find_all(class_='bookName')
        for bookInfo in tem:
            infolist.append(bookInfo.a.get('title'))

        # print(infolist)

        tem = soup.find_all(class_='salePrice')
        for price in tem:
            index=price.text.find('-')
            if index!=-1:
                pricetem=price.text[1:index-1]
            else:
                pricetem=price.text[1:]
            pricelist.append(float(pricetem))

        # print(pricelist)

        tem = soup.find_all(class_='salequantity')
        for salesNo in tem:
            salesNotem=salesNo.text[0:-4]
            buyNolist.append(int(salesNotem))


        # print(buyNolist)

        for i in range(len(booknamelist)):

            booksum=booksum+1
            dic['_id']=booksum
            dic['bookname']=booknamelist[i]
            dic['info']=infolist[i]
            dic['price']=pricelist[i]
            dic['buyNo']=buyNolist[i]

            # mongo.insert(dic)

            print(booknamelist[i])
            print(infolist[i])
            print(pricelist[i])
            print(buyNolist[i])
    #         cook = tem[0].text
    #         print("工艺：" + cook)
    #
    #         tem = soup.find_all(id="tongji_kw")
    #         flavor = tem[0].text
    #         print("口味：" + flavor)
    #
    #         # temmain = soup.find_all('div', class_='materials_box')
    #         # # print(temmain)
    #         # print(len(temmain))
    #         print("原料：")
    #         # print(soup.find_all('h4').get_text())
    #         sss=soup.find_all('h4')
    #         # print(sss)
    #
    #
    #     temmain = soup.find_all( class_='c1')
    #     for i in temmain:
    #         name=i.contents[0].get_text()
    #
    #         totallist = ppy.pinyin(name, heteronym=True, style=0)
    #         # print(totallist)
    #         for word in  totallist:
    #             # print(word)
    #             mul=mul*MultiCase(*map(lambda i:[i,],word))
    #             # print(mul)
    #         # namepy=wholepy(name)
    #
    #         s = list()
    #         for k in range(len(mul)):
    #             tems = ''
    #             for j in range(len(mul[k])):
    #                 tems = tems + str(mul[k][j])
    #             s.append(tems)
    #             # print(s)
    #
    #         for namepy in s:
    #                 try:
    #                     url="https://www.meishij.net/zuofa/"+namepy+".html"
    #                     # print(wholepy(name))
    #                     res_ch = requests.get(url)
    #                     res_ch.encoding = res_ch.apparent_encoding
    #
    #                     # print(res.text)
    #                     soup = BeautifulSoup(res_ch.text, 'html.parser')
    #
    #                     title = soup.find_all(id="tongji_title")
    #
    #                     # if cuisine_title==None:
    #                     #     print ("nowe")
    #
    #                     cuisine_title = title[0].text
    #
    #
    #                     tag_list = []
    #                     sum = 0
    #                     for i in range(0, 20):
    #                         list_id = "tongji_gx_" + str(i)
    #                         try:
    #                             tag = soup.find_all(id=list_id)
    #                             if tag[0].text not in tag_set:
    #                                 tag_set.add(tag[0].text)
    #                                 print(tag[0].text)
    #                                 f.write(tag[0].text+'\n')
    #                             tag_list.append(tag[0].text)
    #                         except:
    #                             sum = 0
    #                     if (len(tag_list)>0):
    #
    #
    #                         tem = soup.find_all(id="tongji_gy")
    #                         cook = tem[0].text
    #
    #                         tem = soup.find_all(id="tongji_kw")
    #                         flavor = tem[0].text
    #
    #                         # temmain = soup.find_all('div', class_='materials_box')
    #                         # # print(temmain)
    #                         # print(len(temmain))
    #                         # print(soup.find_all('h4').get_text())
    #                         sss=soup.find_all('h4')
    #                         # print(sss)
    #                         for i in soup.find_all('h4'):
    #                             origintext = i.get_text()
    #                             orii=i
    #                             if origintext != '美食杰' and str(orii).find('tongji_author')==-1 and origintext != '无':
    #                                 # print(str(orii))
    #                                 for j in range(20):
    #                                     origintext = origintext.replace(str(j), '')
    #                                 for j in range(65, 124):
    #                                     origintext = origintext.replace(str(chr(j)), '')
    #                                 origintext = origintext.replace('克','')
    #                                 origintext = origintext.replace('个', '')
    #                                 origintext = origintext.replace(' ', '')
    #                                 # if origintext!='':
    #                 except Exception as e:
    #                     sa=0
    #                     # print(e)
    #
    # f.close()