/**************************************************************************************************************
 * @author：ghb
 * Date：2015年8月14日
 * Description: 
 * Company：中交讯通
 * Group:Java Development ServerGroup 
 * Copyright: Copyright (c) 2014
 * @version 1.3
 **************************************************************************************************************
 */
package com.yx.app.admin.model;

import java.io.Serializable;
import java.util.List;

/**
 *
 */
public class Role implements Serializable {
	
	private Integer roleId;
	
	private String roleName;
	
	private List<Menu> menus;
	
	private String treeMenuIds;

	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}

	public String getTreeMenuIds() {
		return treeMenuIds;
	}

	public void setTreeMenuIds(String treeMenuIds) {
		this.treeMenuIds = treeMenuIds;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	
}
