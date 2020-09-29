<%@page import="com.joalib.bookground.svc.BookNewService"%>
<%@page import="com.joalib.DTO.SearchDTO"%>
<%@page import="com.joalib.booksearch.action.BookSearchAction2"%>
<%@page import="com.joalib.DTO.BookInfoDTO"%>
<%@page import="com.joalib.DAO.BookInfoDAO"%>
<%@page import="com.joalib.bookground.svc.*" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.joalib.board.action.dbAction"%>
<%@ page import="com.joalib.DAO.DAO"%>

<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.json.simple.JSONObject" %>
<%@page import="org.json.simple.JSONArray" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/booksearch.css">
<link rel="stylesheet" type="text/css" href="css/lib_top.css">
<link rel="stylesheet" type="text/css" href="css/search.css">
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
						String member_id= null;
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
					<li><a href="book_search.jsp">자료검색</a>
						<ul class="sub_menu">
							<li><a href="book_search.jsp">도서 검색</a></li>
							<li><a href="">분야별 도서 조회</a></li>
						</ul></li>
					<li><a href="#">도서마당</a>
						<ul>
							<li><a href="book_new.jsp">신착 도서</a></li>
							<li><a href="book_best.jsp">베스트 셀러</a></li>
							<li><a href="book_recommend.jsp">추천 도서</a></li>
							<li><a href="">희망 도서</a></li>
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
		
		

			<p id="">베스트도서</p>
			

		
			
			
		</div>
		
		
		<!-- <div style="text-align: center;">
		<a href="BookInfoAdd.jsp">임시,관리자 도서추가</a>
		</div>
		<br/> -->
		
		  
		<main id="book_show">














	  	<%
	  	JSONObject books = null;
	  	JSONArray parse_listArr = null;
	  	
	  	BookBestService bookBestService = new BookBestService();
	  	parse_listArr = bookBestService.best();
	  	
		

		
		  for(int i=0; i< parse_listArr.size() ; i++){
				books = (JSONObject)parse_listArr.get(i);
				String title= (String)books.get("title");
				String author = (String)books.get("author");
				String publisher = (String)books.get("publisher");
				String book_img = (String)books.get("coverLargeUrl");
				String isbn = (String)books.get("isbn");
		%>
		
		<div class="box">
		  <a href="bookInfoDetail.bk?isbn=<%=isbn%>">
		  <img src="<%=book_img %>" class="card" src="<%=book_img %>"></a>
		    <div class="content">
		      <h2 class="title"></h2>
		      <span class="favorite">관심도서</span>
		      <span class="loan">대출가능</span>
		    </div>
		    
		    <div class="simple_info">
		  	<span><b>도서명</b></span>&nbsp; <span><%=title %></span></br>
		  	<span><b>저자명</b></span>&nbsp; <span><%=author%></span></br>
		  	<span><b>출판사</b></span>&nbsp; <span><%=publisher %></span>
		  </div>
		  </div>

		
	

		  <%} %>

		  
		  
		  
		  
		
	</section>
	</main>
	<!-- 다음페이지 이전페이지 아직 기능이 없음 추가해야대~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<div class="pagination">
		
		
		
	
		
		
		
		
		</div>
	<footer>
		<div id="footer_size">
			(변경해야함) Library | 04524 서울특별시 중구 세종대로 110 | 전화번호: 02)120, 2133-0300~1</br>
			이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00 /월요일,공휴일 휴관
		</div>
	</footer>




	
</body>
</html>
