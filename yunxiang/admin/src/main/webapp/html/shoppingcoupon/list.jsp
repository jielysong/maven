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

	<table id="dg" class="easyui-datagrid" title="优惠券管理" style="nowrap:false;width:1100px;height:600px"  toolbar="#toolbar"
			data-options="remoteSort:false,loadMsg:'数据加载中，请稍后...',nowrap:false,singleSelect:true,url:'../shoppingcoupon/getDataCondensation',rownumbers:true,pagination:true,pageSize:20">
        <thead>
            <tr>
                <th data-options="field:'shopName',nowrap:false,sortable:true,width:100,align:'center'">商店名称</th>
                <th data-options="field:'batchId',nowrap:false,sortable:true,width:100,align:'center'">批次Id</th>
                <th data-options="field:'type_',sortable:true,nowrap:false,width:80,align:'center'" formatter="formatType_">类别</th>
                <th data-options="field:'name',sortable:true,nowrap:false,width:100,align:'center'">优惠名称</th>
                <!-- <th data-options="field:'code_',sortable:true,width:100,align:'center'">优惠券编码</th>	 -->
                <th data-options="field:'startDate',sortable:true,width:120,align:'center'">优惠开始日期</th>
				<th data-options="field:'stopDate',sortable:true,width:120,align:'center'">优惠结束日期</th>
				<th data-options="field:'createTime',sortable:true,width:120,align:'center'">创建日期</th>
				<th data-options="field:'createName',sortable:true,nowrap:false,width:100,align:'center'">创建人姓名</th>
				<th data-options="field:'couponId',width:80,formatter:operationDetailed,align:'center'">详情</th>	
				
				<!-- 
				<th data-options="field:'balance',sortable:true,width:80,align:'center'">红包金额</th>
				<th data-options="field:'limit_',sortable:true,width:80,align:'center'">满减条件</th>
				<th data-options="field:'userName',sortable:true,width:80,align:'center'">领取人姓名</th>
				<th data-options="field:'description',nowrap:false,sortable:true,width:100,align:'center'">描述</th> -->
            </tr>
        </thead>
	</table>
	<div id="toolbar" style="padding:5px;height:auto">
		
		<div style="margin-bottom:5px">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newShoppingcoupon()">添加</a>
			<!-- <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改</a>  -->
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyBatch()">批次删除</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroySeparate()">删除</a>
    	</div>
    	
    	<div>
    	              商店名称:
	        <input class="easyui-validatebox queryTitle" type="text" id="callSelectQueryShop" readonly=true name="callSelectQueryShop" style="width:130px"/>
			<input class="easyui-validatebox" type="hidden" id="selectQueryShop" name="selectQueryShop" ></input>
			
    		<label>优惠类别:</label>
            <select class="easyui-combobox" name="query_type_" id="query_type_" style="width:70px;" data-options="multiple:false,panelHeight:'auto',editable:false" >  
		       <option value="0">红包</option>
		       <option value="1">折扣</option>
	  	       <option value="2">抵用</option>
	        </select>
	        <label>启用状态:</label>
             <select class="easyui-combobox" name="query_active_" id="query_active_" style="width:138px;" data-options="multiple:false,panelHeight:'auto',editable:false" > 
                <option value="">无</option>
		        <option value="-1">刚发放</option>
	   	        <option value="0">已被领取</option>
    	        <option value="1">被使用或过期</option>
		     </select>
	   
			批次:
			<input name="query_batchId" id="query_batchId" class="easyui-validatebox" data-options="validType:'maxLength[20]'">
			优惠名称:
			<input name="query_name" id="query_name" class="easyui-validatebox" data-options="validType:'maxLength[20]'">
			<!-- 优惠代码:
			<input name="query_code_" id="query_code_" class="easyui-validatebox" data-options="validType:'maxLength[30]'">	 -->	
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'"
        		onclick="javascript:datasearch()">查询</a>
		</div> 
		
	</div>
	
	<div id="dlg" class="easyui-dialog"  style="width:580px;height:450px;"
            closed="true" buttons="#dlg-buttons" data-options="iconCls:'icon-save',modal:true">
        <form id="fm" method="post" >
         <input class="easyui-validatebox" type="hidden" id="headerIcon" name="headerImage" ></input>
         <input class="easyui-validatebox" type="hidden" id="userId" name="userId" ></input>
         <input class="easyui-validatebox" type="hidden" id="couponId" name="couponId" ></input>
         <input class="easyui-validatebox" type="hidden" id="stampIcon" name="stampImage" ></input>
         <input class="easyui-validatebox" type="hidden" id="startDate1" name="startDate1" ></input>
		    <div class="easyui-layout" style="width:510px;height:350px;">
		        <div data-options="region:'center',iconCls:'icon-ok'">
		            <div class="uploadRightTitle">优惠券信息：</div>
		            <div class="fitem">
		                <label>公司:</label>
		                <input class="easyui-validatebox queryTitle" type="text" id="callSelectCompanyId" readonly=true name="callSelectCompanyId" style="width:130px"/>
		    			<input class="easyui-validatebox" type="hidden" id="companyId" name="companyId" ></input>
		            </div>
		            <div class="fitem sends">
		                <label>店铺列表:</label>
		                <input class="easyui-validatebox queryTitle" type="text" id="callSelectShop" readonly=true name="callSelectShop" style="width:130px"/>
		    			<input class="easyui-validatebox" type="hidden" id="selectShop" name="selectShop" ></input>
		            </div>
		            <div class="fitem">
		               <label>优惠类别:</label>
		               <select class="easyui-combobox" name="type_" required="true" style="width:138px;" data-options="multiple:false,panelHeight:'auto',editable:false" >  
						    <option value="0">红包</option>
						    <option value="1">折扣</option>
			    	        <option value="2">抵用</option>
					   </select>
		            </div>
		             
		            <!-- 
		            <div class="fitem">
		                <label>优惠代码:</label>
		                <input class="easyui-validatebox" required="true" type="text" name="code_" id="inputUserId"></input>
		            </div> -->
		            <div class="fitem sends1">
		                <label>优惠名称:</label>
		                <input class="easyui-validatebox" required="true" type="text" name="name" ></input>
		            </div>
		            
		            <div class="fitem">
		                <label>开始日期:</label>
		                <input class="Wdate" name="startDateT" required="true" type="text" onClick="WdatePicker({minDate:'%y-%M-{%d}',errDealMode:0})" style="width:130px" />
		            </div>
		            <div class="fitem sends1">
		                <label>结束日期:</label>
		                <input class="Wdate" name="stopDateT" required="true" type="text" onClick="WdatePicker({minDate:'%y-%M-{%d}',errDealMode:0})" style="width:130px" />
		            </div>
		           <!--  <div class="fitem">
		               <label>启用状态:</label>
		               <select class="easyui-combobox" name="active_" required="true" style="width:138px;" data-options="multiple:false,panelHeight:'auto',editable:false" >  
						    <option value="-1">刚发放</option>
			    	        <option value="0">已被领取</option>
			    	        <option value="1">已使用或过期</option>
					   </select>
		            </div> -->
		            <div class="fitem">
		                <label>满减条件:</label>
		    			<input class="easyui-validatebox" type="text" id="limit_" name="limit_" ></input>
		            </div>
		             
	            	<div class="fitem">
		                <label>红包金额:</label>
		    			<input class="easyui-validatebox" required="true" type="text" id="balabce" name="inputBalabce" ></input>
		            </div>
		            <div class="fitem">
		                <label>数量:</label>
		    			<input class="easyui-validatebox" required="true" type="text" id="balabceNumber" name="balabceNumber" ></input>
		            </div>
		            
		       <!-- <div class="fitem">
		                <label>优惠类别:</label>
		                <textarea class="easyui-validatebox uploadXinXiFaBu" type="text" name="limitCategories" data-options="validType:'maxLength[100]'" invalidMessage="最大长度不能超过100字">优惠类别</textarea> 
		            </div> -->
		            <div class="fitem sends2">
		                <label>说明:</label>
		                <textarea class="easyui-validatebox uploadXinXiFaBu" type="text" name="description" data-options="validType:'maxLength[100]'" invalidMessage="最大长度不能超过100字">说明</textarea> 
		            </div>
		             
		        </div>
		    </div>
        </form>
    </div>

	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
	</div>
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
	<!-- 选择站点 -->
    <div id="selectServerManageQueryTb" style="padding:5px;height:auto">
		<div>
		              店铺名称: <input class="easyui-validatebox" name="queryShop" type="text" style="width:100px" id="queryShop"/> 
		    <input type="hidden" id="queryShopId" name="queryShopId" ></input>
		    <input type="text" id="inputShopIdButton" class="easyui-linkbutton" onclick="doSearchQueryShopId()" style="width:55px;height:20px;" value="查询"/>
		</div>
	</div>	
	<div id="selectServerQueryManage" class="easyui-dialog" style="width:670px;height:300px" closed="true" buttons="#selectServerQueryManage-buttons"
	     data-options="iconCls:'icon-save',toolbar:'#selectServerManageQueryTb',modal:true" >
		<div class="selectServerManageQueryList">
		 <ul id="selectServerManageQueryUl">
	  
		 </ul>
		</div>
	</div>	
	<div id="selectServerQueryManage-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" id="determineQuerySelect" onclick="determineQuerySelect()">确定</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#selectServerQueryManage').dialog('close')">取消</a>
	</div>

	<div id="detailed" class="easyui-dialog"  style="width:730px;height:475px;"
            closed="true" buttons="#detailed-buttons" data-options="iconCls:'icon-save',modal:true">
        <table id="detailedTable" class="easyui-datagrid" style="nowrap:false;width:715px;height:400px;"  
            data-options="remoteSort:false,loadMsg:'数据加载中，请稍后...',toolbar:'#detailedtb',nowrap:false,singleSelect:true,url:'../shoppingcoupon/getData',rownumbers:true,pagination:true,pageSize:10">  
        <thead>  
            <tr>  
            
         <!--   <th data-options="field:'shopName',sortable:true,width:100,align:'center'">商店名称</th>
                <th data-options="field:'batchId',sortable:true,width:100,align:'center'">批次Id</th> 
                <th data-options="field:'code_',sortable:true,width:100,align:'center'">优惠券编码</th>	-->
                
                <th data-options="field:'type_',nowrap:false,sortable:true,width:80,align:'center'" formatter="formatType_">类别</th>
                <th data-options="field:'name',nowrap:false,sortable:true,width:100,align:'center'">优惠名称</th>
                <th data-options="field:'startDate',sortable:true,width:100,align:'center'">优惠开始日期</th>
				<th data-options="field:'stopDate',sortable:true,width:100,align:'center'">优惠结束日期</th>
				<th data-options="field:'balance',sortable:true,width:80,align:'center'">红包金额</th>
				<th data-options="field:'limit_',sortable:true,width:80,align:'center'">满减条件</th>
				<th data-options="field:'userName',nowrap:false,sortable:true,width:100,align:'center'">领取人姓名</th>
				
            </tr>
        </thead>
       </table>
   </div>
    <div id="detailedtb" style="height:auto">  
		领取人姓名:
		<input name="detailed_userName" id="detailed_userName" class="easyui-validatebox" data-options="validType:'maxLength[20]'">
		<!-- 优惠名称:
		<input name="query_name" id="query_name" class="easyui-validatebox" data-options="validType:'maxLength[20]'"> -->
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="javascript:dataDetailedSearch()">查询</a>
    </div>
    
	<div id="detailed-buttons">
		<!-- <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a>  -->
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#detailed').dialog('close')">取消</a>
	</div>
				 	
	<script type="text/javascript">
	
	function operationDetailed(value,row,index){
		var releaseScope="<input type=\"button\" onclick=\"javascript:detailedShoppingcoupon('"+row.type_+"','"+row.batchId+"','"+row.shopId+"','"+index+"');\" value=\"详情\" /> ";
		return releaseScope;
	}
	var detailed_type,detailed_batchId,detailed_shopId;
	function dataDetailedSearch(){
		
    	var userName = $("#detailed_userName").val();
    	$("#detailedTable").datagrid({
    		onBeforeLoad:function(row){
    			row.userName=userName,
    			row.type_=detailed_type,
    			row.shopId=detailed_shopId,
    			row.batchId=detailed_batchId
    	    }
    	});
    	
	}
	function detailedShoppingcoupon(type_,batchId,shopId,index) {
		detailed_type=type_;
		detailed_batchId=batchId;
		detailed_shopId=shopId;
		
    	var userName = $("#detailed_userName").val();
    	$("#detailedTable").datagrid({
    		onBeforeLoad:function(row){
    			row.userName=userName,
    			row.type_=type_,
    			row.shopId=shopId,
    			row.batchId=batchId
    	    }
    	});
    	
		$('#detailed').dialog('open').dialog('setTitle', '查看优惠券详细');
		
	}
	
	function doSearchQueryShopId(){

		var queryShop = $("input[name='queryShop']").val()==0 ? '' : $("input[name='queryShop']").val(); 
		selectShopQueryWin(queryShop,"");
	};
	
    $("#callSelectQueryShop").focus(function(){
    	/* var companyId=$("input[name='companyId']").val();
    	if (companyId==null || companyId==""){
			 $.messager.show({
	             title: '信息提示',
	             msg: "请先选择公司!"
	         });
			 return;
		} */
    	if (selectQueryData==null){
    		var companyId=0;//$("input[name='companyId']").val();
    		selectShopQueryWin("",null);
    	}else{
    		for (var i = 0; i < selectQueryData.total; i++) {
   	  		   $('input[name=queryServerCheck]').get(i).checked=false;
   		    }
    	}

    	if (selectQueryData!=null){
    		var selectShop=$('#selectShop').val();
    		if (selectShop!="" && selectShop!=null) {
    			var selectValue=selectShop.split(",");
    			for (var i = 0; i < selectQueryData.total; i++) {
    				$('input[name=queryServerCheck]').get(i).checked=false;
    				for (var j = 0; j < selectValue.length ; j++) {
    					if ($('input[name=queryServerCheck]').get(i).value==selectValue[j]){
    	    			   $('input[name=queryServerCheck]').get(i).checked=true;
    	    			   continue;
    		    		}
    				}
    			}
    		}
    	}
    	
		$('#selectServerQueryManage').dialog('open').dialog('setTitle', '选择店铺');
	});
    
	var selectQueryData;   //所有的服务器信息
	var showQueryColumn=4; //显示5列
	var stateQuery=false;
	function selectShopQueryWin(inputShop,companyId){
		$('#selectServerManageQueryUl').empty();
		$('#selectServerQueryManage').dialog('open').dialog('setTitle', '选择店铺');
		
		$.ajax({
	        type: "post", 
	        url: "../shop/getData", 
	        dataType: "json", 
	        data: {shopName:inputShop,companyId:companyId},
	        success: function (data) {
	        	selectQueryData=data;
	        	for (var i = 0; i < data.total; i++) {
	        		if (i%showQueryColumn==(showQueryColumn-1)){
	        			if (i==(showQueryColumn-1)){
	        				$('#selectServerManageQueryUl').append('<li class="selectServerManageListLi selectServerManageListLiR"><label><input name="queryServerCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].shopId+',\''+data.rows[i].shopName+'\')\" value=\"'+data.rows[i].shopId+'\" />'+data.rows[i].shopName+'</label></li>'); 
	        			}else{
	        				$('#selectServerManageQueryUl').append('<li class="selectServerManageListLiR"><label><input name="queryServerCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].shopId+',\''+data.rows[i].shopName+'\')\" value=\"'+data.rows[i].shopId+'\" />'+data.rows[i].shopName+'</label></li>'); 
	        			}
	        		}else{
	        			if (i<showQueryColumn-1 && data.total-1==i){
	        				$('#selectServerManageQueryUl').append('<li class="selectServerManageListLi selectServerManageListLiR"><label><input name="queryServerCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].shopId+',\''+data.rows[i].shopName+'\')\" value=\"'+data.rows[i].shopId+'\" />'+data.rows[i].shopName+'</label></li>'); 
	        				continue;
	        			}
	        			if (data.total-1==i){
	        				$('#selectServerManageQueryUl').append('<li class="selectServerManageListLiR"><label><input name="queryServerCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].shopId+',\''+data.rows[i].shopName+'\')\" value=\"'+data.rows[i].shopId+'\" />'+data.rows[i].shopName+'</label></li>'); 
	        			}else{
	        				if (i<(showQueryColumn-1)){
	        					$('#selectServerManageQueryUl').append('<li class="selectServerManageListLi"><label><input name="queryServerCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].shopId+',\''+data.rows[i].shopName+'\')\" value=\"'+data.rows[i].shopId+'\" />'+data.rows[i].shopName+'</label></li>'); 
	        				}else{
	        					$('#selectServerManageQueryUl').append('<li ><label><input name="queryServerCheck" type="radio" onclick="changePageCheck(this,'+data.rows[i].shopId+',\''+data.rows[i].shopName+'\')\" value=\"'+data.rows[i].shopId+'\" />'+data.rows[i].shopName+'</label></li>'); 
	        				}
	        			}
	        		}
	        	}

	        	var selectQueryShop=$('#selectQueryShop').val();
        		if (selectQueryShop!="" && selectQueryShop!=null) {
        			var selectValue=selectQueryShop.split(",");
        			for (var i = 0; i < selectQueryData.total; i++) {
        				$('input[name=queryServerCheck]').get(i).checked=false;
        				for (var j = 0; j < selectValue.length ; j++) {
        					if ($('input[name=queryServerCheck]').get(i).value==selectValue[j]){
        	    			   $('input[name=queryServerCheck]').get(i).checked=true;
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
    
	function determineQuerySelect(){
		var selectShopValue = $("input[name='queryServerCheck']:checked").map(function () {
	        return $(this).val();
	    }).get().join('');
		if (selectShopValue==null || selectShopValue==""){
			 $.messager.show({
	             title: '信息提示',
	             msg: "请选择商店!"
	         });
			 return;
		}
		var rName="";
		var selectValue=selectShopValue.split(",");
		for (var i = 0; i < selectQueryData.total; i++) {
			for (var j = 0; j < selectValue.length ; j++) {
				if (selectQueryData.rows[i].shopId==selectValue[j]){
				   rName=selectQueryData.rows[i].shopName+""+rName;
    			   continue;
	    		}
			}
		}
		
		$("input[name='callSelectQueryShop']").val(rName); 
		$("input[name='selectQueryShop']").val(selectShopValue);

		$('#selectServerQueryManage').dialog('close');
		
	};
	
	function destroySeparate() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$.messager.confirm('Confirm','请确认是否删除?',function(r){
				  if (r) {
					  $.ajax({
				          type: "post", 
		                  url: "<%=request.getContextPath()%>/shoppingcoupon/delete", 
		                  dataType: "json", 
		                  data: {
		                	  couponId:row.couponId
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
	}
	
	function destroyBatch() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$.messager.confirm('Confirm','请确认是否删除'+row.batchId+'批次 ?',function(r){
				  if (r) {
					  $.ajax({
				          type: "post", 
		                  url: "<%=request.getContextPath()%>/shoppingcoupon/delete", 
		                  dataType: "json", 
		                  data: {
		                	  batchId:row.batchId
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
	}
	
	function runProgress(){
		var win = $.messager.progress({
			title:'信息提示',
			msg:'系统正在处理，请稍后...'
		});
	}
	
	function formatType_(type){
    	if (type==0){
    		return "红包";
    	}
    	if (type==1){
    		return "折扣";
    	}
    	if (type==2){
    		return "抵用";
    	}
    	return "未知";
    }
    
    $("#callSelectShop").focus(function(){
    	var companyId=$("input[name='companyId']").val();
    	if (companyId==null || companyId==""){
			 $.messager.show({
	             title: '信息提示',
	             msg: "请先选择公司!"
	         });
			 return;
		}
    	if (selectData==null){
    		var companyId=$("input[name='companyId']").val();
    		if (companyId==null || companyId==0){
    			selectShopWin("",null);
    		}else{
    			selectShopWin("",companyId);
    		}
    		
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
	    }).get().join(',');
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
	
	    //查询站点管理信息
	    function datasearch(){
	    	var query_name = $("#query_name").val();
			//var query_code = $("#query_code_").val();
			var selectQueryShop = $("#selectQueryShop").val();
			var query_type=$("#query_type_").combobox("getValue"); 
			var query_batchId = $("#query_batchId").val();
			var query_active = $("#query_active_").combobox("getValue");
	    	$("#dg").datagrid({
	    		onBeforeLoad:function(row){
	    			row.name=query_name,
	    			//row.code_=query_code,
	    			row.shopId=selectQueryShop,
	    			row.type_=query_type,
	    			row.batchId=query_batchId,
	    			row.active_=query_active
	    	    }
	    	});
	    }
		
		var url;
		function newShoppingcoupon() {
			$('#dlg').dialog('open').dialog('setTitle', '添加优惠券');
			$('#fm').form('clear');
			$("input[name='callSelectCompanyId']").val("无"); 
			$("input[name='companyId']").val(0);
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
			
			var selectShopValue=$("input[name='selectShop']").val();
			if (selectShopValue==null || selectShopValue==""){
				 $.messager.show({
		             title: '信息提示',
		             msg: "请选择店铺!"
		         });
				 return;
			}

			$('#fm').form('submit',{
			      url:"<%=request.getContextPath()%>/shoppingcoupon/save",
			      onSubmit: function(){
			    	  var results=$(this).form('validate');
			    	  if (results==true){
			    		  runProgress();
			    	  }
			          return results;
			      },
			      success: function(result){
			          var result = eval('('+result+')');
			          $.messager.progress('close');
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

.sends{
	margin-left:220px;
	margin-top: -50px;
}
.sends1{
	margin-left:220px;
	margin-top:-35px;
}
.sends2{
	margin-left:220px;
	margin-top:-102px;
}

.selectServerManageQueryList{
display: inline-block;
}
.selectServerManageQueryList ul { list-style-type: none;
}
.selectServerManageQueryList ul li { border-bottom: 1px solid #95B8E7; border-left: 1px solid #95B8E7; height: 23px; width: 140px; float: left;
}
.selectServerManageQueryList ul li div{
width:230px;
overflow:hidden;            //自动隐藏文字
text-overflow: ellipsis;    //文字隐藏后添加省略号
-o-text-overflow:ellipsis; //适用于opera浏览器
}
.selectServerManageListLi { border-top: 1px solid #95B8E7;}
.selectServerManageListLiR { border-right: 1px solid #95B8E7;}

</style>
</body>
</html>