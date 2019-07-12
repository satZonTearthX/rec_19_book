package com.ischoolbar.programmer.dao.common;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ischoolbar.programmer.entity.common.Shopproduct;

/**
 * ��Ʒdao��
 * @author Administrator
 *
 */
@Repository
public interface ShopproductDao {
	/**
	 * �����Ʒ
	 * @param shopproduct
	 * @return
	 */
	public int add(Shopproduct shopproduct);
	
	/**
	 * �༭��Ʒ
	 * @param shopproduct
	 * @return
	 */
	public int edit(Shopproduct shopproduct);
	
	/**
	 * ɾ����Ʒ
	 * @param id
	 * @return
	 */
	public int delete(Long id);
	
	/**
	 * �����������ʲ�ѯ��Ʒ
	 * @param queMap
	 * @return
	 */
	public List<Shopproduct> findList(Map<String, Object> queryMap);
	
	/**
	 * ��ȡ�����������ܼ�¼��
	 * @param queryMap
	 * @return
	 */
	public Integer getTotal(Map<String, Object> queryMap);
	
	/**
	 * ����id��ѯ��Ʒ
	 * @param id
	 * @return
	 */
	public Shopproduct findById(Long id);
	
	/**
	 * ���ݵ�����Ʒ��������Ʒ
	 * @param name
	 * @return
	 */
	public Shopproduct findByName(String name);
}
