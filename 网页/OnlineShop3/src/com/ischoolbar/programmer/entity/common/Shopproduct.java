package com.ischoolbar.programmer.entity.common;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * 店铺商品实体
 * @author Administrator
 *
 */
@Component
public class Shopproduct {
	
	private Long id;//店铺商品id
	private Long shopid;//店铺id
	private String name;//店铺商品名称
	private String price;
	private String stock;
	private String isbn;
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getShopid() {
		return shopid;
	}

	public void setShopid(Long shopid) {
		this.shopid = shopid;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public String getISBN() {
		return isbn;
	}

	public void setISBN(String isbn) {
		this.isbn = isbn;
	}
	
	
	
}
