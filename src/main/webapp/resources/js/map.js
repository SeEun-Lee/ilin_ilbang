
$(document).ready(function(){
	
	// 지도API
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	
	//$('.find_map > a').on('click', function(e){
	
	$(document).on('click', '.find_map > a', function(e){
	
	
		e.preventDefault();
		e.stopPropagation();
		
		// 클릭 시 배경색 적용
		$('.find_map').removeClass('active');
		$(this).parent().addClass('active');
		
		// 클릭한 방의 rcode와 addr 추출
		var rcode = $(this).next().text();
		var addr = $(this).parent().next().text();
		
		console.log(addr);
		console.log(rcode);
		
		var dep;
		var mrent;
		
		//	console.log(JSON.stringify(list.rcdoe));
		
		// 전체리스트와 클릭한 방의 rcode를 비교하여 dep과 mrent 추출
		var dataset = list;
		$.each(dataset, function(idx){
			
			if (dataset[idx].rcode == rcode){
				dep = dataset[idx].dep;
				mrent = dataset[idx].mrent;
			};
			
		});
		
		console.log(dep);
		console.log(mrent); 
		
	
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
		            content: '<div style="width:150px; text-align:center; padding:6px 0;">'
		            		 + dep + '/' + mrent + '</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
	    	};
	    }); // geocoder.addressSearch();
	
	    
	});    

});