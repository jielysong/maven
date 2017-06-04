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

<script type="text/javascript" src="http://www.w3cschool.cc/try/jeasyui/datagrid-detailview.js"></script>


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
	
	
#shopList_ul li {
    border: 1px solid #95B8E7;
    float: left;
    margin-left: -1px;
    margin-top: -1px;
    white-space: nowrap;
    width: 120px;
    list-style-type:none;
}
</style>
</head>
<body>

	<table id="dg" class="easyui-datagrid" title="店铺管理" style="width:1100px;height:600px" toolbar="#toolbar"
			data-options="remoteSort:false,loadMsg:'数据加载中，请稍后...',singleSelect:true,url:'../shoppingcategory/getData',rownumbers:true,pagination:true,pageSize:20">
        <thead>
            <tr>
            	<th data-options="field:'categoryId',sortable:true,width:100,align:'center'" hidden="true"></th>
            	<th data-options="field:'shopId',sortable:true,width:100,align:'center'" hidden="true"></th>
                <th data-options="field:'name',sortable:true,width:160,align:'center'">类别名称</th>
                <th data-options="field:'description',sortable:true,width:160,align:'center'">描述</th>
                <th data-options="field:'shopName',sortable:true,width:160,align:'center'">店铺</th>
                <th data-options="field:'userName',sortable:true,width:100,align:'center'">创建人</th>
                <th data-options="field:'createTime',sortable:true,width:150,align:'center'">创建时间</th>
<!--                 <th data-options="field:'beaconNum',sortable:true,width:100,align:'center'">设备数量</th> -->
<!--                 <th data-options="field:'createDate',sortable:true,width:100,align:'center'">创建时间</th> -->
            </tr>
        </thead>
	</table>
	
	<div id="toolbar" style="padding:5px;height:auto">
		
		<div style="margin-bottom:5px">
     		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addShop()">添加</a>
	 		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editShop()">修改</a> 
	 		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroy()">删除</a>
    	</div>
    	
    	<div>
<!--     		<label>店铺</label>  -->
<!-- 			<select class="easyui-combobox" id="search_shopId" name="shopId" style="width:90px;" data-options="valueField:'shopId', textField:'shopName',editable:false,height:'20px'" >	 -->
<!-- 				<option value ="">请选择</option> -->
<!-- 			</select>	 -->
			<label>类别名称</label> 
			<input name="name" id="search_name" class="easyui-validatebox" data-options="validType:'maxLength[10]'">
    		<label>商铺名称</label> 
			<input name="shopName" id="search_shopName" class="easyui-validatebox" data-options="validType:'maxLength[10]'">
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="javascript:datasearch()">查询</a>
		</div> 
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 400px; height: 450px; padding: 10px 20px" closed="true" buttons="#dlg-buttons" data-options="iconCls:'icon-save',modal:true" >
		<form id="fm" method="post" novalidate>
			<input name="categoryId" type="hidden" class="easyui-validatebox">
			<div class="fitem">
				<label>类别名称:</label>
				<input id="categoryName" name="name" class="easyui-validatebox" missingMessage="类别名称必须填写" required="true">
			</div>
			<div class="fitem">
				<label>类别描述:</label>
				<input id="description" name="description" class="easyui-validatebox">
			</div>
			<div class="fitem">
				<label>店铺名称:</label>
				<input id="shopName" onclick="showShop();" name="shopName" class="easyui-validatebox" required="true">
				<input id="shopId" name="shopId" type="hidden" class="easyui-validatebox">
			</div>
			
<!-- 			<div class="fitem"> -->
<!-- 				<label>店铺:</label>  -->
<!-- 				<select class="easyui-combobox easyui-validatebox" id="shopId" name="shopId" style="width:134px;" data-options="valueField:'shopId', textField:'shopName',editable:false,height:'20px'" >	 -->
<!-- 					<option value ="">请选择</option> -->
<!-- 				</select> -->
<!-- 			</div> -->

		</form>
		
	</div>

	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancle()">取消</a>
	</div>
	
	
	
	<div id="becaon-dialog" class="easyui-dialog" style="width:800px;height:400px" closed="true" buttons="#becaon-dlg-buttons" data-options="iconCls:'icon-save',toolbar:'#becaon-toolbar',modal:true" >
	     <div id="shopList" class="beaconList">
			<ul id="shopList_ul">
			
			</ul>
		</div>
	</div>
	
	<div id="becaon-toolbar" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
     		<label>商铺名称</label> 
			<input name="shopName" id="dialog_search_shopName" class="easyui-validatebox" data-options="validType:'maxLength[10]'">
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="javascript:searchShop()">查询</a>
    	</div>
	</div>
	
	<div id="becaon-dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="select_shop()">确定</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancle_dialog()">取消</a>
	</div>
	
	
	
	
	<script type="text/javascript">
// 	$(function() {
// 		initShop();
// 	});
	
// 	function initShop(){
// 		$.ajax({
// 	        type: "post", 
<%-- 	        url: "<%=request.getContextPath()%>/shoppingcategory/getShopListByUserId",  --%>
// 	        dataType: "json", 
// 	        data: '',
// 	        success: function (data) {
// 	        	$("#shopId").combobox("loadData", data);
// 	        	if (data.length>0) {
// 		            $('#shopId').combobox('select', data[0].shopId);
// 		        }
	        	
// 	        	var arr={
// 	                "shopId" :0,
// 	                "shopName":"全部"
// 	            };
// 	        	data.push(arr);
// 	        	$("#search_shopId").combobox("loadData", data); 
// 	        	if (data.length>0) {
// 		            $('#search_shopId').combobox('select', data[data.length-1].shopId);
// 		        }
// 	        }, 
// 	        error: function (XMLHttpRequest, textStatus, errorThrown) {
// 	            alert(errorThrown); 
// 	        } 
// 	    });
// 	}
	
// 	function chengShop(){
// 		$.ajax({
// 	        type: "post", 
<%-- 	        url: "<%=request.getContextPath()%>/shoppingcategory/getShopListByUserId",  --%>
// 	        dataType: "json", 
// 	        data: '',
// 	        success: function (data) {
// 	        	$("#shopId").combobox("loadData", data);
// 	        	if (data.length>0) {
// 		            $('#shopId').combobox('select', data[0].shopId);
// 		        }
	        	
// 	        	$("#shopId").combobox({onSelect:function(record){  
                      
//                       $("#shopName").val(record.shopName);
//                 }});
// 	        }, 
// 	        error: function (XMLHttpRequest, textStatus, errorThrown) {
// 	            alert(errorThrown); 
// 	        } 
// 	    });
// 	}
	
	
	function save() {
		$('#fm').form('submit',{
	      url:"<%=request.getContextPath()%>/shoppingcategory/saveCategory",
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
	              $('#dlg').dialog('close');
	              $('#dg').datagrid('reload');
             
	          }
	      }
	   });
	}
	
	function addShop() {
		$('#dlg').dialog('open').dialog('setTitle', '添加类别');
		$('#fm').form('clear');
// 		chengShop();
	}
	
	function editShop() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$('#dlg').dialog('open').dialog('setTitle', '修改类别');
			$('#fm').form('load', row);
		}
	}
	
	function destroy() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$.messager.confirm('Confirm','请确认是否删除?',function(r){
			  if (r) {
				  $.ajax({
			          type: "post", 
	                  url: "<%=request.getContextPath()%>/shoppingcategory/deleteCategory", 
	                  dataType: "json", 
	                  data: {
	               		"categoryId" : row.categoryId
	               	  },
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
	
	function datasearch(){
    	$("#dg").datagrid({
    		onBeforeLoad:function(row){
    			var search_name = $("#search_name").val();
    			var search_shopId = $("input[name='shopId']").val();
    			var search_shopName = $("#search_shopName").val();
    			
    			row.shopId= search_shopId !=0 ? search_shopId:"";
    			row.name= search_name;
    			row.shopName = search_shopName;
    			
    	    }  
    	});

    }
	
	function formatItem(value){
// 		return "<a hrf='javascript:void(0);' onclick='showBeacon("+value+")'>设备详情</a>";
		return '<input type="button" value="菜单详情" onclick="showItem(\''+value+'\')" ></input>';
	};

	function showShop(){
		
		$.ajax({
	        type: "post", 
            url: "<%=request.getContextPath()%>/shoppingcategory/getShopListAll", 
            dataType: "json", 
            success: function (data) {
            	$("#shopList_ul").html('');
            	$.each(data,function(index, shop){
            		$("#shopList_ul").append('<li><input type="radio" value="' + shop.shopId + '" name="shopName" data="' + shop.shopName + '">' + shop.shopName + '</li>');
            		
            	});
            	
            	
            	
            	$('#becaon-dialog').dialog('open').dialog('setTitle', '选择商铺');   	      
            }, 
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown); 
            } 
		  });
	}
	
	function searchShop(){
		var shopName = $("#dialog_search_shopName").val();
			
// 			$("#shopList_ul").find('input[name="shopName"]:checked').val();
		
		$.ajax({
	        type: "post", 
            url: "<%=request.getContextPath()%>/shoppingcategory/getShopListAll", 
            dataType: "json", 
            data:{
            	"shopName" : shopName
            },
            success: function (data) {
            	$("#shopList_ul").html('');
            	$.each(data,function(index, shop){
            		$("#shopList_ul").append('<li><input type="radio" value="' + shop.shopId + '" name="shopName">' + shop.shopName + '</li>');
            		
            	});
            	
            }, 
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown); 
            } 
		  });
	}
	  
	
	function select_shop(){
		var shopId = $("#shopList_ul").find('input[name="shopName"]:checked').val();
		var shopName = $("#shopList_ul").find('input[name="shopName"]:checked').attr("data");
		
		$("#shopName").val(shopName);
		$("#shopId").val(shopId);
		
		$('#becaon-dialog').dialog('close');
	}
	
	 
	 

	 
	 
	function cancle(){
		$('#dlg').dialog('close');
	}
	

	
	function addBeacon(){
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$('#becaon-dlg').dialog('open').dialog('setTitle', '添加设备');
			$('#becaonfm').form('clear');
			$('#becaonfm').form('load', row);
		}
	}
	
	function cancleBeacon(){
		$('#becaon-dlg').dialog('close');
	}
	
	function saveBeacon() {
		$('#becaonfm').form('submit',{
	      url:"<%=request.getContextPath()%>/shop/addBeacon",
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
	        	  $('#becaon-dlg').form('clear');
	              $('#becaon-dlg').dialog('close');
	              $('#dg_beacon').datagrid('reload');
             
	          }
	      }
	   });
	}
	
	function deleteBeacon(){
		var row = $('#dg_beacon').datagrid('getSelected');
		var shopRow = $('#dg').datagrid('getSelected');
		if (row) {
			$.messager.confirm('Confirm','请确认是否删除?',function(r){
			  if (r) {
				  $.ajax({
			          type: "post", 
	                  url: "<%=request.getContextPath()%>/shop/deleteBeacon", 
	                  dataType: "json", 
	                  data: {
	                	  "shopId" : shopRow.shopId,
	                	  "beaconId":row.id_
	                  },
	                  success: function (data) {
	                	  $('#dg_beacon').datagrid('reload');   	      
	                  }, 
	                  error: function (XMLHttpRequest, textStatus, errorThrown) {
	                      alert(errorThrown); 
	                  } 
				  });	
	          }
		   });
		} 
	}
	

	
	
	function formatBeacon(value){
// 		return "<a hrf='javascript:void(0);' onclick='showBeacon("+value+")'>设备详情</a>";
		return '<input type="button" value="设备详情" onclick="showBeacon(\''+value+'\')" ></input>';
	};
	
	
	function showBeacon(value){
		
		
		$('#becaon-dialog').dialog('open').dialog('setTitle', '修改商铺');
	    $('#dg_beacon').datagrid({
	    	singleSelect:true,
	        url:'<%=request.getContextPath()%>/shop/getBeaconList',
	        queryParams:{shopId:value},
	        columns:[[
	    		{field:'uuid',title:'uuid',width:100},
				{field:'major',title:'major',width:100},
				{field:'minor',title:'minor',width:100},
				{field:'wxid',title:'wxid',width:100},
				{field:'pwd',title:'密码',width:100},
				{field:'status',title:'状态',width:100},
				{field:'createDate',title:'创建时间',width:100},
				{field:'updateDate',title:'修改时间',width:100}
	        ]]
	    });

	}
	
	

	

	</script>
</body>
</html>