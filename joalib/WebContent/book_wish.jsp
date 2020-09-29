<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@page import="com.joalib.fault.svc.*" %>
<%@page import="com.joalib.DAO.*" %>
<%@page import="com.joalib.DTO.*" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망도서</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- 캘린더 -->
	
	<link rel="stylesheet" type="text/css" href="css/lib_top.css">
	<link rel="stylesheet" type="text/css" href="css/book_wish.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
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
					<li><a href='home.jsp'>HOME</a></li> | <li>
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
						</ul></li>
					<li><a href="book_new.jsp">도서마당</a>
						<ul>
							<li><a href="book_new.jsp">신착 도서</a></li>
							<li><a href="book_best.jsp">베스트 셀러</a></li>
							<li><a href="book_recommend.jsp">추천 도서</a></li>
							<li><a href="book_wish.jsp">희망 도서</a></li>
						</ul>
						</li>
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
		 <div id="title"><p>희망도서</p></div>
	 </header>

	 <section id="wish_size">
	 
	 <div id="guide">
		 <p id="wish_title"><img id="img1" src="img/wish/wish.png" /> 희망도서 신청안내</p>
			<ul>
				<li><img class="img2" src="img/wish/wish_list.png" />신청자격</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;도서관 회원증을 발급받은 회원만 신청이 가능합니다.</li><br/>
				
				<li><img class="img2" src="img/wish/wish_list.png" />희망도서 신청권수</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;1인당 월 3권, 1년에 15권으로 제한</li><br/>
				
				
				<li><img class="img2" src="img/wish/wish_list.png" />희망도서 진행 절차(도서 예약)</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;신청한 도서가 선정절차를 거쳐 구입되어 이용되기까지는 2~3주 간의 기간이 소요됩니다.</li><br/>
				
				<li><img class="img2" src="img/wish/wish_list.png" />선정 제외 도서</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;문제집, 수험서, 중고등 참고서</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;판타지, 로맨스소설, 무협지</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;웹툰, 라이트노벨 등 각종 만화류</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;연감, 백서, 보고서 등 참고도서류</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;영리목적·정치목적 자료</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;미풍양속이나 정서 등에 문제를 유발할 수 있는 유해자료, 19세 이상 선정적인 도서</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;정기간행물과 전자자료(전자책,DVD 등 비도서) ※ 필요하다고 판단되는 경우에는 별도 비도서 구입 지침에 따름)</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;외국도서, 특정분야 전문도서</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;고가도서(5만원 이상), 외국도서, 3권을 초과하는 시리즈 또는 전집도서, 기타 다른 기준을 적용하기 어려운 도서</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;스프링 제본 또는 낱장자료(리플릿), 입체도서, 악보, 색칠공부, 필사 등 책 크기가 너무 작거나 소리가 나는 도서 등 이용과 관리가 어려운 형태 자료</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;소장자료나 구입중 또는 정리중 도서, 신청 또는 주문중복도서</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;서지불명도서나 미간행도서, 비매품, 품절이나 절판 도서</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;유사도서가 많이 소장되어 있는 경우</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;신판이 발간되었음에도 구판을 신청한 경우</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;개인 및 출판사의 영리를 목적으로 하는 자료로 판단되는 경우</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;※&nbsp; 희망도서 선정에서 제외된 도서 중 필요하다고 판단되는 경우에는 정기구입 자료선정위원회에서 심의를 통해 구입</li>
			</ul>
	 </div>
	 </section>
	 <div id="button_div">
	 <input id="wish_button" Type="button" value="신청하기" onclick="newPostBtn()"/>
	 </div>

	 <footer>
		<div id="foot_size">
			(변경) Library | 04524 서울특별시 중구 세종대로 110 | 전화번호: 02)120, 2133-0300~1
			이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00 /월요일,공휴일 휴관
		</div>
	 </footer><!-- Favorite -->
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
