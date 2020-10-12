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
<title>자유게시판</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 캘린더 -->

<link rel="stylesheet" type="text/css" href="css/lib_top.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<style>
.commentCount {
	display: inline;
	margin: 0 0 0 20px;
	font-weight: 300;
	font-size: 13px;
	opacity: 75%;
}

#cont_size {
	float: left;
	width: 75%;
	font-size: 15px;
	margin-top: 50px;
	height: 650px;
}

#sidemenu_size {
	float: left;
	width: 350px;
	height: 100px;
}

#sidmenu_box>div {
	text-align: center;
	width: 80%;
	margin: 15px auto;
	/*box-shadow: 10px 10px 14px rgba(0, 0, 0, 5%);*/
	padding: 20px 0;
	border-radius: 50px;
}

#sidmenu_box>div  li {
	display: block;
	text-align: center;
	margin: 20px auto;
	font-size: 19px;
	padding: 13px 0;
	width: 70%;
	/*background-color: #FFEB3B;*/
	border-radius: 30px;
	font-weight: 400;
	opacity: 90%;
}

#sidmenu_box>div>h1 {
	border-bottom: 1px solid #e6e6e6;
	border-top: 1px solid #e6e6e6;
	font-size: 30px;
	padding: 10px 0;
	width: 90%;
	margin: 10px auto 35px auto;
	opacity: 90%;
	font-weight: 300;
}

#cont_size>h1 {
	padding: 0px 0 10px 30px;
	font-weight: 400;
	border-bottom: 1px solid #e6e6e6;
}

#cont_1_size { /* 자유게시판,커뮤니티 등등 */
	margin: 0px;
}

/*                                   */
#board_con {
	margin: 0px 10px 0 10px;
	padding-bottom: 30px;
	border-bottom: 1px solid #e6e6e6;
}

#board_con>ul {
	padding: 3px 6px;
	border-bottom: 1px solid #e6e6e6;
	border-top: 1px solid #e6e6e6;
}

#board_con>ul>li {
	display: inline-block;
	border-right: 1px solid #e6e6e6;
	text-align: center;
}

#board_con>ul>li:nth-child(1), #board_con>ul>li:nth-child(3), #board_con>ul>li:nth-child(4)
	{ /*게시번호*/
	width: 18%;
}

#board_con>ul>li:nth-child(4) {
	/*마지막 : 회원인가?*/
	border-right: none;
}

#board_con>ul>li:nth-child(2) { /*제목*/
	width: 45%;
}
/**/
#board_con>div>ul {
	margin: 10px 0;
}

#board_con>div>ul>li {
	display: inline-block;
	text-align: left;
	text-align: center;
}

#board_con>div>ul>li:nth-child(1), #board_con>div>ul>li:nth-child(3),
	#board_con>div>ul>li:nth-child(4) { /*게시번호*/
	width: 18%;
}

#board_con>div>ul>li:nth-child(1) {
	opacity: 50%;
}

#board_con>div>ul>li:nth-child(2) { /*제목*/
	width: 43.5%;
	padding-left: 8px;
	text-align: left;
}

#board_con>div {
	margin: 0 0 30px 0;
}

#pageNumber {
	text-align: center;
	margin: 20px;
}

#pageNumber>a {
	font-size: 17px;
	padding: 0 5px;
	font-weight: 400;
}
</style>


</head>
<body>

	<header>
		<%
	 	String idCheckImpart = null;
	 %>
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
					<li><a href="book_search.jsp">자료검색</a>
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
			<h1>불량도서 신고</h1>
			<div id="board_con">

				<form>
					<input type="button" value="글쓰기" id="write_button"
						onclick="
		  		<%
		  		if(member_id != null){
		  			 out.print("location.href='Fault_write.jsp'");
		  		}else{
		  			out.print("alert('로그인 후 이용가능합니다'); location.href='userLogin.html'");
		  		}
		  		%>" />
				</form>

				<ul>
					<li>게시번호</li>
					<li>제목</li>
					<li>회원</li>
					<li>글쓴날짜</li>
				</ul>
				<div>
					<%
				int page_num = 1;
				if(request.getParameter("page_num") != null){
					page_num = Integer.parseInt(request.getParameter("page_num"));
				}
				FaultListViewService svc = new FaultListViewService();
				ArrayList<FaultDTO>[] totalPage = svc.faultList();	
				ArrayList<FaultDTO> list = totalPage[page_num-1];
				
				for(int i = 0 ; i < list.size(); i++){	%>
					<ul id="faultList">
						<li><%= list.get(i).getFault_no() %></li>
						<li><a
							href="Fault_read.jsp?fault_no=<%= list.get(i).getFault_no() %>&page_num=<%= page_num %>"><%= list.get(i).getFault_title() %></a></li>
						<li><%= list.get(i).getFault_date().substring(0, 10) %></li>
						<li><%= list.get(i).getMember_id() %></li>
					</ul>
					<% }	%>
				</div>
			</div>
			<div id="pageNumber">
				<%
		  		for(int i = 0 ; i < totalPage.length; i++){	%>
				<a href="Fault_list.jsp?page_num=<%= (i+1) %>"><%= (i+1)%></a>
				<%	}  	%>

			</div>
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
					out.print("location.href='board_write.jsp'");
				}else{
					//로그인이 안됨
					out.print("alert('로그인 후 이용가능합니다.');location.href='userLogin.html'");
				}
		  		%>
				
			}
		</script>
</body>
</html>
