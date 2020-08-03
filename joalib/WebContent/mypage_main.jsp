<%@ page language="java" contentType="text/html; charset=UTF-8	"
    pageEncoding="UTF-8"%>
<%@ page import="com.joalib.DAO.PointDAO" %>
<%@ page import="com.joalib.DTO.PointDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- 캘린더 -->

<link rel="stylesheet" type="text/css" href="css/lib_mypage_main.css">
<link rel="stylesheet" type="text/css" href="css/lib_top.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style type="text/css">

	#pointSelect{
		text-align : center;
		font-size: 13px;
		display: inline;
		margin: 10px 0 0 15px;
	}
	#pointSelect tr > td:nth-child(1){
		color: #ff3635;
	}
	#pointSelect tr > td:nth-child(2){
		font-weight: 600;
	}
	#pointSelect tr > td:nth-child(3){
		WIDTH: 60%;
		opacity: 85%;
	}
	#pointSelect tr > td:nth-child(4){
		opacity: 85%;
	}
	#pointSelect tr > td {
		padding: 0 10px;
	}
	
	#cont_2_size >div> h5{
		margin: 8px 0;
	    font-size: 17px;
	    font-weight: 400;
	    opacity: 70%;
	    border-bottom: solid 1px #80808057;
	    padding-bottom: 5px;
	}
</style>
</head>

<body>
<%
	String member_id = (String)session.getAttribute("member_id"); 
	if(member_id == null){%>
		<script type="text/javascript">
		alert("로그인 후 이용해주세요");
		location.href="userLogin.html";
		</script>	
	<%}else{%>
<header>

		 <div id="top_size">
		 	<!--로고-->
			<img id="logo" src="img/icon_lib.png">
			<!--탑네비-->
			<nav>
				<ul id="top_nav">
					<li>HOME</li> | <li><a href="memberLogout.mem">로그아웃</a></li> | <li>포인트충전</li>
				</ul>
			</nav>
			<div class="clearF"></div>
			<!--탑메뉴-->
			<nav id="topMenuBorder">
				<ul id="top_menu">

					<li><a href="book_search.html">자료검색</a>
						<ul class ="sub_menu">
							<li><a href="">도서 검색</a></li>
							<li><a href="">분야별 도서 조회</a></li>
						</ul>
					</li>
					<li><a href="#">도서마당</a>
						<ul>
							<li><a href="">신착 도서</a></li>
							<li><a href="">베스트 셀러</a></li>
							<li><a href="">희망도서</a></li>
						</ul>
					</li>
					<li><a href="#">이용안내</a>
						<ul>
							<li><a href="">시설안내</a></li>
							<li><a href="">자료 현황</a></li>
							<li><a href="">포인트</a></li>
							<li><a href="">도서 대여</a></li>
							<li><a href="">도서 예약</a></li>
						</ul>
					</li>				
					<li><a href="#">커뮤니티</a>
						<ul>
							<li><a href="">공지사항</a></li>
							<li><a href="">질문과 답변</a></li>
							<li><a href="board.jsp">자유게시판</a></li>
							<li><a href="">불량도서 신고</a></li>
							<li><a href="">중고도서 나눔</a></li>
						</ul>
					</li>
					<li><a href="mypage_main.jsp">나의서재</a>
						<ul>
							<li><a href="mypage_main.jsp">나의 서재</a></li>
							<li><a href="">서비스 이용 내역</a></li>
							<li><a href="">내가 쓴 글</a></li>
							<li><a href="">포인트</a></li>
							<li><a href="">정보 수정/ 탈퇴</a></li>
						</ul>
					</li>
				</ul>
				<div id="window_menu"></div>
			</nav>
		 </div>
		 <script src="js/lib_top.js"></script>
		 <div id="title"><p>나의 서재</p></div>
	 </header>

	 <section id="side_size">

		<div id="sidemenu_size" >
			<div id="profile_img"><img  src = "img/character/character1.png" /></div>
			<h1>User Name</h1>
			<h5>닉네임</h5>
			<nav>
				<ul  id="sidmenu_box">
					<li><a href="">나의 서재</a></li>
					<li><a href="">서비스 이용 내역</a></li>
					<li><a href="">내가 쓴 글</a></li>
					<li><a href="">정보수정</a></li>
				</ul>
			</nav>
		</div>

		  <div id="cont_size">
		  	<p class="menuTitle">대여/예약 도서 현황</p>
			<div id="cont_1_size">
				<div id="cont1Calender"><!-- 달력 -->
					<div id="dateColorInfo">
						<h1>●</h1><h2>today</h2>
						<h1>●</h1><h2>대여 반납일</h2>
						<h1>●</h1><h2>예약 예정일</h2>
					</div>
				</div>
				<div id="cont1Book">
					<div>
						<p>대여 현황</p><a href="#" class="more">더보기></a>
						
						<div class="bookList">
							<p>도서명</p>
							<p>저자</p>
							<p>도서번호</p>
							<p>반납일</p>
							<h1 id="noBookLoan">대출 중인 도서가 없습니다</h1>
						</div>
						<div id="bookLoanList">
							<div><p><!-- 도서명 1 --></p><p><!-- 저자 --></p><p><!-- 도서번호 --></p><p><!-- 반납일 --></p></div>
							<div><p></p><p></p><p></p><p></p></div>
							<div><p></p><p></p><p></p><p></p></div>
						</div>
						
						
					</div>
					<div style="border-top: 1.5px solid rgba(65, 65, 79, 10%)">
						<p>예약 내역</p><a href="#" class="more">더보기></a>
						<div class="bookList">
							<p>도서명</p>
							<p>저자</p>
							<p>도서번호</p>
							<p>반납예정일</p>
							<h1 id="noBookReser">예약 중인 도서가 없습니다</h1>
						</div>
						<div id="bookReserList">
							<div><p><!-- 도서명 --></p><p><!-- 저자 --></p><p><!-- 도서번호 --></p><p><!-- 반납예정일 --></p></div>
							<div><p></p><p></p><p></p><p></p></div>
							<div><p></p><p></p><p></p><p></p></div>
						</div>
						
						
					</div>
				</div>
			</div>

			<p class="menuTitle">포인트</p>
			<div id="cont_2_size">
				<div>
					<img src="img/mypage/coinIcon.png">
					<div>
						<p>회원님의 포인트는</p>
						<%
						//포인트 조회
						PointDAO dao = new PointDAO();
						PointDAO.getinstance();
						int pointNow = dao.memberPointNow(member_id);
						%>
						<p><%= pointNow %> P</p>
						<a href="pointChargeTemp.po" id="coinCharge">충전하기</a>
					</div>
				</div>
					<div>
						<h5>포인트내역</h5>
						<table border="0" id="pointSelect">
							<!--  <tr><td>+/-</td><td>POINT</td><td>REASON</td><td>DATE</td></tr> -->
							<% 								
							List<PointDTO> list = dao.memberPointList(member_id);
							for(int i = 0;  i < list.size(); i++){									
								if( (i == 4) || (i == list.size()-1)){
									break; 
								}
								String pulma = list.get(i).getUPandDown();
								if(pulma.equals("*")){
									pulma = " ";
								}
								out.print("<tr><td>");
								out.print(pulma+"</td><td>");
								out.print(list.get(i).getPoint()+"</td><td>");
								out.print(list.get(i).getPoint_reason()+"</td><td>");
								out.print(list.get(i).getUpdate_date().substring(0,10)+"</td></tr>");
							}
							%>
						</table>
						</div>
				</div>

			<p class="menuTitle">관심도서</p>
			<div id="cont_3_size">
				<a href="#" class="more">더보기></a>
				<div id="cont_3_item">
					<div class="cont_3_item_book">
						<img src="img/mypage/noBook.png" />
						<div>	
							<img  class="heartbutton" src="img/mypage/heartIcon2.png" />
						</div>					
					</div>
					<div class="cont_3_item_book">
						<img src="img/mypage/noBook.png" />
						<div>
							<img  class="heartbutton" src="img/mypage/heartIcon2.png" />
						</div>
					</div>
					<div class="cont_3_item_book">
						<img src="img/mypage/noBook.png" />
						<div>
							<img  class="heartbutton" src="img/mypage/heartIcon2.png" />
						</div>
					</div>
					<div class="cont_3_item_book">
						<img src="img/mypage/noBook.png" />
						<div>
							<img  class="heartbutton" src="img/mypage/heartIcon2.png" />
						</div>
					</div>
					<div class="cont_3_item_book">
						<img src="img/mypage/noBook.png" />
						<div>
							<img  class="heartbutton" src="img/mypage/heartIcon2.png" />
						</div>
					</div>
					<!-- <div class="clearF"></div> -->
				</div>
			</div>

		<p class="menuTitle">즐겨찾는 도서</p>
		<div id="cont_4_size">

			<div id="chartNoData">
				<img src="img/mypage/errorIcon.png"></br>
				분석하기 위한 데이터가 필요해요
			</div>

			<div id="cont_4_data">
				<div class="pie-chart1"></div>
			</div>
			<div id="cont_4_result">결과</div>
		</div>


		<!-- 스크립트 -->
		<script type="text/javascript">

			//사이드 메뉴 이벤트 스크립트

			//스크롤을 내리면 지정 위치에서 따라오는 이벤트
			var jbOffset = $( '#sidmenu_box' ).offset();	//해당 위치를 파악 //524
			$( window ).scroll( function() {
				 // || ($( document ).scrollBottom()-500 < jbOffset.bottom)
				if (($( document ).scrollTop()+150> jbOffset.top)) {
					$( '#sidemenu_size > nav' ).addClass( 'subMenuFixed' );	//스크롤의 위치가 고정하려는 메뉴의 위치보다 크면 fixed 클래스를 추가

				}else {
					$( '#sidemenu_size > nav' ).removeClass( 'subMenuFixed' );	//그렇지 않으면 fixed 클래스를 제거
				}
			})
				// console.log(jbOffset.left); //406.71875
			//마우스를 올리면 나오는 이벤트
		 	$('#sidmenu_box >li').hover(function(){
		 		$(this).css({
		 			boxShadow: '10px 10px 10px rgba(0, 0, 0, 12%)',
		 			fontSize: "22px",
		 			fontWeight: '600'

		 		})},function(){
		 		$(this).css({
		 			//color: "yellow",
		 			boxShadow: 'none',
		 			fontSize: "20px",
		 			fontWeight: '500'
		 		})
		 		});

			//도서
				//만약에 대출중인 도서가 있으면

				var bookLoan = 0;	//대출중인 도서 권수
				if(bookLoan>0){
					$('#bookLoanList').css('opacity', '1');
					$('#noBookLoan').css('opacity', '0');
					for(var i = 1; i <= bookLoan; i++){
						$('#bookLoanList>div:nth-child('+i+')>p:nth-child(1)').text('대여 도서명');
				        $('#bookLoanList>div:nth-child('+i+')>p:nth-child(2)').text('대여 도서저자');
				        $('#bookLoanList>div:nth-child('+i+')>p:nth-child(3)').text('대여 도서번호');
				        $('#bookLoanList>div:nth-child('+i+')>p:nth-child(4)').text('반납일');
					}
				}else{
					$('#bookLoanList').css('opacity', '0');
					$('#noBookLoan').css('opacity', '1');
				}
				//만약에 예약중인 도서가 있으면

				var bookReser = 0;	//최대 3개	//예약중인 도서 권수
				if(bookReser>0){
					$('#bookReserList').css('opacity', '1');
					$('#noBookReser').css('opacity', '0');
					for(var i = 1; i <= bookReser; i++){
						$('#bookReserList>div:nth-child('+i+')>p:nth-child(1)').text('에약 도서명');
				        $('#bookReserList>div:nth-child('+i+')>p:nth-child(2)').text('에약 도서저자');
				        $('#bookReserList>div:nth-child('+i+')>p:nth-child(3)').text('에약 도서번호');
				        $('#bookReserList>div:nth-child('+i+')>p:nth-child(4)').text('반납예정일');
					}
				}else{
					$('#bookReserList').css('opacity', '0');
					$('#noBookReser').css('opacity', '1');
				}

			//충전하기 액션
				 function coinChargeHover(){
					$('#coinCharge').hover(function(){
					 	$('#coinCharge').css({
					 		color:'red',
					 		marginTop: '0px'
					 	})
					 	},function(){
					 	$('#coinCharge').css({
					 		color: '#41414f',
					 		marginTop: '5px'
					 	})
					})
				}
				//더보기 액션
				$('.more').hover(function(){
				 	$(this).css({
				 		opacity:'90%',
				 		marginRight: '0px'
				 	})
				 	},function(){
				 	$(this).css({
				 		opacity: '70%',
				 		marginRight: '8px'
				 	})
				})

				//달력
				$(function() {
		            //input을 datepicker로 선언
		            $("#cont1Calender").datepicker({
		                dateFormat: 'yy-mm-dd' //Input Display Format 변경
		                //,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		                //,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
		                //,changeYear: true //콤보박스에서 년 선택 가능
		                //,changeMonth: true //콤보박스에서 월 선택 가능                
		                // ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
		                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
		                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
		                // ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
		                // ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
		                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
		                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
		                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
		                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		                ,minDate: "-3M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		                ,maxDate: "+3M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
		                ,nextText: '▶'
		                ,prevText: '◀'
		                // ,showOptions: { direction: "up" }
		                // ,showOn: "button"
		            });                    
		            
		            //초기값을 오늘 날짜로 설정
		            $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
		        });
		        function calenderHover(){
		        	$('#cont1Calender').hover(function(){
		        		$('#dateColorInfo').css({
		        			opacity: '1',
		        			top:'0px'
		        		});
		        	},function(){
		        		$('#dateColorInfo').css({
		        			opacity: '0',
		        			top: '10px'
		        		});
		        	})
		        }
		 		coinChargeHover();
				// moreBookHover();
				calenderHover();

			////////////////////////////관심 도서, heartBook////////////////////////////
			//DB랑 연결하게 되면 \for문(추가된 관심도서 개수 만큼)을 이용해서 문장 정리

			var heartBookNum = 0 ;	//관심도서 권수
			//관심도서 보여주기 최대 수 5
			if (heartBookNum > 5){
				heartBookNum = 5;
			}
			for(var i = 0; i<= heartBookNum; i++){
				//사진 바꾸기
				$('.cont_3_item_book:nth-child('+i+')>img:first-child').attr('src','img/book/book'+i+'.jpg');
				//사진 옵션 바꾸기
				$('.cont_3_item_book:nth-child('+i+')>img:first-child').css({
					width: '150px', height: '223px',
					margin: '0px',
					opacity: '100%'
				});
				//사진 hover시 액션
				$('.cont_3_item_book:nth-child('+i+')>div').hover(function(){
					$(this).css('opacity','100%');

				},function(){
					$(this).css('opacity','0%');
				});

			}
			//하트 버트 클릭시 
			var clickCount = 0;//클릭 횟수
			$('div>.heartbutton').click(function(){
				clickCount++;
				if (clickCount %2 == 1){	//홀수
					$(this).attr('src','img/mypage/heartIcon1.png');
				}else{						//짝수
					$(this).attr('src','img/mypage/heartIcon2.png');
				}
			});
			
			////////////////////////////좋아하는 도서 장르 통계////////////////////////////
			//그래프
			var data1 = 0;
			var data2 = 0;
			var data3 = 0;

			if((data1+data2+data3) == 100){
				$(window).ready(function(){
			    var i=1;
			    var func1 = setInterval(function(){
			        if(i<(data1+1)){
			            color1(i);
			            i++;
			        } else if(i<(data1+data2+1)){
			            color2(i);
			            i++;
			        } else if(i<(data1+data2+data3+1)){
			            color3(i);
			            i++;
			        } else {
			            clearInterval(func1);
			        }
				    },5);
				});

				function color1(i){
				    $(".pie-chart1").css({
				        "background":"conic-gradient(red 0% "+i+"%, #ffffff "+i+"% 100%)"
				        // "background":"conic-gradient("색상1" "시작하는 숫자" "끝나는 숫자", "빈곳을 채워주는 색상" "시작하는 숫자" "끝나는 숫자")"
				        });
				    
				}
				function color2(i){
				    $(".pie-chart1").css({
				        "background":"conic-gradient(red 0% "+data1+"%, #ffc33b "+data1+"% "+i+"%, #ffffff "+i+"% 100%)"
				        });
				     
				}
				function color3(i){
				    $(".pie-chart1").css({
				        "background":"conic-gradient(red 0% "+data1+"%, #ffc33b "+data1+"% "+(data1+data2)+"%, #21f3d6 "+(data1+data2)+"% "+i+"%, #ffffff "+i+"% 100%)"
				        });   
				}								

			} else{
				$("#chartNoData").css("opacity","65%");
				$("#cont_4_data").css("opacity","0%");
				$("#cont_4_result").css("opacity","0%");
			}

		</script>
	 </section>

	 <footer>
		<div id="foot_size">
			(변경) Library | 04524 서울특별시 중구 세종대로 110 | 전화번호: 02)120, 2133-0300~1</br>
			이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00 /월요일,공휴일 휴관
		</div>
	 </footer><!-- Favorite -->

 
<% } %>
</body>

</html>