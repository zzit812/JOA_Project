<%@ page language="java" contentType="text/html; charset=UTF-8	"
	pageEncoding="UTF-8"%>
<%@ page import="com.joalib.DAO.*"%>
<%@ page import="com.joalib.DTO.*"%>
<%@ page import="com.joalib.board.svc.MyBoardViewService"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOA LIBRARY</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 캘린더 -->

<link rel="stylesheet" type="text/css" href="css/lib_mypage_main.css">
<link rel="stylesheet" type="text/css" href="css/lib_top.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<style type="text/css">
#cont_size {
	/*background-color: #e8e8e8; */
	min-height: 800px;
}
</style>
</head>

<body>
	<%
	String member_id = (String)session.getAttribute("member_id"); 
	if(member_id == null){
%>
	<script type="text/javascript">
		alert("로그인 후 이용해주세요");
		location.href="userLogin.html";
		</script>
	<%
			}else{
		%>
	<header>

		<div id="top_size">
			<!--로고-->
			<img id="logo" src="img/icon_lib.png">
			<!--탑네비-->
			<nav>
				<ul id="top_nav">
					<li><a href='home.jsp'>HOME</a></li> |
					<li><a href="memberLogout.mem">로그아웃</a></li> |
					<li>포인트충전</li>
				</ul>
			</nav>
			<div class="clearF"></div>
			<!--탑메뉴-->
			<nav id="topMenuBorder">
				<ul id="top_menu">

					<li><a href="book_search.html">자료검색</a>
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
							<li><a href="Fault_list.jsp">불량도서 신고</a></li>
							<li><a href="Donate_list.jsp">중고도서 나눔</a></li>
						</ul></li>
					<li><a href="mypage_main.jsp">나의서재</a>
						<ul>
							<li><a href="mypage_main.jsp">나의 서재</a></li>
							<li><a href="">서비스 이용 내역</a></li>
							<li><a href="mypage_myPost.jsp">내가 쓴 글</a></li>
							<li><a href="">포인트</a></li>
							<li><a href="">정보 수정/ 탈퇴</a></li>
						</ul></li>
				</ul>
				<div id="window_menu"></div>
			</nav>
		</div>
		<script src="js/lib_top.js"></script>
		<div id="title">
			<p>나의 서재</p>
		</div>
	</header>

	<section id="side_size">

		<div id="sidemenu_size">
			<div id="profile_img">
				<img src="img/character/character1.png" />
			</div>
			<h1><%=session.getAttribute("member_id")%></h1>
			<nav>
				<ul id="sidmenu_box">
					<li><a href="">나의 서재</a></li>
					<li><a href="">서비스 이용 내역</a></li>
					<li><a href="mypage_myPost.jsp">내가 쓴 글</a></li>
					<li><a href="">정보수정</a></li>
				</ul>
			</nav>
		</div>

		<div id="cont_size">
			<form action="" name="pwCheck" method="post">
				<h2>비밀번호 확인</h2>

				<input type="password" name="pwCheck" onkeypress="enter_test();" /><input
					type="button" value="확인" name="pwCheckBtn"
					onClick="
				<%
					memberinfoDAO dao = new memberinfoDAO();
					memberinfoDTO member = dao.memberIDCheck(member_id);
					String member_pw = member.getMember_pw();
				%>
				if(document.querySelector('input[name=pwCheck]').value == '<%= member_pw %>'){
					samePW();
				}else{
				
					alert('잘못된 비밀번호입니다. 다시 입력해주세요.'); 
					document.querySelector('input[name=pwCheck]').value = ''; 
					document.querySelector('input[name=pwCheck]').focus();
				}
			" />
				<script type="text/javascript">
			//enter 눌렀을때 반응
			    function enter_test() {
			        if ( window.event.keyCode == 13 ) {
			            var checkBtn =document.querySelector('input[name=pwCheckBtn]'); // 변수에 엘리먼트 저장
			            checkBtn.click();			            
			        }
			    }			
				function samePW(){
			    	var result = confirm("정말로 탈퇴하시겠습니까?\n*포인트는 모두 소멸됩니다*");	//예-t 아니오-f
			    	if(result  == true){
			    		//탈퇴하기
			    		alert('탈퇴되었습니다. 다음 기회에 봐요!');
			    		window.location.replace('memberDelete.mem');
			    	}else{
			    		//탈퇴 안하기
			    		window.location.replace('mypage_memberinfoChange.jsp');
			    	}
				}			
			</script>
			</form>

		</div>
	</section>

	<footer>
		<div id="foot_size">
			(변경) Library | 04524 서울특별시 중구 세종대로 110 | 전화번호: 02)120, 2133-0300~1</br>
			이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00 /월요일,공휴일 휴관
		</div>
	</footer>
	<!-- Favorite -->


	<% } %>
</body>

</html>