$(document).ready(function(e){
	// form태그의 role속성의 값이 form인것을 선택하여 formObj변수에 저장
	var formObj=$("form[role='form']");
	// submit버튼을 클릭하면
	$("button[type='submit']").on("click",function(e){
		// 현재 submit에 적용되어 있는 클릭이벤트를 취소.
		e.preventDefault();
		
		var str="";
		
		$(".uploadResult ul li").each(function(i,obj){
			var jobj=$(obj);
			console.log(jobj);
			
			str+="<input type='text' name='attachList["+i+"].filename' value='"+jobj.data("filename")+"'>";
			str+="<input type='text' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str+="<input type='text' name='attachList["+i+"].uploadpath' value='"+jobj.data("path")+"'>";
			str+="<input type='text' name='attachList["+i+"].filetype' value='"+jobj.data("type")+"'>";
		})
		formObj.append(str).submit();
		//formObj.append(str);
		
	})// $("button[type='submit']") 끝
	
							// 정규식
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	// checkExtension함수 선언(4. 첨부파일 공격에 대비하기 위한 업로드 파일의 확장자 제한 또는 파일 크게 제한)
	function checkExtension(fileName, fileSize) {

		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		//              mainlogo_new.png
		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	} // checkExtension함수 끝
	$("input[type='file']").change(function(e) {
		// jsp에 <form>태그를 대체
		var formData = new FormData();
		//                  선택자 [속성선택자]
		var inputFile = $("input[name='uploadFile']");

		var files = inputFile[0].files;

		console.log(files);

		for (var i = 0; i < files.length; i++) {
			// checkExtension함수 호출
			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			// 폼태그(formData)와 파일정보(files[i])와 uploadFile변수
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
				
				showUploadResult(result);// 업로드 결과 처리 함수
		
				//$(".uploadDiv").html(cloneObj.html());
			}
		}); //$.ajax
		
	}); //$("input[type='file']").change(function(e) { 이벤트 끝
	function showUploadResult(uploadResultArr){
		 
		if(!uploadResultArr || uploadResultArr.length==0){
			return;
		}
		var uploadUL = $(".uploadResult ul");
		   var str = "";
		   
		   $(uploadResultArr).each(function(i, obj){
		     console.log(obj);
				if(obj.image){	// 파일업로드한게 이미지파일이면,
					var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
					str += "<li data-path='"+obj.uploadPath+"'";
					str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
					str +" ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' "
					str += "data-type='image' class='btnR btn-warning btn-circle'>X<i class='fa fa-times'></i></button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str +"</li>";
				}else{	// 파일업로드한게 이미지파일이 아니면,
					var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
				    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				      
					str += "<li "
					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
					str += "class='btnR btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/resources/img/attach.png'></a>";
					str += "</div>";
					str +"</li>";
				}
		   });
		   
		   uploadUL.append(str);
		 }// showUploadResult 함수 끝
	$(".uploadResult").on("click","button" ,function(e){
		  var targetFile = $(this).data("file");
		  var type = $(this).data("type");
		  
		  var targetLi=(this).closest("li");
		  
		  console.log(targetFile);
		  
		  $.ajax({
		    url: '/deleteFile',
		    data: {fileName: targetFile, type:type},
		    dataType:'text',
		    type: 'POST',
		      success: function(result){
		         //alert(result);
		         targetLi.remove();
		       }
		  }); //$.ajax
		  
		});

	$("#month").change(function(){
	    $("#yrent").hide();
	    $("#mrent").show();
	    $("#dep").show();
	    $(".texts").find('input').val(0);
	});
	      
	$("#all").change(function(){
	    $("#dep").hide();
	    $("#yrent").show();
	    $("#mrent").hide();
	    $(".texts").find('input').val(0);
	});
	
	$("#room_submit").attr("disabled", true);
    $("#submit_ck").on('click',function(){
        var chk = $('input:checkbox[id="submit_ck"]').is(":checked");
        if(chk==true){
            $("#room_submit").removeAttr('disabled');
            $("#room_submit").addClass("on");
        }else{
            $("#room_submit").attr("disabled", true);
            $("#room_submit").removeClass("on");
        }

    });
    
    
    
})
$(document).ready(function(){
	$("#myfloor").on('change',function() {
		if($("#myfloor").val()>$("#buildingFloor").val()){
			alert("현재 건물 층수보다 높습니다")
		}
	})
	$("#btnAddr").on("click",function(){
		new daum.Postcode({ 
			oncomplete: function(data) { 
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 
				
				// 각 주소의 노출 규칙에 따라 주소를 조합한다. 
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다. 
				var fullAddr = ''; // 최종 주소 변수 
				var extraAddr = ''; // 조합형 주소 변수 
				
				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다. 
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우 
					fullAddr = data.roadAddress; 
				} else { // 사용자가 지번 주소를 선택했을 경우(J) 
					fullAddr = data.jibunAddress; 
				} 
				
				// 사용자가 선택한 주소가 도로명 타입일때 조합한다. 
				if(data.userSelectedType === 'R'){ 
					//법정동명이 있을 경우 추가한다. 
					if(data.bname !== ''){ 
						extraAddr += data.bname; 
					} 
					// 건물명이 있을 경우 추가한다. 
					if(data.buildingName !== ''){ 
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName); 
					} 
					// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다. 
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); 
				} 
				
				// 우편번호와 주소 정보를 해당 필드에 넣는다. 
				document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용 
				document.getElementById('addr1').value = fullAddr; // 커서를 상세주소 필드로 이동한다. 
				document.getElementById('addr2').focus(); 
			} 
		}).open();
	});
	// 위치 검색하기 출처 카카오맵
	var mapContainer = document.getElementById("staticMap"), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	$("#btnAddr2").on('click',function(){
		var addr = $("#addr1").val();
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(addr, function(result, status) {
			
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker({
					map: map,
					position: coords
				});
				
				// 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new kakao.maps.InfoWindow({
					content: '<div style="width:150px;text-align:center;padding:6px 0;">'+addr+'</div>'
				});
				infowindow.open(map, marker);
				
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		})
		
	})
	
})
