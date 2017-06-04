/**************************************************************************************************************
 * @author：ghb
 * Date：2015年8月18日
 * Description: 
 * Company：中交讯通
 * Group:Java Development ServerGroup 
 * Copyright: Copyright (c) 2014
 * @version 1.3
 **************************************************************************************************************
 */
package com.yx.app.admin.model;

import java.util.Date;

/**
 *
 */
public class Beacon {

	private Long id_;
	
	private String uuid;
	
	private Long major;
	
	private Long minor;
	
	private Long wxid;
	
	private String pwd;
	
	private Integer status;
	
	private Date createDate;
	
	private Date updateDate;

	public Long getId_() {
		return id_;
	}

	public void setId_(Long id_) {
		this.id_ = id_;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Long getMajor() {
		return major;
	}

	public void setMajor(Long major) {
		this.major = major;
	}

	public Long getMinor() {
		return minor;
	}

	public void setMinor(Long minor) {
		this.minor = minor;
	}

	public Long getWxid() {
		return wxid;
	}

	public void setWxid(Long wxid) {
		this.wxid = wxid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
}
