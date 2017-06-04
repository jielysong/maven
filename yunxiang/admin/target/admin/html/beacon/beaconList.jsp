<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据内容页面</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/themes/icon.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/easyui/easyui-lang-zh_CN.js"></script>

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
</head>
<body>

	<table id="dg" class="easyui-datagrid" title="店铺管理" style="width:1100px;height:600px" toolbar="#toolbar"
			data-options="remoteSort:false,loadMsg:'数据加载中，请稍后...',singleSelect:true,url:'../beacon/getData',rownumbers:true,pagination:true,pageSize:20">
        <thead>
            <tr>
                <th data-options="field:'uuid',sortable:true,width:160,align:'center'">uuid</th>
                <th data-options="field:'major',sortable:true,width:100,align:'center'">major</th>
                <th data-options="field:'minor',sortable:true,width:100,align:'center'">minor</th>
                <th data-options="field:'wxid',sortable:true,width:100,align:'center'">wxid</th>
                <th data-options="field:'pwd',sortable:true,width:100,align:'center'">密码</th>
                <th data-options="field:'status',sortable:true,width:100,align:'center'">状态</th>
                <th data-options="field:'createDate',sortable:true,width:150,align:'center'">创建时间</th>
                <th data-options="field:'updateDate',sortable:true,width:150,align:'center'">修改时间</th>
            </tr>
        </thead>
	</table>
	
	<div id="toolbar" style="padding:5px;height:auto">
		
		<div style="margin-bottom:5px">
     		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addBeacon()">添加</a>
	 		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editBeacon()">修改</a> 
	 		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroy()">删除</a>
    	</div>
    	
    	<div>
			<label>uuid</label> 
			<input name="uuid" id="uuid" class="easyui-validatebox">
			<label>状态</label> 
			<input name="status" id="status" class="easyui-validatebox">
    	
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="javascript:datasearch()">查询</a>
		</div> 
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 400px; height: 450px; padding: 10px 20px" closed="true" buttons="#dlg-buttons" data-options="iconCls:'icon-save',modal:true" >
		<form id="fm" method="post" novalidate>
			<input name="id_" type="hidden" class="easyui-validatebox">
			<div class="fitem">
				<label>uuid:</label><input name="uuid" class="easyui-validatebox" >
			</div>
			<div class="fitem">
				<label>major:</label><input name="major" class="easyui-validatebox" >
			</div>
			<div class="fitem">
				<label>minor:</label><input name="minor" class="easyui-validatebox" >
			</div>
			<div class="fitem">
				<label>wxid:</label><input name="wxid" class="easyui-validatebox" >
			</div>
			<div class="fitem">
				<label>密码:</label><input name="pwd" class="easyui-validatebox" >
			</div>
			<div class="fitem">
				<label>状态:</label><input name="status" class="easyui-validatebox" >
			</div>
		</form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancle()">取消</a>
	</div>
	<script type="text/javascript">
	
	 //查询站点管理信息
    function datasearch(){
    	$("#dg").datagrid({
    		onBeforeLoad:function(row){
    			var uuid = $("#uuid").val();
    			var status = $("#status").val();
    			
    			row.uuid=uuid;
    			row.status=status;
    	    }  
    	});
    }
	 
	function cancle(){
		$('#dlg').dialog('close');
	}
	
	function addBeacon() {
		$('#dlg').dialog('open').dialog('setTitle', '添加设备');
		$('#fm').form('clear');
	}
	
	function editBeacon() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$('#dlg').dialog('open').dialog('setTitle', '修改商铺');
			$('#fm').form('load', row);
		}
	}
	
	function save() {
		$('#fm').form('submit',{
	      url:"<%=request.getContextPath()%>/beacon/saveBeacon",
	      onSubmit: function(){
	          return $(this).form('validate');
	      },
	      success: function(result){
	          var result = eval('('+result+')');
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
	              $('#dlg').dialog('close');
	              $('#dg').datagrid('reload');
             
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
	                  url: "<%=request.getContextPath()%>/beacon/deleteBeacon", 
	                  dataType: "json", 
	                  data: {"id_" : row.id_},
	                  success: function (data) {
	                	  $('#dg').datagrid('reload');   	      
	                  }, 
	                  error: function (XMLHttpRequest, textStatus, errorThrown) {
	                      alert(errorThrown); 
	                  } 
				  });	
	          }
		   });
		} 
	}
	</script>
</body>
</html>