/*
리스트를 불러올 때마다 'div.list_content'가 일종의 새로고침 되는 방식이라
자바스크립트가 'div.list_content'밖에 선언되면 잘 작동하지가 않음. (아마도..)
그래서 항상 작동해야 할 찜 버튼, 검색 결과에 대한 문구 등에 대한 스크립트는 여기다 작성하여
list_content 안에서 따로 불러옴.
*/

$(document).ready(function(){
	
	console.log("roomList.js");
		
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
	
	// 페이지 번호를 클릭하면 이동하는 처리
	$(".paginate_btn a").on("click", function(e){
		/*
		var paginateForm = $("#paginate_form");
		console.log("click")
		e.preventDefault();
		paginateForm.find("input[name='pageNum']").val($(this).attr('href'));
		paginateForm.submit();
		*/
		e.preventDefault();
		var filters = [];
		$('input:checkbox[name=filter]:checked').each(function(){
			filters.push($(this).val());
		});
		var pageNum = $(this).attr('href');
		console.log(filters);
		console.log(pageNum);
		$.ajax({
			url : '/',
			type : 'get',
			data : { filters : filters, pageNum : pageNum },
			success : function(data){
				$("#list_container").find("#list_content").remove().end().prepend($(data).find("#list_content"));
				$(".btn_more").removeClass("filterInactive").addClass("filterActive");
			},
			error : function(xhr, status, error){
				alert("실패")
			}
		})
		
				
	});
		
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