<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="com.joalib.DAO.FaultDAO" %>
<%@ page import="com.joalib.DTO.FaultDTO" %>
<%@ page import="com.joalib.fault.action.*" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
	<title>Document</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="css/lib_top.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

	<style>
	.commentCount{
			display: inline;
		    margin: 0 0 0 20px;
		    font-weight: 300;
		    font-size: 13px;
		    opacity: 75%;
		}		
		#cont_size{	
			float: left;
			width: 75%;
			font-size: 15px;
			margin-top: 50px;
		}
		
		#sidemenu_size{ 
			float: left;
			width: 350px;
			height: 100px;
		}
		#sidmenu_box > div{
			text-align: center;
		    width: 80%;
		    margin: 15px auto;
		    /*box-shadow: 10px 10px 14px rgba(0, 0, 0, 5%);*/
		    padding: 20px 0;
    		border-radius: 50px;
		} 
		#sidmenu_box > div  li {
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
		#sidmenu_box > div > h1 {
			border-bottom: 1px solid #e6e6e6;
			border-top: 1px solid #e6e6e6;
		    font-size: 30px;
		    padding: 10px 0;
		    width: 90%;
    		margin: 10px auto 35px auto;
    		opacity: 90%;
    		font-weight: 300;
		}
		#cont_size > h1 {
			padding: 0px 0 10px 30px;
		    font-weight: 400;
		    border-bottom: 1px solid #e6e6e6;
		}		
		#cont_1_size {	/* 자유게시판,커뮤니티 등등 */
			margin:0px;
		}
		
	/*								*/
		#write_box {
			margin: 10px auto 50px auto;
  			width: 970px;
			padding: 1.5em;
			border: 1px solid rgb(221 221 221);
			border-radius: 1em;
		}
		#board_text {
			position: relative;
			top: 20px;
		}
		.button {
			text-align: center;
			margin-top: 10px;
		}
		textarea {
		    margin: 0px;
	  	 	height: 220px;
	    	width: 963px;
		}	
		
		#faultImg {
			height: 20px;
		}
		
		#fault_title {
			display: block;
		    margin: 5px 0;
		    width: 50%;
		    padding: 5px;
		}
		#fault_text{
		    margin: 0px;
		    min-height: 220px;
		    width: 98%;
		    padding: 5px;
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
					<li><a href='home.jsp'>HOME</a></li> | <li>
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
							<li><a href="Fault_list.jsp">불량도서 신고</a></li>
							<li><a href="Donate_list.jsp">중고도서 나눔</a></li>
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
            <%
				int fault_no = Integer.parseInt(request.getParameter("fault_no"));
				FaultDAO dao = FaultDAO.getinstance();
				FaultDTO dto = dao.faultPageRead(fault_no);	
			%>
            <div id="cont_1_size">				
				<div id="write_box">                        
				<form action='faultUpdate.fa' name="faultUpdate" method="post">
					<input type="hidden" name="fault_no" value="<%= fault_no%>"  />
					<input type="text" name="fault_title" id="fault_title" value="<%= dto.getFault_title()%>"/>
					<textarea id="fault_text" name="fault_text"><%= dto.getFault_text()%></textarea>
					<input class="button" type="submit" onClick ="alert('수정되었습니다');" value = "등록" />
					<a href="javascript:history.go(-1)"><input type="button" value="뒤로"/></a>
				</form>
            	</div>            	                  
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
        </html>
        