/**
 * 
 */
package com.yx.app.admin.model;

import java.io.Serializable;
import java.util.List;

/**************************************************************************************************************
 * @author：LJ
 * Date：2014年6月23日
 * Description: 
 * Company：中交讯通
 * Group:Java Development ServerGroup 
 * Copyright: Copyright (c) 2014
 * @version 1.3
 **************************************************************************************************************
 */

public class Page implements Serializable {
	
	public static final String DEFAULT_PAGE_SIZE = "20";
	public static final String DEFAULT_CURRENT_PAGE = "1";
	
	private Integer rows;//每页显示的记录数  
    
    private Integer page;//当前第几页  
    
    private List<Object> objects;
    
    int number;  
    //每页的开始记录  第一页为1  第二页为number +1   
    int start ;  
    
    

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public List<Object> getObjects() {
		return objects;
	}

	public void setObjects(List<Object> objects) {
		this.objects = objects;
	}


	public int getNumber() {
		int intPage = (page == null || page == 0) ? 1:page;  
        //每页显示条数  
        int number = (rows == null || rows == 0) ? 20:rows;  
        //每页的开始记录  第一页为1  第二页为number +1   
        int start = (intPage-1)*number; 
		return number;
	}

	

	public int getStart() {
		int intPage = (page == null || page == 0) ? 1:page;  
        //每页显示条数  
        int number = (rows == null || rows == 0) ? 20:rows;  
        //每页的开始记录  第一页为1  第二页为number +1   
        int start = (intPage-1)*number; 
		return start;
	}
	
	public void setNumber(int number) {
		this.number = number;
	}

	public void setStart(int start) {
		this.start = start;
	}


}
