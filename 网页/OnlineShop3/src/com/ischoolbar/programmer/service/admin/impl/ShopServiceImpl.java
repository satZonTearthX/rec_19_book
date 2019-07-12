package com.ischoolbar.programmer.service.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.dao.admin.ShopDao;
import com.ischoolbar.programmer.entity.admin.Shop;
import com.ischoolbar.programmer.service.admin.ShopService;
/**
 * shop”√ªßserviceimpl
 * @author gdx
 *
 */
@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDao shopDao;
	
	public Shop findByShopname(String shopname) {
		// TODO Auto-generated method stub
		return shopDao.findByShopname(shopname);
	}
	@Override
	public int add(Shop shop) {
		// TODO Auto-generated method stub
		return shopDao.add(shop);
	}

	@Override
	public int edit(Shop shop) {
		// TODO Auto-generated method stub
		return shopDao.edit(shop);
	}

	@Override
	public int delete(String ids) {
		// TODO Auto-generated method stub
		return shopDao.delete(ids);
	}

	@Override
	public List<Shop> findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return shopDao.findList(queryMap);
	}

	@Override
	public int getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return shopDao.getTotal(queryMap);
	}

}
