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
	
	// 메인 리스트 페이징 - 페이지 번호를 클릭하면 이동하는 처리
	$("#list_content_main .paginate_btn a").on("click", function(e){
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
				$("#list_container_main").find("#list_content_main").remove().end().prepend($(data).find("#list_content_main"));
				$(".btn_more").removeClass("filterInactive").addClass("filterActive");
			},
			error : function(xhr, status, error){
				alert("실패")
			}
		})
	});
		
	// 찜목록 리스트 페이징 - 페이지 번호를 클릭하면 이동하는 처리
	var like_list = $('#list_content_like');
	$('.paginate_btn a', like_list).on("click", function(e){
		e.preventDefault();
		var pageNum = $(this).attr('href');
		$.ajax({
			url : '/roomLike',
			type : 'get',
			data : { pageNum : pageNum },
			success : function(data){
				$("#list_container_like").find("#list_content_like").remove().end().prepend($(data).find("#list_content_like"));
				$(".btn_more").removeClass("filterInactive").addClass("filterActive");
			},
			error : function(xhr, status, error){
				alert("실패")
			}
		})
	});
	
})
