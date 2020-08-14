<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="com.joalib.DAO.DAO" %>
<%@ page import="com.joalib.DTO.*" %>
<%@ page import="com.joalib.board.action.dbAction" %>
<%@ page import="com.joalib.board.svc.CommentListService" %>
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
			padding: 1.5em;
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
		#memberinfo  p:nth-child(1) {
		    font-size: 16px;
		    font-weight: 400;
		    opacity: 80%;
		    margin: 0;
		    display: inline;
		    float: left;
		}
		#memberinfo  p:nth-child(2){
			 font-size: 12px;
			 opacity: 50%;
		}
		
		#board_text {
			clear: both;
		    min-height: 180px;
		    width: 98%;
		    padding: 10px;
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
		
		form > h2 {
			margin: 40px 0px 20px 0;
		    padding:0 0 10px 20px;
		    font-weight: 300;
		    opacity: 85%;
		    font-size: 18px;
		    border-bottom: solid 1px #8080803b;
		}
		#board_comment_add {
			margin: auto;
		    width: 95%;
		    padding-bottom: 20px;
		}
		#board_comment_add > input[type=text] {
			border: 1px solid #00000030;
			height: 40px;
		    width: 75%;
		    margin-left: 10px;
		    padding: 0 10px;
		}
		
		#board_comment_add > input[type=submit] {
			margin: 0 10px;
		    height: 40px;
		    width: 10%;
		    border: 0px;
		    background-color: #FF9800;
		    border-radius: 15px;
		    float: right;
		}
		#boardComment_List {
			min-height: 10px;
			border-top: solid 1px #8080803b;
			padding-top : 20px;
		}
		.boardComments{
			padding: 2px 0;
		}
		.boardComments > .member_character{
			width: 25px;
		    height: 25px;
		    overflow: hidden;
		    float: left;
		    margin:0 10px 0 5px;
		    border-radius: 80%;
		}
		.boardComments > .member_character > img{
			width: 25px;
		}
		.boardComments > h5:nth-child(2){
    		display: inline-block;
		    margin: 0 0 0 10px;
		    font-size: 15px;
		    font-weight: 500;
		    opacity: 90%;
		    
		}
		.boardComments > h5:nth-child(3){
			/*댓글 날짜*/
			display: inline-block;
		    margin: 0 0 0 20px;
		    font-weight: 400;
		    opacity: 60%;
		    font-size: 12px;
		    border-left: solid 1px gray;
    		padding-left: 8px;
		}
		.boardComments > a:nth-child(4), .boardComments > a:nth-child(5){
			float: right;
		    opacity: 80%;
		    font-size: 13px;
		    margin: 0 3px;
			
		}
		.boardComments > p {
			/*댓글 내용*/
			clear: both;
		    padding: 5px 10px;
		    font-size: 13px;
		    font-weight: 300;
		    margin: 10px 0;
		    background-color: #dcdcdc4f;
		    min-height: 35px;
		}
		.changeText{
			border: 1px solid #00000030;
			clear: both;
		    padding: 5px 10px;
		    font-size: 13px;
		    font-weight: 300;
		    margin: 10px 0;
		    width: 79%;
		    min-height: 35px;
		}
		
		input[name=changeBtn]{
			min-height: 35px;
		    width: 10%;
		    margin: auto 20px;
		    border: 0px;
		    border-radius: 15px;
		    box-shadow: 5px 5px 8px rgba(0,0,0,15%);
		    background-color: #c5c4c426;
		    font-size: 16px;
		    padding: 5px 0;
		    font-weight: 500;
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
			    <h1>자유게시판</h1>
			    <div id="cont_1_size">
	
				<%BoardDTO article = (BoardDTO)request.getAttribute("article");%>
					
					<div id="write_box">   
						<!-- 게시글 내용 -->                     
					    <h2><%out.print(article.getBoard_title());%></h2>
					    <div id="memberinfo">
							<div class="member_character" ><img  src="img/character/character1.png"></div>
							<p><%out.print(article.getMember_id());%></p>
							<p><%out.print(article.getBoard_date().substring(0, 19));%></p>  
						</div>							                  
						<div id="board_text"><%out.print(article.getBoard_text());%></div>   
						
						<form name="btns" method="post" action="commentWrite.bo?board_no=<%=article.getBoard_no()%>">
						<!-- 댓글 -->     
						<h2>Comment</h2>
						<div id="board_comment_add">
							<div class="member_character" ><img  src="img/character/character1.png"></div>
							<input type="text" name ="boardComment" /><%  %>
							<input type="submit" value="Comment"/>
						</div>
						<!-- 댓글 list -->
						<div id="boardComment_List">
							<%
							CommentListService svc = new CommentListService();
							List<Board_CommentDTO> list = svc.commentList(article.getBoard_no());
							if(list.size() > 0){
								for(int i = 0; i < list.size(); i++){
							%>
									<div class="boardComments">
										<div class="member_character" ><img  src="img/character/character1.png"></div> <!-- 이미지 -->
										<h5><%= list.get(i).getMember_id() %></h5><h5><%= list.get(i).getBc_date() %></h5>
										<% if(list.get(i).getMember_id().equals(member_id)){ %>
											<a href="commentDelete.bo?board_no=<%= list.get(i).getBoard_no() %>&member_id=<%= list.get(i).getMember_id() %>&bc_date=<%= list.get(i).getBc_date().substring(0, 19)%>">삭제</a>
											<a href="javacsript:void(0);" onclick="">수정</a>
										<% } %>
										
										<p><%= list.get(i).getBc_text() %></p>
										<input type='text' class="changeText" name="changeText<%= i %>" value="<%= list.get(i).getBc_text() %>" />
										<input type='button' name='changeBtn' value="수정" class='changeBtn'  onClick="location.href='commentUpdate.bo?board_no=<%= list.get(i).getBoard_no() %>&member_id=<%= list.get(i).getMember_id() %>&bc_date=<%= list.get(i).getBc_date()%>&bc_text='+ document.querySelector('input[name=changeText<%= i %>]').value; " />
									</div>
							<%} 
							}
							%>
							
							<script type="text/javascript">
								$(function(){
									var chlickCount = 1;
									$(".changeText").hide();
									$("input[name=changeBtn]").hide();		
									//a태그 수정 눌렀을때
									$('.boardComments > a:nth-child(5)').on('click', function(){
										var change = $(this).text();
										if(change == '수정'){
											//console.log('수정이다');
											$(this).parent().children('p').hide();										
											$(this).parent().children(".changeText").show();
											$(this).parent().children("input[name=changeBtn]").show();
											$(this).text('취소');											
										}else{
											//console.log('수정 아니다');
											$(this).parent().children('p').show();										
											$(this).parent().children(".changeText").hide();
											$(this).parent().children("input[name=changeBtn]").hide();
											$(this).text('수정');
										}																			
									})															
								})
							</script>
						</div>
					</div>					
					         
						<div class="button">	<!-- 버튼 -->
						<% int sitePage = 1;
							if(session.getAttribute("boardPageNum") != null){								
								sitePage = (Integer) session.getAttribute("boardPageNum");
							}
						%>
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
        	 		location.href='boardDelete.bo?board_num=<%=article.getBoard_no()%>'        	 	
        	 	}else{  
        	    	 return false;
        	 	}
        	}
        </script>
        </html>
        

        