﻿<%@page import="org.apache.taglibs.standard.tag.common.core.ForEachSupport"%>
<%@page import="java.util.List"%>
<%@page import="com.yx.app.admin.model.Menu"%>
<%@page import="com.yx.app.admin.model.User"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理平台</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.7.2.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/demo.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script> 
<style>
* {
text-decoration:none;
}

</style>
</head>

<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:70px;background-color:#056cb4;padding:10px">
	<img src="<%=request.getContextPath()%>/images/logo.png" style="margin-top:0;margin-left:10px;width:65px;height:50px;" /> 
	<div style="margin-top:-35px;margin-left:80px;"> 
<!-- 		<img  src="images/logoShu.png" style="height:30px;"/> -->
<!-- 		<div style="margin-left:20px;margin-top:-23px;color:#FFFFFF" >缔造移动互联网第一价值媒体</div> -->
	</div>
	</div>
	<div data-options="region:'west',split:true,title:'菜单'" style="width:199px;padding:1px;">
	
	 <div class="easyui-accordion" style="width:190px;height:480px;">
	 <%
	 //session = request.getSession();
	 List<Menu> userMenus = (List<Menu>)session.getAttribute("menu");
	 Menu tmpMenu = null;
	 for (int i =0;i<userMenus.size();i++) {%>
		 <%
		 Menu menu = userMenus.get(i);		 
		 if(menu.getLevel()==1){
			 //一级菜单不是第一个并且上节点是三级菜单的需要增加</ul>结束符
		    if(i!=0&&userMenus.get(i-1).getLevel()==3){%>
		     </ul>
		     </li> 
             </ul>
             </div>
             
		    <%}else if(i!=0){//一级菜单不是第一个的情况要 </li></ul></div>%>
		     </li> 
             </ul>
             </div>
		     <%}%>
			<div title="<%=menu.getMenuName()%>" data-options="iconCls:'icon-ok'" style="padding:10px;">
				<ul class="easyui-tree">
						
			 <%//第一个一级菜单当子节点有三级菜单时需要增加li开始
			 if(userMenus.get(i+1)!=null&&userMenus.get(i+1).getLevel()==2&&userMenus.get(i+1).getUrl().equals("#")){%>
		       <li>
             
		    <%}%>
		<%}else if(menu.getLevel()==2&&menu.getUrl().equals("#")){
			    //无URL的二级菜单在不是第一个的情况下都需要有 <ul><li>的结束和<li>的开始
		        if(userMenus.get(i-1).getParentId()!=0){%>
		        
		        </ul>
		        </li>
		        <li> 
		        <%}%> 
		         	
			<span><%=menu.getMenuName()%></span>
		    <ul>
		    		    
		<%}else if(menu.getLevel()==2&&!menu.getUrl().equals("#")){%>
		
		    
			<li><a href="../<%=menu.getUrl() %>" target="main"><%=menu.getMenuName() %></a></li>

		<%}else if(menu.getLevel()==3){%>
		
		<li><a href="<%=menu.getUrl() %>" target="main"><%=menu.getMenuName() %></a></li>
		
		<%} 		
	 }%>
	 
	 </li> 
     </ul>
     </div>
	 
	
	</div>
	</div>
	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;"> </div>
	<div data-options="region:'south',border:false" style="height:50px;background:#fff;padding:10px;"> </div>
	<div data-options="region:'center',title:'内容 <div style=position:absolute;right:150px;margin-top:-15px>登录用户:<%=((User)session.getAttribute("user")).getUserName()%></div><a style=position:absolute;right:40px;margin-top:1px href=logout>退出</a>'"><iframe width="100%" scrolling="auto" height="100%" frameborder="false" allowtransparency="true" style="border: medium none;" src="main.jsp" id="rightMain" name="main"></iframe></div>
</body>
<script>
	window.onload=function(){
		
		var session='<%=request.getSession()%>'
		if(session!=null){
			/* location.href = "http://" + window.location.host
			+ "/crm_web/login_new.html"; */ 
		}else{
			var top = getTopWinow(); //获取当前页面的顶层窗口对象
			var x=5;
			$.messager.alert("系统提示（"+x+"秒后自动跳转至登录界面）", "登录超时-请重新登录！", "info",function(){
				location.href='<%=request.getContextPath()%>'+"/login" 
			});
			
			getTime()
			//跳转到登陆页面
			
		}
		/* var sessionstatus = request.getResponseHeader("sessionstatus"); //通过XMLHttpRequest取得响应头,sessionstatus，
			if (sessionstatus == "timeout") {
				//如果超时就处理 ，指定要跳转的页面
				var top = getTopWinow(); //获取当前页面的顶层窗口对象
				$.messager.alert("我的消息", "登录超时-请重新登录！", "info");
				top.location.href = "http://" + window.location.host
						+ "/crm_web/login_new.html"; //跳转到登陆页面
			} */
	}
	/**
	* 在页面中任何嵌套层次的窗口中获取顶层窗口
	* @return 当前页面的顶层窗口对象
	*/
	function getTopWinow(){
	var p = window;
	while(p != p.parent){
	p = p.parent;
	}
	return p;
	} 
	var i = 5;
	function getTime() {
		i -= 1;
		var x = setTimeout('getTime()', 1000)
		if (i <= 0) {
			clearTimeout(x);
			location.href='<%=request.getContextPath()%>'+"/login" 
		}
	}
</script>
</html>