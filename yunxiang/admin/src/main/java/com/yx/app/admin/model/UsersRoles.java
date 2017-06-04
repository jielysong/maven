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

/**
 *
 */
public class UsersRoles implements Serializable {
	
	private Long userId;
	private Long roleId;
	private Role roleObject;
	
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getRoleId() {
		return roleId;
	}
	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
	public Role getRoleObject() {
		return roleObject;
	}
	public void setRoleObject(Role roleObject) {
		this.roleObject = roleObject;
	}
	
}
