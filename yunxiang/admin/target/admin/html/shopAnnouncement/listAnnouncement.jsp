<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>公告管理页面</title>

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

	<table id="dg" class="easyui-datagrid" title="公告管理页面" style="nowrap:false;width:1100px;height:600px"  toolbar="#toolbar"
			data-options="remoteSort:false,loadMsg:'数据加载中，请稍后...',singleSelect:true,nowrap:false,url:'../shopAnnouncement/getData',rownumbers:true,pagination:true,pageSize:20">
        <thead>
            <tr>
               <!--  <th data-options="field:'headerImage',sortable:true,formatter:showImage,width:160,align:'center'">头像</th>
                <th data-options="field:'company',sortable:true,width:100,align:'center'" formatter="formatCompany">公司名</th>  -->
                <th data-options="field:'shopName',sortable:true,width:130,align:'center'">商店名称</th>
                <th data-options="field:'content',sortable:true,nowrap:false,width:250,align:'center'">留言内容</th>
				<th data-options="field:'customerId',sortable:true,width:100,align:'center'">用户ID</th>
				<th data-options="field:'customerName',sortable:true,nowrap:false,width:100,align:'center'">用户昵称</th>	
                <th data-options="field:'createDate',sortable:true,width:150,align:'center'">留言日期</th>
                <th data-options="field:'id',width:80,formatter:operationDetailed,align:'center'">操作</th>	
                
            </tr>
        </thead>
	</table>
	
    <div id="toolbar" style="padding:5px;height:auto">	
		<div>
		             商店名称:
	        <input class="easyui-validatebox queryTitle" type="text" id="callSelectShop" readonly=true name="callSelectShop" style="width:130px"/>
			<input class="easyui-validatebox" type="hidden" id="selectShop" name="selectShop" ></input>

			起始时间: <input class="Wdate" name="firstTime" type="text" onClick="WdatePicker()" style="width:102px" id="firstTime"/>
			结束时间: <input class="Wdate" name="lastTime" type="text" onClick="WdatePicker()" style="width:102px" id="lastTime"/>
			内容: <input  name="queryContent" type="text"  style="width:102px" id="queryContent"/>
			
			 <!-- 类别: <select class="easyui-combobox" data-options="editable:false" name="selectType" id="selectType" style="width:82px" id="selectType">
		            <option value ="1">按商家公告</option>
					<option value ="0">按用户留言</option>
			    </select> -->	
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="datasearch()">查询</a>
		</div>
	</div>
	
<!-- 	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div> -->
    <div id="selectServerManageTb" style="padding:5px;height:auto">
		<div>
		              店铺名称: <input class="easyui-validatebox" name="inputShop" type="text" style="width:100px" id="inputShop"/> 
		    <input type="hidden" id="inputShopId" name="inputShopId" ></input>
		    <input type="text" id="inputShopIdButton" class="easyui-linkbutton" onclick="doSearchShopId()" style="width:55px;height:20px;" value="查询"/>
		</div>
	</div>
		
	<!-- 选择站点 -->
	<div id="selectServerManage" class="easyui-dialog" style="width:670px;height:300px" closed="true" buttons="#selectServerManage-buttons"
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
	
	function operationDetailed(value,row,index){
		var releaseScope="<input type=\"button\" onclick=\"javascript:deleteShopMessage('"+row.id+"','"+row.shopId+"');\" value=\"删除\" /> ";
		return releaseScope;
	}
	function deleteShopMessage (id , shopId){
		
		$.messager.confirm('Confirm','请确认是否删除?',function(r){
			  if (r) {
				  $.ajax({
			          type: "post", 
	                  url: "<%=request.getContextPath()%>/shopAnnouncement/delete",
	                  dataType: "json", 
	                  data: {
	                	  id:id,
	                	  shopId:shopId
	               	  },
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
    //查询站点管理信息
    function datasearch(){
    	var selectShop = $("#selectShop").val();
		var firstTime = $("#firstTime").val();
		var lastTime = $("#lastTime").val();
		var content = $("#queryContent").val();
		//var selectType=$("#selectType").combobox("getValue"); 
		
    	$("#dg").datagrid({
    		onBeforeLoad:function(row){
    			
    			row.shopId=selectShop,
    			row.firstTime=firstTime,
    			row.lastTime=lastTime,
    			row.content=content
    			//,row.type=selectType
    	    }
    	});
    }
    
    $("#callSelectShop").focus(function(){
    	/* var companyId=$("input[name='companyId']").val();
    	if (companyId==null || companyId==""){
			 $.messager.show({
	             title: '信息提示',
	             msg: "请先选择公司!"
	         });
			 return;
		} */
    	if (selectData==null){
    		var companyId=0;//$("input[name='companyId']").val();
    		selectShopWin("",null);
    	}else{
    		for (var i = 0; i < selectData.total; i++) {
   	  		   $('input[name=selectServerCheck]').get(i).checked=false;
   		    }
    	}

    	if (selectData!=null){
    		var selectShop=$('#selectShop').val();
    		if (selectShop!="" && selectShop!=null) {
    			var selectValue=selectShop.split(",");
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
    	
		$('#selectServerManage').dialog('open').dialog('setTitle', '选择店铺');
	});
    
	var selectData;   //所有的服务器信息
	var showColumn=4; //显示5列
	var state=false;
	function selectShopWin(inputShop,companyId){
		$('#selectServerManageUl').empty();
		$('#selectServerManage').dialog('open').dialog('setTitle', '选择店铺');
		
		$.ajax({
	        type: "post", 
	        url: "../shop/getData", 
	        dataType: "json", 
	        data: {shopName:inputShop,companyId:companyId},
	        success: function (data) {
	        	selectData=data;
	        	for (var i = 0; i < data.total; i++) {
	        		if (i%showColumn==(showColumn-1)){
	        			if (i==(showColumn-1)){
	        				$('#selectServerManageUl').append('<li class="selectServerManageListLi selectServerManageListLiR"><label><input name="selectServerCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].shopId+',\''+data.rows[i].shopName+'\')\" value=\"'+data.rows[i].shopId+'\" />'+data.rows[i].shopName+'</label></li>'); 
	        			}else{
	        				$('#selectServerManageUl').append('<li class="selectServerManageListLiR"><label><input name="selectServerCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].shopId+',\''+data.rows[i].shopName+'\')\" value=\"'+data.rows[i].shopId+'\" />'+data.rows[i].shopName+'</label></li>'); 
	        			}
	        		}else{
	        			if (i<showColumn-1 && data.total-1==i){
	        				$('#selectServerManageUl').append('<li class="selectServerManageListLi selectServerManageListLiR"><label><input name="selectServerCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].shopId+',\''+data.rows[i].shopName+'\')\" value=\"'+data.rows[i].shopId+'\" />'+data.rows[i].shopName+'</label></li>'); 
	        				continue;
	        			}
	        			if (data.total-1==i){
	        				$('#selectServerManageUl').append('<li class="selectServerManageListLiR"><label><input name="selectServerCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].shopId+',\''+data.rows[i].shopName+'\')\" value=\"'+data.rows[i].shopId+'\" />'+data.rows[i].shopName+'</label></li>'); 
	        			}else{
	        				if (i<(showColumn-1)){
	        					$('#selectServerManageUl').append('<li class="selectServerManageListLi"><label><input name="selectServerCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].shopId+',\''+data.rows[i].shopName+'\')\" value=\"'+data.rows[i].shopId+'\" />'+data.rows[i].shopName+'</label></li>'); 
	        				}else{
	        					$('#selectServerManageUl').append('<li ><label><input name="selectServerCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].shopId+',\''+data.rows[i].shopName+'\')\" value=\"'+data.rows[i].shopId+'\" />'+data.rows[i].shopName+'</label></li>'); 
	        				}
	        			}
	        		}
	        	}

	        	var selectShop=$('#selectShop').val();
        		if (selectShop!="" && selectShop!=null) {
        			var selectValue=selectShop.split(",");
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
		var selectShopValue = $("input[name='selectServerCheck']:checked").map(function () {
	        return $(this).val();
	    }).get().join('');
		if (selectShopValue==null || selectShopValue==""){
			 $.messager.show({
	             title: '信息提示',
	             msg: "请选择店铺!"
	         });
			 return;
		}
		var rName="";
		var selectValue=selectShopValue.split(",");
		for (var i = 0; i < selectData.total; i++) {
			for (var j = 0; j < selectValue.length ; j++) {
				if (selectData.rows[i].shopId==selectValue[j]){
				   rName=selectData.rows[i].shopName+""+rName;
    			   continue;
	    		}
			}
		}
		
		$("input[name='callSelectShop']").val(rName); 
		$("input[name='selectShop']").val(selectShopValue);

		$('#selectServerManage').dialog('close');
	};
	function doSearchShopId(){

		var inputShop = $("input[name='inputShop']").val()==0 ? '' : $("input[name='inputShop']").val(); 
		var companyId=$("input[name='companyId']").val();
		if (companyId=="0"){
			selectShopWin(inputShop,"");
		}else{
			selectShopWin(inputShop,companyId);
		}
		
	};
		
	
	function determineSelectCompany(){
		var companyId=$('input:radio[name="selectCompanyIdCheck"]:checked').val();
		if (companyId==null || companyId==""){
			 $.messager.show({
	             title: '信息提示',
	             msg: "请选择公司!"
	         });
			 return;
		}
		var oCompanyId=$("input[name='companyId']").val();
		if (companyId!=oCompanyId){
			$("input[name='callSelectShop']").val("");
			$("input[name='selectShop']").val("");
			$('#selectServerManageUl').empty();
			selectData=null;
		}
    	for (var i = 0; i < selectCompanyIdData.total; i++) {
    		if (selectCompanyIdData.rows[i].companyId==companyId){
    			$("input[name='callSelectCompanyId']").val(selectCompanyIdData.rows[i].companyName); 
    			$("input[name='companyId']").val(selectCompanyIdData.rows[i].companyId);
    		}
    	}

		$('#selectCompanyManage').dialog('close');
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
	
	function doSearch(){

		var inputCompany = $("input[name='inputCompany']").val()==0 ? '' : $("input[name='inputCompany']").val(); 
		selectCompanyIdWin(inputCompany);
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
	
	function formatlockout(value){
		if(value==1){
			return "是";
		}
		return "否";
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
	
		var url;
		function newshopMessage() {
			$('#dlg').dialog('open').dialog('setTitle', '添加优惠圈');
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
		    $('#callSelectShop').val("");
		    $('#selectShop').val("");
		    state=false;
		}
		
		function editUser() {
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
			    $('#callSelectShop').val(row.rolesName);
			    $('#selectShop').val(row.rolesId);
			    //$(".signShow").text("");
	
			}
		}
		function save() {
			var selectCompanyIdValue=$("input[name='companyId']").val();
			if (selectCompanyIdValue==null || selectCompanyIdValue==""){
				 $.messager.show({
		             title: '信息提示',
		             msg: "请选择公司!"
		         });
				 return;
			}

			$("input[name='startDate1']").val($("input[name='startdate']").val());
			
			var selectShopValue=$("input[name='selectShop']").val();
			if (selectShopValue==null || selectShopValue==""){
				 $.messager.show({
		             title: '信息提示',
		             msg: "请选择店铺!"
		         });
				 return;
			}

			$('#fm').form('submit',{
			      url:"<%=request.getContextPath()%>/shopMessage/save",
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
			                  url: "<%=request.getContextPath()%>/user/delete", 
			                  dataType: "json", 
			                  data: {"userId" : row.userId},
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