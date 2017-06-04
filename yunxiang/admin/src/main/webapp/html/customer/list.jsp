<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据内容页面</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/themes/icon.css"> 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/demo.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/userManage.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/swfUpload.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/easyui/easyui-lang-zh_CN.js"></script>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/swf/swfupload.js"></script>   
<script type="text/javascript" src="<%=request.getContextPath() %>/js/swf/swfupload.queue.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath() %>/js/swf/handlers.js"></script>   --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/userManage/userManage.js"></script>  --%>

</head>
<body>

	<table id="dg" class="easyui-datagrid" title="顾客管理"   toolbar="#toolbar"
			data-options="remoteSort:false,fit: true,loadMsg:'数据加载中，请稍后...',singleSelect:true,url:'../customer/getData',rownumbers:true,pagination:true,pageSize:20">
        <thead>
            <tr>
               <!--  <th data-options="field:'headerImage',sortable:true,formatter:showImage,width:160,align:'center'">头像</th> -->
                <th data-options="field:'customerName',sortable:true,width:100,align:'center'">登陆名</th>
				<th data-options="field:'screenName',sortable:true,width:140,align:'center'">用户名</th>	
                <th data-options="field:'emailAddress',sortable:true,width:160,align:'center'">Email</th>
				
				<th data-options="field:'failedLoginAttempts',sortable:true,width:70,align:'center'">错误次数</th>
				<th data-options="field:'lastFailedLoginDate',sortable:true,width:70,align:'center'">错误时间</th>
				<th data-options="field:'lockout',sortable:true,width:70,align:'center'" formatter="formatlockout">锁定状态</th>
				<th data-options="field:'lockoutDate',sortable:true,width:70,align:'center'">锁定时间</th>
								
				<th data-options="field:'company',sortable:true,width:100,align:'center'" formatter="formatCompany">公司名</th>
				<th data-options="field:'status',sortable:true,width:130,align:'center'" formatter="formatActive">状态</th>			           
                <th data-options="field:'createDate',sortable:true,width:150,align:'center'">注册时间</th>
				<th data-options="field:'modifiedDate',sortable:true,width:150,align:'center'">修改时间</th>
              
            </tr>
        </thead>
	</table>
	<div id="toolbar" style="padding:5px;height:auto">
		
		<div style="margin-bottom:5px">
      			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newCustomer()">添加</a>
		 		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editCustomer()">修改</a> 
		 		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroy()">删除</a>
    	</div>
    	
    	<div>
			登陆名:
			<input name="query_customerName" id="query_customerName" class="easyui-validatebox" data-options="validType:'maxLength[10]'">
			用户名:
			<input name="query_screenName" id="query_screenName" class="easyui-validatebox" data-options="validType:'maxLength[20]'">		
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'"
        		onclick="javascript:datasearch()">查询</a>
		</div> 
		
	</div>
	
	<div id="dlg" class="easyui-dialog"  style="width:380px;height:460px;"
            closed="true" buttons="#dlg-buttons" data-options="iconCls:'icon-save',modal:true">
        <form id="fm" method="post" >
         <input class="easyui-validatebox" type="hidden" id="headerIcon" name="headerImage" ></input>
         <input class="easyui-validatebox" type="hidden" id="customerId" name="customerId" ></input>
         <input class="easyui-validatebox" type="hidden" id="stampIcon" name="stampImage" ></input>
		    <div class="easyui-layout" style="width:326px;height:360px;">
		        <div data-options="region:'center',iconCls:'icon-ok'">
		            <div class="uploadRightTitle">个人资料信息：</div>
		            <div class="fitem">
		                <label>登陆名:</label>
		                <input class="easyui-validatebox" required="true" type="text" name="customerName" id="inputCustomerName"></input>
		            </div>
		            <div class="fitem">
		                <label>用户名:</label>
		                <input class="easyui-validatebox" required="true" type="text" name="screenName" ></input>
		            </div>
		            <div class="fitem">
		                <label>公司:</label>
		                <input class="easyui-validatebox queryTitle" type="text" id="callSelectCompanyId" readonly=true name="callSelectCompanyId" style="width:130px"/>
		    			<input class="easyui-validatebox" type="hidden" id="companyId" name="companyId" ></input>
		            </div>
		            <%-- 
		            <div class="fitem">
		                <label>公司:</label>
		                <input class="easyui-combobox" id="companyId" name="companyId" data-options="url:'<%=request.getContextPath() %>/company/getCompany', method:'get',valueField:'companyId',textField:'companyName',height:'100px',editable:false" required="true"/>
		            </div> --%>
		            
		            <div class="fitem">
		                <label>Email:</label>
		                <input class="easyui-validatebox" required="true" type="text" name="emailAddress"  validType="email"></input>
		            </div>
		            <div class="fitem">
		                <label>密码:</label>
		                <input class="easyui-validatebox" required="true" type="password" name="password_"  id="password" validType="pwlength"></input>
		            </div>
		            <div class="fitem">
		                <label>确认密码:</label>
		                <input class="easyui-validatebox" required="true" type="password" name="repassword" id="repassword"  validType="equalTo['#password']"></input>
		            </div>
		      <!--  <div class="fitem">
		                <label>错误次数:</label>
		                <input class="easyui-validatebox" required="true" type="text" name="failedLoginAttempts" ></input>
		            </div> -->
		            <div class="fitem">
		               <label>锁定状态:</label>
		               <select class="easyui-combobox" name="lockout" required="true" style="width:138px;" data-options="multiple:false,panelHeight:'auto',editable:false" >  
						    <option value="0" selected="selected">否</option>
			    	        <option value="1">是</option>
					   </select>
		            </div>
		            <div class="fitem">
						<label>状态:</label>
						<select name="status" id="active" style="width:140px">
							<option value="0">不可用</option>
							<option value="1" selected="selected">可用</option>
						</select>
					</div>
		        </div>
		    </div>
        </form>
    </div>

	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
	<!-- 选择站点 -->
	<div id="selectServerManage" class="easyui-dialog" style="width:500px;height:300px" closed="true" buttons="#selectServerManage-buttons"
	     data-options="iconCls:'icon-save',toolbar:'#selectServerManageTb',modal:true" >
		<div class="selectServerManageList">
		 <ul id="selectServerManageUl">
	  
		 </ul>
		</div>
	</div>	
	<div id="selectServerManage-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" id="determineSelect" onclick="determineSelect()">确定</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#selectServerManage').dialog('close')">取消</a>
	</div>

   <div id="selectCompanyManageTb" style="padding:5px;height:auto">
		<div>
		              公司名称: <input class="easyui-validatebox" name="inputCompany" type="text" style="width:100px" id="inputCompany"/> 
		    <input type="hidden" id="inputCompanyId" name="inputCompanyId" ></input>
		    <input type="text" id="inputCompanyIdButton" class="easyui-linkbutton" onclick="doSearch()" style="width:55px;height:20px;" value="查询"/>
		</div>
	</div>
	<!-- 选择公司 -->
	<div id="selectCompanyManage" class="easyui-dialog" style="width:670px;height:300px" closed="true" buttons="#selectCompanyManage-buttons"
	     data-options="iconCls:'icon-save',toolbar:'#selectCompanyManageTb',modal:true" >
		<div class="selectServerManageList">
		 <ul id="selectCompanyManageUl">
	  
		 </ul>
		</div>
	</div>	
	<div id="selectCompanyManage-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" id="determineSelectCompany" onclick="determineSelectCompany()">确定</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#selectCompanyManage').dialog('close')">取消</a>
	</div>
		 	
	<script type="text/javascript">
	function determineSelectCompany(){
		var companyId=$('input:radio[name="selectCompanyIdCheck"]:checked').val();
		if (companyId==null || companyId==""){
			 $.messager.show({
	             title: '信息提示',
	             msg: "请选择公司!"
	         });
			 return;
		}
    	for (var i = 0; i < selectCompanyIdData.total; i++) {
    		if (selectCompanyIdData.rows[i].companyId==companyId){
    			$("input[name='callSelectCompanyId']").val(selectCompanyIdData.rows[i].companyName); 
    			$("input[name='companyId']").val(selectCompanyIdData.rows[i].companyId);
    		}
    	}

		$('#selectCompanyManage').dialog('close');
	};
	
	function doSearch(){

		var inputCompany = $("input[name='inputCompany']").val()==0 ? '' : $("input[name='inputCompany']").val(); 
		selectCompanyIdWin(inputCompany);
	};
	
	var selectCompanyIdData;   //所有的服务器信息
	var showCompanyIdColumn=4; //显示5列
    $("#callSelectCompanyId").focus(function(){
		
    	if (selectCompanyIdData==null){
    		selectCompanyIdWin();
    	}

    	if (selectCompanyIdData!=null){
    		var companyId=$('#companyId').val();
    		if (companyId!="" && companyId!=null) {
    			$('[name="selectCompanyIdCheck"]:radio').each(function(item) {
    				
    				var svalue=this.value;
    				if (companyId==svalue){
    					this.checked =true;
    				}else{
    					this.checked =false;
    				}
    	    		 
                });
    		}
    	}
    	
		$('#selectCompanyManage').dialog('open').dialog('setTitle', '选择公司');
	});

	function selectCompanyIdWin(inputCompany){
		$('#selectCompanyManageUl').empty();
		$('#selectCompanyManage').dialog('open').dialog('setTitle', '选择公司');
		$.ajax({
	        type: "post", 
	        url: "../company/getAllCompany", 
	        dataType: "json", 
	        data: {companyName:inputCompany},
	        success: function (data) {
	        	selectCompanyIdData=data;
	        	for (var i = 0; i < data.total; i++) {
	        		if (i%showCompanyIdColumn==(showCompanyIdColumn-1)){
	        			if (i==(showCompanyIdColumn-1)){
	        				$('#selectCompanyManageUl').append('<li class="selectServerManageListLi selectServerManageListLiR"><label><input name="selectCompanyIdCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].companyId+',\''+data.rows[i].companyName+'\')\" value=\"'+data.rows[i].companyId+'\" />'+data.rows[i].companyName+'</label></li>'); 
	        			}else{
	        				$('#selectCompanyManageUl').append('<li class="selectServerManageListLiR"><label><input name="selectCompanyIdCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].companyId+',\''+data.rows[i].companyName+'\')\" value=\"'+data.rows[i].companyId+'\" />'+data.rows[i].companyName+'</label></li>'); 
	        			}
	        		}else{
	        			if (i<showCompanyIdColumn-1 && data.total-1==i){
	        				$('#selectCompanyManageUl').append('<li class="selectServerManageListLi selectServerManageListLiR"><label><input name="selectCompanyIdCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].companyId+',\''+data.rows[i].companyName+'\')\" value=\"'+data.rows[i].companyId+'\" />'+data.rows[i].companyName+'</label></li>'); 
	        				continue;
	        			}
	        			if (data.total-1==i){
	        				$('#selectCompanyManageUl').append('<li class="selectServerManageListLiR"><label><input name="selectCompanyIdCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].companyId+',\''+data.rows[i].companyName+'\')\" value=\"'+data.rows[i].companyId+'\" />'+data.rows[i].companyName+'</label></li>'); 
	        			}else{
	        				if (i<(showCompanyIdColumn-1)){
	        					$('#selectCompanyManageUl').append('<li class="selectServerManageListLi"><label><input name="selectCompanyIdCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].companyId+',\''+data.rows[i].companyName+'\')\" value=\"'+data.rows[i].companyId+'\" />'+data.rows[i].companyName+'</label></li>'); 
	        				}else{
	        					$('#selectCompanyManageUl').append('<li ><label><input name="selectCompanyIdCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].companyId+',\''+data.rows[i].companyName+'\')\" value=\"'+data.rows[i].companyId+'\" />'+data.rows[i].companyName+'</label></li>'); 
	        				}
	        			}
	        		}
	        	}

	        	var companyId=$('#companyId').val();
        		if (companyId!="" && companyId!=null) {
        			$('[name="selectCompanyIdCheck"]:radio').each(function(item) {
        				
        				var svalue=this.value;
        				if (companyId==svalue){
        					this.checked =true;
        				}else{
        					this.checked =false;
        				}
                    });
        		}
	        }, 
	        error: function (XMLHttpRequest, textStatus, errorThrown) {
	            alert(errorThrown); 
	        } 
		});
	};
	
	function formatlockout(value){
		if(value==1){
			return "是";
		}
		return "否";
	};
	
    $("#callSelectRoles").focus(function(){
		
    	if (selectData==null){
    		selectRolesWin();
    	}else{
    		for (var i = 0; i < selectData.total; i++) {
   	  		   $('input[name=selectServerCheck]').get(i).checked=false;
   		    }
    	}

    	if (selectData!=null){
    		var selectRoles=$('#selectRoles').val();
    		if (selectRoles!="" && selectRoles!=null) {
    			var selectValue=selectRoles.split(",");
    			for (var i = 0; i < selectData.total; i++) {
    				$('input[name=selectServerCheck]').get(i).checked=false;
    				for (var j = 0; j < selectValue.length ; j++) {
    					if ($('input[name=selectServerCheck]').get(i).value==selectValue[j]){
    	    			   $('input[name=selectServerCheck]').get(i).checked=true;
    	    			   continue;
    		    		}
    				}
    			}
    		}
    	}
    	
		$('#selectServerManage').dialog('open').dialog('setTitle', '选择角色');
	});
    
	var selectData;   //所有的服务器信息
	var showColumn=3; //显示5列
	var state=false;
	function selectRolesWin(){
		$('#selectServerManageUl').empty();
		$('#selectServerManage').dialog('open').dialog('setTitle', '选择角色');
		$.ajax({
	        type: "post", 
	        url: "../role/getUserRole", 
	        dataType: "json", 
	        data: {},
	        success: function (data) {
	        	selectData=data;
	        	for (var i = 0; i < data.total; i++) {
	        		if (i%showColumn==(showColumn-1)){
	        			if (i==(showColumn-1)){
	        				$('#selectServerManageUl').append('<li class="selectServerManageListLi selectServerManageListLiR"><label><input name="selectServerCheck" type="checkbox" onclick="changePageCheck(this,'+data.rows[i].roleId+',\''+data.rows[i].roleName+'\')\" value=\"'+data.rows[i].roleId+'\" />'+data.rows[i].roleName+'</label></li>'); 
	        			}else{
	        				$('#selectServerManageUl').append('<li class="selectServerManageListLiR"><label><input name="selectServerCheck" type="checkbox" onclick="changePageCheck(this,'+data.rows[i].roleId+',\''+data.rows[i].roleName+'\')\" value=\"'+data.rows[i].roleId+'\" />'+data.rows[i].roleName+'</label></li>'); 
	        			}
	        		}else{
	        			if (i<showColumn-1 && data.total-1==i){
	        				$('#selectServerManageUl').append('<li class="selectServerManageListLi selectServerManageListLiR"><label><input name="selectServerCheck" type="checkbox" onclick="changePageCheck(this,'+data.rows[i].roleId+',\''+data.rows[i].roleName+'\')\" value=\"'+data.rows[i].roleId+'\" />'+data.rows[i].roleName+'</label></li>'); 
	        				continue;
	        			}
	        			if (data.total-1==i){
	        				$('#selectServerManageUl').append('<li class="selectServerManageListLiR"><label><input name="selectServerCheck" type="checkbox" onclick="changePageCheck(this,'+data.rows[i].roleId+',\''+data.rows[i].roleName+'\')\" value=\"'+data.rows[i].roleId+'\" />'+data.rows[i].roleName+'</label></li>'); 
	        			}else{
	        				if (i<(showColumn-1)){
	        					$('#selectServerManageUl').append('<li class="selectServerManageListLi"><label><input name="selectServerCheck" type="checkbox" onclick="changePageCheck(this,'+data.rows[i].roleId+',\''+data.rows[i].roleName+'\')\" value=\"'+data.rows[i].roleId+'\" />'+data.rows[i].roleName+'</label></li>'); 
	        				}else{
	        					$('#selectServerManageUl').append('<li ><label><input name="selectServerCheck" type="checkbox" onclick="changePageCheck(this,'+data.rows[i].roleId+',\''+data.rows[i].roleName+'\')\" value=\"'+data.rows[i].roleId+'\" />'+data.rows[i].roleName+'</label></li>'); 
	        				}
	        			}
	        		}
	        	}

	        	var selectRoles=$('#selectRoles').val();
        		if (selectRoles!="" && selectRoles!=null) {
        			var selectValue=selectRoles.split(",");
        			for (var i = 0; i < selectData.total; i++) {
        				$('input[name=selectServerCheck]').get(i).checked=false;
        				for (var j = 0; j < selectValue.length ; j++) {
        					if ($('input[name=selectServerCheck]').get(i).value==selectValue[j]){
        	    			   $('input[name=selectServerCheck]').get(i).checked=true;
        	    			   continue;
        		    		}
        				}
        			}
        		}
	        }, 
	        error: function (XMLHttpRequest, textStatus, errorThrown) {
	            alert(errorThrown); 
	        } 
		});
	};

	function changePageCheck(obj,serverId,serverName){

	};
	function determineSelect(){
		var selectRolesValue = $("input[name='selectServerCheck']:checked").map(function () {
	        return $(this).val();
	    }).get().join(',');
		if (selectRolesValue==null || selectRolesValue==""){
			 $.messager.show({
	             title: '信息提示',
	             msg: "请选择角色!"
	         });
			 return;
		}
		var rName="";
		var selectValue=selectRolesValue.split(",");
		for (var i = 0; i < selectData.total; i++) {
			for (var j = 0; j < selectValue.length ; j++) {
				if (selectData.rows[i].roleId==selectValue[j]){
				   rName=selectData.rows[i].roleName+","+rName;
    			   continue;
	    		}
			}
		}
		
		$("input[name='callSelectRoles']").val(rName); 
		$("input[name='selectRoles']").val(selectRolesValue);

		$('#selectServerManage').dialog('close');
	};
	
	function cancle(){
		$(".selectdivFileProgress").text("");
         newPictureLoad();
		$('#dlg').dialog('close');
	}
	function formatCompany(value){
		if(value==null){
			return "";
		}
		return value.companyName;
	};
	function formatActive(value){
		if(value==null||value==0){
			return "<span style='color:red;font-weight:bold;'>不可用</span>";
		}
		return "<span style='color:Green;font-weight:bold;'>可用</span>";
	}
	function formatUser(value){
		
		if(value==null){
			return "顶级用户";
		}
		return value.username;
	};
	
	
	function getSelect(){
        var nodes = $('#roles').combobox('getValues');
        //alert(nodes.length);
        var s = '';
        for(var i=0; i<nodes.length; i++){
            if (s != '') s += ',';
            //alert(nodes[i]);
            s += nodes[i];
        }
        //alert(s);
        return s;
    }
	
	$.extend($.fn.validatebox.defaults.rules, {  
	    /*必须和某个字段相等*/
	    equalTo: {
	    	validator:function(value,param){
	    		//alert(value);
	    		//alert($(param[0]).val());
	    		return $(param[0]).val() == value;
	    	},
	    	message:'两次密码不一致'
	    }
	          
	});
	
	 $.extend($.fn.validatebox.defaults.rules, {   
	  	   email : {   
			        validator: function(value){ 
			         
			            return /^[a-zA-Z0-9_+.-]+\@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}$/i.test($.trim(value));   
			        },   
			        message: '电子邮箱格式错误.'  
			    }   
			}); 
	 
	
	 $.extend($.fn.validatebox.defaults.rules, {   
  	   pwlength : {   
		        validator: function(value){  
		        	if($.trim(value).length>=6){
		        		return true;
		        	}else{
		        		return false;
		        	}
		        },   
		        message: '密码必须大于6位.'  
		    }   
		}); 
	
	    //查询站点管理信息
	    function datasearch(){
	    	$("#dg").datagrid({
	    		onBeforeLoad:function(row){
	    			var customerName = $("#query_customerName").val();
	    			var screenName = $("#query_screenName").val();
	    			row.customerName=customerName,
	    			row.screenName=screenName
	    	    }
	    	});
	    }
		
		var url;
		function newCustomer() {
			$('#dlg').dialog('open').dialog('setTitle', '添加用户');
			$('#fm').form('clear');
			$("#active option[value='1']").attr("selected",true);
			$("#inputUserId").attr("readonly",false);		
			$(".progressName").text("");
			//$(".progressPictureName1").text("");
			$(".progressBarStatus").text("");
			$(".progressPictureBarStatus").text("");
			$(".progressPictureName").text("");
		    $(".pictureShow").text("");
		    //$(".signShow").text("");		    
		    $('#callSelectRoles').val("");
		    $('#selectRoles').val("");
		    $('#callSelectCompanyId').val("");
		    $('#companyId').val("");
		    state=false;
		}
		
		function editCustomer() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				state=true;
				$('#dlg').dialog('open').dialog('setTitle', '修改用户');
				$('#fm').form('load', row);
				$("#inputUserId").attr("readonly",true);	
				$('#repassword').val($('#password').val());
				$('#repassword').val($('#password').val());
				$(".progressName").text("");
				//$(".progressPictureName1").text("");
				$(".progressBarStatus").text("");
				$(".progressPictureBarStatus").text("");
				$(".progressPictureName").text("");
			    $(".pictureShow").text("");
			    $('#callSelectCompanyId').val(row.company.companyName);
			    $('#companyId').val(row.companyId);
			    //$(".signShow").text("");
	
			}
		}
		function save() {

			var companyId=$("input[name='companyId']").val();
			if (companyId==null || companyId==""){
				 $.messager.show({
		             title: '信息提示',
		             msg: "请选择公司!"
		         });
				 return;
			}
			
			$('#fm').form('submit',{
			      url:"<%=request.getContextPath()%>/customer/save",
			      onSubmit: function(){
			          return $(this).form('validate');
			      },
			      success: function(result){
			          var result = eval('('+result+')');
			         // alert(result.errorMsg);
			          if (result.errorMsg){
			              $.messager.show({
			                  title: 'Error',
			                  msg: result.message
			              });		              
			            
			          } else {
			        	  $.messager.show({
			                  title: '信息提示',
			                  msg: "保存成功!"
			              });
			        	  $('#dlg').form('clear');
			              $('#dlg').dialog('close');        // close the dialog
			              $('#dg').datagrid('reload');// reload the ServerManage data
			             // $(".selectPictureFileProgress").text("");
			            //  $(".selectdivFileProgress").text("");
			             //  newPictureLoad();
				          //newSignImage();
			             
			          }
			      }
			   });
		}
		function destroy() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$.messager.confirm('Confirm','请确认是否删除?',function(r){
					  if (r) {
						  $.ajax({
					          type: "post", 
			                  url: "<%=request.getContextPath()%>/customer/delete", 
			                  dataType: "json", 
			                  data: {"customerId" : row.customerId},
			                  success: function (data) {
			                	  $('#dg').datagrid('reload'); // reload the ServerManage data			               	      
			                  }, 
			                  error: function (XMLHttpRequest, textStatus, errorThrown) {
			                      alert(errorThrown); 
			                  } 
						  });	
			          }
			          else {
			              
			          }
					  
			   });
			} 
		}
		
	
	</script>
	
	<style type="text/css">
#fm {
	margin: 0;
	padding: 10px 30px;
}

.ftitle {
	font-size: 14px;
	font-weight: bold;
	padding: 5px 0;
	margin-bottom: 10px;
	border-bottom: 1px solid #ccc;
}

.fitem {
	margin-bottom: 5px;
}

.fitem label {
	display: inline-block;
	width: 80px;
}
.selectServerManageList{
display: inline-block;
}
.selectServerManageList ul { list-style-type: none;
}
.selectServerManageList ul li { border-bottom: 1px solid #95B8E7; border-left: 1px solid #95B8E7; height: 23px; width: 140px; float: left;
}
.selectServerManageList ul li div{
width:230px;
overflow:hidden;            //自动隐藏文字
text-overflow: ellipsis;    //文字隐藏后添加省略号
-o-text-overflow:ellipsis; //适用于opera浏览器
}
.selectServerManageListLi { border-top: 1px solid #95B8E7;}
.selectServerManageListLiR { border-right: 1px solid #95B8E7;}
.templetcss{
 position:relative;	
 text-align:center;
}
.templet-image{
width: 164px;
height: 120px;
overflow: hidden;
}
.templet-name {
font-size: 14px;
white-space: nowrap;
word-wrap: normal;
overflow: hidden;
text-overflow: ellipsis;
width: 100%;
}
.appfeed-list{
width: 519px;
margin-right: 0px;
}

.templetDiv ul{
list-style:none;
text-align:center;
} 
.templetDiv li{
float:left;
} 
.selectServerManageList_s{
display: inline-block;
}
.selectServerManageList_s ul { list-style-type: none;
}
.selectServerManageList_s ul li { border-bottom: 0px solid #95B8E7; border-left: 0px solid #95B8E7; height: 23px; width: 140px; float: left;
}
.selectServerManageList_s ul li div{
width:230px;
overflow:hidden;            //自动隐藏文字
text-overflow: ellipsis;    //文字隐藏后添加省略号
-o-text-overflow:ellipsis; //适用于opera浏览器
}
.f_pName {
    float: left;
    margin: 10px;
    width: 40px;
}
</style>
</body>
</html>