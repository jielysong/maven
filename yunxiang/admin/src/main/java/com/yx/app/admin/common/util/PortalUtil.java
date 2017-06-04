/**************************************************************************************************************
 * @author：huangjianyi
 * Date：2014年7月8日
 * Description: 
 * Company：中交讯通
 * Group:Java Development ServerGroup 
 * Copyright: Copyright (c) 2014
 * @version 1.3
 **************************************************************************************************************
 */
package com.yx.app.admin.common.util;

import java.io.File;
import java.text.DecimalFormat;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

/**
 *
 */
public class PortalUtil implements ServletContextAware{
	private static ServletContext servletContext;
	private static String appPath="app/";
	private static String imagePath="picture1/";
	
	public void setServletContext(ServletContext sc) {
	    this.servletContext=sc;
	}
	public static String getTomcatPath() {
		String realpath = servletContext.getRealPath("/") + "/../../";
		return realpath;
	}

	public static String getUploadTempFileRoot() {
		String tomcatPath = getTomcatPath();
		return tomcatPath+ "../data/temp";
	}

	public static String getUploadTempPicturePath(String fileName) {
		String tomcatPath = getTomcatPath();
		return tomcatPath+ "../data/temp/"+imagePath+fileName;
	}
	
	public static String getUploadTempAppPath(String fileName) {
		String tomcatPath = getTomcatPath();
		return tomcatPath+ "../data/temp/"+appPath+fileName;
	}
	
	public static String getFileRoot() {
		String tomcatPath = getTomcatPath();
		return tomcatPath+ "../data/";
	}
	
	public static String getAppPath(String fileName){
		String basePath=getFileRoot()+appPath+fileName;
		return basePath;
	}

	public static String getPicturePath(String fileName){
		String basePath=getFileRoot()+imagePath+fileName;
		return basePath;
	}
	
	public static String getAppPath(Long fileEntryId,String fileName){
		String basePath=getFileRoot()+appPath+fileEntryId+"/"+fileName;
		return basePath;
	}
	
	public static String getPicturePath(Long fileEntryId,String fileName){
		String basePath=getFileRoot()+imagePath+fileEntryId+"/"+fileName;
		return basePath;
	}
	
	public static void deleteFile(String fileName){
    	String prefix=fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase(); 
    	String basePath=getFileRoot();
    	if (prefix!=null && !prefix.equals("") && (prefix=="apk" || prefix.equals("apk"))){
    		basePath=basePath+appPath;
    	}else{
    		basePath=basePath+imagePath;
    	}
		File file =new File(basePath+fileName);
		// 路径为文件且不为空则进行删除
		if (file.isFile() && file.exists()) {
			file.delete(); 
		}
	}
	
	/*
	 * 文件大小转换
	 * 
	 * */
	public static String covertFileSize(Float fileSize){
		if (fileSize!=null && !fileSize.equals("") && fileSize!=0.0){
			DecimalFormat df = new DecimalFormat("#.00");
			String fileSizeString = "";
			if (fileSize < 1024) {
				fileSizeString = df.format((double) fileSize) + "B";
			} else if (fileSize < 1048576) {
				fileSizeString = df.format((double) fileSize / 1024) + "K";
			} else if (fileSize < 1073741824) {
				fileSizeString = df.format((double) fileSize / 1048576) + "M";
			} else {
				fileSizeString = df.format((double) fileSize / 1073741824) + "G";
			}
			return fileSizeString;
		}
		return null;
	}
	public static ServletContext getServletContext() {
		return servletContext;
	}

}