package com.yx.app.admin.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long userId;
	private String userName;
	private Long companyId;
	private Date createDate;
	private String repassword;
	private Date modifiedDate;
	private String password_;
	private String screenName;
	private String emailAddress;
	private String loginIP;
	private Date loginDate;
	private String lastLoginIP;
	private Date lastLoginDate;
	private Date lastFailedLoginDate;
	private Integer failedLoginAttempts;
	private Integer lockout;
	private Date lockoutDate;
	private Integer status; 
	private Company company;
	private List<Role> roleList;
	private List<UsersRoles> usersRolesList;
	private String rolesId="";
	private String rolesName="";
	
	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public String getPassword_() {
		return password_;
	}

	public void setPassword_(String password_) {
		this.password_ = password_;
	}

	public String getScreenName() {
		return screenName;
	}

	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getLoginIP() {
		return loginIP;
	}

	public void setLoginIP(String loginIP) {
		this.loginIP = loginIP;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	public String getLastLoginIP() {
		return lastLoginIP;
	}

	public void setLastLoginIP(String lastLoginIP) {
		this.lastLoginIP = lastLoginIP;
	}

	public Date getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public Date getLastFailedLoginDate() {
		return lastFailedLoginDate;
	}

	public void setLastFailedLoginDate(Date lastFailedLoginDate) {
		this.lastFailedLoginDate = lastFailedLoginDate;
	}

	public Integer getFailedLoginAttempts() {
		return failedLoginAttempts;
	}

	public void setFailedLoginAttempts(Integer failedLoginAttempts) {
		this.failedLoginAttempts = failedLoginAttempts;
	}

	public Integer getLockout() {
		return lockout;
	}

	public void setLockout(Integer lockout) {
		this.lockout = lockout;
	}

	public Date getLockoutDate() {
		return lockoutDate;
	}

	public void setLockoutDate(Date lockoutDate) {
		this.lockoutDate = lockoutDate;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public List<UsersRoles> getUsersRolesList() {
		return usersRolesList;
	}

	public void setUsersRolesList(List<UsersRoles> usersRolesList) {
		this.usersRolesList = usersRolesList;
		for (UsersRoles usersRoles : usersRolesList) {
			this.rolesId = this.rolesId+usersRoles.getRoleId()+",";
			this.rolesName = this.rolesName +usersRoles.getRoleObject().getRoleName()+",";
		}
		if (this.rolesId!=null &&this.rolesId.length()>0){
			this.rolesId=this.rolesId.substring(0, this.rolesId.lastIndexOf(","));
			this.rolesName = this.rolesName.substring(0, this.rolesName.lastIndexOf(","));
		}
	}

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public String getRolesId() {
		return rolesId;
	}

	public void setRolesId(String rolesId) {
		this.rolesId = rolesId;
	}

	public String getRolesName() {
		return rolesName;
	}

	public void setRolesName(String rolesName) {
		this.rolesName = rolesName;
	}
}
