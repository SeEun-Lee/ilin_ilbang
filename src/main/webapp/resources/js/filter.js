$(document).ready(function(){
  
    // 필터 메뉴 제목 클릭시 필터박스 열기
    $('.filter_title').on('click', function(){
		openFilter();
		return false;
    });
    
	// 닫기 클릭 시 필터박스 닫기
    $('.close').on('click', function(){
		closeFilter();
		return false;
    });

	// 필터적용 버튼 클릭시 /listByFilter로 데이터 전송 
	$("#btn_filter").on("click", function(){
		
		var filters = [];
		
		$('input:checkbox[name=filter]:checked').each(function(){
			filters.push($(this).val());
		});
		
		$.ajax({
			url : '/listByFilter',
			type : 'get',
			data : { filters },
			success : function(data){
				closeFilter();
				$("#list_container").find("#list_content").remove().end().prepend($(data).find("#list_content"));
				$(".btn_more").removeClass("filterInactive").addClass("filterActive");
			},
			error : function(xhr, status, error){
				alert("실패")
			}
		})
		
		

	});	

	// openFilter();
    function openFilter(){
		$('.filter_sub').slideDown(200);
        $('.search_bg').slideDown(200);
        $('.btn_filter').show();
        $('.close').show(200);
        $('.reset').show(200);
        $('.main_search').addClass('active');
        return false;
	}
	
	// closeFilter();
	function closeFilter(){
		$('.filter_sub').slideUp(100);
        $('.search_bg').slideUp(100);
        $('.btn_filter').hide();
        $('.close').hide();
        $('.reset').hide();
        $('.main_search').removeClass('active')
        return false;
	}
	
	
});

// 필터 초기화
var filters = document.querySelectorAll("input[type='checkbox']")

function checkAll(myCheckbox){
    filters.forEach(function(checkbox){
        checkbox.checked = false;})
}


