<%@ page language="java" contentType="text/html; charset=UTF-8	"
    pageEncoding="UTF-8"%>
<%@ page import="com.joalib.DAO.*" %>
<%@ page import="com.joalib.DTO.*" %>
<%@ page import="com.joalib.board.svc.MyBoardViewService" %>
<%@ page import="com.joalib.fault.svc.myFaultPostViewService" %>
<%@ page import="com.joalib.donate.svc.myDonatePostSelectService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

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
		min-height: 800px;
	}
	.tab_container div > #table1{
		border-bottom: solid 1px #0000003d;
    	margin: 10px auto;
    	padding-bottom:5px;
	}
	.tab_container div > #table1  tr > td {
		text-align: center;
		border-left: solid 1px #0000003d;
	}
	.tab_container div > #table1  tr > td:nth-child(1) {
		border-left: none;
	}
	.tab_container div tr > td{
		padding-left: 10px;
		text-align: center;
	}
	.tab_container div tr > td:nth-child(1){
		width:15%;
		
	}
	.tab_container div tr > td:nth-child(2){
		width:50%;
		text-align: left;		
	}
	.tab_container div tr > td:nth-child(3){
		width:20%;
	}
	.tab_container div> tr > td:nth-child(4){
	}
	.tab_container div > table {	
		width: 90%;
		margin: 5px auto;		
	}
	.tab_container div > table:nth-child(2){
		/* list table */
			
		border-bottom: solid 1px #0000003d;
		padding-bottom: 15px;
	}
	.tab_container div > table:nth-child(2)  tr {
		height: 30px;
	}
	.tab_container h1 {
		text-align: center;
	    opacity: 75%;
	    font-weight: 300;
	    margin: 100px 0;
	    font-size: 25px;
	}
	/* 하단 페이지 번호 */
	
	#pageNumber {
		text-align : center;
		margin-top : 30px;		
	}
	#pageNumber > a {
		/*color : red;*/
		font-weight: 400;
		margin : 0 10px;
	}
	
	/* 탭 설정 */
	
	ul.tabs {
	  /* 윗쪽 공간, 탭 옆*/
		margin: 0;
		padding: 0;
		float: left;
		list-style: none;
		height: 47px;
		border-bottom: 1px solid  #3333331c;
		width: 100%;	  
	}
	
	ul.tabs li {
	  /* 탭 안쪽 */
		float: left;
	    margin: 0;
	    cursor: pointer;
	    padding: 8px 30px;
	    height: 31px;
	    line-height: 31px;
	    /* border-top: 1px solid #333; */
	    /* border-left: 1px solid #333; */
	    /* border-bottom: 1px solid #333; */
	    /* background-color: #666; */
	    /* color: #ccc; */
	    overflow: hidden;
	    position: relative;
	    border-radius: 20px 20px 0 0;
	}
	
	.tab_last {
	  /* 탭 마지막 선,, 솔직히 필요한지는 모르겠당*/
	  border-right: 1px solid #333; 
	}
	
	ul.tabs li:hover {
		background-color: #ccc;
		color: #333;
	}
	
	ul.tabs li.active {
	  /*선택된 탭*/
		background-color: #ff9f40;
	    color: #41414ff0;
	    /* border-bottom: 1px solid #fff; */
	    display: block;
	    font-size: 25px;
    	font-weight: 600;
	}
	
	.tab_container {
	  /*탭 내용: 큰*/
		/* border: 1px solid #333; */
	    border-top: none;
	    clear: both;
	    float: left;
	    width: 100%;
	    /* background: #fff; */
	    overflow: auto;
	}
	
	.tab_content {
	  /*탭 내용:작은*/
		padding: 20px;
		display: none;
		height : 420px;	
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
					<li><a href='home.jsp'>HOME</a></li> | <li><a href="memberLogout.mem">로그아웃</a></li> | <li>포인트충전</li>
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
							<li><a href="Fault_list.jsp">불량도서 신고</a></li>
							<li><a href="Donate_list.jsp">중고도서 나눔</a></li>
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
			<h1><%=session.getAttribute("member_id")%></h1>
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
			<!-- <h1>내가 쓴 글</h1>  -->
			<div id ="valueList" style="border: none;">					
					<ul class="tabs">
					  <li class="active" rel="tab1">자유게시판</li>
					  <li rel="tab2">불량도서 신고</li>
					  <li rel="tab3">중고나눔</li>
					</ul>
					
					<div class="tab_container">
						<!-- #tab1 -->
					  <div id="tab1" class="tab_content">
					<%
							int boardPage = 1;
							if(request.getParameter("boardPage") != null){
								boardPage = Integer.parseInt(request.getParameter("boardPage")) ;
							}
							MyBoardViewService svc = new MyBoardViewService();
							ArrayList[] boardPageList = svc.myBoardPost(member_id); //페이지정보를 담아옴.
							
							
							if(boardPageList.length < 1){
								out.print("<h1>작성하신 게시물이 없습니다</h1>");
							}else{
								out.print("<table border='0' id='table1' cellspacing='0'><tr><td>게시글번호</td><td>제목</td><td>날짜</td><td>조회수</td></tr></table>");
								out.print("<table border='0'>");
								for(int j = 0 ; j < boardPageList[(boardPage)-1].size(); j++){
									BoardDTO dto = (BoardDTO) boardPageList[(boardPage)-1].get(j);	//게시물 하나
									//
									int board_num = dto.getBoard_no();
									out.print("<tr><td>"
									+dto.getBoard_no()+"</td><td><a href='boardReadPage.bo?board_num="
									+dto.getBoard_no()+"'>"
									+dto.getBoard_title()+"</a></td><td>"
									+dto.getBoard_date().substring(0, 10)+"</td><td>"
									+dto.getBoard_hit()+"</td></tr>");  								
								}
								out.print("</table>"); 
								out.print("<div id='pageNumber'>");
								for(int i = 0; i < (boardPageList.length); i++){
									if((i+1) == boardPage){
										out.print("<a href='mypage_myPost.jsp?boardPage="+(i+1)+"' style='color: #009688; font-weight: 700;'>"+(i+1)+"</a>");
									}else{
										out.print("<a href='mypage_myPost.jsp?boardPage="+(i+1)+"'>"+(i+1)+"</a>");
									}
									
								}
								out.print(" </div>");
							}
						%>							
					</div>
					  <!-- #tab2 -->
					  <div id="tab2" class="tab_content">
					  	<!-- <h1>불량도서 준비중 </h1> -->
						<%
							int faultPage = 1;
							if(request.getParameter("faultPage") != null){
								faultPage = Integer.parseInt(request.getParameter("faultPage")) ;
							}
							myFaultPostViewService svcF = new myFaultPostViewService();
							ArrayList<FaultDTO>[] faultPageList = svcF.myFaultPostView(member_id); //페이지정보를 담아옴.
							
							
							if(faultPageList.length < 1){
								out.print("<h1>작성하신 게시물이 없습니다</h1>");
							}else{
								out.print("<table border='0' id='table2' cellspacing='0'><tr><td>게시글번호</td><td>제목</td><td>날짜</td></tr></table>");
								out.print("<table border='0'>");
								for(int j = 0 ; j < faultPageList[(faultPage)-1].size(); j++){
									FaultDTO dtoF = (FaultDTO) faultPageList[(faultPage)-1].get(j);	//게시물 하나
									
									out.print("<tr><td>"
									+dtoF.getFault_no()+"</td><td><a href='Fault_read.jsp?fault_no="+dtoF.getFault_no()+"'>"
									+dtoF.getFault_title()+"</a></td><td>"
									+dtoF.getFault_date().substring(0,10)+"</td></tr>");  								
								}
								out.print("</table>"); 
								out.print("<div id='pageNumber'>");
								for(int i = 0; i < (faultPageList.length); i++){
									if((i+1) == faultPage){
										out.print("<a href='mypage_myPost.jsp?boardPage="+(i+1)+"' style='color: #009688; font-weight: 700;'>"+(i+1)+"</a>");
									}else{
										out.print("<a href='mypage_myPost.jsp?boardPage="+(i+1)+"'>"+(i+1)+"</a>");
									}
									
								}
								out.print(" </div>");
							}
						%>
					  </div>
					  <!-- #tab3 -->
					  <div id="tab3" class="tab_content">
					  	<!-- <h1>중고도서 준비중</h1> -->
					  	<%
							int donatePage = 1;
							if(request.getParameter("donatePage") != null){
								donatePage = Integer.parseInt(request.getParameter("donatePage")) ;
							}
							myDonatePostSelectService svcD = new myDonatePostSelectService();
							ArrayList<DonateDTO>[] donatePageList = svcD.myDonatePostSvc(member_id); //페이지정보를 담아옴.
							
							
							if(donatePageList.length < 1){
								out.print("<h1>작성하신 게시물이 없습니다</h1>");
							}else{
								out.print("<table border='0' id='table2' cellspacing='0'><tr><td>게시글번호</td><td>제목</td><td>날짜</td><td>상태</td></tr></table>");
								out.print("<table border='0'>");
								for(int j = 0 ; j < donatePageList[(donatePage)-1].size(); j++){
									DonateDTO dtoD = (DonateDTO) donatePageList[(donatePage)-1].get(j);	//게시물 하나
									
									out.print("<tr><td>"
									+dtoD.getDonate_no()+"</td><td><a href='Fault_read.jsp?fault_no="+dtoD.getDonate_no()+"'>"
									+dtoD.getDonate_title()+"</a></td><td>"
									+dtoD.getDonate_date().substring(0,10)+"</td><td>"
									+dtoD.getDonate_condition()+"</td></tr>");  								
								}
								out.print("</table>"); 
								out.print("<div id='pageNumber'>");
								for(int i = 0; i < (donatePageList.length); i++){
									if((i+1) == donatePage){
										out.print("<a href='mypage_myPost.jsp?boardPage="+(i+1)+"' style='color: #009688; font-weight: 700;'>"+(i+1)+"</a>");
									}else{
										out.print("<a href='mypage_myPost.jsp?boardPage="+(i+1)+"'>"+(i+1)+"</a>");
									}
									
								}
								out.print(" </div>");
							}
						%>
					  </div>
			</div>
			
			<script type="text/javascript">

		    $(".tab_content").hide();
		    $(".tab_content:first").show();

		  	/* if in tab mode */
		    $("ul.tabs li").click(function() {
				
		      $(".tab_content").hide();
		      var activeTab = $(this).attr("rel"); 
		      $("#"+activeTab).fadeIn();		
				
		      $("ul.tabs li").removeClass("active");
		      $(this).addClass("active");
			  
		    });
			
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