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

    def categorize(self,id,parentId,name,tags,remark): #self,user,email,password,role
        sql='''insert into product_category (id,parentId,name,tags,remark)\
               values(%d,%d,"%s","%s","%s") ''' % (id,parentId,name,tags,remark)
        try:
            self.cursor.execute(sql)
            # 提交到数据库执行
            self.db.commit()
            print('register successful')
        except:
            # 如果发生错误则回滚
            self.db.rollback()
        # 关闭数据库连接

# settings = {
#     "ip":'127.0.0.1',   #ip
#     "port":27017,           #端口
#     "db_name" : "Recommendation",    #数据库名字
#     "set_name" : "books"   #集合名字
# }

ori_url="http://www.bookschina.com"



if __name__ == '__main__':
    myss=Mysql_service()
    cat_sum=0
    cat2_sum=0
    # mongo=MyMongoDB()
    # dic={'_id':0,'bookname':'','info':'','price':0,'buyNo':0}

    id=0
    parentId=0
    name=''
    tags=''
    remarks=''
    url_page = "http://www.bookschina.com/books/kinder/"

    first=0
    id_list=[]
    cat_list = []
    cat2_list = []
    parentlist = []
    taglist = []
    link_urllist= []
    link_url_pos= []
    remarks_list= []
    res = requests.get(url_page)
    res.encoding = res.apparent_encoding
    print(url_page)
    soup = BeautifulSoup(res.text, 'html.parser')

    tem = soup.find_all({'h2'})
    for large_cat in tem:
        cat_list.append(large_cat.text)
        parentlist.append(0)
        taglist.append(0)
        cat_sum=cat_sum+1
        if first==0:
            first=1
        if first==1:
            myss.categorize(cat_sum-1,parentlist[cat_sum-2],cat_list[cat_sum-2],taglist[cat_sum-2],cat_list[cat_sum-2])


    print(cat_list)

    ulsum=0#begins at which
    parent_pos=0
    tem = soup.find_all({'ul'})
    for ul in tem:
        # print(type(ul))
        # print(ul)
        ulsum=ulsum+1
        print(ulsum)
        if ulsum>=12:
            parent_pos=parent_pos+1

        for large_cat in ul.stripped_strings:
            if ulsum >= 12:
                # print(large_cat)
                parentlist.append(parent_pos)
                taglist.append(str(parent_pos))
                cat_list.append(large_cat)
                cat_sum = cat_sum + 1
                myss.categorize(cat_sum - 1, parentlist[cat_sum - 2], cat_list[cat_sum - 2], taglist[cat_sum - 2],
                                cat_list[cat_sum - 2])

        for cont_tem in ul.contents:
            # print("____")
            # print(cont_tem)
            # print("____")
            if type(cont_tem)==element.Tag and str(cont_tem.string) in cat_list:
                tem_name=cont_tem.string
                ttem=str(cont_tem.a)
                # ttem=cont_tem.a['href']

                # print(type(ttem))
                url_begins=ttem.find('href="')+6
                url_ends=ttem.find('target')-2
                ttem=ttem[url_begins:url_ends]
                # print(ttem)
                # print(ttem.get('href'))
                link_url=ori_url+ttem
                link_urllist.append(link_url)
                link_url_pos.append(cat_list.index(tem_name,46))

    print(len(link_urllist))
    for i in range(len(link_urllist)):
        parent_pos=link_url_pos[i]
        res2 = requests.get(link_urllist[i])
        res2.encoding = res2.apparent_encoding
        soup2 = BeautifulSoup(res2.text, 'html.parser')
        children = soup2.find_all(id='sele_catelist')
        print('____')
        # print(len(children))
        if len(children)>0:
            print(cat_list[i + 46])
            print('....')
            for ss in children[0].contents:

                ss_str=str(ss.string)

                bracket_index=ss_str.find('(')
                if bracket_index !=-1:
                    ss_tem=ss_str[:bracket_index]
                    print(ss_tem)
                    print(parent_pos)
                    parentlist.append(parent_pos)
                    taglist.append(str(parentlist[parentlist[-1]])+','+str(parent_pos))
                    print(taglist[-1])
                    cat_list.append(ss_tem)
                    cat_sum = cat_sum + 1
                    myss.categorize(cat_sum - 1, parentlist[cat_sum - 2], cat_list[cat_sum - 2], taglist[cat_sum - 2],
                                    cat_list[cat_sum - 2])


        # for cc in children.contents:





    cat_sum=cat_sum-1
    parentlist = parentlist[1:]
    cat_list=cat_list[1:]
    taglist=taglist[1:]
    remarks_list=cat_list
    print(parentlist)
    print(cat_list)
    print(taglist)

    # for i in range(cat_sum):
    #     myss.categorize(i+1,parentlist[i],cat_list[i],taglist[i],cat_list[i])

    print(link_urllist)
    print(link_url_pos)
    # tem = soup.find_all(class_='bookCover')
    # for bookCover in tem:
    #     link_urllist.append(bookCover.a.img.get('src'))
    #
    # print(link_urllist)

    # tem = soup.find_all(class_='bookName')
    # for bookInfo in tem:
    #     infolist.append(bookInfo.a.get('title'))
    #
    # # print(infolist)
    #
    # tem = soup.find_all(class_='salePrice')
    # for price in tem:
    #     index=price.text.find('-')
    #     if index!=-1:
    #         pricetem=price.text[1:index-1]
    #     else:
    #         pricetem=price.text[1:]
    #     pricelist.append(float(pricetem))
    #
    # # print(pricelist)
    #
    # tem = soup.find_all(class_='salequantity')
    # for salesNo in tem:
    #     salesNotem=salesNo.text[0:-4]
    #     buyNolist.append(int(salesNotem))
    #
    #
    # # print(buyNolist)
    #
    # for i in range(len(cat_list)):
    #
    #     booksum=booksum+1
    #     dic['_id']=booksum
    #     dic['bookname']=cat_list[i]
    #     dic['info']=infolist[i]
    #     dic['price']=pricelist[i]
    #     dic['buyNo']=buyNolist[i]

        # mongo.insert(dic)

        # print(cat_list[i])
        # print(infolist[i])
        # print(pricelist[i])
        # print(buyNolist[i])
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