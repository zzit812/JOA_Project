<%@page import="com.joalib.booksearch.action.BookSearchAction2"%>
<%@page import="com.joalib.DTO.BookInfoDTO"%>
<%@page import="com.joalib.DAO.BookInfoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.joalib.board.action.dbAction"%>


<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<!-- 되라되라 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
			<img id="logo" src="img/Logo_1.png">
			<!--탑네비-->
			<nav>
				<ul id="top_nav">
					<li><a>HOME</a></li> |
					<li>
						<%
						String member_id= null;
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
							<li><a href="book_guide">도서 이용안내</a></li>
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
		<script src="js/search.js"></script>
	</header>



	<section>
		<div class="search">
			<div id="search_title">도서검색</div>
			<div id="search_box">
				<!--검색어-->



				<div id="hbz-searchbox">
					<!-- sc -->
					<form action="book_search.bs" method="get">
						<select id="select_search" name="select_search">
							<option>전체</option>
							<option>도서명</option>
							<option>저자</option>
							<option>출판사</option>
						</select>

						<!-- <input Type="hidden" name="page" value="1" /> -->

						<input type="text" id="hbz-input" name="what"
							placeholder="검색어를 입력해주세요" /> <input id="hbz-submit"
							type="submit" value="Search" />
				</div>
			</div>
			
			<div id="category_box">
				<!--카테고리검색-->
				<ul>
					<li><input type="checkbox" id="100" name="check" value="100"><label
						for="100">전체</label></li>
					<li><input type="checkbox" id="101" name="check" value="101">
						<label for="101">소설</label></li>
					<li><input type="checkbox" id="102" name="check" value="102">
						<label for="102">시/에세이</label></li>
					<li><input type="checkbox" id="103" name="check" value="103">
						<label for="103">예술/대중문화</label></li>
					<li><input type="checkbox" id="104" name="check" value="104">
						<label for="104">사회과학</label></li>
					<li><input type="checkbox" id="105" name="check" value="105">
						<label for="105">역사/문화</label></li>
					<li><input type="checkbox" id="110" name="check" value="110"><label
						for="110">유아/아동</label></li>
					<li><input type="checkbox" id="111" name="check" value="111"><label
						for="111">가정과생활</label></li>
					<li><input type="checkbox" id="112" name="check" value="112"><label
						for="112">청소년</label></li>
					<li><input type="checkbox" id="115" name="check" value="115"><label
						for="115">어학</label></li>

					<li><input type="checkbox" id="116" name="check" value="116"><label
						for="116">자연과과학</label></li>
					<li><input type="checkbox" id="117" name="check" value="117"><label
						for="117">경제경영</label></li>
					<li><input type="checkbox" id="118" name="check" value="118"><label
						for="118">자기계발</label></li>
					<li><input type="checkbox" id="119" name="check" value="119"><label
						for="119">인문</label></li>
					<li><input type="checkbox" id="120" name="check" value="120"><label
						for="120">종교/역학</label></li>

					<li><input type="checkbox" id="123" name="check" value="123"><label
						for="123">자격서/수험서</label></li>
					<li><input type="checkbox" id="124" name="check" value="124"><label
						for="124">취미와레저</label></li>
					<li><input type="checkbox" id="128" name="check" value="128"><label
						for="128">여행</label></li>

				</ul>


			</div>
			</form>


		</div>


		<!-- <div style="text-align: center;">
		<a href="BookInfoAdd.jsp">임시,관리자 도서추가</a>
		</div>
		<br/> -->


	</section>


	<footer>
		<div id="footer_size">
			(변경해야함) Library | 04524 서울특별시 중구 세종대로 110 | 전화번호: 02)120, 2133-0300~1</br>
			이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00 /월요일,공휴일 휴관
		</div>
	</footer>





</body>
</html>
