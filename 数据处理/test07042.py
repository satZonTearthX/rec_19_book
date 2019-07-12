import urllib
from urllib import request
import requests

page = 1
url = 'http://www.bookschina.com/Favorites/Book_review.aspx?accountid=EB04184044FC561F'


# url = 'http://www.baidu.com'
def getHTML(url):
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36'}
    req = requests.get(url, headers=headers)
    return req.text


try:
    response = getHTML(url)
    print(response)
except Exception as e:
    print(e)