

$(document).ready(function(){
    
    // nav 메뉴 클릭 시 이벤트
    $header = $('#header');
    $nav = $('#nav', $header);
    $('.gnb > li > a', $nav).on('click', function(){
        $('.gnb > li > a', $nav).removeClass('active');
        $(this).addClass('active');
        return false;
    });
    

    
});


    /*

    // 더보기 for 전체 리스트   
    $('.filterInactive').on("click", function(e){
	
		e.preventDefault();
		
		var more = 1;
		
		console.log(more);
		
		$.ajax({
			url : '/',
			type : 'get',
			data : { more },
			success : function(data){
				alert("안됨ㅋ");
				$("#list_container").find("#list_content").remove().end().prepend($(data).find("#list_content"));
			},
			error : function(xhr, status, error){
				alert("실패");
			}
		})
	})
    
     */


	// 페이징 처리
	/*
		$(".page-number").on("click", function(e){
		
		e.preventDefault(); // a태그 동작X

		var goPageNum = parseInt($(this).attr('value'));
		
		$(".page-number").removeClass('on');
		$(this).addClass('on');
		
		console.log(goPageNum)

		$.ajax({
			url : '/listWithPage',
			type : 'get',
			data : { goPageNum },
			success : function(data){
				$("#list_container").find("#list_content").remove().end().prepend($(data).find("#list_content"));
			},
			error : function(xhr, status, error){
				alert("실패");
			}
		})
				
		})
	
	 */


	
	// 상세페이지 이동


	
/*
	$(".page-move").on("click", function(e){
		
		e.preventDefault();
		
		var curPage = parseInt($(".page-number.on").attr('value'));
		var prevOrNext = $(this).attr('value');
		
		console.log(prevOrNext)
		
		$.ajax({
			url : '/listWithPage',
			type : 'get',
			data : { curPage, prevOrNext },
			success : function(data){
				$("#list_container").find("#list_content").remove().end().prepend($(data).find("#list_content"));
			},
			error : function(xhr, status, error){
				alert("실패");
			}
		}) 		
	})
	
	// 뒤로가기 버튼 w.paging
	
	var operForm = $("#operForm");
	
	$(".back a").on("click", function(e){
		
		e.preventDefault();
		operForm.attr("action", "/listWithPage")
		operForm.submit();
		
	})
	





 */
