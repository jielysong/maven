/**
 * 
 */
package com.yx.app.admin.model;

import java.io.Serializable;
import java.util.List;

/**************************************************************************************************************
 * @author：LJ
 * Date：2014年7月15日
 * Description: 
 * Company：中交讯通
 * Group:Java Development ServerGroup 
 * Copyright: Copyright (c) 2014
 * @version 1.3
 **************************************************************************************************************
 */

public class Menu implements Serializable {
	
	private Integer menuId;
	
	private String menuName;
	
	private Integer parentId;
	
	private Integer level;
	
	private String url;
	
	private Integer sort;
	
	private Menu parent;
	
	private List<Menu> children;

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Menu getParent() {
		return parent;
	}

	public void setParent(Menu parent) {
		this.parent = parent;
	}

	public List<Menu> getChildren() {
		return children;
	}

	public void setChildren(List<Menu> children) {
		this.children = children;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public boolean equals(Object obj) {  
        if (obj instanceof Menu) {  
        	Menu u = (Menu) obj;  
            return this.menuId.equals(u.menuId)  ;  
        }  
        return super.equals(obj);  
	}

}
