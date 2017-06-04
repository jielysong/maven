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

	<table id="dg" class="easyui-datagrid" style="width:1100px;height:600px" toolbar="#toolbar" data-options= "remoteSort:false,loadMsg:'数据加载中，请稍后...',singleSelect:true,url:'<%=request.getContextPath() %>/role/getData',rownumbers:true">
        <thead>
            <tr>
                <th data-options="field:'roleName',sortable:true,width:180,align:'center'">角色名</th>
				<th data-options="field:'menus',sortable:true,width:440,align:'center'" formatter="formatMenu">权限</th>				
                
            </tr>
        </thead>
	</table>
	<div id="toolbar">
		 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newRole()">添加</a>
		 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editRole()">修改</a> 
		 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroy()">删除</a>
	</div>
	<div id="dlg" class="easyui-dialog" style="width: 400px; height: 380px; padding: 10px 20px" closed="true" buttons="#dlg-buttons"
	     data-options="iconCls:'icon-save',modal:true" >
	     <form id="fm" method="post" novalidate>
		<input type="hidden" name="roleId" id="roleId" class="easyui-validatebox">
		
			<div class="fitem">
				<label>角色名:</label> <input name="roleName" id="roleName" class="easyui-validatebox" missingMessage="角色名必须填写" required="true" style="width:180px"/>
			</div>
			<div class="fitem">
				<label>角色权限:</label> 
				<div class="easyui-panel" style="padding:5px;width:280px">
					<ul id="tt" class="easyui-tree" data-options="url:'<%=request.getContextPath()%>/role/getMenu',animate:true,method:'get',checkbox:true,cache:false,
					 formatter:function(node){
                        var s = node.menuName;
                        return s;
                    },">
                    </ul> 
				</div> 				
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
	<script type="text/javascript">
  
    $(function(){
    	
    	//$('#tt').tree({cascadeCheck:$(this).is(':checked')});
    	
    });
    
    function isLeaf(){
        var node = $('#tt').tree('getSelected');
        var b = $('#tt').tree('isLeaf', node.target);
        return b;
    }

	function getChecked(){
        var nodes = $('#tt').tree('getChecked');
        var s = '';
        var parantsnodes = '';
        var prevNode = '';
        var prevParentNode='';

        for(var i=0; i<nodes.length; i++){
	       	if ($('#tt').tree('isLeaf', nodes[i].target)) {
	        	var pnode = $('#tt').tree('getParent', nodes[i].target);
	        	//alert(pnode.menuId);
	            if (pnode!=null&&prevNode != pnode.menuId) {
	                parantsnodes += pnode.menuId + ',';
	                prevNode = pnode.menuId;
	                var parent_node = $('#tt').tree('getParent', pnode.target);
	                if(parent_node!=null&&prevParentNode!=parent_node.menuId){
	                	parantsnodes += parent_node.menuId + ',';
	                	prevParentNode = parent_node.menuId;
	                }
	            }
	            
	            if (s != '') s += ',';
	            s += nodes[i].menuId;
	       	}
       }
        //alert(parantsnodes+s);
        return parantsnodes+s;
    }
	
	function formatMenu(value){
		var result ="";
		if(value==null||value.length<=0){
			return "无";
		}else{
		  for(var i=0; i<value.length; i++){
			  if(value[i].parentId==0)
			  result+=" "+value[i].menuName;
		  }
			return result;
		} 
    };
	   

		var url;
		function newRole() {
			$('#dlg').dialog('open').dialog('setTitle', '添加角色栏');
			$('#fm').form('clear');
		
			
		}
		
		function editRole() {
			var row = $('#dg').datagrid('getSelected');
			
			if (row) {
				$('#dlg').dialog('open').dialog('setTitle', '修改角色');
				$('#fm').form('load', row);
				$.ajax({
			        type: "post", 
			        url: "<%=request.getContextPath()%>/role/getRole", 
			        dataType: "json", 
			        data: {"roleId" : row.roleId},
			        success: function (data) {
// 			        	alert(data.length);
			        	var roots = $('#tt').tree('getChildren');
		                for (var i = 0; i < roots.length; i++) {
		                	var flag =false;
		                	for(var j=0;j<data.length;j++){
// 		                		alert(data[j].menuId);
		                		if(data[j].menuId==roots[i].menuId){
		                			flag = true;
		                		}
		                	}
		                    if (flag) {
		                    	 $('#tt').tree('check', roots[i].target);
		                    }else{
		                    	 $('#tt').tree('uncheck', roots[i].target);
		                    }
		                }
			        }, 
			        error: function (XMLHttpRequest, textStatus, errorThrown) {
			            alert(errorThrown); 
			        } 
				});
				
			}
		}
		function save() {
			
			var treeMenuIds = getChecked();
			var roleName = $("#roleName").val();
			var roleId = $("#roleId").val();
			if(($('#fm').form('validate'))==false){
				return;
			}
			$.ajax({
		        type: "post", 
		        url: "<%=request.getContextPath()%>/role/saveRole", 
		        dataType: "json", 
		        data: {roleName:roleName,treeMenuIds:treeMenuIds,roleId:roleId},
		        success: function (data) {
		        	 $.messager.show({
		                  title: '信息提示',
		                  msg: "保存成功!"
		              });
		        	  $('#dlg').form('clear');
		              $('#dlg').dialog('close');        // close the dialog
		              $('#dg').datagrid('reload');      // reload the ServerManage data
		        }, 
		        error: function (XMLHttpRequest, textStatus, errorThrown) {
		        	$.messager.show({
		                  title: 'Error',
		                  msg: data.errorMsg
		              });
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
			                  url: "<%=request.getContextPath()%>/role/deleteRole", 
			                  dataType: "json", 
			                  data: {"roleId" : row.roleId},
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