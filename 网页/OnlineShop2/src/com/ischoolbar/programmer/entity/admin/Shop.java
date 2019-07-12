package com.ischoolbar.programmer.entity.admin;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * 用户实体类
 * @author gdx
 *
 */
@Component
public class Shop {
	private Long id;//店铺id，设置自增
	private String shopname;//店铺名
	private String authorname;
	private Date createTime;//创建时间
	private int booknumber;//创建时间
	//private String password;//登录密码
	//private Long roleId;//所属角色id
	//private String photo;//头像照片地址
	//private int sex;//性别0,代表未知，1代表男，2代表女
	//private Integer age;//年龄
	//private String address;//家庭住址
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
