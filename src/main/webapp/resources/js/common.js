/* nav 메뉴 스크립트 입니다 */

$(document).ready(function(){
	
	var pathname = $(location).attr('pathname');
	if (pathname == "/"){
		$('.gnb > li > a').removeClass('active');
		$('.gnb').find('.main').addClass('active');
	} else if (pathname == "/like"){
		$('.gnb > li > a').removeClass('active');
		$('.gnb').find('.like').addClass('active');
	} else if (pathname == "/room_register"){
		$('.gnb > li > a').removeClass('active');
		$('.gnb').find('.room_register').addClass('active');
	} else if (pathname == "/myDeal"){
		$('.gnb > li > a').removeClass('active');
		$('.gnb').find('.myDeal').addClass('active');
	}
	
})