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

	<table id="dg" class="easyui-treegrid" toolbar="#toolbar"
			data-options="
                url: '<%=request.getContextPath() %>/menu/getData?parentId=0',
                method: 'get',
                rownumbers: true,fit: true,
                idField: 'menuId',
                treeField: 'menuName',
                collapsible: false
            ">
        <thead>
            <tr>
                <th data-options="field:'menuName',width:180">菜单名名</th>
				<th data-options="field:'parent',sortable:true,width:140,align:'center'" formatter="formatParent">父菜单</th>	
				<th data-options="field:'url',sortable:true,width:400,align:'center'">菜单URL</th>			
                <th data-options="field:'level',sortable:true,width:180,align:'center'">菜单等级</th>
                <th data-options="field:'sort',sortable:true,width:130,align:'center'">菜单顺序</th>
                
            </tr>
        </thead>
	</table>
	<div id="toolbar">
		 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newMenu()">添加</a>
		 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editMenu()">修改</a> 
		 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroy()">删除</a>
	</div>
	<div id="dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px" closed="true" buttons="#dlg-buttons"
	     data-options="iconCls:'icon-save',modal:true" >
		<form id="fm" method="post" novalidate>
		<input type="hidden" name="menuId" class="easyui-validatebox">
			<div class="fitem">
				<label>菜单名:</label> <input name="menuName" id="menuName" class="easyui-validatebox" missingMessage="菜单名必须填写" required="true">
			</div>
			<div class="fitem">
				<label>父菜单:</label> 
				<select class="easyui-combobox easyui-validatebox" id="parentId" name="parentId" style="width:134px;" 
				 	    data-options="valueField:'menuId', textField:'menuName',editable:false,height:'20px'" >	
							
				</select>
			</div>
			<div class="fitem">
				<label>菜单等级:</label> <input name="level"  id="level" class="easyui-validatebox" required="true" />
			</div>
						
			<div class="fitem">
				<label>菜单顺序:</label> <input name="sort" id="sort" class="easyui-validatebox" required="true"  />
			</div>
			
			<div class="fitem">
				<label>菜单URL:</label> <input name="url"  id="url" class="easyui-validatebox" required="true" />
			</div>
			
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
	<script type="text/javascript">

	
	$(function() {
		$('#parent_search').combobox({
		    url:'<%=request.getContextPath()%>/menu/getParent',
		    valueField:'menuId',
		    textField:'menuName',
		    onLoadSuccess:function(){
		    	 var target = $(this);
		    	 var data = target.combobox("getData");
		    	 //var options = target.combobox("options");
		    	 target.combobox('select', data[data.length-1].menuId);
		    	 
		    }
		});
		
	});
	
	function formatParent(value){
		if(value==null){
			return "顶级菜单";
		}else{
			return value.menuName;
		} 
    };
	   
		
		var url;
		function newMenu() {
			$('#dlg').dialog('open').dialog('setTitle', '添加菜单栏');
			$('#fm').form('clear');
			
			$('#parentId').combobox({
			    url:'<%=request.getContextPath()%>/menu/getParent',
			    valueField:'menuId',
			    textField:'menuName',
			    onLoadSuccess:function(){
			    	 var target = $(this);
			    	 var data = target.combobox("getData");
			    	 //var options = target.combobox("options");
			    	 target.combobox('select', data[data.length-1].menuId);
			    	 
			    }
		});
			
		}
		
		function editMenu() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$('#dlg').dialog('open').dialog('setTitle', '修改菜单');
				$('#fm').form('load', row);
				$.ajax({
			        type: "post", 
			        url: "<%=request.getContextPath()%>/menu/getParent", 
			        dataType: "json", 
			        data: "",
			        success: function (data) {
			     	    $("#parentId").combobox("loadData", data);
			     	    $('#parentId').combobox("setValue", row.parentId);
			        }, 
			        error: function (XMLHttpRequest, textStatus, errorThrown) {
			            alert(errorThrown); 
			        } 
				});
				
			}
		}
		function save() {
			$('#fm').form('submit',{
			      url:"<%=request.getContextPath()%>/menu/saveMenu",
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
			              $('#dg').treegrid('reload');      // reload the ServerManage data
			          }
			      }
			   });
		}
		function destroy() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				if(row.children.length>0){
					alert("删除的菜单不能有子菜单");
					return;
				}
				$.messager.confirm('Confirm','请确认是否删除?',function(r){
					  if (r) {
						  $.ajax({
					          type: "post", 
			                  url: "<%=request.getContextPath()%>/menu/deleteMenu", 
			                  dataType: "json", 
			                  data: {"menuId" : row.menuId},
			                  success: function (data) {
			                	  $('#dg').treegrid('reload'); // reload the ServerManage data			               	      
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