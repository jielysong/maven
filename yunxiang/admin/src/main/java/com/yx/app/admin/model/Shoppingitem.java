package com.yx.app.admin.model;

import java.io.Serializable;
import java.util.Date;
 
public class Shoppingitem implements Serializable {
 
	private static final long serialVersionUID = 1L;
 
	private Long itemId;
	private Long companyId;
	private Long userId;
	private String userName;
	private Date createTime;
	private Date updateTime;
	private Long categoryId; 
	private String code_; 
	private String name;
	private String description;
	
	private String properties;
	private Double price;
	private Integer discount;
	private Integer taxable;
	private Double shipping;
	private Integer requiresShipping; 
	private Integer stockQuantity;
	private Integer featured_; 
	private Integer sale_;
	
	private Long smallImageId;
	private String smallImageURL;
	private Long mediumImageId;
	private String mediumImageURL;
	private Long largeImageId; 
	private String largeImageURL;
	
	private String shopId;
	private String shopName;
	private String categoryName;
	
	public Long getItemId() {
		return itemId;
	}
	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}
	public Long getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
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
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public String getCode_() {
		return code_;
	}
	public void setCode_(String code_) {
		this.code_ = code_;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getProperties() {
		return properties;
	}
	public void setProperties(String properties) {
		this.properties = properties;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getDiscount() {
		return discount;
	}
	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
	public Integer getTaxable() {
		return taxable;
	}
	public void setTaxable(Integer taxable) {
		this.taxable = taxable;
	}
	public Double getShipping() {
		return shipping;
	}
	public void setShipping(Double shipping) {
		this.shipping = shipping;
	}
	public Integer getRequiresShipping() {
		return requiresShipping;
	}
	public void setRequiresShipping(Integer requiresShipping) {
		this.requiresShipping = requiresShipping;
	}
	public Integer getStockQuantity() {
		return stockQuantity;
	}
	public void setStockQuantity(Integer stockQuantity) {
		this.stockQuantity = stockQuantity;
	}
	public Integer getFeatured_() {
		return featured_;
	}
	public void setFeatured_(Integer featured_) {
		this.featured_ = featured_;
	}
	public Integer getSale_() {
		return sale_;
	}
	public void setSale_(Integer sale_) {
		this.sale_ = sale_;
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
	public Long getMediumImageId() {
		return mediumImageId;
	}
	public void setMediumImageId(Long mediumImageId) {
		this.mediumImageId = mediumImageId;
	}
	public String getMediumImageURL() {
		return mediumImageURL;
	}
	public void setMediumImageURL(String mediumImageURL) {
		this.mediumImageURL = mediumImageURL;
	}
	public Long getLargeImageId() {
		return largeImageId;
	}
	public void setLargeImageId(Long largeImageId) {
		this.largeImageId = largeImageId;
	}
	public String getLargeImageURL() {
		return largeImageURL;
	}
	public void setLargeImageURL(String largeImageURL) {
		this.largeImageURL = largeImageURL;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	
}
