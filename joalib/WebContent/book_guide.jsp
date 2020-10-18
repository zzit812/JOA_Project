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
<title>도서이용안내</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 캘린더 -->

<link rel="stylesheet" type="text/css" href="css/lib_top.css">
<link rel="stylesheet" type="text/css" href="css/book_wish.css">
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
			<p>이용 안내</p>
		</div>
	</header>

	<section id="wish_size">

		<div id="guide">
			<p id="wish_title">
				<img id="img1" src="img/wish/wish.png" /> 도서 이용안내
			</p>
			<ul>
				<li><img class="img2" src="img/wish/wish_list.png" />대출자격</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;조아도서관 회원이며 회원증을 소지한 자</li>
				<br />

				<li><img class="img2" src="img/wish/wish_list.png" />대출가능권수</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;도서: 1인 5권</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;비도서: 1인 2점</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;대출이 불가능한 자료: 세계자료실 대사관 기증자료,
					참고 도서, 시청각자료 등</li>
				<br />
				<li><img class="img2" src="img/wish/wish_list.png" />희망도서 진행
					절차(도서 예약)</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;신청한 도서가 선정절차를 거쳐 구입되어
					이용되기까지는 2~3주 간의 기간이 소요됩니다.</li>
				<br />
				<li><img class="img2" src="img/wish/wish_list.png" />대출기간</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;도서: 14일(1회 7일 연장가능)</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;비도서(DVD,CD등): 7일(1회 7일 연장가능)</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;※&nbsp;예약자가 없는 경우에 한하여 연장가능</li>
				<br />
				<li><img class="img2" src="img/wish/wish_list.png" />연체 재재 안내</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;연체 반납시 반납일이 지난 도서의 연체 일수를 모두
					합한 기간 동안 대출 정지</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;장기 연체 시 회원자격이 상실되며 조아도서관 이용과
					자료대출이 불가</li>
				<br />
				<li><img class="img2" src="img/wish/wish_list.png" />자료분실(훼손)</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;자료의 분실이나 훼손시 동일 도서로 변상하여야
					합니다</li>
			</ul>
		</div>
	</section>

	<footer>
		<div id="foot_size">(변경) Library | 04524 서울특별시 중구 세종대로 110 |
			전화번호: 02)120, 2133-0300~1 이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00
			/월요일,공휴일 휴관</div>
	</footer>
	<!-- Favorite -->
	<script type="text/javascript">
	 
			function newPostBtn(){
				<% 
			  	request.setCharacterEncoding("UTF-8");
				if ( member_id != null) {
					//로그인이 되어있음
					out.print("location.href='book_wish_form.jsp'");
				}else{
					//로그인이 안됨
					out.print("alert('로그인 후 이용가능합니다.');location.href='userLogin.html'");
				}
		  		%>
				
			}
		</script>
</body>
</html>
