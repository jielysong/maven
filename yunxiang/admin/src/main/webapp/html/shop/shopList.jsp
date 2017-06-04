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
	    padding-right: 55px;
	}
	.uploadXinXiFaBu{
		vertical-align: middle;
	}
	
	#companyList_ul li {
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
			data-options="remoteSort:false,loadMsg:'数据加载中，请稍后...',singleSelect:true,url:'../shop/getData',rownumbers:true,pagination:true,pageSize:20">
        <thead>
            <tr>
            	<th data-options="field:'companyId',sortable:true,width:100,align:'center'" hidden="true"></th>
            	
                <th data-options="field:'shopName',formatter:showImage,sortable:true,width:160,align:'center'">商铺名</th>
                <th data-options="field:'companyName',sortable:true,width:160,align:'center'">公司名</th>
                <th data-options="field:'onwerName',sortable:true,width:100,align:'center'">商铺负责人</th>
                <th data-options="field:'pName',sortable:true,width:100,align:'center'">省</th>
                <th data-options="field:'cName',sortable:true,width:100,align:'center'">市</th>
                <th data-options="field:'beaconNum',sortable:true,width:60,align:'center'">设备数量</th>
                <th data-options="field:'createDate',sortable:true,width:150,align:'center'">创建时间</th>
                <th data-options="field:'shopId',sortable:true,width:90,align:'center'" formatter="formatBeacon">设备详情</th>
                <th data-options="field:'banner',sortable:true,width:110,align:'center'" formatter="formatBannerImages">管理商铺广告</th>
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
    		<label>省</label> 
			<select class="easyui-combobox" id="province" name="province" style="width:90px;" data-options="valueField:'pId', textField:'pName',editable:false,height:'20px'" >	
				<option value ="">请选择</option>
			</select>	
			<label>市</label>
 			<select class="easyui-combobox" id="city" name="city" style="width:90px;" data-options="valueField:'cId', textField:'cName',editable:false,height:'20px'" >	
				<option value ="">请选择</option>
			</select>
			<label>商铺名称</label> 
			<input name="shopName" id="shopName" class="easyui-validatebox" data-options="validType:'maxLength[10]'">
    	
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="javascript:datasearch()">查询</a>
		</div> 
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 400px; height: 450px; padding: 10px 20px" closed="true" buttons="#dlg-buttons" data-options="iconCls:'icon-save',modal:true" >
		<form id="fm" method="post" novalidate>
			<input name="shopId" type="hidden" class="easyui-validatebox">
			
			<input name="itemId" type="hidden" class="easyui-validatebox">
			<input id="itemImageId_shop" name="itemImageId" type="hidden" class="easyui-validatebox">
			<input id="itemImageName_shop" name="itemImageName" type="hidden" class="easyui-validatebox">
			<input id="itemImageSize_shop" name="itemImageSize" type="hidden" class="easyui-validatebox">
			<input id="itemImageUrl_shop" name="itemImageUrl" type="hidden" class="easyui-validatebox">
			
			<div class="fitem">
				<label>店铺名称:</label><input id="shopName" name="shopName" class="easyui-validatebox" missingMessage="店铺名称必须填写" required="true">
			</div>
			<div class="fitem">
				<label>省:</label> 
				<select class="easyui-combobox easyui-validatebox" id="pId" name="pId" style="width:134px;" data-options="valueField:'pId', textField:'pName',editable:false,height:'20px'" >	
					<option value ="">请选择</option>
				</select>
			</div>
			<div class="fitem">
				<label>市:</label> 
			 	<select class="easyui-combobox easyui-validatebox" id="cId" name="cId" style="width:134px;" data-options="valueField:'cId', textField:'cName',editable:false,height:'20px'" >	
					<option value ="">请选择</option>
				</select>
			</div>
			<div class="fitem">
				<label>地址:</label> <input name="street" class="easyui-validatebox" >
			</div>
			<div class="fitem">
				<label>公司:</label> 
				<input id="dlg_companyName" name="companyName" onclick="showCompany();" class="easyui-validatebox" >
				<input id="dlg_companyId" name="companyId" type="hidden" class="easyui-validatebox">
			</div>
		</form>
		<form action="pictureAction" method="post" name="thisform" enctype="multipart/form-data"> 
			<div class="selectPictureFileProgress_shop" >
				<span id="selectPictureFile_shop"></span>
			</div> 
			<div id="pictureFileProgressContainer_shop" ></div>
			<div id="pictureShow_shop" class="pictureShow_shop"></div>
	    </form>
		
	</div>

	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancle()">取消</a>
	</div>
	
	
	
	<div id="becaon-dlg" class="easyui-dialog" style="width: 400px; height: 450px; padding: 10px 20px" closed="true" buttons="#becaon-dlg-buttons" data-options="iconCls:'icon-save',modal:true" >
		<form id="becaonfm" method="post" novalidate>
			<input name="shopId" type="hidden" class="easyui-validatebox">
			<div class="fitem">
				<label>beaconId:</label> <input name="beaconId" class="easyui-validatebox" >
			</div>
		</form>
	</div>
	
	<div id="becaon-dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveBeacon()">保存</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancleBeacon()">取消</a>
	</div>
	
<!-- 	<div id="becaon-buttons"> -->
<!-- 		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" id="saveServerManage" onclick="saveServerManage()">确定</a>  -->
<!-- 		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#selectServerManage').dialog('close')">取消</a> -->
<!-- 	</div>	 -->
	
	
    <div id="becaon-toolbar" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
     		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addBeacon()">添加</a>
	 		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteBeacon()">删除</a>
    	</div>
	</div>	
	
	
	<div id="becaon-dialog" class="easyui-dialog" style="width:800px;height:400px" closed="true"  data-options="iconCls:'icon-save',toolbar:'#becaon-toolbar',modal:true" >
	     <div id="beaconList" class="beaconList">
			<table id="dg_beacon" ></table>
		</div>
	</div>
	
	
	
	<div id="banner-dlg" class="easyui-dialog" style="width: 400px; height: 450px; padding: 10px 20px" closed="true" buttons="#banner-dlg-buttons" data-options="iconCls:'icon-save',modal:true" >
		<form id="bannerfm" method="post" novalidate>
			<input id="banner_dlg_shopId" name="shopId" type="hidden" class="easyui-validatebox">
			
			<input name="itemId" type="hidden" class="easyui-validatebox">
			<input id="itemImageId" name="itemImageId" type="hidden" class="easyui-validatebox">
			<input id="itemImageName" name="itemImageName" type="hidden" class="easyui-validatebox">
			<input id="itemImageSize" name="itemImageSize" type="hidden" class="easyui-validatebox">
			<input id="itemImageUrl" name="itemImageUrl" type="hidden" class="easyui-validatebox">
			
		</form>
		<form action="pictureAction" method="post" name="thisform" enctype="multipart/form-data"> 
			<div class="selectPictureFileProgress" >
				<span id="selectPictureFile"></span>
			</div> 
			<div id="pictureFileProgressContainer" ></div>
			<div id="pictureShow" class="pictureShow"></div>
	    </form>
	</div>
	
	<div id="banner-dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveBanner()">保存</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancleBanner()">取消</a>
	</div>
	
	
    <div id="banner-toolbar" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
     		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addBanner()">添加</a>
	 		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteBanner()">删除</a>
    	</div>
	</div>	
	
	
	<div id="banner-dialog" class="easyui-dialog" style="width:800px;height:400px" closed="true"  data-options="iconCls:'icon-save',toolbar:'#banner-toolbar',modal:true" >
	     <div id="beaconList" class="beaconList">
	     <input id="banner_shopId" type="hidden" />
			<table id="dg_banner" ></table>
		</div>
	</div>		
	
	
	
	
	<div id="company-dialog" class="easyui-dialog" style="width:800px;height:400px" closed="true" buttons="#company-dlg-buttons" data-options="iconCls:'icon-save',toolbar:'#company-toolbar',modal:true" >
	     <div id="companyList" class="beaconList">
			<ul id="companyList_ul">
			
			</ul>
		</div>
	</div>
	
	<div id="company-dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="select_company()">确定</a> 
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="cancle_company()">取消</a>
	</div>
	
	<div id="company-toolbar" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
     		<label>商铺名称</label> 
			<input name="companyName" id="dialog_search_companyName" class="easyui-validatebox" data-options="validType:'maxLength[10]'">
			<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="javascript:searchCompany()">查询</a>
    	</div>
	</div>
	
	
	
	<script type="text/javascript">
window.onload = function() {
		
		function Pictureupload(conf){
			
			var uploadImage = new SWFUpload({
				// Backend Settings
				upload_url: "<%=request.getContextPath()%>/shop/swfUploadFile",
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
		
		
		var conf_shop={};
		conf_shop.uploadPictureProgress=uploadPictureProgress;
		conf_shop.uploadPictureSuccess=uploadPictureSuccess_shop;
		conf_shop.uploadPictureComplete=uploadPictureComplete_shop;
		conf_shop.selectPictureFile="selectPictureFile_shop";
		conf_shop.pictureFileProgressContainer="pictureFileProgressContainer_shop";
		conf_shop.pictureUploadProgress1="pictureUploadProgress_shop";
		conf_shop.title="请选择图片";
		conf_shop.fileSize="60 KB";
		conf_shop.file_types="*.jpg;*.jpeg;*.png;*.bmp;*.gif";
		var pictureUpload1=new Pictureupload(conf_shop);
		
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
		return "<img class=\"appListImageName\"  src='../shop/getPictureFile?t="+Math.random()+"&fileEntryId="+row.smallImageId+"&pictureFile="+row.smallImageURL+"' /> <div class=\"appListTitleContent\">"+value+"</div>";
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
	    newImg.src ="../shop/getPictureFile?pictureFile="+src_s;
	}
	
	function refreshPictureDelete(file,progressPictureName){
		var r=Math.floor(Math.random()*1000);
		var div ='<div id="'+r+'"><SPAN id='+r+"s"+' >'+file.name+'</SPAN> <a href="#" id="'+r+"_"+'" onclick=\"javascript:clickLinkDelete('+r+',2);\" name="rmlink">删除</a> </div>';
		$("#pictureFileProgressContainer ."+progressPictureName).html(div);
	} 
	
	//删除上传app文件或上传app图片文件
	  function clickLinkDelete(value,type){
		
		  var fileName = $("#itemImageUrl").val();
		  
		  $.messager.confirm('Confirm','请确认是否删除?',function(r){
			  if (r) {
				  $.ajax({
			          type: "post", 
	                  url: "../shop/deleteFile", 
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
	                	  
// 	                	  if (type==1){
// 	                		  $("input[name='fileName']").val(""); //获取上传app文件名
// 	                		  $(".progressBarStatus").text("");
// 	                		  $(".progressAppPackageBarStatus").text(""); 
// 	                		  $(".showUploadAppImage").text("");
// 	                	  }else{
// 	                		  $("input[name='imageName']").val(""); //获取上传app图片文件名
// 	                		  $(".pictureShow").text(""); 
// 	                		  $(".progressPictureBarStatus").text("");
// 	                	  }
// 	               	      $("#"+value+"").css('display','none');
	               	      
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
	
	
	
	
	
	
	
	
	
	
	
	
	
		//上传一个文件成功后，所触发的事件。
		function uploadPictureComplete_shop(file) {
		    try {
		        //若有多个文件，则上传一个成功后，继续上传，否则显示上传成功！
		        if (this.getStats().files_queued > 0) {
		             this.startUpload();
		        }else{
		             var progress = new FilePictureProgress(file, this.customSettings.upload_target);
		             progress.setComplete();
		             $("#itemImageName_shop").val(file.name);
		             $("#itemImageSize_shop").val(file.size);
		             refreshPictureDelete_shop(file,"progressPictureName");
		          // $(".progressName").html(file.name);
		             progress.setStatus("文件上传成功！");
		             progress.toggleCancel(false);
		        }
		    }catch(ex){
		        this.debug(ex);
		    }
		}
		
		function uploadPictureSuccess_shop(file, serverData) {
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
		            
		            $("#itemImageName_shop").val(result.fileName);
		            $("#itemImageUrl_shop").val(result.url_s);
		            $("#itemImageId_shop").val(result.fileId);

		            addUploadImage(result.url_s,result.src_b,"pictureShow_shop");  
		        }  
		  
		    } catch (ex) {  
		        this.debug(ex);  
		    }  
		}
		
		
		function refreshPictureDelete_shop(file,progressPictureName){
			var r=Math.floor(Math.random()*1000);
			var div ='<div id="'+r+'"><SPAN id='+r+"s"+' >'+file.name+'</SPAN> <a href="#" id="'+r+"_"+'" onclick=\"javascript:clickLinkDelete_shop('+r+',2);\" name="rmlink">删除</a> </div>';
			$("#pictureFileProgressContainer_shop ."+progressPictureName).html(div);
		} 
		
		//删除上传app文件或上传app图片文件
		  function clickLinkDelete_shop(value,type){
			
			  var fileName = $("#itemImageUrl").val();
			  
			  $.messager.confirm('Confirm','请确认是否删除?',function(r){
				  if (r) {
					  $.ajax({
				          type: "post", 
		                  url: "../shop/deleteFile", 
		                  dataType: "json", 
		                  data: 'file='+fileName+'&type='+type, 
		                  success: function (data) {
		                	  $("#itemImageId_shop").val("");
		                	  $("#itemImageName_shop").val("");
		                	  $("#itemImageSize_shop").val("");
		                	  $("#itemImageUrl_shop").val("");
		                	  $(".pictureShow_shop").text(""); 
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
		
		
		
		
		
		
		
	
	
	
	$(function() {
		initProvince();
		changeCity();
	});
	
	function initProvince() {
		$.ajax({
	        type: "post", 
	        url: "<%=request.getContextPath()%>/common/getProvinceList", 
	        dataType: "json", 
	        data: '',
	        success: function (data) {
	        	$("#pId").combobox("loadData", data); 
	     	    if (data.length>0) {
		            $('#pId').combobox('select', data[0].pId);
		        }
	        	var arr={
	                "pId" :0,
	                "pName":"全部"
	            };
	        	data.push(arr);
	     	    $("#province").combobox("loadData", data);
	     	    if (data.length>0) {
		            $('#province').combobox('select', data[data.length-1].pId);
		        }
	        }, 
	        error: function (XMLHttpRequest, textStatus, errorThrown) {
	            alert(errorThrown); 
	        } 
	    });
		
	}
	
	function changeCity() {
		var pId = $("#province").combobox("getValue"); 
		if (pId==null || pId==""){
			return;
		}
		$.ajax({
	        type: "post", 
	        url: "<%=request.getContextPath()%>/common/getCityList", 
	        dataType: "json", 
	        data: {"pId" : pId},
	        success: function (data) {
	     	    $("#city").combobox("loadData", data);
	     	    if (data.length>0) {
	              $('#city').combobox('select', data[0].cId);
	            }
	        }, 
	        error: function (XMLHttpRequest, textStatus, errorThrown) {
	            alert(errorThrown); 
	        } 
		});
	}
	
	
	$('#province').combobox({
       onSelect: function (record) {
    	   if (record.pId!=0){
    		   $.ajax({
			        type: "post", 
			        url: "<%=request.getContextPath()%>/common/getCityList", 
			        dataType: "json", 
			        data: {"pId" :  record.pId},
			        success: function (data) {
			        	var arr={
			                "cId" :0,
			                "cName":"全部"
			            };
			        	data.push(arr);
			     	    $("#city").combobox("loadData", data);
			     	    if (data.length>0) {
			              $('#city').combobox('select', data[data.length-1].cId);
			            }
			        }, 
			        error: function (XMLHttpRequest, textStatus, errorThrown) {
			            alert(errorThrown); 
			        } 
			   }); 
    	   }else{
    		   var jsonDataCity = [];
    		   jsonDataCity.push({"cId":"0","cName":"全部"}); //没有选择项
    		   $("#city").combobox("loadData", jsonDataCity);
    		   $('#city').combobox('select', 0);
    	   }
       }                                                     
    });  
	
	function changeCId(pId) {
		if (pId==null || pId==""){
			return;
		}
		$.ajax({
		   type: "post", 
		   url: "<%=request.getContextPath()%>/common/getCityList", 
		   dataType: "json", 
		   data: {"pId" : pId},
		   success: function (data) {
			    $("#cId").combobox("loadData", data);
			    if (data.length>0) {
		          $('#cId').combobox('select', data[0].cId);
		        }
		   }, 
		   error: function (XMLHttpRequest, textStatus, errorThrown) {
		       alert(errorThrown); 
		   } 
		});
	}
	
	function modifyCity(pId,cId) {
		if (pId==null || pId==""){
			return;
		}
		$.ajax({
	        type: "post", 
	        url: "<%=request.getContextPath()%>/common/getCityList", 
	        dataType: "json", 
	        data: {"pId" : pId},
	        success: function (data) {
	     	    $("#cId").combobox("loadData", data);
	     	    $('#cId').combobox("setValue", cId);
	        }, 
	        error: function (XMLHttpRequest, textStatus, errorThrown) {
	            alert(errorThrown); 
	        } 
		});
	}
	   
	
	
	 //查询站点管理信息
    function datasearch(){
    	$("#dg").datagrid({
    		onBeforeLoad:function(row){
    			var shopName = $("#shopName").val();
    			var pId = $("input[name='province']").val();
    			var cId = $("input[name='city']").val();
    			
    			row.pId= pId !=0 ? pId:"";
    			row.cId= cId !=0 ? cId:"";
    			row.shopName=shopName;
    	    }  
    	});

    }
	 
	 
    $('#pId').combobox({
       onSelect: function (record) {
    	   $.ajax({
		        type: "post", 
		        url: "<%=request.getContextPath()%>/common/getCityList", 
		        dataType: "json", 
		        data: {"pId" :  record.pId},
		        success: function (data) {
		     	    $("#cId").combobox("loadData", data);
		     	    if (data.length>0) {
		               $('#cId').combobox('select', data[0].cId);
		            }
		        }, 
		        error: function (XMLHttpRequest, textStatus, errorThrown) {
		            alert(errorThrown); 
		        } 
		   });                                               
       }                                                     
    });  
	 
	 
	function cancle(){
		$('#dlg').dialog('close');
	}
	
	function addShop() {
		$('#dlg').dialog('open').dialog('setTitle', '添加商铺');
		$('#fm').form('clear');
		$('#pId').combobox("setValue","1");
		
		$("#itemImageId_shop").val("");
	    $("#itemImageName_shop").val("");
	    $("#itemImageSize_shop").val("");
	    $("#itemImageUrl_shop").val("");
	    $("#pictureFileProgressContainer_shop").html(""); 
	    $("#pictureShow_shop").html("");
	    
	    $("#pictureFileProgressContainer").html(""); 
	    $("#pictureShow").html("");
	    
		changeCId(1);
	}
	
	function editShop() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$('#dlg').dialog('open').dialog('setTitle', '修改商铺');
			
			$("#itemImageId_shop").val("");
		    $("#itemImageName_shop").val("");
		    $("#itemImageSize_shop").val("");
		    $("#itemImageUrl_shop").val("");
		    $("#pictureFileProgressContainer_shop").html(""); 
		    $("#pictureShow_shop").html("");
			
			$('#fm').form('load', row);
			modifyCity(row.pId,row.cId);
		}
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
	                  data: {"shopId" : shopRow.shopId,
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
	
	function save() {
		$('#fm').form('submit',{
		      url:"<%=request.getContextPath()%>/shop/saveShop",
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
	function destroy() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$.messager.confirm('Confirm','请确认是否删除?',function(r){
			  if (r) {
				  $.ajax({
			          type: "post", 
	                  url: "<%=request.getContextPath()%>/shop/deleteShop", 
	                  dataType: "json", 
	                  data: {"shopId" : row.shopId},
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
	    		{field:'uuid',title:'uuid',width:100,align:'center'},
				{field:'major',title:'major',width:100,align:'center'},
				{field:'minor',title:'minor',width:100,align:'center'},
				{field:'wxid',title:'wxid',width:100,align:'center'},
				{field:'pwd',title:'密码',width:100,align:'center'},
				{field:'status',title:'状态',width:100,align:'center'},
				{field:'createDate',title:'创建时间',width:150,align:'center'},
				{field:'updateDate',title:'修改时间',width:150,align:'center'}
	        ]]
	    });
	    
// 	    $('#dg_beacon').datagrid('load',{shopId:value});
		
		
// 		$.ajax({
// 	        type: "post", 
<%--             url: "<%=request.getContextPath()%>/shop/getBeaconList",  --%>
//             dataType: "json", 
//             data: {"shopId" : value},
//             success: function (data) {
// //             	var beaconList_ul = $("#beaconList_ul");
            	
//             	var beacon_tbody = $("#beacon_tbody");
            	
// 	           	$.each(data.rows, function(index, item){
	           		
// 	           		var beaconInfo = "<tr><td>" + item.uuid + "</td><td>" + item.major + "</td><td>" + item.minor + "</td><td>" + item.wxid + "</td><td>" + item.pwd + "</td><td>" + item.status + "</td><td>" + item.createDate + "</td><td>" + item.updateDate + "</td></tr>";
	           		
// 	           		beacon_tbody.append(beaconInfo);
	           		
// // 					var beaconList_li = "<ul><li>" + item.uuid + "</li><li>" + item.major + "</li><li>" + item.minor + "</li><li>" + item.wxid + "</li><li>" + item.pwd + "</li><li>" + item.status + "</li><li>" + item.createDate + "</li><li>" + item.updateDate + "</li></ul>";					
// // 					beaconList_ul.append(beaconList_li);
					
// 				});
//             }, 
//             error: function (XMLHttpRequest, textStatus, errorThrown) {
//                 alert(errorThrown); 
//             } 
// 		  });	
	}
	
	
// 	$('#dg').datagrid({
// 		view: detailview,
// 		detailFormatter:function(index,row){
// 			return '<div style="padding:2px"><table class="ddv"></table></div>';
// 		},
// 		onExpandRow: function(index,row){
// 			var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
// 			ddv.datagrid({
<%-- 				url:'<%=request.getContextPath()%>/shop/getBeaconList?shopId='+row.shopId, --%>
// 				fitColumns:true,
// 				singleSelect:true,
// 				rownumbers:true,
// 				loadMsg:'',
// 				height:'auto',
// 				columns:[[
// 					{field:'uuid',title:'uuid',width:80},
// 					{field:'major',title:'major',width:80},
// 					{field:'minor',title:'minor',width:80},
// 					{field:'wxid',title:'wxid',width:80},
// 					{field:'pwd',title:'密码',width:80},
// 					{field:'status',title:'状态',width:10},
// 					{field:'createDate',title:'创建时间',width:80},
// 					{field:'updateDate',title:'修改时间',width:80}
// 				]],
// 				onResize:function(){
// 					$('#dg').datagrid('fixDetailRowHeight',index);
// 				},
// 				onLoadSuccess:function(){
// 					setTimeout(function(){
// 						$('#dg').datagrid('fixDetailRowHeight',index);
// 					},0);
// 				}
// 			});
// 			$('#dg').datagrid('fixDetailRowHeight',index);
// 		}
// 	});



	function formatBannerImages(val,row,index){
	//		return "<a hrf='javascript:void(0);' onclick='showBeacon("+value+")'>设备详情</a>";
		return '<input type="button" value="管理商铺广告" onclick="showBannerImages(\'' + row.shopId + '\')" ></input>';
	};
	
	function showBannerImages(value){

		$('#banner-dialog').dialog('open').dialog('setTitle', '管理商铺广告');
	    $('#dg_banner').datagrid({
	    	singleSelect:true,
	        url:'<%=request.getContextPath()%>/shop/getBannerList',
	        queryParams:{shopId:value},
	        onDblClickCell: onDblClickCell,
	        onAfterEdit:fouconAfterEdit,
	        onBeforeEdit:onClickonBeforeEdit,
	        columns:[[
				{field:'fileEntryId',title:'fileEntryId',width:100,align:'center'},
				{field:'fileName',title:'广告图片',width:100,align:'center',
					formatter:function(value,row,index){  
						return "<img class=\"appListImageName\"  src='../shop/getPictureFile?t="+Math.random()+"&fileEntryId="+row.fileEntryId+"&pictureFile="+row.fileName+"' />";
					}
				},
// 				{field:'fileOrder',title:'顺序',width:100,editor:'numberbox'}
				{field:'fileOrder',title:'排序',width:100,
					editor:{
						type:'numberbox'
					}
				}
				
	        ]],
	        onBeforeLoad:function(data){
	        	$("#banner_shopId").val(value);
	        }
	    });
		
	}
	
	function addBanner(){
		$('#banner-dlg').dialog('open').dialog('setTitle', '添加广告');
		
		$('#bannerfm').form('clear');
		
		$("#itemImageId").val("");
	    $("#itemImageName").val("");
	    $("#itemImageSize").val("");
	    $("#itemImageUrl").val("");
	    $("#pictureFileProgressContainer").html(""); 
	    $("#pictureShow").html("");
	    
	    $("#pictureFileProgressContainer_shop").html(""); 
	    $("#pictureShow_shop").html("");
	    
	    var shopId = $("#banner_shopId").val();
		$("#banner_dlg_shopId").val(shopId);
	}
	
	
	function saveBanner(){
		$('#bannerfm').form('submit',{
		      url:"<%=request.getContextPath()%>/shop/saveShopBanner",
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
		        	  $('#banner-dlg').form('clear');
		              $('#banner-dlg').dialog('close');
		              $('#dg_banner').datagrid('reload');
	             
		          }
		      }
		   });
	}
	
	function cancleBanner(){
		 $('#banner-dlg').form('clear');
         $('#banner-dlg').dialog('close');
         $('#dg_banner').datagrid('reload');
	}
	
	
	function deleteBanner(){
		var row = $('#dg_banner').datagrid('getSelected');
		var shopId = $('#banner_shopId').val();
		if (row) {
			$.messager.confirm('Confirm','请确认是否删除?',function(r){
			  if (r) {
				  $.ajax({
			          type: "post", 
	                  url: "<%=request.getContextPath()%>/shop/deleteBanner", 
	                  dataType: "json", 
	                  data: {
	                	  "shopId" : shopId,
	                	  "fileEntryId" : row.fileEntryId
	                  },
	                  success: function (data) {
	                	  $('#dg_banner').datagrid('reload');   	      
	                  }, 
	                  error: function (XMLHttpRequest, textStatus, errorThrown) {
	                      alert(errorThrown); 
	                  } 
				  });	
	          }
		   });
		} 
	}
	
	function showCompany(){
		$.ajax({
	        type: "post", 
            url: "<%=request.getContextPath()%>/shop/getAllCompany", 
            dataType: "json", 
            success: function (data) {
            	$("#companyList_ul").html('');
            	$.each(data,function(index, company){
            		$("#companyList_ul").append('<li><input type="radio" value="' + company.companyId + '" name="companyName" data="' + company.companyName + '">' + company.companyName + '</li>');
            		
            	});
            	
            	$('#company-dialog').dialog('open').dialog('setTitle', '选择公司');   	      
            }, 
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown); 
            } 
		});
	}
	
	function searchCompany(){
		var companyName = $("#dialog_search_companyName").val();
			
		$.ajax({
	        type: "post", 
            url: "<%=request.getContextPath()%>/shop/getAllCompany", 
            dataType: "json", 
            data:{
            	"companyName" : companyName
            },
            success: function (data) {
            	$("#companyList_ul").html('');
            	$.each(data,function(index, company){
            		$("#companyList_ul").append('<li><input type="radio" value="' + company.companyId + '" name="companyName">' + company.companyName + '</li>');
            	});
            }, 
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown); 
            } 
		 });
	}
	
	function select_company(){
		var companyId = $("#companyList_ul").find('input[name="companyName"]:checked').val();
		var companyName = $("#companyList_ul").find('input[name="companyName"]:checked').attr("data");
		
		$("#dlg_companyName").val(companyName);
		$("#dlg_companyId").val(companyId);
		
		$('#company-dialog').dialog('close');
	}
	
	function cancle_company(){
		$('#company-dialog').dialog('close');
	}
	

	
	
	
	
	$.extend($.fn.datagrid.methods, {
	    editCell: function(jq,param){
	        return jq.each(function(){
	            var opts = $(this).datagrid('options');
	            var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
	            for(var i=0; i<fields.length; i++){
	                var col = $(this).datagrid('getColumnOption', fields[i]);
	                col.editor1 = col.editor;
	                if (fields[i] != param.field){
	                    col.editor = null;
	                }
	            }
	            $(this).datagrid('beginEdit', param.index);
	            for(var i=0; i<fields.length; i++){
	                var col = $(this).datagrid('getColumnOption', fields[i]);
	                col.editor = col.editor1;
	            }
	        });
	    }
	});
	
	var editIndex = undefined;
	var editColumn = undefined;
	var editFileOrder = undefined;
	function endEditing(){
		if (editIndex == undefined){
			return true;
		}
		if ($('#dg_banner').datagrid('validateRow', editIndex)){
			$('#dg_banner').datagrid('endEdit', editIndex);
			editIndex = undefined;
			return true;
		} else {
			return false;
		}
	}
	
	function onDblClickCell(index, field){
		if (endEditing()){
			$('#dg_banner').datagrid('selectRow', index).datagrid('editCell', {index:index,field:field});
			
			var row = $('#dg_banner').datagrid('getRows')[index]; 
			
			editFileOrder=row.fileOrder;
	        editColumn=field;
	        editIndex =index;
		}
	}
	
	
	
	
	var editSort="";
	function onClickonBeforeEdit(rowIndex, rowData){
		editSort=rowData.sort; 
	}
	function fouconAfterEdit(index,row){
		var edit=false;
		
		if (editColumn=="fileOrder"){
			edit=true;
			if (editSort=="" || editFileOrder==row.fileOrder){
				return null;
			}
		}
		
		if (edit==false){
			return null;
		}
		
		var shopId = $("#banner_shopId").val();
	
		$.ajax({
	        type: "post", 
	        url:"<%=request.getContextPath()%>/shop/saveBannerSort",
	        dataType: "json", 
	        data: {
	        	shopId:shopId,
	        	fileEntryId:row.fileEntryId ,
	        	sort:row.fileOrder
	        },
	        success: function (data) {
	             if (data.errorMsg){
	                 $.messager.show({
	                     title: 'Error',
	                     msg: "修改失败!"
	                 });
	             } else {
	           	     $.messager.show({
	                     title: '信息提示',
	                     msg: "修改成功!"
	                 }); 
	             }
	             $('#dg_banner').datagrid('reload');  
	        }, 
	        error: function (XMLHttpRequest, textStatus, errorThrown) {
	            alert(errorThrown); 
	        } 
		});
	}

	
	</script>
</body>
</html>