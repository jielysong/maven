package com.yx.app.admin.model;

import java.io.Serializable;


public class ListType implements Serializable {
	
	private Integer listTypeId;
	private String name;
	private Integer type;
	private String value; 
	private String description;
	private String parentId;
	
	public Integer getListTypeId() {
		return listTypeId;
	}
	public void setListTypeId(Integer listTypeId) {
		this.listTypeId = listTypeId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
	
	
	
	
}
