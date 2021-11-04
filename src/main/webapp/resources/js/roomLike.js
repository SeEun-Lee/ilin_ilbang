/* 찜 기능 Javascript (모듈화) */

$(document).ready(function(){
		
	// 검색 결과가 없으면 문구 출력
	var result = $('.result').text();
	if (result == "검색결과 없음"){
		$('.isEmpty').show();
	}
	
	var modalLike = $('.modal_like');
	var modalFail = $('.modal_fail');
	var modalDislike = $('.modal_dislike');
	
	function closeModal(){
		$(modalLike).fadeOut(200);
		$(modalFail).fadeOut(200);
		$(modalDislike).fadeOut(200);
	}
	
	// 찜 버튼 클릭
	$('.btn_like').on('click', function(e){
	
		e.preventDefault();
		e.stopPropagation();
	
		var rcode = $(this).next().text();
		
		console.log(rcode);
	
		var modal_like = $('.modal_like');
		var modal_fail = $('.modal_fail');
	
		$.ajax({ // like 컨트롤러로 rcode 보냄
			
			url : '/like',
			type : 'post',
			async: false,
			dataType : 'text',
			data : { rcode : rcode },
			success : function(data){
				if (data == "1"){ // 성공 시,
					modal_like.find('.modal_rcode').text(rcode);
					modal_like.fadeIn(200);
				} else { // 이미 추가된 방일 시, 모달창
					modal_fail.find('.modal_rcode').text(rcode);
					modal_fail.fadeIn(200);
				}
			}, // success 
			error : function(xhr, status, error){
					alert("실패")
			} // error
		}) // ajax 
		
		// Modal - 닫기 버튼
		$('.modal_close, .modal_btn_2').on("click", function(e){
			e.preventDefault();
			closeModal();
		}) 
			
	})
		
	
	// Modal - 관심 취소
	$('.btn_dislike').on("click", function(e){
		e.preventDefault();
		var rcode = $(this).parent().find('.modal_rcode').text();
		console.log(rcode);
		
		$.ajax({ // like 컨트롤러로 rcode 보냄
			url : '/dislike',
			type : 'post',
			async: false,
			dataType : 'text',
			data : { rcode : rcode },
			success : function(data){
				closeModal();
				$('.modal_dislike').find('.modal_rcode').text(rcode);
				$('.modal_dislike').fadeIn(200);
			},
			error : function(xhr, status, error){
					alert("실패")
			} 
		}) // ajax
		
		$('.modal_close, .modal_btn_2').on("click", function(e){
			e.preventDefault();
			closeModal();
			location.reload();
	})
	
	
	
})

})