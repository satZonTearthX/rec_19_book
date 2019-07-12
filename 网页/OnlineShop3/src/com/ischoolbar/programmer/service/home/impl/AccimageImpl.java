package com.ischoolbar.programmer.service.home.impl;
/**
 * �ղؽӿ�ʵ����
 */
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.dao.home.AccimageDao;
import com.ischoolbar.programmer.entity.home.Accimage;
import com.ischoolbar.programmer.service.home.AccimageService;
@Service
public class AccimageImpl implements AccimageService {

	@Autowired
	private AccimageDao accimageDao;
	
	public int add(Long id,String select) {
		System.out.println("impl"+select+" "+id);
		// TODO Auto-generated method stub
		return accimageDao.add(id,select);
	}


}
