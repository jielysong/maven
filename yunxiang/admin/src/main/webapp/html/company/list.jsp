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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/easyui/easyui-lang-zh_CN.js"></script>
</head>
<body>

	<table id="dg" class="easyui-datagrid" title="公司管理"   toolbar="#toolbar"
	 data-options= "remoteSort:false,loadMsg:'数据加载中，请稍后...',fit: true,singleSelect:true,url:'<%=request.getContextPath() %>/company/getData',
	 rownumbers:true,pagination:true,pageSize:20">
        <thead>
            <tr>
                <th data-options="field:'companyName',sortable:true,width:180,align:'center'">公司名称</th>
                <th data-options="field:'address',sortable:true,width:280,align:'center'">公司地址</th>
                <th data-options="field:'contacts',sortable:true,width:180,align:'center'">联系人</th>		
                <th data-options="field:'superCompany',sortable:true,width:180,align:'center'" formatter="formatCompany">上级代理公司</th>							
				<th data-options="field:'homeURL',sortable:true,width:180,align:'center'">公司网址</th>					
				<th data-options="field:'tel',sortable:true,width:180,align:'center'">公司电话(座机)</th>	
				<th data-options="field:'companyPhone',sortable:true,width:180,align:'center'">公司电话(手机)</th>				               
            </tr>
        </thead>
	</table>
	<div id="toolbar">
		 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newCompany()">添加</a>
		 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editCompany()">修改</a> 
		 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroy()">删除</a>
		 
		 <div>
			公司名:
			<input name="companyName" id="companyName" class="easyui-validatebox" data-options="validType:'maxLength[10]'">
			联系人:
			<input name="contacts" id="contacts" class="easyui-validatebox" data-options="validType:'maxLength[10]'">		
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'"
        		onclick="javascript:datasearch()">查询</a>
		</div> 
	</div>
	<div id="dlg" class="easyui-dialog" style="width: 400px; height: 380px; padding: 10px 20px" closed="true" buttons="#dlg-buttons"
	     data-options="iconCls:'icon-save',modal:true" >
	     <form id="fm" method="post" novalidate>
		<input type="hidden" name="companyId" id="companyId" class="easyui-validatebox">
				
			<div class="fitem">
				<label>公司名:</label> <input name="companyName" id="inputCompanyName" class="easyui-validatebox" missingMessage="公司名称必须填写" required="true" style="width:150px" validType="maxLength[50]" invalidMessage="最大长度不能超过50字符"/>
			</div>
			 <%-- <div class="fitem">
		        <label>上级代理公司:</label>		               
		        <input class="easyui-combobox" id="superCompanyId" name="superCompanyId" data-options="url:'<%=request.getContextPath() %>/company/getCompany', method:'get',valueField:'companyId',textField:'companyName',panelHeight:'auto'" required="true" style="width:150px"/>
		     </div> --%>
			<div class="fitem">
				<label>公司地址:</label> <input name="address" id="address" class="easyui-validatebox" missingMessage="公司地址必须填写" required="true" style="width:150px" />
			</div>
			<div class="fitem">
				<label>联系人:</label> <input name="contacts" id="contacts" class="easyui-validatebox" missingMessage="联系人名必须填写" required="true" style="width:150px"/>
			</div>
			<div class="fitem">
				<label>公司电话(座机):</label> <input name="tel" id="tel" class="easyui-validatebox" missingMessage="公司电话(座机)必须填写" required="true" style="width:150px" validType="phone"/>
			</div>
			<div class="fitem">
				<label>公司电话(手机):</label> <input name="companyPhone" id="companyPhone" class="easyui-validatebox" missingMessage="公司电话(手机)必须填写" required="true" style="width:150px" validType="mobile"/>
			</div>
			<div class="fitem">
				<label>公司网址:</label> <input name="homeURL" id="homeURL" class="easyui-validatebox" style="width:150px"  validType="website"/> <div style="margin-left: 245px;margin-top: -19px;width: 50px;" >(http://)</div> 
			</div>
			<div class="fitem" style="margin-top: 15px;">
			<label>状态:</label>
			<select name="active" id="active" style="width:150px">
						<option value="0">不可用</option>
						<option value="1" selected="selected">可用</option>
			</select>
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
	<script type="text/javascript">
  
	function formatCompany(value){
		if(value==null){
			return "无";
		}
		return value.companyName;
	};
	
	
    $(function(){
    	
    	
    });
    
    $.extend($.fn.validatebox.defaults.rules, {   
		    maxLength: {   
		        validator: function(value, param){   
		            return param[0] >= value.length;   
		        },   
		        message: '请输入最大{0}位字符.'  
		    }   
		}); 
    
    $.extend($.fn.validatebox.defaults.rules, {   
 	   mobile : {   
		        validator: function(value){   
		            return /^1[0-9]{10}$/i.test($.trim(value));   
		        },   
		        message: '手机号码格式错误.'  
		    }   
		});
		
	$.extend($.fn.validatebox.defaults.rules, {   
		 	   phone : {   
				        validator: function(value){   
				            return /^(\d{3,4}-)?\d{7,8}/i.test($.trim(value));   
				        },   
				        message: '电话号码格式错误.'  
				    }   
				});
	
	$.extend($.fn.validatebox.defaults.rules, {   
			website : {   
		        validator: function(value){   
		        	return /^(http[s]{0,1}|ftp):\/\//i.test($.trim(value));
		        },   
		        message: '网址格式错误.'  
		    }   
		});
    
    //查询站点管理信息
    function datasearch(){
    	$("#dg").datagrid({
    		onBeforeLoad:function(row){
    			var companyName = $("#companyName").val();
    			var contacts = $("#contacts").val();
    			row.companyName=companyName,
    			row.contacts=contacts
    	    }  
    	});
    	
    	 $.ajax({
             type: "post",
             url: "<%=request.getContextPath() %>/company/getData",
             data: {contacts:contacts,companyName:companyName},
             dataType: "json",
             success: function(data){
            	 //alert(data.length);
            	 $('#dg').datagrid('loadData', data);
                        
                      }
         });
    }
    
    

		var url;
		function newCompany() {
			$('#dlg').dialog('open').dialog('setTitle', '添加公司信息');			
			$('#fm').form('clear');
			$("#active option[value='1']").attr("selected",true);
			$("#inputCompanyName").attr("readonly",false);	
			$("#superCompanyId").combobox('enable');
			
		}
		
		function editCompany() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$('#dlg').dialog('open').dialog('setTitle', '修改公司信息');
				$('#fm').form('load', row);	
				$("#inputCompanyName").attr("readonly",true);
				//$("#superCompanyId").combobox('disable');
				
			}
		}
		function save() {
			
			$('#fm').form('submit',{
			      url:"<%=request.getContextPath()%>/company/saveCompany",
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
			              $('#dg').datagrid('reload');      // reload the ServerManage data
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
			                  url: "<%=request.getContextPath()%>/company/deleteCompany", 
			                  dataType: "json", 
			                  data: {"companyId" : row.companyId},
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