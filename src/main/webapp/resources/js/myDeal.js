//by세은, 거래관리페이지 Javascript 입니다
$(document).ready(function(){

	//by세은, 검색 - 토글 슬라이드 메뉴
    $(".search_open").on("click", function(e){
        e.preventDefault();
        var searchBox = $(".dm_search");
        var innerText = $(".search_open .text")
        if (searchBox.is(":visible")){
            searchBox.slideUp();
            innerText.empty().append("열기");
            innerText.removeClass("close").addClass("open")
        } else{
            searchBox.slideDown();
            innerText.empty().append("닫기");
            innerText.removeClass("open").addClass("close")
        }
    });
    
    //by세은, 등록목록에서 방 선택 (체크박스)
    var deal_list = $('#list_content_deal');
	$('.ck_container', deal_list).on('click', function(e){
		e.stopPropagation();
	});
	
	//by세은, 전체선택 체크박스를 눌렀을 경우
	$('.ck_all .ck_container', deal_list).on('click', function(){
		if($('.ck_all .ck_container input').prop("checked")){ // 체크된 경우 
			$("input[name='selected']").prop("checked", true); // 전부 선택 
		} else { // 체크 해제된 경우 
			$("input[name='selected']").prop("checked", false); // 전부 선택 헤제
		}
	});
    
    //by세은, select 박스 선택시 거래상태를 변경하는 작업 (추가예정)
	$(".progress").on("click", function(e){
		e.stopPropagation();
	});
	
	//by세은, 등록목록 리스트 페이징 - 페이지 번호를 클릭하면 이동하는 처리
	var like_list = $('#list_content_deal');
	$('.paginate_btn a', like_list).on("click", function(e){
		e.preventDefault();
		var pageNum = $(this).attr('href');
		$.ajax({
			url : '/myDeal',
			type : 'get',
			data : { pageNum : pageNum },
			success : function(data){
				$(".deal_list_container").find(".deal_list").remove().end().prepend($(data).find(".deal_list"));
				$(".btn_more").removeClass("filterInactive").addClass("filterActive");
			},
			error : function(xhr, status, error){
				alert("실패")
			}
		})
	});
});