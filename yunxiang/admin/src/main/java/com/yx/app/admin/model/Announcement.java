package com.yx.app.admin.model;

import java.io.Serializable;
import java.util.Date;

public class Announcement implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * id_:公告id
	 */
	private Long id;
	/**
	 * shopId:商铺id
	 */
	private Long shopId;
	/**
	 * shopName:商铺名称
	 */
	private String shopName;
	/**
	 * content:公告内容
	 */
	private String content;
	/**
	 * userId:商家用户id
	 */
	private Long userId;
	/**
	 * userId:用户id
	 */
	private Long customerId;
	/**
	 * userName:商家用户名称
	 */
	private String userName;
	/**
	 * createDate:创建日期
	 */
	private Date createDate;
	/**
	 * type:分类
	 */
	private Integer type;
	/**
	 * imageId:公告图片Id
	 */
	private Long imageId;
	/**
	 * imageUrl:公告图片名称
	 */
	private String imageUrl;
	private String firstTime;
	private String lastTime;
	public Long getShopId() {
		return shopId;
	}

	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Message [id=" + id + ", shopId=" + shopId + ", content=" + content + ", userId=" + userId
				+ ", userName=" + userName + ", createDate=" + createDate + "]";
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the imageId
	 */
	public Long getImageId() {
		return imageId;
	}

	/**
	 * @param imageId
	 *            the imageId to set
	 */
	public void setImageId(Long imageId) {
		this.imageId = imageId;
	}

	/**
	 * @return the imageUrl
	 */
	public String getImageUrl() {
		return imageUrl;
	}

	/**
	 * @param imageUrl
	 *            the imageUrl to set
	 */
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	/**
	 * @return the customerId
	 */
	public Long getCustomerId() {
		return customerId;
	}

	/**
	 * @param customerId the customerId to set
	 */
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	/**
	 * @return the lastTime
	 */
	public String getLastTime() {
		return lastTime;
	}

	/**
	 * @param lastTime the lastTime to set
	 */
	public void setLastTime(String lastTime) {
		this.lastTime = lastTime;
	}

	/**
	 * @return the firstTime
	 */
	public String getFirstTime() {
		return firstTime;
	}

	/**
	 * @param firstTime the firstTime to set
	 */
	public void setFirstTime(String firstTime) {
		this.firstTime = firstTime;
	}

}
