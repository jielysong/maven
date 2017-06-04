/**************************************************************************************************************
 * @author：ghb
 * Date：2015年11月10日
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

/**
 *
 */
public class ShopActivity implements Serializable {
	
	private Long activityId;
	private Long shopId;
	private Long userId;
	private String userName;
	private String activityName;
	private String description;
	private Date createDate;
	private Date modifiedDate;
	private String startDate;
	private String stopDate;
	private Long activityImgId;
	private String activityImgURL;
	private Integer active_;
	private Integer viewCount;
	private String stopMessage;
	private String shopName;
	
	public Long getActivityId() {
		return activityId;
	}
	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}
	public Long getShopId() {
		return shopId;
	}
	public void setShopId(Long shopId) {
		this.shopId = shopId;
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
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getStopDate() {
		return stopDate;
	}
	public void setStopDate(String stopDate) {
		this.stopDate = stopDate;
	}
	public Long getActivityImgId() {
		return activityImgId;
	}
	public void setActivityImgId(Long activityImgId) {
		this.activityImgId = activityImgId;
	}
	public String getActivityImgURL() {
		return activityImgURL;
	}
	public void setActivityImgURL(String activityImgURL) {
		this.activityImgURL = activityImgURL;
	}
	public Integer getActive_() {
		return active_;
	}
	public void setActive_(Integer active_) {
		this.active_ = active_;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	/**
	 * @return the viewCount
	 */
	public Integer getViewCount() {
		return viewCount;
	}
	/**
	 * @param viewCount the viewCount to set
	 */
	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}
	/**
	 * @return the stopMessage
	 */
	public String getStopMessage() {
		return stopMessage;
	}
	/**
	 * @param stopMessage the stopMessage to set
	 */
	public void setStopMessage(String stopMessage) {
		this.stopMessage = stopMessage;
	}
	
}
