/**
 * 
 */
package com.yx.app.admin.model;

import java.io.Serializable;

/**************************************************************************************************************
 * @author： huangjianyi
 * Date：2014年6月20日
 * Description: 城市对象
 * Company：中交讯通
 * Group:Java Development ServerGroup 
 * Copyright: Copyright (c) 2014
 * @version 1.3
 **************************************************************************************************************
 */


public class City implements Serializable {

	private int cId;
	
	private String cName;
	
	private String cPostcode;

	private int pId;

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}


	public String getcPostcode() {
		return cPostcode;
	}

	public void setcPostcode(String cPostcode) {
		this.cPostcode = cPostcode;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}
	
	
}
