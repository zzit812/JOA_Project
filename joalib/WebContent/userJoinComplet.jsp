<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
  <meta charset="UTF-8">
	<title>Document</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- <script src="js/join_2.js"></script> -->
	
	<link rel="stylesheet" type="text/css" href="css/lib_top.css">
	<link rel="stylesheet" type="text/css" href="css/lib_join_3.css">
	<link rel="stylesheet" type="text/css" href="css/lib_join.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<script type="text/javascript">
		$(function(){
			$('input[name=loginGo]').on('click',function(){
				location.href='userLogin.html';
			});
			$('input[name=homeGo]').on('click',function(){
				location.href='home.jsp';
			});
		});
	</script>

</head>

 <body>
 	 <% request.setCharacterEncoding("UTF-8");%>
	 <header>
		 <div id="top_size">
		 	<!--로고-->
			<img id="logo" src="img/icon_lib.png">
			<!--탑네비-->
			<nav>
				<ul id="top_nav">
					<li><a>HOME</a></li> | <li><a href='userJoinRule.html'>회원가입</a></li> | <li><a href='userLogin.html'>로그인</a></li> | <li><a>포인트충전</a></li>
				</ul>
			</nav>
			<div class="clearF"></div>
			<!--탑메뉴-->
			<nav id="topMenuBorder">
				<ul id="top_menu">

					<li><a href="book_search.jsp">자료검색</a>

					<li><a href="book_search.html">자료검색</a>

						<ul class ="sub_menu">
							<li><a href="book_search.html">도서 검색</a></li>
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
		 <div id="title"><p>회원가입</p></div><!-- (타이틀에이미지넣을거에용) -->
	 </header>

	 <section id="side_size"><!-- id="side_size" 이거 크기 설정한거니깐 삭제하면 안돼요 -->
	 	<div id="sidemenu_size" >
	 		<div id="sidemenuBlook">
	 			<div>
			 		<h3>약관 동의</h3>
			 		<h3>회원 정보 입력</h3>
			 		<h3>캐릭터</h3>
			 		<h3>가입 완료!</h3>
		 		</div>
	 		</div>
		</div>
		<div id="cont_size">
			<% String member_name = (String) session.getAttribute("member_name"); %>
			<h1><p id="userName"><%= member_name %>님</p>
		 	<br>환영합니다!</h1>
		 	<img src="img/character/character1.png"/>
		 		<form>
		 			<input type="button" name="loginGo" value="LOGIN" />
		 			<input type="button" name="homeGo" value="HOME" />
		 		</form>
		</div>
	 </section>

	 <footer>
			(변경해야함) Library | 04524 서울특별시 중구 세종대로 110 | 전화번호: 02)120, 2133-0300~1</br>
			이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00 /월요일,공휴일 휴관
	 </footer>

 

</body></html>