package com.yx.app.admin.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @description 提现记录表
 * @author JIANGGERONG
 * @email: jianggerong@yunxianglife.com
 * @date 创建时间：2015年12月7日下午7:50:30
 */
public class Withdraw implements Serializable{
	/** 
	 * serialVersionUID:
	 */  
	private static final long serialVersionUID = 1L;
	/**
	 * withdrawId:提现ID
	 */
	private String withdrawId;// 提现id
	/**
	 * accountId:转账帐号id
	 */
	private Long  accountId;// 体现到的帐号id
	/**
	 * withdrawMoney:提现金额
	 */
	private Double withdrawMoney;// 提现金额
	/**
	 * withdrawStatus:提现状态(0=申请中;1=成功;2=失败)
	 */
	private Integer withdrawStatus;
	/**
	 * shopId:商店id
	 */
	private Long shopId;
	/**
	 * userId:商家申请提现人id
	 */
	private Long userId;
	/**
	 * userName:商家申请提现人名
	 */
	private String userName;
	/**
	 * customerId:用户申请提现人id
	 */
	private Long customerId;
	/**
	 * customerName:用户申请提现人名
	 */
	private String customerName;
	/**
	 * withdrawDate:提现申请时间
	 */
	private String withdrawDate;
	/**
	 * approveUserId:审批人
	 */
	private Long approveUserId;
	/**
	 * approveUserName:审批人名
	 */
	private String approveUserName;
	/**
	 * approveDate:审批时间
	 */
	private Date approveDate;
	/**
	 * approveDesc:审批信息
	 */
	private String approveDesc;
	/**
	 * remark:
	 */
	private String remark;
	public String getWithdrawId() {
		return withdrawId;
	}
	public Long getAccountId() {
		return accountId;
	}
	public Double getWithdrawMoney() {
		return withdrawMoney;
	}
	public Integer getWithdrawStatus() {
		return withdrawStatus;
	}
	public Long getShopId() {
		return shopId;
	}
	public Long getUserId() {
		return userId;
	}
	public String getUserName() {
		return userName;
	}
	public Long getCustomerId() {
		return customerId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public String getWithdrawDate() {
		return withdrawDate;
	}
	public Long getApproveUserId() {
		return approveUserId;
	}
	public String getApproveUserName() {
		return approveUserName;
	}
	public Date getApproveDate() {
		return approveDate;
	}
	public String getApproveDesc() {
		return approveDesc;
	}
	public String getRemark() {
		return remark;
	}
	public void setWithdrawId(String withdrawId) {
		this.withdrawId = withdrawId;
	}
	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}
	public void setWithdrawMoney(Double withdrawMoney) {
		this.withdrawMoney = withdrawMoney;
	}
	public void setWithdrawStatus(Integer withdrawStatus) {
		this.withdrawStatus = withdrawStatus;
	}
	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public void setWithdrawDate(String withdrawDate) {
		this.withdrawDate = withdrawDate;
	}
	public void setApproveUserId(Long approveUserId) {
		this.approveUserId = approveUserId;
	}
	public void setApproveUserName(String approveUserName) {
		this.approveUserName = approveUserName;
	}
	public void setApproveDate(Date approveDate) {
		this.approveDate = approveDate;
	}
	public void setApproveDesc(String approveDesc) {
		this.approveDesc = approveDesc;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

	
}
