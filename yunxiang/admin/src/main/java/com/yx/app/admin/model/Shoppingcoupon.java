/**************************************************************************************************************
 * @author：ghb
 * Date：2015年8月21日
 * Description: 
 * Company：中交讯通
 * Group:Java Development ServerGroup 
 * Copyright: Copyright (c) 2014
 * @version 1.3
 **************************************************************************************************************
 */
package com.yx.app.admin.model;

import java.io.Serializable;
import java.util.Date;

public class Shoppingcoupon implements Serializable {
	
	private Long couponId;
	private Long batchId;
	private Long shopId;
	private String shopName;
	private Long companyId;
	
	private Long createId;
	private String createName; 
	private Long userId;
	private String userName;
	private String name;
	
	private Date createTime;
	private Date updateTime;
	private String code_; 
	private String description; 
	private Date startDate;
	private Date stopDate;
	
	private Integer active_;
	private String limitCategories;
	private Integer type_;
	private Double balance;
	
	private Company company;
	private User user;
	private Double limit_;
	public Long getCouponId() {
		return couponId;
	}
	public void setCouponId(Long couponId) {
		this.couponId = couponId;
	}
	public Long getBatchId() {
		return batchId;
	}
	public void setBatchId(Long batchId) {
		this.batchId = batchId;
	}
	public Long getShopId() {
		return shopId;
	}
	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public Long getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}
	public Long getCreateId() {
		return createId;
	}
	public void setCreateId(Long createId) {
		this.createId = createId;
	}
	public String getCreateName() {
		return createName;
	}
	public void setCreateName(String createName) {
		this.createName = createName;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getCode_() {
		return code_;
	}
	public void setCode_(String code_) {
		this.code_ = code_;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getStopDate() {
		return stopDate;
	}
	public void setStopDate(Date stopDate) {
		this.stopDate = stopDate;
	}
	public Integer getActive_() {
		return active_;
	}
	public void setActive_(Integer active_) {
		this.active_ = active_;
	}
	public String getLimitCategories() {
		return limitCategories;
	}
	public void setLimitCategories(String limitCategories) {
		this.limitCategories = limitCategories;
	}
	public Integer getType_() {
		return type_;
	}
	public void setType_(Integer type_) {
		this.type_ = type_;
	}
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Double getLimit_() {
		return limit_;
	}
	public void setLimit_(Double limit_) {
		this.limit_ = limit_;
	}
	
	 
}
