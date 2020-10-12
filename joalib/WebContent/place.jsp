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
<title>오시는 길</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


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
							<li><a href="">포인트 이용안내</a></li>

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
		<div id="title">
			<p>오시는길</p>
		</div>
	</header>

	<section id="wish_size">

		<div id="guide">
			<p id="wish_title">
				<img id="img1" src="img/wish/wish.png" />위치 안내
			</p>
			<ul>
				<li><img class="img2" src="img/wish/wish_list.png" />지하철</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;2호선 강남역 11번 출구</li>
				<br />

				<li><img class="img2" src="img/wish/wish_list.png" />버 스</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;145, 146, 730, 341, 4312,
					4420, 4421, 4422, 4424, 4431 마을 : 3, 01-6, 10-2, 서초10, 서초 20버스</li>
				<br />


				<li><img class="img2" src="img/wish/wish_list.png" />주 소</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;서울시 강남구 역삼동 815-4(강남대로 428)
					지수빌딩 5층, 10층.</li>
				<br />
				<li><img class="img2" src="img/wish/wish_list.png" />연락처</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;010-1234-5678</li>
				<br />
				<li><img class="img2" src="img/wish/wish_list.png" />팩스</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;02-0202-0202</li>
				<br />
				<li><img class="img2" src="img/wish/wish_list.png" />지도</li>
			</ul>

			<div id="joalib_map" style="width: 85%; height: 550px;"></div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8bb56473dbe59066a763c4558c39b43"></script>
			<script>
				var mapContainer = document.getElementById('joalib_map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(37.500127, 127.029090), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(37.500127, 127.029090); 
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
				</script>

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
