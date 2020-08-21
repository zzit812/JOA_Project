<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="com.joalib.DAO.DonateDAO" %>
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
		
		#donate_text {
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
		#donate_text > img{
			text-align: center;
		    margin: 20px 0;
		    display: block;
		    width: 450px;
		}
		
		form > h2 {
			margin: 40px 0px 20px 0;
		    padding:0 0 10px 20px;
		    font-weight: 300;
		    opacity: 85%;
		    font-size: 18px;
		    border-bottom: solid 1px #8080803b;
		}
		#donate_comment_add {
			margin: auto;
		    width: 95%;
		    padding-bottom: 20px;
		}
		#donate_comment_add > input[type=text] {
			border: 1px solid #00000030;
			height: 40px;
		    width: 75%;
		    margin-left: 10px;
		    padding: 0 10px;
		}
		
		#donate_comment_add > input[type=submit] {
			margin: 0 10px;
		    height: 40px;
		    width: 10%;
		    border: 0px;
		    background-color: #FF9800;
		    border-radius: 15px;
		    float: right;
		}
		#donateComment_List {
			min-height: 10px;
			border-top: solid 1px #8080803b;
			padding-top : 20px;
		}
		.donateComments{
			padding: 2px 0;
			clear: both;
		}
		.donateComments > .member_character{
			width: 25px;
		    height: 25px;
		    overflow: hidden;
		    float: left;
		    margin:0 10px 0 5px;
		    border-radius: 80%;
		}		
		.donateComments > .member_character > img{
			width: 25px;
		}
		.donateComments > h5:nth-child(2), .donate_small_comment_list > h5{
    		display: inline-block;
		    margin:0 0 -20px 10px;
		    font-size: 15px;
		    font-weight: 500;
		    opacity: 90%;
		    
		}
		.donateComments > h5:nth-child(3), .donate_small_comment_list > h6{
			/*댓글 날짜*/
			display: inline-block;
		    margin: 0 0 0 20px;
		    font-weight: 400;
		    opacity: 60%;
		    font-size: 12px;
		    border-left: solid 1px gray;
    		padding-left: 8px;
		}
		.donateComments > a:nth-child(4), .donateComments > a:nth-child(5), .donateComments > a:nth-child(6), 
		.donate_small_comment_list a:nth-child(2),.donate_small_comment_list a:nth-child(3){
			float: right;
		    opacity: 70%;
		    font-size: 13px;
		    margin-right: 7px;
		    margin-top: -2px;
			
		}
		.donateComments > p {
			/*댓글 내용*/
			clear: both;
		    padding: 5px 10px;
		    font-size: 15px;
		    font-weight: 300;
		    margin: 5px 0;
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
		.donate_small_comment{
		    display: flex;
		    border-bottom: 1px solid rgba(0, 0, 0, 0.07);
		}
		.donate_small_comment > div{
		    float: left;
		    display: block;
		    width: 95%;
		    /* margin: 5px 0 10px 0; */
		    /* margin: 2px 0 0 auto; */
		    padding: 5px 0 10px 0;
		    /* border-bottom: 1px solid; */
		}
		.donate_small_comment > div > input[type=text]{
			min-height: 30px;
		    width: 85%;
		    border: 1px solid #00000030;		    
		    margin: 5px 0;
		}
		.donate_small_comment > div > h5 {
			margin: 0;
		    font-size: 13px;
		    font-weight: 400;
		    opacity: 90%;
		    padding-left : 5px;
		}
		.donate_small_comment > h5 {
			float: left;
		    width: 5%;
		    text-align: center;
		    font-size: 15px;
		    opacity: 35%;
		}
		.donate_small_comment > div > input[type=button]{
		    clear: both;
		    margin: 5px 15px;
		    width: 11%;
		    padding: 5px 0;
		}
		.donate_small_comment_list {
			width: 95%;
		    margin: 13px 0 15px auto;
		    padding: 5px 0 0 0;
		    /* box-shadow: -5px 5px 10px rgba(0,0,0,5%); */
		     border-radius: 10px; 
		    /* background-color: #5f9ea014; */
		    border: 1px solid #dcdcdc73;
		}
		.donate_small_comment_list > h5, .donate_small_comment_list > h6 {
		    float: left;
		}
		.donate_small_comment_list > p, .donate_small_comment_list > input[type=text] {
		    clear: both;
		    display: block;
		    margin: 7px 6px;
		    padding: 2px 15px;
		    font-size: 13px;
		    font-weight: 300;
		    width: 85%;
		    border: none;
		    display: inline-block;
		    background-color: #ffffff00;		    
		}
		.donate_small_comment_list > input[name=sc_changeBtn]{
			margin-left: 20px;
	    	width: 55px;
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
					<li><a href="book_search.jsp">자료검색</a>
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
			    <h1>중고도서 나눔</h1>
			    <div id="cont_1_size">
	
				<%
				int page_num = 1;
				if(request.getParameter("page_num") != null){
					page_num = Integer.parseInt(request.getParameter("page_num"));
				}
				int donate_no = Integer.parseInt(request.getParameter("donate_no"));
				DonateDAO dao = DonateDAO.getinstance();
				DonateDTO dto = dao.donatePostOneRead(donate_no);
				%>
					<div id="write_box">   
						<!-- 게시글 내용 -->                     
					    <h2><%= dto.getDonate_title() %></h2>
					    <div id="memberinfo">
							<div class="member_character" ><img  src="img/character/character1.png"></div>
							<p><%= dto.getMember_id() %></p>
							<p><%= dto.getDonate_date() %></p>  
						</div>							                  
						<div id="fault_text">
						<img src="<%= request.getContextPath() +"/donateImage/"+dto.getDonate_attach() %>" />
						<pre><%= dto.getDonate_text() %>	</pre>
						</div>   
						
						
						
					</div>
					<!-- 댓글 -->
					<form name="btns" method="post" action="donateCommentAdd.don?donate_no=<%= dto.getDonate_no() %>" 	><!-- 댓글쓰기 --> 
						<h2>Comment</h2>
						<div id="donate_comment_add">
							<div class="member_character" ><img  src="img/character/character1.png"></div>
							<input type="text" name ="dc_text" />
							<input type="hidden" name="member_id" value="<%= member_id %>" />
							<input type="submit" value="Comment"/>
						</div>
						<div id="donateComment_List">
							<%
							List<Donate_CommentDTO> list = dao.donateCommentList(donate_no);	//댓글
							
							if(list.size() > 0){
								for(int i = 0; i < list.size(); i++){
									int donate_comment_no = list.get(i).getDonate_comment_no();
									List<Donate_Small_CommentDTO> sc_dto = dao.donateSmallCommentList(donate_comment_no);	//대댓글
							%>
									<div class="donateComments">
										<div class="member_character" ><img  src="img/character/character1.png"></div> <!-- 이미지 -->
										<h5><%= list.get(i).getMember_id() %></h5>
										<h5><%= list.get(i).getDc_date().substring(0,19) %></h5>
										<% if(list.get(i).getMember_id().equals(member_id)){ %>
											<a href="donateCommentDel.don?donate_no=<%= donate_no%>&donate_comment_no=<%= donate_comment_no%>" onclick="<%if(sc_dto.size() > 0){//대댓글이 있으면 %>	alert('답글이 있으면 삭제 할 수 없습니다.'); return false;	<%}else{%>alert('삭제되었습니다.');<%}%>">삭제</a>
											<a href="javacsript:void(0);" onclick="">수정</a>											
										<% } if(member_id != null){%>
										<a href="javacsript:void(0);" class="s_comments">답글</a><%}%>
										<p><%= list.get(i).getDc_text() %></p>
										<input type='text' class="changeText" name="changeText<%= i %>" value="<%= list.get(i).getDc_text() %>" />
										<input type='button' name='changeBtn' value="수정" class='changeBtn'  onClick="location.href='commentUpdate.don?donate_commnet_no=<%= list.get(i).getDonate_comment_no()%>&donate_no=<%= list.get(i).getDonate_no()%>&dc_text='+ document.querySelector('input[name=changeText<%= i %>]').value;" />
										
										<!-- 답글 -->
										<div class="donate_small_comment">
											<h5>└</h5>
											<div>
												<h5><%= member_id %></h5>
												<input type='text' class="" name="smallComment<%= i %>" />
												<input type="button" name="" value="확인" onClick="location.href='smallCommentAdd.don?donate_no=<%= donate_no %>&donate_comment_no=<%= donate_comment_no%>&member_id=<%= member_id %>&dc_s_text='+ document.querySelector('input[name=smallComment<%= i %>]').value;" />
											</div>
										</div>
										<!-- 답글 list -->
										<%										
										if( sc_dto.size() > 0){
											for(int j = 0 ; j < sc_dto.size(); j++){ %>
												<div class="donate_small_comment_list">
													<h5><%= sc_dto.get(j).getMember_id()%></h5>
													<% if (sc_dto.get(j).getMember_id().equals(member_id)) {%>
														<a href="smallCommentDel.don?member_id=<%= sc_dto.get(j).getMember_id() %>&dc_s_date=<%= sc_dto.get(j).getDc_s_date()%>&donate_no=<%= donate_no %>">삭제</a><a href="javacsript:void(0);">수정</a>
													<%} else{	out.print("<a></a><a></a>");	}%>
													
													<h6><%= sc_dto.get(j).getDc_s_date().substring(0, 19) %></h6>
													<input type="text" name="sc_value" value="<%= sc_dto.get(j).getDc_s_text() %>" disabled="disabled" />
													<input type="hidden" name="member_id" value="<%= sc_dto.get(j).getMember_id() %>" />
													<input type="hidden" name="dc_s_date" value="<%= sc_dto.get(j).getDc_s_date()%>" />
													<input type="button" name="sc_changeBtn" value="수정" />
												</div>
										<%	}
										}%>
										
																		
									</div>
							<% } } %>
						</div>
						<script type="text/javascript">
								$(function(){
									var chlickCount = 1;
									$(".changeText").hide();
									$("input[name=changeBtn]").hide();
									$(".donate_small_comment").hide();
									$(".donate_small_comment_list > input[name=sc_changeBtn]").hide();
									
									//a태그 수정 눌렀을때
									$('.donateComments > a:nth-child(5)').on('click', function(){
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
									
									//a태그 답글 눌렀을때
									$('.s_comments').on('click', function(){
										var change = $(this).text();
										if(change == '답글'){	
											$(this).parent().children(".donate_small_comment").show();
											$(this).text('취소');											
										}else{									
											$(this).parent().children(".donate_small_comment").hide();
											$(this).text('답글');
										}																			
									})
									
									var sc_value = null ;
									$('.donate_small_comment_list a:nth-child(3)').on('click', function(){
										//console.log("aaa");
										var change = $(this).text();										
										if(change == '수정'){	
											sc_value = $(this).parent().children("input[name=sc_value]").val();
											$(this).parent().children("input[name=sc_value]").attr("disabled", false); //활성화
											$(this).parent().children("input[name=sc_value]").focus();
											$(this).parent().children("input[name=sc_value]").css('border','1px solid #00000030');
											$(this).parent().children("input[name=sc_changeBtn]").show();	//버튼 보여줌								
											$(this).text('취소');		//텍스트는 취소로 바뀜 
											//
											$(this).parent().children("input[name=sc_changeBtn]").on('click', function(){
												//버튼 누르면
												var member_id = document.querySelector('input[name=member_id]');
												var dc_s_date = document.querySelector('input[name=dc_s_date]');
												var dc_s_text = document.querySelector('input[name=sc_value]');												
												$.ajax({
													type : 'POST',
													url: 'smallCommentChange.don',	//접근 문서
													data: {'member_id':member_id.value, 'dc_s_date':dc_s_date.value , 'dc_s_text': dc_s_text.value },	//{String key:value} >이 값을 넘겨주겠습니다. > 리턴타입이라고 생각하면 된다.
													dataType : "json",	//접근 문서의 종류, 어떤 타입으로 보여줄거냐	//html, text, 		
													success: function(){	//성공을 하면 처리해야하는 작업
														sc_value = dc_s_text.value;	
													}							
												});
												$(this).parent().children("input[name=sc_value]").css('border','none');
												$(this).parent().children("input[name=sc_value]").attr("disabled", true); //비활성화
												$(this).parent().children(".donate_small_comment_list a:nth-child(3)").text('수정');
												$(this).hide();
												//버튼을 누르면~ 끝
											})											
										}else{
											$(this).parent().children("input[name=sc_value]").val(sc_value);
											$(this).parent().children("input[name=sc_value]").attr("disabled", true); //비활성화
											$(this).parent().children("input[name=sc_value]").css('border','none');
											//
											$(this).parent().children("input[name=sc_changeBtn]").hide();
											//
											$(this).text('수정');
										}
									})
								})
							</script>
						
						<div class="button">	<!-- 버튼 -->
						<% int sitePage = 1;
							if(session.getAttribute("boardPageNum") != null){								
								sitePage = (Integer) session.getAttribute("boardPageNum");
							}
						%>
						<input type="button" value = "목록" onClick="location.href='Donate_list.jsp?page_num=<%= page_num%>'"/>
						<%	
							if ( member_id != null && member_id.equals(dto.getMember_id())) { 
								request.setAttribute("article", dto.getMember_id());							
						%>
						<input type='button'  value = '수정' onClick="location.href='Donate_update.jsp?donate_no=<%= donate_no%>'"/>
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
        	 	if (confirm("정말 삭제하시겠습니까") == true){    //확인
        	 		alert("삭제되었습니다");
        	 		location.href='donatePostDelete.don?donate_no=<%= dto.getDonate_no()%>'
        	 	}else{  
        	    	 return false;
        	 	}
        	}
       		
        </script>
        </html>
        

        