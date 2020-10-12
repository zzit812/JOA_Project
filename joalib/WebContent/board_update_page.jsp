<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="com.joalib.DAO.DAO"%>
<%@ page import="com.joalib.DTO.BoardDTO"%>
<%@ page import="com.joalib.board.action.dbAction"%>
<%@ page import="java.util.List"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/lib_top.css">
<link rel="stylesheet" type="text/css" href="css/board_base.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<style>
#write_box {
	margin: 0 auto;
	width: 970px;
	height: 325px;
	padding: 1.5em;
	border: 1px solid rgb(221, 221, 221);
	border-radius: 1em;
}

#member_character {
	
}

#member_id {
	font-size: 15px;
	font-weight: bold;
}

#board_text {
	position: relative;
	top: 20px;
}

.button {
	text-align: center;
	margin-top: 10px;
}

textarea {
	margin: 0px;
	height: 220px;
	width: 963px;
}
</style>
</head>

<body>
	<header>
		<div id="top_size">
			<!--로고-->
			<img id="logo" src="img/icon_lib.png">
			<!--탑네비-->
			<nav>
				<ul id="top_nav">
					<li><a href='home.jsp'>HOME</a></li> |
					<li>
						<%
						String member_id = null;
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
					<li><a href="book_search.html">자료검색</a>
						<ul class="sub_menu">
							<li><a href="book_search.html">도서 검색</a></li>
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
							<li><a href="Donate_list.jsp">중고도서 나눔</a></li>
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
		<div id="title">
			<p>커뮤니티</p>
		</div>
	</header>

	<section id="side_size">

		<div id="sidemenu_size">
			<div id="sidmenu_box">
				<div>
					<h1>커뮤니티</h1>
					<ul>
						<li>공지사항</li>
						<li>질문과 답변</li>
						<li>자유게시판</li>
						<li>불량도서 신고</li>
						<li>중고도서 나눔</li>
					</ul>

				</div>
			</div>
		</div>

		<div id="cont_size">

			<h1>자유게시판</h1>
			<div id="cont_1_size">
				<div id="write_box">
					<form action='boardModifyPro.bo' name="boardUpdatePro"
						method="post">
						<%BoardDTO article = (BoardDTO) request.getAttribute("article");	%>
						<input type="hidden" name="board_no"
							value="<%= article.getBoard_no() %>" /> <input type="text"
							name="board_title" value="<%= article.getBoard_title() %>" />
						<textarea id="board_text" name="board_write"><%= article.getBoard_text() %></textarea>
						<input class="button" type="submit" value="등록" /> <a
							href="javascript:history.go(-1)"><input type="button"
							value="뒤로" /></a>
					</form>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<div id="foot_size">(변경) Library | 04524 서울특별시 중구 세종대로 110 |
			전화번호: 02)120, 2133-0300~1 이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00
			/월요일,공휴일 휴관</div>
	</footer>
	<!-- Favorite -->
</body>
</html>
