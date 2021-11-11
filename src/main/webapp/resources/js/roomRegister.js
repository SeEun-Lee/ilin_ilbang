$(document).ready(function(){
	
	// dtype에 따라 <input>에 disabled='true' 설정을 부여하는 함수입니다.
	function monthOrYear(dtype){
		
		if(dtype == 'm'){
			$("input[name='mrent']").removeAttr('disabled');
			$("input[name='yrent']").attr("disabled", true);
		} else if (dtype == 'y'){
			$("input[name='yrent']").removeAttr('disabled');
			$("input[name='mrent']").attr("disabled", true);
		}
	}
	
	var monthly = $("label[for='month']");
	var yearly = $("label[for='year']");

	$(monthly).on("click",function(){
		monthOrYear('m');
	})
	
	$(yearly).on("click",function(){
		monthOrYear('y');
	})
	
})