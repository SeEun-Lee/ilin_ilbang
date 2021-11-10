/* 찜 기능 Javascript */

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
		$('.modal_dislike_mul').fadeOut(200);
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
		
		var rcodeArr = []; 
		var rcode = $(this).parent().find('.modal_rcode').text();
		rcodeArr.push(rcode);
		console.log(rcode);
		
		$.ajax({ // like 컨트롤러로 rcode 보냄
			url : '/dislike',
			type : 'post',
			async: false,
			dataType : 'text',
			data : { rcodeArr : rcodeArr },
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
		}) // 모달창 닫기	
	}) // end function 관심 취소
	
	
	// 관심목록에서 방 선택 (체크박스)
	var like_list = $('#list_content_like');
	$('.ck_container', like_list).on('click', function(e){
		console.log('체크박스 click')
		e.stopPropagation();
	});
	
	// 전체선택 체크박스를 눌렀을 경우
	$('.ck_all .ck_container').on('click', function(){
		if($('.ck_all .ck_container input').prop("checked")){ // 체크된 경우 
			$("input[name='selected']").prop("checked", true); // 전부 선택 
		} else { // 체크 해제된 경우 
			$("input[name='selected']").prop("checked", false); // 전부 선택 헤제
		}
	});
	
	// 선택한 방 삭제하기
	$('.btn_delete').on('click', function(e){
		e.preventDefault();
		var rcodeArr = []; 
		// 체크된 방의 rcode를 배열에 담는다
		$('input:checkbox[name=selected]:checked').each(function(){
			rcodeArr.push($(this).val());
		})
		console.log(rcodeArr);
		$.ajax({
			url : '/dislike',
			type : 'post',
			async : false,
			data : { rcodeArr : rcodeArr },
			success : function(data){
				if (data == "1"){ // 성공적으로 삭제를 하면
					$('.modal_dislike_mul').fadeIn(200);
				} else {
					alert("삭제할 방이 없음")
				}
			},
			error : function(xhr, status, error){
				alert("실패")
			}
		}) // end ajax
		$('.modal_dislike_mul .modal_close, .modal_dislike_mul .modal_btn_2').on("click", function(e){
			e.preventDefault();
			closeModal();
			location.reload();
		}) // 모달창 닫기	
	}); // end function 

})