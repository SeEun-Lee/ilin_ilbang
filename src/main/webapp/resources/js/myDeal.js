// by 세은, 거래관리페이지 Javascript 입니다
$(document).ready(function(){
	
	// 검색 - 토글 슬라이드 메뉴
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
    
    // select 박스 선택시 거래상태를 변경하는 작업 (추가예정)
	$("#progress").on("click", function(e){
		e.stopPropagation();
	});
});