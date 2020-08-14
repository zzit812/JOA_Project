<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="com.joalib.DAO.FaultDAO" %>
<%@ page import="com.joalib.DTO.*" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
	<title>Document</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="css/lib_top.css">
	<link rel="stylesheet" type="text/css" href="css/board_base.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
	<style>
		#cont_size{
			height: auto;
		}
				
		#write_box {
			margin: 0 auto;
  			width: 970px;
			min-height: 350px;
			padding: 20px 30px 60px 30px;
			border: 1px solid rgb(221 221 221);
			border-radius: 1em;
		}
		#write_box > h2 {
		    border-bottom: 1px solid #00000030;
		    margin: 5px;
		    font-size: 22px;
		    font-weight: 500;
		    padding-bottom: 5px;
		    padding-left: 10px;
		}
		.member_character{
			width: 40px;
		    height: 40px;
		    overflow: hidden;
		    float: left;
		    margin:0 10px 0 5px;
		    border-radius: 80%;
		}
		.member_character > img {
			width:40px;
		}
		#memberinfo {
			float: left;
    		width: 80%;
		}
		#memberinfo > p {
			margin: 0;
		}
		#memberinfo  p:nth-child(2) {		   
		    font-size: 16px;
		    font-weight: 400;
		    opacity: 80%;
		    margin: 0;
		    /* display: inline; */
		    float: left;
		    display: contents;
		}
		#memberinfo  p:nth-child(3){
			 font-size: 12px;
			 opacity: 50%;
		}
		
		#fault_text {
			clear: both;
		    min-height: 180px;
		    width: 93%;
		    padding: 20px 30px;
		    border: 1px solid #00000030;
		    box-shadow: 0px 15px 10px rgba(0,0,0,7%);
		    display: inline-block;
		    margin-top: 10px;
		}
		.button {
			margin: 22px 0;
		    float: right;
		    margin-right: 30px;
		}
		#fault_text > img{
			text-align: center;
		    margin: auto;
		    display: block;
		    margin: 10px auto 30px auto;
		    width: 450px;
		}
		
		
	</style>
	
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
			    <h1>불량도서 신고</h1>
			    <div id="cont_1_size">
	
				<%
				int page_num = 1;
				if(request.getParameter("page_num") != null){
					page_num = Integer.parseInt(request.getParameter("page_num"));
				}
				int fault_no = Integer.parseInt(request.getParameter("fault_no"));
				FaultDAO dao = FaultDAO.getinstance();
				FaultDTO dto = dao.faultPageRead(fault_no);	
				%>
					<div id="write_box">   
						<!-- 게시글 내용 -->                     
					    <h2><%= dto.getFault_title() %></h2>
					    <div id="memberinfo">
							<div class="member_character" ><img  src="img/character/character1.png"></div>
							<p><%= dto.getMember_id() %></p>
							<p><%= dto.getFault_date() %></p>  
						</div>							                  
						<div id="fault_text">
						<img src="<%= request.getContextPath() +"/faultImage/"+dto.getFault_attach() %>" />
						<%= dto.getFault_text() %></div>   
						
						<form name="btns" method="post" action="commentWrite.bo?board_no=">
					</div>					
					         
						<div class="button">	<!-- 버튼 -->
						<% int sitePage = 1;
							if(session.getAttribute("boardPageNum") != null){								
								sitePage = (Integer) session.getAttribute("boardPageNum");
							}
						%>
						<input type="button" value = "목록" onClick="location.href='Fault_list.jsp?page_num=<%= page_num%>'"/>
						<%	
							if ( member_id != null && member_id.equals(dto.getMember_id())) { 
								request.setAttribute("article", dto.getMember_id());							
						%>
						<input type='button'  value = '수정' onClick="location.href=''"/>
						<input type='button'  value = '삭제' onClick="removeCheck()"/>
						<% }%>							
						</div>
					</form>
				</div>
			</div>
        </section>
        
        <footer>
		<div id="foot_size">
			(변경) Library | 04524 서울특별시 중구 세종대로 110 | 전화번호: 02)120, 2133-0300~1
			이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00 /월요일,공휴일 휴관
		</div>
	 </footer><!-- Favorite -->
        </body>
        <script type="text/javascript">
    
       		function removeCheck() {
        	 	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
        	 		location.href=''        	 	
        	 	}else{  
        	    	 return false;
        	 	}
        	}
        </script>
        </html>
        

        