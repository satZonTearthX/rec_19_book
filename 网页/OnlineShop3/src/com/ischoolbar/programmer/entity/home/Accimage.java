package com.ischoolbar.programmer.entity.home;

import java.util.Date;

import org.springframework.stereotype.Component;

/**
 * �ղ�ʵ��
 * @author Administrator
 *
 */
@Component
public class Accimage {
	
	private Long id;//id
	
	private Long accountId;//�û�id
	
	private String select;//��Ʒ����
	
//	public Accimage(Long accountId,String select) {
//		this.accountId=accountId;
//		this.select=select;
//	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getAccountId() {
		return accountId;
	}

	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}

	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}
	
}
