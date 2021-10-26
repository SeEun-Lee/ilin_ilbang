/*
리스트를 불러올 때마다 'div.list_content'가 일종의 새로고침 되는 방식이라
자바스크립트가 'div.list_content'밖에 선언되면 잘 작동하지가 않음. (아마도..)
그래서 항상 작동해야 할 찜 버튼, 검색 결과에 대한 문구 등에 대한 스크립트는 여기다 작성하여
list_content 안에서 따로 불러옴.
*/

// 검색 결과가 없으면 문구 출력
var result = $('.result').text();
if (result == "검색결과 없음"){
	$('.isEmpty').show();
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
		data : { rcode : rcode },
		success : function(data){
			if (data == 1){ // 성공 시,
				modal_like.find('.modal_rcode').text(rcode);
				modal_like.fadeIn(200);
			} else { // 이미 추가된 방일 시, 모달창
				modal_fail.find('.modal_text').text("이미 관심목록에 추가된 방입니다!")
				modal_fail.find('.modal_btn_2').text("확인");
				modal_fail.fadeIn(200);
			}
			/*alert(rcode + " 번 방이 관심 목록에 추가되었습니다!");*/
		},
		error : function(xhr, status, error){
				alert("실패")
		}
		
	}) // ajax 
	
	// 닫기 버튼
	$('.modal_close, .modal_btn_2').on("click", function(e){
		e.preventDefault();
		modal_like.fadeOut(200);
		modal_fail.fadeOut(200);
	})
	
	
})



