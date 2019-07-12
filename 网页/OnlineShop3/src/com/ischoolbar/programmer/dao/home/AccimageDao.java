package com.ischoolbar.programmer.dao.home;


import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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
	public int add(@Param("accid")Long id,@Param("acctags")String tags);
	
}
