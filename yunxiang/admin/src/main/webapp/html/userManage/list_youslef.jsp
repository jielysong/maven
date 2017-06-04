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
<script type="text/javascript" src="<%=request.getContextPath() %>/js/swf/swfupload.js"></script>   
<script type="text/javascript" src="<%=request.getContextPath() %>/js/swf/swfupload.queue.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath() %>/js/swf/handlers.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/js/userManage/userManage.js"></script> 

</head>
<body>

	<table id="dg" class="easyui-datagrid" title="用户管理" style="width:1100px;height:600px" toolbar="#toolbar"
			data-options="remoteSort:false,loadMsg:'数据加载中，请稍后...',singleSelect:true,url:'../user/getYouData',rownumbers:true">
        <thead>
            <tr>
                <th data-options="field:'headerImage',sortable:true,formatter:showImage,width:160,align:'center'">头像</th>
                  <th data-options="field:'email',sortable:true,width:160,align:'center'">Email</th>
                <th data-options="field:'userid',sortable:true,width:100,align:'center'">登陆名</th>
				<th data-options="field:'username',sortable:true,width:140,align:'center'">用户名</th>	
				<th data-options="field:'active',sortable:true,width:130,align:'center'" formatter="formatActive">状态</th>			           
                <th data-options="field:'createtime',sortable:true,width:130,align:'center'">注册时间</th>
				<th data-options="field:'updatetime',sortable:true,width:130,align:'center'">修改时间</th>
              
            </tr>
        </thead>
	</table>
	<div id="toolbar" style="padding:5px;height:auto">
		
		<div style="margin-bottom:5px">
      			
		 		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改</a> 
		 		
    	</div>

	</div>
	
	<div id="dlg" class="easyui-dialog"  style="width:650px;height:460px;"
            closed="true" buttons="#dlg-buttons" data-options="iconCls:'icon-save',modal:true">
        <form id="fm" method="post" >
         <input class="easyui-validatebox" type="hidden" id="headerIcon" name="headerImage" ></input>
         <input class="easyui-validatebox" type="hidden" id="id" name="id" ></input>
         <input class="easyui-validatebox" type="hidden" id="stampIcon" name="stampImage" ></input>
		    <div class="easyui-layout" style="width:586px;height:360px;">
		        <div data-options="region:'west'" style="width:300px;">
		           
		            <div class="uploadAppLeft" id="uploadAppLeft">
		                <div class="uploadLeftTitle">上传头像</div>
						
							<div class="selectdivFileProgress" id="selectdivFileProgress">
								<span id="selectdivFile"></span>
								<br/>
							</div>
							<div id="test"></div>
							<div id="selectdivFileContainer" ></div>
							<div id="pictureShow" class="pictureShow"></div>
						
		             </div> 
		        </div>
		        <div data-options="region:'center',iconCls:'icon-ok'">
		            <div class="uploadRightTitle">个人资料信息：</div>		        
		            <div class="fitem">
		                <label>登陆名:</label>
		                <input class="easyui-validatebox" required="true" type="text" name="userid" ></input>
		            </div>
		            <div class="fitem">
		                <label>用户名:</label>
		                <input class="easyui-validatebox" required="true" type="text" name="username" ></input>
		            </div>
		            <div class="fitem">
		                <label>Email:</label>
		                <input class="easyui-validatebox" required="true" type="text" name="email"  validType="email"></input>
		            </div>
		            <div class="fitem">
		                <label>密码:</label>
		                <input class="easyui-validatebox" required="true" type="password" name="password"  id="password" validType="pwlength"></input>
		            </div>
		            <div class="fitem">
		                <label>确认密码:</label>
		                <input class="easyui-validatebox" required="true" type="password" name="repassword" id="repassword"  validType="equalTo['#password']"></input>
		            </div>
		            <div class="fitem">
		                <label>角色:</label>
		               
		               <input class="easyui-combobox" id="roles" name="roleId" data-options="url:'<%=request.getContextPath() %>/role/getUserRole', method:'get',valueField:'roleId',textField:'roleName',panelHeight:'auto'" required="true" readonly="readonly"/>
		            </div>
		        </div>
		    </div>
        </form>
    </div>

	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancle()">取消</a>
	</div>
	<script type="text/javascript">
	function cancle(){
		$(".selectdivFileProgress").text("");
         newPictureLoad();
		$('#dlg').dialog('close');
	}
	
	function formatActive(value){
		if(value==null||value==0){
			return "<span style='color:red;font-weight:bold;'>不可用</span>";
		}
		return "<span style='color:Green;font-weight:bold;'>可用</span>";
	}
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
	    			var userid = $("#userid").val();
	    			var username = $("#username").val();
	    			row.userid=userid,
	    			row.username=username
	    	    }  
	    	});
	    	
	    	 $.ajax({
	             type: "post",
	             url: "<%=request.getContextPath() %>/user/getData",
	             data: {userid:userid,username:username},
	             dataType: "json",
	             success: function(data){
	            	 //alert(data.length);
	            	 $('#dg').datagrid('loadData', data);
	                        
	                      }
	         });
	    }
	  
		
		var url;
		function newUser() {
			$('#dlg').dialog('open').dialog('setTitle', '添加用户');
			$('#fm').form('clear');
			$(".progressName").text("");
			//$(".progressPictureName1").text("");
			$(".progressBarStatus").text("");
			$(".progressPictureBarStatus").text("");
			$(".progressPictureName").text("");
		    $(".pictureShow").text("");
		   // $(".signShow").text("");		    
		   
			
		}
		
		function editUser() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$('#dlg').dialog('open').dialog('setTitle', '修改用户');
				$('#fm').form('load', row);
				$('#repassword').val($('#password').val());
				$(".progressName").text("");
				//$(".progressPictureName1").text("");
				$(".progressBarStatus").text("");
				$(".progressPictureBarStatus").text("");
				$(".progressPictureName").text("");
			    $(".pictureShow").text("");
			   // $(".signShow").text("");

			}
		}
		function save() {
			$('#fm').form('submit',{
			      url:"<%=request.getContextPath()%>/user/save",
			      onSubmit: function(){
			          return $(this).form('validate');
			      },
			      success: function(result){
			          var result = eval('('+result+')');
			          if (result.errorMsg){
			              $.messager.show({
			                  title: 'Error',
			                  msg: result.errorMsg
			              });
			          } else {
			        	  $.messager.show({
			                  title: '信息提示',
			                  msg: "保存成功!"
			              });
			        	  $('#dlg').form('clear');
			              $('#dlg').dialog('close');        // close the dialog
			              $('#dg').datagrid('reload');// reload the ServerManage data
			              $(".selectPictureFileProgress").text("");
			              $(".selectdivFileProgress").text("");
			              newPictureLoad();
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
			                  data: {"id" : row.id},
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
</style>
</body>
</html>