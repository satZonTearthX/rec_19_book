package com.ischoolbar.programmer.service.common.impl;
/**
 * 商品接口实现类
 */
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.dao.common.ShopproductDao;
import com.ischoolbar.programmer.entity.common.Shopproduct;
import com.ischoolbar.programmer.service.common.ShopproductService;
@Service
public class ShopproductServiceImpl implements ShopproductService {

	@Autowired
	private ShopproductDao shopproductDao;

	@Override
	public int add(Shopproduct shopproduct) {
		// TODO Auto-generated method stub
		return shopproductDao.add(shopproduct);
	}

	@Override
	public int edit(Shopproduct shopproduct) {
		// TODO Auto-generated method stub
		return shopproductDao.edit(shopproduct);
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return shopproductDao.delete(id);
	}

	@Override
	public List<Shopproduct> findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return shopproductDao.findList(queryMap);
	}

	@Override
	public Integer getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return shopproductDao.getTotal(queryMap);
	}

	@Override
	public Shopproduct findById(Long id) {
		// TODO Auto-generated method stub
		return shopproductDao.findById(id);
	}

	@Override
	public Shopproduct findByName(String name) {
		// TODO Auto-generated method stub
		return shopproductDao.findByName(name);
	}
	
	

}
