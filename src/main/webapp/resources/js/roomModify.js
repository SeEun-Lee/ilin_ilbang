
/* by 세은, roomModify.jsp Script 입니다. */
$(document).ready(function(){
	
	// by 세은, dtype에 따라 <input>에 disabled='true' 설정을 부여하고 안보이게하는 함수입니다.
	function monthOrYear(dtype){
		if(dtype == 'm'){
			$("input[name='mrent']").removeAttr('disabled');
			$("input[name='yrent']").attr("disabled", true);
			$("#yrent").hide();
		    $("#mrent").show();
		    $("#dep").show();
		} else if (dtype == 'y'){
			$("input[name='yrent']").removeAttr('disabled');
			$("input[name='mrent']").attr("disabled", true);
			$("#dep").hide();
		    $("#yrent").show();
		    $("#mrent").hide();
		}
	}
	// 처음 페이지 로드 시 monthOrYear() 함수를 실행합니다.
	var loadDtype = $("input[name='dtype']:checked").val();
	monthOrYear(loadDtype);
	
	var monthly = $("label[for='month']");
	var yearly = $("label[for='year']");
	// 이후 클라이언트가 '월세''전세'를 선택할 때도 함수가 실행되도록 합니다.
	$(monthly).on("click",function(){
		monthOrYear('m');
	})
	$(yearly).on("click",function(){
		monthOrYear('y');
	})
	
	// by 세은, '수정하기' 클릭시 ajax
	$('#btn_modify').on("click", function(e){
		e.preventDefault();
		$.ajax({
			type : 'put',
			url : '/Modify/' + info.rcode,
			data : JSON.stringify(info),
			contentType : "application/json; charset=utf-8",
			success:function(){
				alert("성공!!!!")
			}
		})//end ajax
	})// end event
	
	

});