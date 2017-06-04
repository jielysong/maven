/**************************************************************************************************************
 * @author：ghb
 * Date：2015年8月17日
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
import java.util.HashMap;
import java.util.Map;

import com.yx.app.admin.common.util.ListTypeUtil;

/**
 *
 */
public class Shop implements Serializable {

	private Long shopId;
	
	private String shopName;
	
	private Integer pId;
	
	private Integer cId;
	
	private Integer dId;
	
	private String street;
	
	private Long onwerId;
	
	private String onwerName;
	
	private Long companyId;
	
	private Date createDate;
	
	private Date modifiedDate;
	
	private Integer typeId;
	
	private String pName;
	
	private String cName;
	
	private String dName;
	
	private Integer beaconNum;
	
	private String bannerImages;
	
	private String companyName;
	
	private Long smallImageId;
	
	private String smallImageURL;

	public Integer getBeaconNum() {
		return beaconNum;
	}

	public void setBeaconNum(Integer beaconNum) {
		this.beaconNum = beaconNum;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
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

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		if (pId !=null && !pId.equals("")){
			Map<Integer,String> provinceMap = ListTypeUtil.getProvinceMap();  
			this.setpName(provinceMap.get(pId));
		}
		this.pId = pId;
	}

	public Integer getcId() {
		return cId;
	}

	public void setcId(Integer cId) {
		if (cId !=null && !cId.equals("") && this.getpId() !=null && !this.getpId().equals("")){
			Map<Integer, Map<Integer, String>> provinceMap = ListTypeUtil.getCityMap();
			HashMap<Integer,String> map=(HashMap<Integer,String>)provinceMap.get(this.getpId()); 
			this.setcName(map.get(cId));
		}
		this.cId = cId;
	}

	public Integer getdId() {
		return dId;
	}

	public void setdId(Integer dId) {
		this.dId = dId;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public Long getOnwerId() {
		return onwerId;
	}

	public void setOnwerId(Long onwerId) {
		this.onwerId = onwerId;
	}

	public String getOnwerName() {
		return onwerName;
	}

	public void setOnwerName(String onwerName) {
		this.onwerName = onwerName;
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

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getBannerImages() {
		return bannerImages;
	}

	public void setBannerImages(String bannerImages) {
		this.bannerImages = bannerImages;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Long getSmallImageId() {
		return smallImageId;
	}

	public void setSmallImageId(Long smallImageId) {
		this.smallImageId = smallImageId;
	}

	public String getSmallImageURL() {
		return smallImageURL;
	}

	public void setSmallImageURL(String smallImageURL) {
		this.smallImageURL = smallImageURL;
	}
	
	
}
