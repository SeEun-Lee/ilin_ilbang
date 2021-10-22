/* 공통화면 (헤더&푸터) 자바스크립트  */

$(document).ready(function(){
    
    // nav 메뉴 클릭 시 이벤트
    $header = $('#header');
    $nav = $('#nav', $header);
    $('.gnb > li > a', $nav).on('click', function(){
        $('.gnb > li > a', $nav).removeClass('active');
        $(this).addClass('active');
        return false;
    })
})