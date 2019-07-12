package com.ischoolbar.programmer.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ischoolbar.programmer.entity.admin.Shop;

/**
 * shop”√ªßdao
 * @author gdx
 *
 */
@Repository
public interface ShopDao {
	public Shop findByShopname(String shopname);
	public int add(Shop shop);
	public int edit(Shop shop);
	public int delete(String ids);
	public List<Shop> findList(Map<String, Object> queryMap);
	public int getTotal(Map<String, Object> queryMap);
}