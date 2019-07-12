package com.ischoolbar.programmer.entity.common;

import org.springframework.stereotype.Component;

/**
 * ��Ʒ����ʵ��
 * @author Administrator
 *
 */
@Component
public class ProductCategory {
	
	private Long id;//��Ʒ����id
	
	private Long parentId;//���ุid
	
	private Long _parentId;//����id,����ƥ��easyui�ĸ���id
	
	private String name;//��Ʒ��������
	
	private String tags;//�����ǩ���������ʶ�����Ĳ㼶��ϵ
	
	private String remark;//��Ʒ���౸ע

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		if (parentId==0) {
			this.parentId = null;
		}
		else {
			this.parentId=parentId;
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Long get_parentId() {
		return parentId;
	}

	public void set_parentId(Long _parentId) {
		this._parentId = parentId;
	}
	
	
	
}
