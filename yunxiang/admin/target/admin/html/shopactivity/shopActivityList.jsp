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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery/jquery.simplemodal.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/swf/swfupload.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/swf/swfupload.queue.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/swf/handlers.js"></script>


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

.appListImageName {
	float: left;
	height: 30px;
	width: 30px;
	margin-bottom: 5px;
	margin-left: 30px;
	margin-top: 5px;
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
.appListImageName{
    float: left;
    height: 30px;
    width: 30px;
    margin-bottom: 5px;
    margin-left: 30px;
    margin-top: 5px;
}
	
.appListTitleContent{
	margin-top: 10px;
	float: left;
}
.uploadXinXiFaBu{
	vertical-align: middle;
	height:250px;
	width:195px;
}
.welcomePopup{
	display:none;
}

#simplemodal-container a.modalCloseImg {
    background: rgba(0, 0, 0, 0) url("../images/jquery_x.png") repeat scroll 0 0;
    cursor: pointer;
    display: inline;
    height: 40px;
    position: absolute;
    right: -20px;
    top: -20px;
    width: 40px;
    z-index: 3200;
}
</style>
</head>
<body>

	<table id="dg" class="easyui-datagrid" title="活动管理" style="width: 1100px; height: 600px" toolbar="#toolbar" nowrap="false"
		data-options="remoteSort:false,loadMsg:'数据加载中，请稍后...',singleSelect:true,url:'../shopActivity/getData',rownumbers:true,pagination:true,pageSize:20">
		<thead>
			<tr>
				<th data-options="field:'activityName',formatter:showImage,sortable:true,width:160,align:'center'">活动名称</th>
				<th data-options="field:'shopName',sortable:true,width:140,align:'center'">商铺名</th>
				<th data-options="field:'description',sortable:true,width:160,align:'center'">活动描述</th>
				<th data-options="field:'startDate',sortable:true,width:100,align:'center'">开始时间</th>
				<th data-options="field:'stopDate',sortable:true,width:100,align:'center'">结束时间</th>
				<th data-options="field:'userName',sortable:true,width:100,align:'center'">创建人</th>
				<th data-options="field:'createDate',sortable:true,width:150,align:'center'">创建时间</th>
				<th data-options="field:'viewCount',sortable:true,width:50,align:'center'">浏览次数</th>
				<th data-options="field:'stopMessage',sortable:true,width:100,align:'center'">下架原因</th>
			</tr>
		</thead>
	</table>

	<div id="toolbar" style="padding: 5px; height: auto">

		<div style="margin-bottom: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addShop()">添加</a> 
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editShop()">修改</a> 
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroy()">删除</a>
		</div>

		<div>
			商铺名称:<input name="shopName" id="shopName" class="easyui-validatebox" data-options="validType:'maxLength[20]'">
			活动名称:<input name="activityName" id="activityName" class="easyui-validatebox" data-options="validType:'maxLength[20]'">  
			起始时间:<input id="startDate" class="Wdate" name="startDate" type="text" onClick="WdatePicker()"/>
			结束时间:<input id="stopDate" class="Wdate" name="stopDate" type="text" onClick="WdatePicker()"/>
			<label>活动状态:</label>
             <select class="easyui-combobox" name="query_active_" id="query_active_" style="width:138px;" data-options="multiple:false,panelHeight:'auto',editable:false" > 
                <option value="">无</option>
		        <option value="-1">刚发放</option>
	   	        <option value="0">已被领取</option>
    	        <option value="1">被使用或过期</option>
		     </select>
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="javascript:datasearch()">查询</a>
		</div>
	</div>

	<div id="dlg" class="easyui-dialog" style="width: 400px; height: 700px; padding: 10px 20px" closed="true" buttons="#dlg-buttons" data-options="iconCls:'icon-save',modal:true">
		<form id="fm" method="post" novalidate>
			<input name="activityId" type="hidden" class="easyui-validatebox">
			<input id="itemImageId" name="itemImageId" type="hidden" class="easyui-validatebox">
			<input id="itemImageName" name="itemImageName" type="hidden" class="easyui-validatebox">
			<input id="itemImageSize" name="itemImageSize" type="hidden" class="easyui-validatebox">
			<input id="itemImageUrl" name="itemImageUrl" type="hidden" class="easyui-validatebox">
			
		
			<div class="fitem">
				<label>活动名称:</label>
				<input id="dlg_activityName" name="activityName" class="easyui-validatebox" invalidMessage="活动名称必须填写" required="true">
			</div>
			<div class="fitem">
				<label>店铺:</label> 
				<input id="dlg_shopName" name="shopName" onclick="showShop();" class="easyui-validatebox" invalidMessage="请选择商铺" required="true">
				<input id="dlg_shopId" name="shopId" type="hidden" class="easyui-validatebox">
			</div>
			<div class="fitem">
				<label>起始日期:</label>
				<input id="dlg_startDate" class="Wdate" name="startDate" type="text" onClick="WdatePicker({maxDate:'#F{$dp.$D(\'dlg_stopDate\')}',minDate:'%y-%M-%d',errDealMode:0})" style="width:100px" invalidMessage="请选择起始时间" required="true"/>
			</div>
			<div class="fitem">
				<label>结束日期:</label>
				<input id="dlg_stopDate" class="Wdate" name="stopDate" type="text" onClick="WdatePicker({minDate:'#F{$dp.$D(\'dlg_startDate\')}',errDealMode:0})" style="width:100px" invalidMessage="请选择结束时间" required="true"/>
			</div>
			<div class="fitem">
                <label>活动详情:</label>
                <textarea class="easyui-validatebox uploadXinXiFaBu" type="text" name="description" data-options="validType:'maxLength[300]'" invalidMessage="最大长度不能超过300字" required="true"></textarea> 
            </div>
		</form>
		
		<form action="pictureAction" method="post" name="thisform" enctype="multipart/form-data"> 
			<div class="selectPictureFileProgress" >
				<span id="selectPictureFile"></span>
			</div> 
			<div id="pictureFileProgressContainer" ></div>
			<div id="pictureShow" class="pictureShow"></div>
	    </form>
	</div>

	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancle()">取消</a>
	</div>

	<div id="becaon-dialog" class="easyui-dialog" style="width:600px;height:500px" closed="true" buttons="#becaon-dlg-buttons" data-options="iconCls:'icon-save',toolbar:'#becaon-toolbar',modal:true" >
	     <div id="shopList" class="beaconList">
			<ul id="shopList_ul">
			
			</ul>
		</div>
	</div>
	
	<div id="becaon-dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="select_shop()">确定</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancle_dialog()">取消</a>
	</div>
	
	<div id="becaon-toolbar" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
     		<label>商铺名称</label> 
			<input name="shopName" id="dialog_search_shopName" class="easyui-validatebox" data-options="validType:'maxLength[10]'">
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="javascript:searchShop()">查询</a>
    	</div>
	</div>


<div id="popUp"  class="welcomePopup">
	<img id="popUpImg" src="" width="280px" height="300px" />
</div>

<script type="text/javascript">
	function datasearch(){
		$("#dg").datagrid({
			onBeforeLoad:function(row){
				var shopName = $("#shopName").val();
				var activityName = $("#activityName").val();
				var startDate = $("#startDate").val();
				var stopDate = $("#stopDate").val();
				
				row.shopName = shopName;
				row.activityName = activityName;
				row.startDate = startDate;
				row.stopDate = stopDate;
		    }  
		});
	}
	
	function addShop() {
		$('#dlg').dialog('open').dialog('setTitle', '添加活动');
		$('#fm').form('clear');
		

		$("#itemImageId").val("");
	    $("#itemImageName").val("");
	    $("#itemImageSize").val("");
	    $("#itemImageUrl").val("");
	    $("#pictureFileProgressContainer").html(""); 
	    $("#pictureShow").html("");
	}
	
	function showShop(){
		
		$.ajax({
	        type: "post", 
            url: "<%=request.getContextPath()%>/shopActivity/getShopListAll", 
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
			
		$.ajax({
	        type: "post", 
            url: "<%=request.getContextPath()%>/shopActivity/getShopListAll", 
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
		
		$("#dlg_shopName").val(shopName);
		$("#dlg_shopId").val(shopId);
		
		$('#becaon-dialog').dialog('close');
	}
	
	function save() {
		$('#fm').form('submit',{
	      url:"<%=request.getContextPath()%>/shopActivity/saveShopActivity",
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
	                  url: "<%=request.getContextPath()%>/shopActivity/deleteShopActivity", 
	                  dataType: "json", 
	                  data: {
	               		"activityId" : row.activityId
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
	
	function editShop() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$('#dlg').dialog('open').dialog('setTitle', '修改活动');
			$('#fm').form('load', row);
		}
		
		$("#itemImageId").val("");
	    $("#itemImageName").val("");
	    $("#itemImageSize").val("");
	    $("#itemImageUrl").val("");
	    $("#pictureFileProgressContainer").html(""); 
	    $("#pictureShow").html("");
	}
	
	window.onload = function() {
		
		function Pictureupload(conf){
			
			var uploadImage = new SWFUpload({
				// Backend Settings
				upload_url: "<%=request.getContextPath()%>/shopActivity/swfUploadFile",
				post_params: {"type": "2"},
				// File Upload Settings
				file_size_limit : conf.fileSize,	// 2MB
				file_types :conf.file_types ,
				file_types_description : "All Files",
				file_upload_limit : "0",
				file_queue_error_handler : fileQueueError,
				file_dialog_complete_handler : fileDialogComplete,
				upload_progress_handler : conf.uploadPictureProgress,
				upload_error_handler : uploadError,
				upload_success_handler : conf.uploadPictureSuccess, 
				upload_complete_handler : conf.uploadPictureComplete,
				// Button Settings
				button_image_url : "../images/SmallSpyGlassWithTransperancy_17x18.png",
				button_placeholder_id : conf.selectPictureFile,
				button_width: 180,
				button_height: 18,
				button_text : '<span class="button">'+ conf.title +' <span class="buttonSmall"></span></span>',
				button_text_style : '.button { font-family: Helvetica, Arial, sans-serif; font-size: 12pt; } .buttonSmall { font-size: 10pt; }',
				button_text_top_padding: 0,
				button_text_left_padding: 18,
				button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
				button_cursor: SWFUpload.CURSOR.HAND,
				button_action :SWFUpload.BUTTON_ACTION.SELECT_FILE, //单选择文件
				// Flash Settings
				flash_url : "../js/swf/swfupload.swf",
				custom_settings : {
					upload_target : conf.pictureFileProgressContainer,
					progressTarget : conf.pictureUploadProgress1,
				},
				// Debug Settings
				debug: false
			}); 
			
			return uploadImage;
		}
		
		//上传app图片文件
		var conf={};
		conf.uploadPictureProgress=uploadPictureProgress;
		conf.uploadPictureSuccess=uploadPictureSuccess;
		conf.uploadPictureComplete=uploadPictureComplete;
		conf.selectPictureFile="selectPictureFile";
		conf.pictureFileProgressContainer="pictureFileProgressContainer";
		conf.pictureUploadProgress1="pictureUploadProgress1";
		conf.title="请选择图片";
		conf.fileSize="60 KB";
		conf.file_types="*.jpg;*.jpeg;*.png;*.bmp;*.gif";
		var pictureUpload=new Pictureupload(conf);

		
	};
	
	//上传进度设置事件
	function uploadPictureProgress(file, bytesLoaded) { 
	   try {
	       var percent = Math.ceil((bytesLoaded / file.size) * 100); 
	       var progress = new FilePictureProgress(file, this.customSettings.upload_target);
	       progress.setProgress(percent);
	       if (percent == 100) {
	            progress.setStatus("上传完毕");
	            progress.toggleCancel(false, this);             
	            //跳转到上传成功网页
	            //refresh(file);
	       } else {
	      	  //显示上传信息
	            progress.setStatus("上传中,请梢后......‖已上传："+(bytesLoaded/(1024*1024))+"/"+file.size+" 『"+percent+"%』");
	            progress.toggleCancel(true, this);
	       }
	   } catch (ex) {
	       this.debug(ex);
	   }
	}
	//上传一个文件成功后，所触发的事件。
	function uploadPictureComplete(file) {
	    try {
	        //若有多个文件，则上传一个成功后，继续上传，否则显示上传成功！
	        if (this.getStats().files_queued > 0) {
	             this.startUpload();
	        }else{
	             var progress = new FilePictureProgress(file, this.customSettings.upload_target);
	             progress.setComplete();
	             $("#itemImageName").val(file.name);
	             $("#itemImageSize").val(file.size);
	             refreshPictureDelete(file,"progressPictureName");
	          // $(".progressName").html(file.name);
	             progress.setStatus("文件上传成功！");
	             progress.toggleCancel(false);
	        }
	    }catch(ex){
	        this.debug(ex);
	    }
	}
	
	function uploadPictureSuccess(file, serverData) {
	    try {  
	        var result =eval('(' + serverData + ')');
	        if(result.success!= 1) {
	            var progress = new FilePictureProgress(file, this.customSettings.progressTarget);  
	            progress.setError();  
	            progress.setStatus(serverData);  
	            progress.toggleCancel(false);  
	        } else {
	            var progress = new FilePictureProgress(file, this.customSettings.progressTarget);  
	            progress.setComplete();  
	            progress.toggleCancel(false);
	            
	            $("#itemImageName").val(result.fileName);
	            $("#itemImageUrl").val(result.url_s);
	            $("#itemImageId").val(result.fileId);

	            addUploadImage(result.url_s,result.src_b,"pictureShow");  
	        }  
	  
	    } catch (ex) {  
	        this.debug(ex);  
	    }  
	}

	function showImage(value,row,index){
		return "<img onclick='showBigImage(this);' class=\"appListImageName\"  src='../shopActivity/getPictureFile?t="+Math.random()+"&fileEntryId="+row.activityImgId+"&pictureFile="+row.activityImgURL+"' /> <div class=\"appListTitleContent\">"+value+"</div>";
	}
	
	function showBigImage(obj){
		$('#popUpImg').attr('src',$(obj).attr("src"));
		
		$("#popUp").modal();
	}
	
	//加载图片
	function addUploadImage(src_s,src_b,pictureShow) {
	    var newDiv = parent.document.createElement("div");  
	    newDiv.style.margin = "5px";  
	    newDiv.style.height = "120px";  
	    newDiv.style.width = "160px";  
	    newDiv.style.border = "1px solid #7F9DB9";  
	    newDiv.style.cssFloat = "left";  
	    newDiv.style.styleFloat = "left";  
	    newDiv.style.position = "relative";  
	    var newImgDiv = parent.document.createElement("div");
	    var newImg = parent.document.createElement("img");  
	    newImg.style.height = "120px";
	    newImg.style.width = "160px";
	    newImgDiv.appendChild(newImg);  
	    newDiv.appendChild(newImgDiv);
	    document.getElementById(pictureShow).appendChild(newDiv);  
	    if (newImg.filters) {
	        try {  
	            newImg.filters.item("DXImageTransform.Microsoft.Alpha").opacity = 0;  
	        } catch (e) {  
	            // If it is not set initially, the browser will throw an error.  This will set it if it is not set yet.  
	            newImg.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=' + 0 + ')';  
	        }  
	    } else {  
	        newImg.style.opacity = 0;  
	    }  
	    newImg.onload = function () {
	        fadeIn(newImg, 0);  
	    };  
	    newImg.src ="../shoppingitem/getPictureFile?pictureFile="+src_s;
	}
	
	function refreshPictureDelete(file,progressPictureName){
		var r=Math.floor(Math.random()*1000);
		var div ='<div id="'+r+'"><SPAN id='+r+"s"+' >'+file.name+'</SPAN> <a href="#" id="'+r+"_"+'" onclick=\"javascript:clickLinkDelete('+r+',2);\" name="rmlink">删除</a> </div>';
		$("."+progressPictureName).html(div);
	} 
	
	//删除上传app文件或上传app图片文件
	  function clickLinkDelete(value,type){
		
		  var fileName = $("#itemImageUrl").val();
		  
		  $.messager.confirm('Confirm','请确认是否删除?',function(r){
			  if (r) {
				  $.ajax({
			          type: "post", 
	                  url: "../shoppingitem/deleteFile", 
	                  dataType: "json", 
	                  data: 'file='+fileName+'&type='+type, 
	                  success: function (data) {
	                	  $("#itemImageId").val("");
	                	  $("#itemImageName").val("");
	                	  $("#itemImageSize").val("");
	                	  $("#itemImageUrl").val("");
	                	  $(".pictureShow").text(""); 
	                	  $(".progressPictureBarStatus").text("");
	                	  $("#"+value+"").css('display','none');
	                	  
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
	
	function cancle_dialog(){
		$('#becaon-dialog').dialog('close');
	}
	
	function cancle(){
		$('#dlg').dialog('close');
	}

</script>
</body>
</html>