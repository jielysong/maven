var pictureImage =null;
var pictureUpload=null;
  //删除上传app文件或上传app图片文件
  function clickLinkDelete(value,type,divId,imageId,flag){
	  //alert(divId);
	  var fileName="";	  
	  fileName=$("#"+imageId).val(); //获取上传app文件名,
	  
	  $.messager.confirm('Confirm','请确认是否删除?',function(r){
		  if (r) {
			  $.ajax({
		          type: "post", 
                  url: "../appManagement/deleteFile", 
                  dataType: "json", 
                  data: 'file='+fileName+'&type='+type, 
                  success: function (data) {
                	  if (type==1){
                		  $("input[name='fileName']").val(""); //获取上传app文件名
                		  $(".progressBarStatus").text("");
                	  }else{
                		  $("input[name='imageName']").val(""); //获取上传app图片文件名
                		  //alert($("#"+divId));
                		  $("#"+divId).text(""); 
                		  $(".progressPictureBarStatus").text("");
                		 
                		  if(flag){
                			  newPictureLoad();
                		  }else{
                			  newSignImage();
                		  }
                		  
                		  //alert(pictureImage);
                		  //alert(pictureImage.destroy());
                		  //alert(pictureUpload.destroy());
                		  //alert(newPictureLoad());
                	  }
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

  
 

/************************头像图片上传回调函数start***************************/
function uploadPictureSuccess(file, serverData) {
	//alert(id);
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
            $("input[name='headerImage']").val(result.fileName);
            addUploadImage(result.url_s,result.src_b,"pictureShow");  
        }  
  
    } catch (ex) {  
        this.debug(ex);  
    }  
}


//加载图片
function addUploadImage(src_s,src_b,id) {
	//alert($("#headerIcon").val());
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
    document.getElementById(id).appendChild(newDiv);  
  
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
    newImg.src ="../appManagement/getPictureFile?pictureFile="+$("#headerIcon").val();
}   

function refreshPictureDelete(file){
	  var r=Math.floor(Math.random()*1000);
	  var div ='<div id="'+r+'"><SPAN id='+r+"s"+' >'+file.name+'</SPAN> <a href="#" id="'+r+"_"+'" onclick=\"javascript:clickLinkDelete('+r+',2,\'pictureShow\',\'headerIcon\',true);\" name="rmlink">删除</a> </div>';
	  $(".progressPictureName").html(div);
}

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
            // $("input[name='appImage']").val(file.name);
            //$("input[name='appImageSize']").val(file.size);
             refreshPictureDelete(file);
             $(".selectdivFileProgress").text("");
            
          // $(".progressName").html(file.name);
             progress.setStatus("文件上传成功！");
             progress.toggleCancel(false);
            
        }
    }catch(ex){
        this.debug(ex);
    }
}

/************************头像图片上传回调函数end***************************/


/************************签名图片上传回调函数start***************************/
function uploadSignSuccess(file, serverData) {
	//alert(id);
    try {  
        var result =eval('(' + serverData + ')');
        if(result.success!= 1) {
            var progress = new UploadAppImageProgress(file, this.customSettings.progressTarget);  
            progress.setError();  
            progress.setStatus(serverData);  
            progress.toggleCancel(false);  
        } else {
            var progress = new UploadAppImageProgress(file, this.customSettings.progressTarget);  
            progress.setComplete();  
            progress.toggleCancel(false);
            $("input[name='stampImage']").val(result.fileName);
            addSignImage(result.url_s,result.src_b,"signShow");  
        }  
  
    } catch (ex) {  
        this.debug(ex);  
    }  
}
function refreshSignDelete(file){
	  var r=Math.floor(Math.random()*1000);
	  //var div = $("#test");
	  var div ='<div id="'+r+'"><SPAN id='+r+"s"+'  >'+file.name+'</SPAN> <a href="#" id="'+r+"_"+'" onclick=\"javascript:clickLinkDelete('+r+',2,\'signShow\',\'stampIcon\',false);\" name="rmlink">删除</a> </div>';
	  $(".progressPictureName1").html(div);
}

//加载图片
function addSignImage(src_s,src_b,divId) {
	//alert($("#stampIcon").val());
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
    document.getElementById("signShow").appendChild(newDiv);  
  
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
    newImg.src ="../appManagement/getPictureFile?pictureFile="+$("#stampIcon").val();
}   

//上传进度设置事件
function uploadSignProgress(file, bytesLoaded) { 
   try {
       var percent = Math.ceil((bytesLoaded / file.size) * 100); 
       var progress = new UploadAppImageProgress(file, this.customSettings.upload_target);
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
function uploadSignComplete(file) {
    try {
        //若有多个文件，则上传一个成功后，继续上传，否则显示上传成功！
        if (this.getStats().files_queued > 0) {
             this.startUpload();
        }else{
             var progress = new UploadAppImageProgress(file, this.customSettings.upload_target);
             progress.setComplete();
            // $("input[name='appImage']").val(file.name);
            // $("input[name='appImageSize']").val(file.size);
             refreshSignDelete(file);
             $(".selectPictureFileProgress").text("");
             
          // $(".progressName").html(file.name);
             progress.setStatus("文件上传成功！");
             progress.toggleCancel(false);
        }
    }catch(ex){
        this.debug(ex);
    }
}

/************************签名图片上传回调函数end***************************/


window.onload = function() {
	
	newPictureLoad();
	//newSignImage();
	
	
	

	$("input[name='size_']").attr({readonly:"true"});
};

function newPictureLoad(){
	//alert($(".selectdivFileProgress").find("span").val());
	if($(".selectdivFileProgress").find("span").val()== undefined){
		$(".selectdivFileProgress").append("<span id='selectdivFile'></span>")
	}
	var confApp={};
	confApp.uploadPictureProgress=uploadPictureProgress;
	confApp.uploadPictureSuccess=uploadPictureSuccess;
	confApp.uploadPictureComplete=uploadPictureComplete;
	confApp.selectPictureFile="selectdivFile";
	confApp.pictureFileProgressContainer="selectdivFileContainer";
	confApp.pictureUploadProgress1="pictureUploadProgress1";
	confApp.title="请选择图片";
	confApp.fileSize="50 MB";
	pictureImage=new Pictureupload(confApp);
	//return pictureImage;
}

function newSignImage(){
	if($(".selectPictureFileProgress").find("span").val()== undefined){
		$(".selectPictureFileProgress").append("<span id='selectPictureFile'></span>")
	}
	var conf={};
	conf.uploadPictureProgress=uploadSignProgress;
	conf.uploadPictureSuccess=uploadSignSuccess;
	conf.uploadPictureComplete=uploadSignComplete;
	conf.selectPictureFile="selectPictureFile";
	conf.pictureFileProgressContainer="pictureFileProgressContainer";
	conf.pictureUploadProgress1="pictureUploadProgress1";
	conf.title="请选择图片";
	conf.fileSize="50 MB";
	pictureUpload=new Pictureupload(conf);
	//return pictureUpload;
}

function Pictureupload(conf){
	var uploadImage = new SWFUpload({
		// Backend Settings
		upload_url: "../appManagement/swfUploadFile",
		post_params: {"type": "2"},
		// File Upload Settings
		file_size_limit : conf.fileSize,	// 2MB
		file_types : "*.jpg;*.jpeg;*.png;*.gif", 
		file_types_description : "Web Image Files",
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



function showImage(value){
	return "<img class=\"appListImageName\"   src='../appManagement/getPictureFile?pictureFile="+ value +"'  onerror=\"this.src='../images/login-bg.gif'\" />";
}



