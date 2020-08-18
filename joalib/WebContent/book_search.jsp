<%@page import="com.joalib.book.search.svc.BookSearchAllService"%>
<%@page import="com.joalib.DTO.BookInfoDTO"%>

<%@page import="com.joalib.DAO.BookInfoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.joalib.board.action.dbAction"%>
<%@ page import="com.joalib.DAO.DAO"%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/booksearch.css">
<link rel="stylesheet" type="text/css" href="css/lib_top.css">
<<link rel="stylesheet" type="text/css" href="css/search.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>





<body>
	<header>
		<div id="top_size">
			<!--로고-->
			<img id="logo" src="img/icon_lib.png">
			<!--탑네비-->
			<nav>
				<ul id="top_nav">
					<li><a>HOME</a></li> | <li>
					<%
						String member_id = null;
									member_id = (String)session.getAttribute("member_id");
									if ( member_id != null) {
										out.print("<a href='memberLogout.mem'>로그아웃</a>");
									}else{
										out.print("<a href='userJoinRule.html'>회원가입</a></li> | <li><a href='userLogin.html'>로그인</a>");
									}
					%>
					</li> | <li><a>포인트충전</a></li>
				</ul>
			</nav>
			<div class="clearF"></div>
			<!--탑메뉴-->
			<nav id="topMenuBorder">
				<ul id="top_menu">
					<li><a href="#">자료검색</a>
						<ul class="sub_menu">
							<li><a href="">도서 검색</a></li>
							<li><a href="">분야별 도서 조회</a></li>
						</ul></li>
					<li><a href="#">도서마당</a>
						<ul>
							<li><a href="">신착 도서</a></li>
							<li><a href="">베스트 셀러</a></li>
							<li><a href="">희망도서</a></li>
						</ul></li>
					<li><a href="#">이용안내</a>
						<ul>
							<li><a href="">시설안내</a></li>
							<li><a href="">자료 현황</a></li>
							<li><a href="">포인트</a></li>
							<li><a href="">도서 대여</a></li>
							<li><a href="">도서 예약</a></li>
						</ul></li>
					<li><a href="#">커뮤니티</a>
						<ul>
							<li><a href="">공지사항</a></li>
							<li><a href="">질문과 답변</a></li>
							<li><a href="board.jsp">자유게시판</a></li>
							<li><a href="Fault_list.jsp">불량도서 신고</a></li>
							<li><a href="">중고도서 나눔</a></li>
						</ul></li>
					<li><a href="mypage_main.jsp">나의서재</a>
						<ul>
							<li><a href="mypage_main.jsp">나의 서재</a></li>
							<li><a href="">서비스 이용 내역</a></li>
							<li><a href="">내가 쓴 글</a></li>
							<li><a href="">포인트</a></li>
							<li><a href="">정보 수정/ 탈퇴</a></li>
						</ul></li>
				</ul>
				<d iv id="window_menu">
		</div>
		</nav>
		</div>
		<script src="js/lib_top.js"></script>
		<script src="js/search.js"></script>
	</header>



	<section id="book_search_size">
		<div class="search">
			<div id="search_title">도서검색</div>
			<div id="search_box">
				<!--검색어-->
				<form method="get" action="book_search.sc">
				<div id="hbz-searchbox" action="/search" method="get">
					<select id="select_search" name="select_search">
						<option name="all">전체</option>
						<option>도서명</option>
						<option>저자</option>
						<option>출판사</option>
					</select> <input type="text" id="hbz-input" name="q" placeholder="Search..." />
					<input type="hidden" name="max-results" value="8" />
					<input id="hbz-submit" type="submit" value="Search" />
				</div>
			</div>

			<div id="category_box">
				<!--카테고리검색-->
				<ul>
					<li><input type="checkbox" id="all" name="check" value="총류"><label for="all">총류</label></li>
					<li><input type="checkbox" id="religion" name="check" value="종교">
					<label for="religion">종교</label></li>
					<li><input type="checkbox" id="history" name="check" value="역사·지리·관광">
					<label for="history">역사·지리·관광</label></li>
					<li><input type="checkbox" id="social_science" name="check" value="사회과학">
					<label for="social_science">사회과학</label></li>
					<li><input type="checkbox" id="philosophy" name="check" value="철학·심리학·윤리학">
					<label for="philosophy">철학·심리학·윤리학</label></li>
					<li><input type="checkbox" id="descriptive_science" name="check" value="기술과학">
					<label for="descriptive_science">기술과학</label></li>
					<li><input type="checkbox" id="art" name="check" value="예술"><label for="art">예술</label></li>
					<li><input type="checkbox" id="pure_science" name="check" value="순수과학"><label
						for="pure_science">순수과학</label></li>
					<li><input type="checkbox" id="literature" name="check" value="문학"><label
						for="literature">문학</label></li>
					<li><input type="checkbox" id="language" name="check" value="어학"><label
						for="language">어학</label></li>
				</ul>
				<!-- 검색바에 맞춰서 정렬할 것임 -->
			</div>
			</form>
			
			
			
			
		</div>
		<div style="text-align: center;">
		<a href="BookInfoAdd.jsp">임시,관리자 도서추가</a>
		</div>
		<br/>
		<main class="page-content">
		 <!-- 페이징 -->
	  	
	  	<%
	  		
	  	%> 
		
		
		
		
		
	</section>
	<!-- 다음페이지 이전페이지 아직 기능이 없음 추가해야대~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<div class="pagination">
		
		
		
		</div>
	<footer>
		<div id="footer_size">
			(변경해야함) Library | 04524 서울특별시 중구 세종대로 110 | 전화번호: 02)120, 2133-0300~1</br>
			이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00 /월요일,공휴일 휴관
		</div>
	</footer>




	</main>
</body>
</html>