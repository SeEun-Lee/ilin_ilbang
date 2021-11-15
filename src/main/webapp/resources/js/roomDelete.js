/* 방 삭제 기능 Javascript 입니다. */

$(document).ready(function(){
	
	var modalDelete = $('#modal_delete');
	var modalNotice = $('#modal_notice');
	var rcode;
	//by세은, '삭제'버튼 클릭 시 삭제모달 Show
	$('.btn_delete').on('click', function(e){
		e.preventDefault;
		rcode = $(this).children('.rcode').text();
		modalDelete.find('.rcode').empty().text(rcode)
					.end().fadeIn(200);
	})//end event
	//by세은, 삭제모달 내 닫기버튼 클릭시 모달 Hide
	$('.modal_close, .modal_btn_2', modalDelete).on('click',function(e){
		e.preventDefault;
		modalDelete.fadeOut(200);
	})//end event
	//by세은, 삭제모달 내 삭제버튼 클릭시 삭제실행 함수호출
	$('.modal_btn_1', modalDelete).on('click', function(e){
		e.preventDefault;
		modalDelete.fadeOut(200);
		roomDelete(rcode);
	})//end event
	
	//by세은, 방 삭제 함수 함수(ajax)입니다.
	function roomDelete(rcode){
		$.ajax({
			type : 'DELETE',
			url : '/' + rcode,
			dataType : 'text',
			success : function(result, status, xhr){
					modalNotice.find('.rcode').empty().text(rcode)
							   .end().fadeIn(200);
			},
			error : function(xhr, status, error){
					alert("실패!")
			} // error
		})//end ajax 
			
		$('.modal_btn_2, .modal_close', modalNotice).on('click', function(e){
			e.preventDefault;
			modalNotice.fadeOut(200);
			location.reload();
		})
	}//end function
})// end document