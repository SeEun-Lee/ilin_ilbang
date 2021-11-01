$(document).ready(function(){

function showImage(fileCallPath){
	  
	  //alert(fileCallPath);
	
	  $(".bigPictureWrapper").css("display","flex").show();
	  
	  $(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>").animate({width:'100%', height: '100%'}, 1000);

	}
	
	$(".bigPictureWrapper").on("click", function(e){
	  $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
	  setTimeout(() => {
	    $(this).hide();
	  }, 1000);
	});

	
	$(".uploadResult").on("click","span", function(e){
	   
	  var targetFile = $(this).data("file");
	  var type = $(this).data("type");
	  console.log(targetFile);
	  
	  $.ajax({
	    url: '/deleteFile',
	    data: {fileName: targetFile, type:type},
	    dataType:'text',
	    type: 'POST',
	      success: function(result){
	         alert(result);
	       }
	  }); //$.ajax
	  
	});

		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|txt|hwp|pdf|doc|html)$");
		var maxSize = 5242880; //5MB

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}

		var cloneObj = $(".uploadDiv").clone();

		$("#uploadBtn").on("click", function(e) {
			// jsp 에 <form> 태그를 대체
			var formData = new FormData();

			var formData = new FormData();
			//                    속성 선택자
			var inputFile = $("input[name='uploadFile']");

			var files = inputFile[0].files;

			//console.log(files);

			for (var i = 0; i < files.length; i++) {
				//checkExtension함수 호출
				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				// 폼태그(formData) 와 파일정보(files[i])와 uploadFile변수
				// 이용하여 폼태그와 파일정보를 연결
				formData.append("uploadFile", files[i]);

			}

	$.ajax({
		url : '/uploadAjaxAction',
		processData : false,
		contentType : false,
		data : formData,
		type : 'POST',
		dataType : 'json',
		success : function(result) {
	
			console.log(result);
	
			showUploadedFile(result);
	
			$(".uploadDiv").html(cloneObj.html());
		}
	}); //$.ajax

});

var uploadResult = $(".uploadResult ul");

function showUploadedFile(uploadResultArr){
 
   var str = "";
   
   $(uploadResultArr).each(function(i, obj){
     console.log(obj);
     if(obj.image){   // 업로드한 파일이 이미지이면
       
    	 var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
         
         var originPath = obj.uploadPath+ "\\"+obj.uuid +"_"+obj.fileName;
         
         originPath = originPath.replace(new RegExp(/\\/g),"/");
         
         str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\">"+
                "<img src='display?fileName="+fileCallPath+"'></a>"+
                "<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span>"+
                "<li>";
           
     }else{ // 업로드한 파일이 이미지아니면  
       return false;
     }
   });
   
   uploadResult.append(str);
 }
})