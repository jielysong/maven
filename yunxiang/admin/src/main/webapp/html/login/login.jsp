<%@ page import="com.yx.app.admin.common.util.ListTypeUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>登录页面</title>
<link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery.tinywatermark-3.1.0.min.js"></script>


<script type="text/javascript">
    //登录界面居中显示 2013-12-25 黄现伟
    function bodyH() {
        var b = $(".wrapH").height();
        var w = $(window).height();
        var p = (w - b) / 2 + "px";

        if (w > b) {
            $("body").css({ "padding-top": p });

        } else {
            $("body").css({ "padding-top": 0 });
        }
    }
    
    $(function () {
    	$("#username").watermark("loginInput","请输入用户名");
    	$("#password").watermark("loginInput","请输入登录密码");
        bodyH();
    });
    
    $(window).resize(function () {
        bodyH();
    }); 
    
    
    function login(){
    	if($("#username").val() =="" || $("#username").val()=="请输入用户名" ||$("#password").val()=="" || $("#password").val()=="请输入登录密码"){
    		$("#error_message").html("用户名密码不能为空!");
    		return;
    	}   		
      	$("#loginform").submit();
    }
    
    
</script>
<style type="text/css">

	.error_message{
		text-align: center;
		margin-top:10px;	
		height:20px;
		font-size:14px;
		color:red;
	}
	
	
	.loginInput{
		color:#666666;
	}
</style>
</head>

<body class="wrapH">
	<div>
    	<div class="logo-box">
    		<a class="logo" href="#">后台管理系统</a>
        </div>
    	<div class="img-box">
        	<div class="content">
            	<img src="<%=request.getContextPath()%>/images/images.png";>
                <ul class="rightContent">
                	<li class="content-text"> <span>“来吧”是一款由北京云享时代网络科技有限公司开发的APP应用平台，”来吧”专注于实现场景智能应用，平台弥补了其他APP只能“远”不能“近”，所产生的用户参与感的不足，通过远景与现场的智能场景应用，真正实现了传统商铺与移动网络的完美结合。从而全面无死角的完成用户与商户的自由对接与沟通。通过平台的场景应用+场景支付+客户关系系统全力实现城市智慧商圈规划与实施。</span></li>
                	<dl class="login-box">
                    	<dd class="ueseLogin">用户登录</dd>
                        <dd class="solidBox"></dd>
                        <form method="post" action="login" class="seach" id="loginform">
                        	<input  type="text" name="username" id="username" class="user" autocomplete="off">
                            <br/>
                            <label class="lost">
                            	<a href="#" class="forgetWD">忘记密码了？</a>
                            </label>
                            <br/>
                           	<input type="password" name="password" id="password" class="pass" >
                            <br/>
                            <div class="login-submit">
                            	<div class="error_message">
	                            	<span id="error_message">
	                            		<c:out value="${msg}"/>
	                            	</span>
                            	</div>
                            	<a class="submit" onclick="login();">登&nbsp;&nbsp;录</a>
                            </div>
                        </form>
                         <script> 
// 							$(".submit").mouseenter(function(){
// 								$(this).css({"background-color":"#000"})
// 							})
                        </script>
                        <ul class="merchants">
                        	<li><a href="#" class="leftMerchants">客户下载</a></li>
                            <li><a href="#" class="rightMerchants">商家注册</a></li>
                        </ul>
                    </dl>
                </ul>
            </div>
        </div>
        <div class="footer">版权所有：北京云享时代网络科技有限公司</div>
    </div>
</body>
</html>
