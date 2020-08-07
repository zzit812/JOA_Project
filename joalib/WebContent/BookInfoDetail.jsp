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
							<li><a href="">불량도서 신고</a></li>
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
	</header>

	
	<%	
			BookInfoDTO bookinfo = (BookInfoDTO)request.getAttribute("bookinfoD");
		
		
	%>

	
	<section>
		<div id="book_box">
			<div id="img_box">
				<span id="category"><%=bookinfo.getCategory() %></span>
				<img id="book_img" src="img/book/<%=bookinfo.getBook_img()%>">
				<div id="button">
				
				<form action="">
					<input type="button" id="favorite_add" value="관심도서" onclick="Login()">
					<input type="button" id="loan" value="대출하기" onclick="Login()">

				</form>

				</div>
			</div>
			<div id="detail_box">
				<a href="#" onclick="history.back();"><img id="back" src="img/back.png"></a>
				<div id="detail">
				<h2><%=bookinfo.getBook_title() %></h2>
				<div><b>저자사항</b>   <%=bookinfo.getAuthor() %></div>
				<div><b>출판사</b>   <%=bookinfo.getPublisher()%> </div>
				<div><b>출판년도</b>   <%=bookinfo.getPub_date()%> </div>
				<div><b>표준번호</b>   ISBN: <%=bookinfo.getIsbn() %></div>
				<div><b>상세정보</b></div>
				<div>
					<%=bookinfo.getBook_story()%>
				</div>
				
				
			</div>
		</div>
		
	</section>
	
	 <script type="text/javascript">
	function Login(){
		<%
				if ( member_id != null) {
					//로그인이 되어있음
					out.print("location.href= 'bookInfoDetail.bk");
				}else{
					//로그인이 안됨
					out.print("alert('로그인 후 이용가능합니다.'); location.href='userLogin.html'");
				}
		%>
		 
				
			}
	</script>

			
			
	<footer>
		<div id="footer_size">
			(변경해야함) Library | 04524 서울특별시 중구 세종대로 110 | 전화번호: 02)120, 2133-0300~1</br>
			이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00 /월요일,공휴일 휴관
		</div>
	</footer>




	</main>
</body>
</html>