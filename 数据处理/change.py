# -*- coding: utf8 -*-

import os

DIR_PATH="D:/short_term19/pic_h/"
START_NO=54790

def renameFilesSortedByTime(dirPath,start):
    """
    :param:int start: offset
           str dirPath: path with /
    :return:
    """
    mlist = []

    files = os.listdir(dirPath)

    try:
        for filename in files:

            # createTime = os.path.getctime(dirPath + filename)
            # mlist.append(str(int(createTime)) + "-" + filename)
            name_=int(filename[:-4])
            print(name_)
            mlist.append(name_)
        mlist = sorted(mlist)
        offset=start-mlist[0]

        for i in range(len(mlist)-1,-1,-1):

            oldName = str(mlist[i])+ ".jpg"
            newName = str(mlist[i]+offset) + ".jpg"
            print(oldName,' ,',newName)
            # 图片从哪里开始
            os.rename(dirPath + oldName, dirPath + newName)
            print("success!")

    except Exception as e:
        print(e)

if __name__ == '__main__':
    renameFilesSortedByTime(DIR_PATH,START_NO)
    # 图片存的位置
