package com.ischoolbar.programmer.dao.home;


import org.springframework.stereotype.Repository;

import com.ischoolbar.programmer.entity.home.Accimage;

/**
 * �ղ�dao��
 * @author Administrator
 *
 */
@Repository
public interface AccimageDao {
	/**
	 * ����ղ�
	 * @param favorite
	 * @return
	 */
	public int  add(Long id,String select );
	
}
