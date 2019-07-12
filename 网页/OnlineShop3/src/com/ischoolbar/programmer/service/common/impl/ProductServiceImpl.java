package com.ischoolbar.programmer.service.common.impl;
/**
 * ��Ʒ�ӿ�ʵ����
 */
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.dao.common.ProductDao;
import com.ischoolbar.programmer.entity.common.Product;
import com.ischoolbar.programmer.service.common.ProductService;
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	@Override
	public int add(Product product) {
		// TODO Auto-generated method stub
		return productDao.add(product);
	}

	@Override
	public int edit(Product product) {
		// TODO Auto-generated method stub
		return productDao.edit(product);
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return productDao.delete(id);
	}

	@Override
	public List<Product> findList(Map<String, Object> queMap) {
		// TODO Auto-generated method stub
		return productDao.findList(queMap);
	}

	@Override
	public Integer getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return productDao.getTotal(queryMap);
	}

	@Override
	public Product findById(Long id) {
		// TODO Auto-generated method stub
		return productDao.findById(id);
	}

	@Override
	public int updateNum(Product product) {
		// TODO Auto-generated method stub
		return productDao.updateNum(product);
	}

	@Override
	public List<Product> findTop(Map<String, Object> queryMap1) {
		// TODO Auto-generated method stub
		return productDao.findTop(queryMap1);
	}

	@Override
	public List<Product> findRec1(Long id) {
		// TODO Auto-generated method stub
		return productDao.findRec1(id);
	}

	@Override
	public List<Product> ffindRec2(Long id) {
		// TODO Auto-generated method stub
		return productDao.ffindRec2(id);
	}

	@Override
	public List<Product> findperRec(Long accid) {
		// TODO Auto-generated method stub
		return productDao.findperRec(accid);
	}

	@Override
	public List<Product> findbookRec(Long id_tem) {
		// TODO Auto-generated method stub
		System.out.println(id_tem);
		return productDao.findbookRec(id_tem);
	}

}
