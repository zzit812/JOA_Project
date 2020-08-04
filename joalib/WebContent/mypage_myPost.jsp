<%@ page language="java" contentType="text/html; charset=UTF-8	"
    pageEncoding="UTF-8"%>
<%@ page import="com.joalib.DAO.PointDAO" %>
<%@ page import="com.joalib.DTO.PointDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOA LIBRARY</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- 캘린더 -->

<link rel="stylesheet" type="text/css" href="css/lib_mypage_main.css">
<link rel="stylesheet" type="text/css" href="css/lib_top.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style type="text/css">
	
	#cont_size{
		background-color: #e8e8e8;
		min-height: 1000px;
	}
	
	
	#valueList > #table1{
		border-bottom: solid 1px black;
    	margin: 10px auto;
    	padding-bottom:5px;
	}
	
	#valueList  tr > td:nth-child(1){
		width:15%;
	}
	#valueList  tr > td:nth-child(2){
		width:50%;
	}
	#valueList  tr > td:nth-child(3){
		width:20%;
	}
	#valueList  tr > td:nth-child(4){
	}
	#valueList > table {
		width: 90%;
		margin: auto;		
	}
	
	

</style>
</head>

<body>
<%
	String member_id = (String)session.getAttribute("member_id"); 
	if(member_id == null){%>
		<script type="text/javascript">
		alert("로그인 후 이용해주세요");
		location.href="userLogin.html";
		</script>	
	<%}else{%>
<header>

		 <div id="top_size">
		 	<!--로고-->
			<img id="logo" src="img/icon_lib.png">
			<!--탑네비-->
			<nav>
				<ul id="top_nav">
					<li>HOME</li> | <li><a href="memberLogout.mem">로그아웃</a></li> | <li>포인트충전</li>
				</ul>
			</nav>
			<div class="clearF"></div>
			<!--탑메뉴-->
			<nav id="topMenuBorder">
				<ul id="top_menu">

					<li><a href="book_search.html">자료검색</a>
						<ul class ="sub_menu">
							<li><a href="">도서 검색</a></li>
							<li><a href="">분야별 도서 조회</a></li>
						</ul>
					</li>
					<li><a href="#">도서마당</a>
						<ul>
							<li><a href="">신착 도서</a></li>
							<li><a href="">베스트 셀러</a></li>
							<li><a href="">희망도서</a></li>
						</ul>
					</li>
					<li><a href="#">이용안내</a>
						<ul>
							<li><a href="">시설안내</a></li>
							<li><a href="">자료 현황</a></li>
							<li><a href="">포인트</a></li>
							<li><a href="">도서 대여</a></li>
							<li><a href="">도서 예약</a></li>
						</ul>
					</li>				
					<li><a href="#">커뮤니티</a>
						<ul>
							<li><a href="">공지사항</a></li>
							<li><a href="">질문과 답변</a></li>
							<li><a href="board.jsp">자유게시판</a></li>
							<li><a href="">불량도서 신고</a></li>
							<li><a href="">중고도서 나눔</a></li>
						</ul>
					</li>
					<li><a href="mypage_main.jsp">나의서재</a>
						<ul>
							<li><a href="mypage_main.jsp">나의 서재</a></li>
							<li><a href="">서비스 이용 내역</a></li>
							<li><a href="mypage_myPost.jsp">내가 쓴 글</a></li>
							<li><a href="">포인트</a></li>
							<li><a href="">정보 수정/ 탈퇴</a></li>
						</ul>
					</li>
				</ul>
				<div id="window_menu"></div>
			</nav>
		 </div>
		 <script src="js/lib_top.js"></script>
		 <div id="title"><p>나의 서재</p></div>
	 </header>

	 <section id="side_size">

		<div id="sidemenu_size" >
			<div id="profile_img"><img  src = "img/character/character1.png" /></div>
			<h1><%= session.getAttribute("member_id") %></h1>
			<nav>
				<ul  id="sidmenu_box">
					<li><a href="">나의 서재</a></li>
					<li><a href="">서비스 이용 내역</a></li>
					<li><a href="mypage_myPost.jsp">내가 쓴 글</a></li>
					<li><a href="">정보수정</a></li>
				</ul>
			</nav>
		</div>

		<div id="cont_size">
			<h1>내가 쓴 글</h1>
			<form name="mypostform">
			<select id="changePage" name="changePage">
				<option value="1">자유게시판</option>
				<option value="2">불량도서신고</option>
				<option value="3">중고나눔</option>
			</select>
			</form>
			<div id ="valueList">
				<table border="0" id="table1" cellspacing="0">
					<tr><td>첫번째</td><td>두번째</td><td>세번째</td><td>네번째</td></tr>
				</table>
				<table border="0">
					<tr><td>첫번째</td><td>두번째</td><td>세번째</td><td>네번째</td></tr>
					<tr><td>첫번째</td><td>두번째</td><td>세번째</td><td>네번째</td></tr>
					<tr><td>첫번째</td><td>두번째</td><td>세번째</td><td>네번째</td></tr>
				</table>
			</div>
			
			<script type="text/javascript">
			
				$(function(){
					
					var selValue = 1;
					
					$("#changePage").on("change", function(){
						//option value값 받기
						var st = document.querySelector('#changePage');	//select 가져옴
						for(var i=0; i < st.length; i++){
							if (st.options[i].selected){ 
				 				selValue = st.options[i].value;			 				
				 			}
						}
						//
						if(selValue == 1){
							console.log("자유게시판");
							
						}else if(selValue == 2){
							console.log("불량도서");	
						}else if(selValue == 3){
							console.log("중고나눔");	
						}
						
					});
				})
			
			</script>
			
			
			
		</div>
		</section>


		

	 <footer>
		<div id="foot_size">
			(변경) Library | 04524 서울특별시 중구 세종대로 110 | 전화번호: 02)120, 2133-0300~1</br>
			이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00 /월요일,공휴일 휴관
		</div>
	 </footer><!-- Favorite -->

 
<% } %>
</body>

</html>