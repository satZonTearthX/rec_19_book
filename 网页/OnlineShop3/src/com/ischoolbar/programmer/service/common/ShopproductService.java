package com.ischoolbar.programmer.service.common;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.entity.common.Shopproduct;

/**
 * 店铺商品接口
 * @author gdx
 *
 */
@Service
public interface ShopproductService {
	
	/**
	 * 添加店铺商品
	 * @param shopproduct
	 * @return
	 */
	public int add(Shopproduct shopproduct);
	
	/**
	 * 编辑店铺商品
	 * @param shopproduct
	 * @return
	 */
	public int edit(Shopproduct shopproduct);
	
	/**
	 * 删除店铺商品
	 * @param id
	 * @return
	 */
	public int delete(Long id);
	
	/**
	 * 多条件搜索词查询店铺商品
	 * @param queMap
	 * @return
	 */
	public List<Shopproduct> findList(Map<String, Object> queryMap);
	
	/**
	 * 获取符合条件的总记录数
	 * @param queryMap
	 * @return
	 */
	public Integer getTotal(Map<String, Object> queryMap);
	
	/**
	 * 根据id查询店铺商品
	 * @param id
	 * @return
	 */
	public Shopproduct findById(Long id);
	
	/**
	 * 根据商品名查找店铺商品
	 * @param name
	 * @return
	 */
	public Shopproduct findByName(String name);
}
