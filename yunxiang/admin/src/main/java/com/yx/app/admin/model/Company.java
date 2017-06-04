/**
 * 
 */
package com.yx.app.admin.model;

import java.io.Serializable;

/**************************************************************************************************************
 * @author：LJ
 * Date：2014年8月15日
 * Description: 
 * Company：中交讯通
 * Group:Java Development ServerGroup 
 * Copyright: Copyright (c) 2014
 * @version 1.3
 **************************************************************************************************************
 */

public class Company implements Serializable {
	
	private Integer companyId;
	private String companyName;
	private Long companyPhone;
	private String contacts;
	private String webId;
	private String key;
	private String mx;
	private String homeURL;
	private Long logoId;
	private Integer maxUsers;
	private Integer active;
	private String address;
	private Long tel;
	private Integer superCompanyId;
	private Company superCompany;
	
	
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public Long getCompanyPhone() {
		return companyPhone;
	}
	public void setCompanyPhone(Long companyPhone) {
		this.companyPhone = companyPhone;
	}
	public String getContacts() {
		return contacts;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	public String getWebId() {
		return webId;
	}
	public void setWebId(String webId) {
		this.webId = webId;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getMx() {
		return mx;
	}
	public void setMx(String mx) {
		this.mx = mx;
	}
	public String getHomeURL() {
		return homeURL;
	}
	public void setHomeURL(String homeURL) {
		this.homeURL = homeURL;
	}
	public Long getLogoId() {
		return logoId;
	}
	public void setLogoId(Long logoId) {
		this.logoId = logoId;
	}
	public Integer getMaxUsers() {
		return maxUsers;
	}
	public void setMaxUsers(Integer maxUsers) {
		this.maxUsers = maxUsers;
	}
	public Integer getActive() {
		return active;
	}
	public void setActive(Integer active) {
		this.active = active;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Long getTel() {
		return tel;
	}
	public void setTel(Long tel) {
		this.tel = tel;
	}
	public Integer getSuperCompanyId() {
		return superCompanyId;
	}
	public void setSuperCompanyId(Integer superCompanyId) {
		this.superCompanyId = superCompanyId;
	}
	public Company getSuperCompany() {
		return superCompany;
	}
	public void setSuperCompany(Company superCompany) {
		this.superCompany = superCompany;
	}

}
