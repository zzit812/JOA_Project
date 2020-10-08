
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.joalib.DTO.BookInfoDTO"%>
<%@page import="com.joalib.DAO.BookInfoDAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page import="java.util.List"%>
<%@ page import="com.joalib.board.action.dbAction"%>
<%@ page import="com.joalib.DAO.DAO"%>
<%@ page import="com.joalib.DTO.BoardDTO"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/lib_top.css">
<link rel="stylesheet" type="text/css" href="css/BookInfoDetail.css">

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<!-- <script type="text/javascript">
	
		$(function(){
			$(window).ready(function(){
				
			});
		})
		
	</script> -->




</head>

<body>
	<header>
		<%
			if (request.getAttribute("message") != null) {
			String messageAlert = (String) request.getAttribute("message");
			out.print("<script type='text/javascript'> alert('" + messageAlert + "');</script>");
		}
		%>
		<div id="top_size">
			<!--로고-->
			<img id="logo" src="img/icon_lib.png">
			<!--탑네비-->
			<nav>
				<ul id="top_nav">
					<li><a>HOME</a></li> |
					<li>
						<%
							String member_id = null;
						member_id = (String) session.getAttribute("member_id");
						if (member_id != null) {
							out.print("<a href='memberLogout.mem'>로그아웃</a>");
						} else {
							out.print("<a href='userJoinRule.html'>회원가입</a></li> | <li><a href='userLogin.html'>로그인</a>");
						}
						%>
					</li> |
					<li><a>포인트충전</a></li>
				</ul>
			</nav>
			<div class="clearF"></div>
			<!--탑메뉴-->
			<nav id="topMenuBorder">
				<ul id="top_menu">
					<li><a href="book_search.jsp">자료검색</a>
						<ul class="sub_menu">
							<li><a href="book_search.jsp">도서 검색</a></li>
						</ul></li>
					<li><a href="book_new.jsp">도서마당</a>
						<ul>
							<li><a href="book_new.jsp">신착 도서</a></li>
							<li><a href="book_best.jsp">베스트 셀러</a></li>
							<li><a href="book_recommend.jsp">추천 도서</a></li>
							<li><a href="book_wish.jsp">희망 도서</a></li>
						</ul></li>
					<li><a href="place.jsp">이용안내</a>
						<ul>
							<li><a href="place.jsp">오시는 길</a></li>
							<li><a href="book_guide.jsp">도서 이용안내</a></li>
							<li><a href="point_guide.jsp">포인트 이용안내</a></li>

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
				<div id="window_menu"></div>
			</nav>
		</div>
		<script src="js/lib_top.js"></script>
	</header>


	<%
		BookInfoDTO bookInfoDB = (BookInfoDTO) request.getAttribute("bookDB");

	String title = bookInfoDB.getBook_title();
	String author = bookInfoDB.getAuthor();
	String book_img = bookInfoDB.getBook_img();
	String isbn = bookInfoDB.getIsbn();
	String pubDate = bookInfoDB.getPub_date();
	String description = bookInfoDB.getBook_story();
	String publisher = bookInfoDB.getPublisher();
	%>





	<section>
		<div id="book_box">
			<div id="img_box">
				<span id="category"> </span> <img id="book_img"
					src="img/book/<%=book_img%>">
				<div id="button">

					<%
						if (member_id == null) {
						out.print("로그인 후 대출 가능합니다.");
					} else {
					%>
					<form action="bookLoan.loa" name="loan" method="post">
						<input type="hidden" name="isbn" value="<%=isbn%>"> <input
							type="hidden" name="member_id" value="<%=member_id%>"> <input
							type="submit" value="대출하기"> <a
							href="bookFavorite.fav?isbn=<%=isbn%>&member_id=<%=member_id%>"><input
							type="button" value="관심도서"></a>

					</form>
					<%
						}
					%>



				</div>
			</div>
			<div id="detail_box">

				<div id="detail">
					<h2><%=title%></h2>
					<div>
						<b>저자사항</b>
						<%=author%></div>
					<div>
						<b>출판사</b>
						<%=publisher%>
					</div>
					<div>
						<b>출판년도</b>
						<%=pubDate%>
					</div>
					<div>
						<b>표준번호</b> ISBN:
						<%=isbn%>
					</div>
					<div>
						<b>상세정보</b>
					</div>
					<div>
						<!-- 줄거리 집어넣기 -->
						<%=description%>
					</div>


				</div>
			</div>
	</section>


	<footer>
		<div id="footer_size">
			(변경해야함) Library | 04524 서울특별시 중구 세종대로 110 | 전화번호: 02)120, 2133-0300~1<br>
			이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00 /월요일,공휴일 휴관
		</div>
	</footer>





	</main>
</body>
</html>
