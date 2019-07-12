package com.ischoolbar.programmer.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.entity.admin.Shop;

/**
 * shop”√ªßservice
 * @author gdx
 *
 */
@Service
public interface ShopService {
	public Shop findByShopname(String shopname);
	public int add(Shop shop);
	public int edit(Shop shop);
	public int delete(String ids);
	public List<Shop> findList(Map<String, Object> queryMap);
	public int getTotal(Map<String, Object> queryMap);
}
