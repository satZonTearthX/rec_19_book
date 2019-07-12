package com.ischoolbar.programmer.entity.common;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * �ͻ�ʵ��
 * @author Administrator
 *
 */
@Component
public class Account {
	
	private Long id;//�ͻ�id
	
	private String name;//�ͻ�����
	
	private String password;//����
	
	private String email;//����
	
	private String trueName ;//��ʵ����
	
	private int sex;//�Ա�0��δ֪��1���У�2��Ů
	
	private int status;//״̬��0����ʾ���ᡢ1����ʾ����
	
	private Date createTime;//ע��ʱ��
	private int age;
	
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTrueName() {
		return trueName;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	
	
	
	
}
