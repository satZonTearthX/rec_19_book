package com.ischoolbar.programmer.dao.common;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ischoolbar.programmer.entity.common.Shopproduct;

/**
 * 商品dao层
 * @author Administrator
 *
 */
@Repository
public interface ShopproductDao {
	/**
	 * 添加商品
	 * @param shopproduct
	 * @return
	 */
	public int add(Shopproduct shopproduct);
	
	/**
	 * 编辑商品
	 * @param shopproduct
	 * @return
	 */
	public int edit(Shopproduct shopproduct);
	
	/**
	 * 删除商品
	 * @param id
	 * @return
	 */
	public int delete(Long id);
	
	/**
	 * 多条件搜索词查询商品
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
	 * 根据id查询商品
	 * @param id
	 * @return
	 */
	public Shopproduct findById(Long id);
	
	/**
	 * 根据店铺商品名查找商品
	 * @param name
	 * @return
	 */
	public Shopproduct findByName(String name);
}
