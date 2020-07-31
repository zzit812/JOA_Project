<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="com.joalib.DAO.DAO" %>
<%@ page import="com.joalib.DTO.BoardDTO" %>
<%@ page import="com.joalib.board.action.dbAction" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
	<title>Document</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="css/lib_top.css">
	<link rel="stylesheet" type="text/css" href="css/board_base.css">
	<link rel="stylesheet" type="text/css" href="css/board_readPage.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

	
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
					<li><a href="book_search.html">자료검색</a>
						<ul class ="sub_menu">
							<li><a href="book_search.html">도서 검색</a></li>
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
							<li><a href="">내가 쓴 글</a></li>
							<li><a href="">포인트</a></li>
							<li><a href="">정보 수정/ 탈퇴</a></li>
						</ul>
					</li>
				</ul>
				<div id="window_menu"></div>
			</nav>
		 </div>
		 <script src="js/lib_top.js"></script>
		 <div id="title"><p>커뮤니티</p></div>
	 </header>

	 <section id="side_size">

		<div id="sidemenu_size" >
			<div id = "sidmenu_box">
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

			<%BoardDTO article = (BoardDTO)request.getAttribute("article");%>
			
				<div id="write_box">                        
				    <h2><%out.print(article.getBoard_title());%></h2>
					<div id="member_character" ><img  src="img/character/character1.png"></div>
					<p><%out.print(article.getMember_id());%></p>
					<p><%out.print(article.getBoard_date());%></p>                    
					<div id="board_text"><%out.print(article.getBoard_text());%></div>   
					<form name="btns">         
						<div class="button">	<!-- 버튼 -->
						<% int sitePage = (Integer)session.getAttribute("boardPageNum"); %>
						<input type="button" value = "목록" onClick="location.href='board.jsp?sitePage=<%= sitePage%>'"/>
						<%	
							if ( member_id != null && member_id.equals(article.getMember_id())) { 
								request.setAttribute("article", article);
							
							%>
								<input type='button'  value = '수정' onClick="location.href='boardModifyForm.bo?board_num=<%=article.getBoard_no()%>'"/>
								<input type='button'  value = '삭제' onClick="removeCheck()"/>
						<% }%>							
						</div>
					</form>		   
				</div>
			</div>
			</div>
        </section>
        
        <footer>
		<div id="foot_size">
			(변경) Library | 04524 서울특별시 중구 세종대로 110 | 전화번호: 02)120, 2133-0300~1</br>
			이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00 /월요일,공휴일 휴관
		</div>
	 </footer><!-- Favorite -->
        </body>
        <script type="text/javascript">
    
       		function removeCheck() {
        	 	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
        	 		location.href='boardDelete.bo?board_num=<%=article.getBoard_no()%>'
        	 	
        	 	}else{  
        	    	 return false;
        	 	}
        	}
        </script>
        </html>
        

        