<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@page import="com.joalib.fault.svc.*"%>
<%@page import="com.joalib.DAO.*"%>
<%@page import="com.joalib.DTO.*"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망도서 양식</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 캘린더 -->

<link rel="stylesheet" type="text/css" href="css/lib_top.css">
<link rel="stylesheet" type="text/css" href="css/book_wish_form.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

</head>
<body>

	<header>
		<%
	 	String idCheckImpart = null;
	 %>
		<div id="top_size">
			<!--로고-->
			<img id="logo" src="img/Logo_1.png">
			<!--탑네비-->
			<nav>
				<ul id="top_nav">
					<li><a href='index.jsp'>HOME</a></li> |
					<li>
						<%
						String member_id = null;
						String changeResult = null;
						
						member_id = (String)session.getAttribute("member_id");
						if ( member_id != null) {
							out.print("<a href='memberLogout.mem'>로그아웃</a>");
						}else{
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
				<li><div class="menuHoverEvent"></div>
					<a href="book_search.jsp">자료검색</a>
					<ul class="sub_menu">
						<li><a href="book_search.jsp">도서 검색</a></li>
					</ul></li>

				<li><div class="menuHoverEvent"></div>
					<a href="#">도서마당</a>
					<ul>
						<li><a href="">신착 도서</a></li>
						<li><a href="">베스트 셀러</a></li>
						<li><a href="">희망도서</a></li>
					</ul></li>

				<li><div class="menuHoverEvent"></div>
					<a href="#">이용안내</a>
					<ul>
						<li><a href="place.jsp">오시는 길</a></li>
							<li><a href="book_guide.jsp">도서 이용안내</a></li>
					</ul></li>

				<li><div class="menuHoverEvent"></div>
					<a href="board.jsp">커뮤니티</a>
					<ul>
						<li><a href="">공지사항</a></li>
						<li><a href="board.jsp">자유게시판</a></li>
						<li><a href="Fault_list.jsp">불량도서 신고</a></li>
						<li><a href="Donate_list.jsp">중고도서 나눔</a></li>
					</ul></li>

				<li><div class="menuHoverEvent"></div>
					<a href="mypage_main.jsp">나의서재</a>
					<ul>
						<li><a href="mypage_main.jsp">나의 서재</a></li>
						<li><a href="mypage_myPost.jsp">내가 쓴 글</a></li>
						<li><a href="mypage_memberinfoChange.jsp">정보 수정/ 탈퇴</a></li>
					</ul></li>
			</ul>
		<div id="window_menu"></div>
		<script src="js/lib_top.js"></script></nav>
		<div id="title">
			<p>희망도서</p>
		</div>
	</header>

	<section id="form_size">

		<div id="form">
			<p id="wish_title">
				<img id="img1" src="img/wish/wish.png" /> 희망도서 신청양식
			</p>


			<form action="book_wish.bw" id="wish_form" name="book_wish">

				<table>
					<tr>
		
						<td>도서명</td>
						<td><input Type="text" name="title" required="required"></td>
					</tr>
					<tr>
						<td>저자</td>
						<td><input Type="text" name="author" required="required" /></td>
					</tr>
					<tr>
						<td>출판사</td>
						<td><input Type="text" name="publisher" required="required" /></td>
					</tr>
					<tr>
						<td>ISBN</td>
						<td><input Type="text" name="isbn" required="required" /></td>
					</tr>

					<input Type="hidden" name="member_id" value="<%=member_id %>" />
				</table>
		</div>
	</section>
	<div id="button_div">
		<input id="wish_button" Type="submit" value="신청완료" />
	</div>
	</form>


	<footer>
		<div id="foot_size">(변경) Library | 04524 서울특별시 중구 세종대로 110 |
			전화번호: 02)120, 2133-0300~1 이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00
			/월요일,공휴일 휴관</div>
	</footer>
	<!-- Favorite -->

</body>
</html>
>
