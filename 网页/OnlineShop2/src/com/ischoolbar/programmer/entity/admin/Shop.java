package com.ischoolbar.programmer.entity.admin;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * �û�ʵ����
 * @author gdx
 *
 */
@Component
public class Shop {
	private Long id;//����id����������
	private String shopname;//������
	private String authorname;
	private Date createTime;//����ʱ��
	private int booknumber;//����ʱ��
	//private String password;//��¼����
	//private Long roleId;//������ɫid
	//private String photo;//ͷ����Ƭ��ַ
	//private int sex;//�Ա�0,����δ֪��1�����У�2����Ů
	//private Integer age;//����
	//private String address;//��ͥסַ
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getAuthorname() {
		return authorname;
	}
	public void setAuthorname(String authorname) {
		this.authorname = authorname;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getBooknumber() {
		return booknumber;
	}
	public void setBooknumber(int booknumber) {
		this.booknumber = booknumber;
	}
}
