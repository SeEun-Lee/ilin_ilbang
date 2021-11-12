
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
	
	var loadDtype = $("input[name='dtype']:checked").val();
	var monthly = $("label[for='month']");
	var yearly = $("label[for='year']");
	// 처음 페이지 로드 시 monthOrYear() 함수를 실행합니다.
	monthOrYear(loadDtype);
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
		var rcode = $('input[name="rcode"]').val(); 
		var allData = $('#room_Modify').serializeObject(); // input 데이터를 전부 JSON형식으로
		// @RequestBody로 여러 파라미터를 받을 수 없기때문에 VO별로 분류해서 JSON안에 JSON을 넣어주는 방식을 선택했습니다.
		// (Controller에서는 room_allDataVO로 받습니다.)
		var mappedData = {}; // Controller에 보낼 JSON 입니다.
		var roomI = {rcode : rcode}; // room_infoVO 
		var roomP = {rcode : rcode}; // room_priceVO
		var roomOP = {rcode : rcode}; // room_optionVO
		var infoArr = ['rtype', 'btype', 'rface', 'addr', 'addsub', 'rcmt', 'rcont', 'mvdate'
					  , 'whlarea', 'area', 'flr', 'myflr', 'park', 'pet', 'elev'];
		var priceArr = ['dtype', 'dep', 'mrent', 'yrent', 'mcfee'];
		var optionArr = ['ac', 'washer', 'fridge', 'tv', 'stove', 'microw', 'bed', 'desk'
						, 'closet', 'shelf'];

		// key중에 priceArr[i]가 있으면 room_price에 넣습니다. 
		for (i=0; i<priceArr.length; i++){
			if(allData.hasOwnProperty(priceArr[i])){
				var name = priceArr[i];
				roomP[name] = allData[name];
			} 
		}
		// key중에 optionArr[i]가 있으면 room_option에 넣습니다.
		for (i=0; i<optionArr.length; i++){
			if(allData.hasOwnProperty(optionArr[i])){
				var name = optionArr[i];
				roomOP[name] = allData[name];
			} 
		}  
		// key중에 infoArr[i]가 있으면 room_info에 넣습니다.
		for (i=0; i<infoArr.length; i++){
			if(allData.hasOwnProperty(infoArr[i])){
				var name = infoArr[i];
				roomI[name] = allData[name];
			}
		} // end for 
		mappedData['roomI'] = roomI;
		mappedData['roomP'] = roomP;
		mappedData['roomOP'] = roomOP;
		$.ajax({
			type : 'PUT',
			url : '/Modify/' + rcode,
			data : JSON.stringify(mappedData),
			contentType : "application/json; charset=utf-8",
			success:function(){
				alert("성공!!!!")
			}
		})//end ajax
	})// end event
	
	//by세은, Form Data를 JSON 형태로 만드는 함수입니다. (출처: https://coding-start.tistory.com/152)
	jQuery.fn.serializeObject = function() { 
      var obj = null; 
      try { 
          if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { 
              var arr = this.serializeArray(); 
              if(arr){ obj = {}; 
              jQuery.each(arr, function() { 
                  obj[this.name] = this.value; }); 
              } 
          } 
      }catch(e) { 
          alert(e.message); 
      }finally {} 
      return obj; 
    } // end function

});