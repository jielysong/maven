package com.yx.app.admin.common.util;

import java.util.HashMap;
import java.util.Map;

public class ListTypeUtil {

	private static  Map<String,Map> listTypeMap = new HashMap<String,Map>();
	private static  Map<Integer,String> provinceMap = new HashMap<Integer,String>();
	private static  Map<Integer,Map<Integer,String>> cityMap = new HashMap<Integer,Map<Integer,String>>();
	private static  Map<String,Long> currentId =  new HashMap<String,Long>();
	
	public static Map<String, Map> getListTypeMap() {
		return listTypeMap;
	}

	public static void setListTypeMap(Map<String, Map> listTypeMap) {
		ListTypeUtil.listTypeMap = listTypeMap;
	}
	
	public static Map getMapByName(String name) {
		return ListTypeUtil.listTypeMap.get(name);
	}

	public static Map<Integer, String> getProvinceMap() {
		return provinceMap;
	}

	public static void setProvinceMap(Map<Integer, String> provinceMap) {
		ListTypeUtil.provinceMap = provinceMap;
	}
		
	/*
	 * 根据pId获取省名
	 * */
	public static String getProvinceByPId(String pId) {
		return ListTypeUtil.provinceMap.get(pId);
	}
	

	public static Map<Integer, Map<Integer, String>> getCityMap() {
		return cityMap;
	}

	public static void setCityMap(Map<Integer, Map<Integer, String>> cityMap) {
		ListTypeUtil.cityMap = cityMap;
	}

	public static Map<String, Long> getCurrentId() {
		return currentId;
	}

	public static void setCurrentId(Map<String, Long> currentId) {
		ListTypeUtil.currentId = currentId;
	}

	

}
