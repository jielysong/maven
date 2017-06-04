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

import java.util.Date;

/**
 *
 */
public class ShopBeacon {

	private Long shopId;
	
	private Long beaconId;
	
	private Long companyId;
	
	private Date createDate;
	
	private Date updateDate;

	public Long getShopId() {
		return shopId;
	}

	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}

	public Long getBeaconId() {
		return beaconId;
	}

	public void setBeaconId(Long beaconId) {
		this.beaconId = beaconId;
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

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	
}
