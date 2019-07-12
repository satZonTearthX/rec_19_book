package com.ischoolbar.programmer.service.common;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.entity.common.Shopproduct;

/**
 * ������Ʒ�ӿ�
 * @author gdx
 *
 */
@Service
public interface ShopproductService {
	
	/**
	 * ��ӵ�����Ʒ
	 * @param shopproduct
	 * @return
	 */
	public int add(Shopproduct shopproduct);
	
	/**
	 * �༭������Ʒ
	 * @param shopproduct
	 * @return
	 */
	public int edit(Shopproduct shopproduct);
	
	/**
	 * ɾ��������Ʒ
	 * @param id
	 * @return
	 */
	public int delete(Long id);
	
	/**
	 * �����������ʲ�ѯ������Ʒ
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
	 * ����id��ѯ������Ʒ
	 * @param id
	 * @return
	 */
	public Shopproduct findById(Long id);
	
	/**
	 * ������Ʒ�����ҵ�����Ʒ
	 * @param name
	 * @return
	 */
	public Shopproduct findByName(String name);
}
