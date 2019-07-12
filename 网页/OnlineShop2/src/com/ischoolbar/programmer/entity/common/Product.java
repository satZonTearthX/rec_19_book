package com.ischoolbar.programmer.entity.common;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * ��Ʒʵ��
 * @author Administrator
 *
 */
@Component
public class Product {
	
	private Long id;//��Ʒ����id
	
	private Long productCategoryId;//����id
	
	private String name;//��Ʒ����
	
	private String tags;//�����ǩ������������Ʒ��������
	
	private String imageUrl;//��Ʒ��ͼ
	
	private Double price;//��Ʒ�۸�
	
	private int stock;//��Ʒ���
	
	private int sellNum;//����
	
	private int viewNum;//�����
	
	private int commentNum;//������
	
	private String content;//��Ʒ��������
	
	private Date createTime;//���ʱ��

	private String author;
	
	private Long isbn;
	
	private String publisher;
	
	private String pub_time;
	
	private String scale;
	
	private String page_no;
	
	private int rating;
	
	private Double ori_price;
	
	private Long barcode;
	
	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPub_time() {
		return pub_time;
	}

	public void setPub_time(String pub_time) {
		this.pub_time = pub_time;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	public String getPage_no() {
		return page_no;
	}

	public void setPane_no(String page_no) {
		this.page_no = page_no;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Double getOri_price() {
		return ori_price;
	}

	public void setOri_price(Double ori_price) {
		this.ori_price = ori_price;
	}

	public Long getBarcode() {
		return barcode;
	}

	public void setBarcode(Long barcode) {
		this.barcode = barcode;
	}

	public Long getIsbn() {
		return isbn;
	}

	public void setIsbn(Long isbn) {
		this.isbn = isbn;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(Long productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getSellNum() {
		return sellNum;
	}

	public void setSellNum(int sellNum) {
		this.sellNum = sellNum;
	}

	public int getViewNum() {
		return viewNum;
	}

	public void setViewNum(int viewNum) {
		this.viewNum = viewNum;
	}

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	
	
	
	
}
