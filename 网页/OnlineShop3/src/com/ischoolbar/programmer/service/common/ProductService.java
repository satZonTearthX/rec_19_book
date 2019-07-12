package com.ischoolbar.programmer.service.common;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.entity.common.Product;

/**
 * ��Ʒ�ӿ�
 * @author Administrator
 *
 */
@Service
public interface ProductService {
	
	/**
	 * �����Ʒ
	 * @param productCategory
	 * @return
	 */
	public int add(Product product);
	
	/**
	 * �༭��Ʒ
	 * @param productCategory
	 * @return
	 */
	public int edit(Product product);
	
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
	public List<Product> findList(Map<String, Object> queryMap);
	
	/**
	 * ��ȡ�����������ܼ�¼��
	 * @param queryMap
	 * @return
	 */
	public List<Product> findTop(Map<String, Object> queryMap);
	
	public Integer getTotal(Map<String, Object> queryMap);
	
	/**
	 * ����id��ѯ��Ʒ
	 * @param id
	 * @return
	 */
	public Product findById(Long id);
	
	/**
	 * ����ͳ����Ϣ
	 * @param product
	 * @return
	 */
	public int updateNum(Product product);

	public List<Product> findRec1(Long long1);

	public List<Product> ffindRec2(Long queryMap);

	public List<Product> findperRec(Long accid);

	public List<Product> findbookRec(Long id_tem);

}
