/* nav 메뉴 스크립트 입니다 */

$(document).ready(function(){
	
	var pathname = $(location).attr('pathname');
	if (pathname == "/list"){
		$('.gnb > li > a').removeClass('active');
		$('.gnb').find('.list').addClass('active');
	} else if (pathname == "/roomLike"){
		$('.gnb > li > a').removeClass('active');
		$('.gnb').find('.roomLike').addClass('active');
	} else if (pathname == "/sub/room_register"){
		$('.gnb > li > a').removeClass('active');
		$('.gnb').find('.room_register').addClass('active');
	}
	
})