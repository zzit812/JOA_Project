	$(function(){
		$('body').css('display', 'none');
		$( document ).ready( function() {			
			$('body').fadeIn(500);
			$('body').css('display', 'block');
		});
		
	 	//상단 메뉴 스크립트
	 	//상단 메뉴바에 마우스를 올리면 생기는 이벤트
 		//각 목록이 보임
	 	$('#top_menu').hover(function(){
	 		$('#top_menu li ul').css("height", "300px"),
	 		$('#window_menu').css("height", "300px")
	 		},function(){
	 		$('#top_menu li ul').css("height", "0px"),
	 		$('#window_menu').css("height", "0px")
	 		
	 		});
	 	//상단 메뉴 목록에 효과 이벤트
	 	$('#top_menu > li').hover(function(){
	 			$(this).css('backgroundColor', "#4704a2")
	 		},function(){
	 			$(this).css('backgroundColor', "#ffffff")

	 		});
		$('#top_menu li > ul > li').hover(function(){
	 		$(this).css({
	 			fontSize: "20px",
				opacity: "90%",
				fontWeight: "500"
	 		})},function(){
	 		$(this).css({
	 			fontSize: "15px",
				opacity: "60%",
				fontWeight: "400"
	 		})
	 		});
	
		
	});	
