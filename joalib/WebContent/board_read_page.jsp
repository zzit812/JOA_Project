<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="com.joalib.DAO.DAO" %>
<%@ page import="com.joalib.DAO.DonateDAO" %>
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
		.boardComments > a:nth-child(4), .boardComments > a:nth-child(5), .boardComments > a:nth-child(6){
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
		
		
		
		<!-- -->
		.board_small_comment_list > h6{
			/*댓글 날짜*/
			display: inline-block;
		    margin: 0 0 0 20px;
		    font-weight: 400;
		    opacity: 60%;
		    font-size: 12px;
		    border-left: solid 1px gray;
    		padding-left: 8px;
		}
		
		.board_small_comment_list a:nth-child(2),.board_small_comment_list a:nth-child(3){
			float: right;
		    opacity: 70%;
		    font-size: 13px;
		    margin-right: 7px;
		    margin-top: -2px;
			
		}
		
		.board_small_comment{
		    display: flex;
		    border-bottom: 1px solid rgba(0, 0, 0, 0.07);
		}
		.board_small_comment > div{
		    float: left;
		    display: block;
		    width: 95%;
		    /* margin: 5px 0 10px 0; */
		    /* margin: 2px 0 0 auto; */
		    padding: 5px 0 10px 0;
		    /* border-bottom: 1px solid; */
		}
		.board_small_comment > div > input[type=text]{
			min-height: 30px;
		    width: 85%;
		    border: 1px solid #00000030;		    
		    margin: 5px 0;
		}
		.board_small_comment > div > h5 {
			margin: 0;
		    font-size: 13px;
		    font-weight: 400;
		    opacity: 90%;
		    padding-left : 5px;
		}
		.board_small_comment > h5 {
			float: left;
		    width: 5%;
		    text-align: center;
		    font-size: 15px;
		    opacity: 35%;
		}
		.board_small_comment > div > input[type=button]{
		    clear: both;
		    margin: 5px 10px;
		    width: 11%;
		    padding: 5px 0;
		}
		.board_small_comment_list {
			width: 95%;
		    margin: 13px 0 15px auto;
		    padding: 5px 0 0 0;
		    /* box-shadow: -5px 5px 10px rgba(0,0,0,5%); */
		     border-radius: 10px; 
		    /* background-color: #5f9ea014; */
		    border: 1px solid #dcdcdc73;
		}
		.board_small_comment_list > h5, .board_small_comment_list > h6 {
			padding: 2px 10px;
		    float: left;
		    margin: 0px;
		}
		.board_small_comment_list > p, .board_small_comment_list > input[type=text] {
		    clear: both;
		    display: block;
		    margin: 7px 2px;
		    padding: 2px 5px;
		    font-size: 13px;
		    font-weight: 300;
		    width: 80%;
		    border: none;
		    display: inline-block;
		    background-color: #ffffff00;		    
		}
		.board_small_comment_list > input[name=sc_changeBtn]{
			margin-left: 20px;
	    	width: 55px;
		}
		#donate_text  img {
			width: 70%;
		}
		
		input[name=dealChange]{
			margin: 22px 0;
		    margin-right: 30px;
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
							<input type="text" name ="boardComment" />
							<input type="hidden" name="boardWriter" value="<%= article.getMember_id()%>" />
							<input type="submit" value="Comment"/>
						</div>
						<!-- 댓글 list -->
						<div id="boardComment_List">
							<%
							CommentListService svc = new CommentListService();
							List<Board_CommentDTO> list = svc.commentList(article.getBoard_no());
							if(list.size() > 0){
								for(int i = 0; i < list.size(); i++){
									int board_comment_no = list.get(i).getBoard_comment_no();
							%>
							<div class="boardComments" id=<%= board_comment_no%>>
								<div class="member_character" ><img  src="img/character/character1.png"></div> <!-- 이미지 -->
								<h5><%= list.get(i).getMember_id() %></h5><h5><%= list.get(i).getBc_date() %></h5>
								<% if(list.get(i).getMember_id().equals(member_id)){ %>
									<a href="javascript:void(0);" class= "commentDelBtn">삭제</a>
									<a href="javascript:void(0);" onclick="" id="change" class="commentChangeBtn">수정</a>
								<% } %>
								<a href="javascript:void(0);" onclick="" class="s_comments">답글</a>
								<p><%= list.get(i).getBc_text() %></p>
								<input type="hidden" name="commentNum" value="<%= board_comment_no%>" />
								<input type='text' class="changeText" name="changeText<%= i %>" value="<%= list.get(i).getBc_text() %>" />
								<input type='button' name='changeBtn' value="수정" class='changeBtn'  onClick="commentChangeBtn(<%= i %>,'<%= member_id %>','<%= list.get(i).getBc_date() %>',<%= article.getBoard_no() %>)" />
							
								<!-- 답글 -->
								<div class="board_small_comment">
									<h5>└</h5>
									<div>
										<h5><%= member_id %></h5>
										<input type='text' class="" name="smallComment<%= i %>" />
										<input type="button" name="" value="확인" onClick="location.href='smallCommentAdd.bo?boardCommentWriter=<%= list.get(i).getMember_id() %>&member_id=<%= member_id %>&board_comment_no=<%= list.get(i).getBoard_comment_no() %>&board_no=<%= list.get(i).getBoard_no() %>&bc_s_text='+ document.querySelector('input[name=smallComment<%= i %>]').value;" />
									</div>
								</div>
								<!-- 답글 리스트 -->
								<%
								DAO dao = DAO.getinstance();
								List<Board_Small_CommentDTO> sc_dto = dao.boardSmallCommentList(board_comment_no);
								if( sc_dto.size() > 0){
									for(int j = 0 ; j < sc_dto.size(); j++){
										String scNum = sc_dto.get(j).getBoard_comment_no()+"_"+ j;  %>
										<div class="board_small_comment_list" id="<%= scNum%>">
											<h5><%= sc_dto.get(j).getMember_id()%></h5>
											<% if (sc_dto.get(j).getMember_id().equals(member_id)) {%>
												<a href="javascript:void(0);" onClick="">삭제</a><a href=" javascript:void(0); ">수정</a>
											<%} else{	out.print("<a></a><a></a>");	}%>
											
											<h6><%= sc_dto.get(j).getBc_s_date().substring(0, 19) %></h6>
											<input type="text" name="sc_value" value="<%= sc_dto.get(j).getBc_s_text() %>" disabled="disabled" />
											<input type="hidden" name="scNum" value="<%= scNum%>" />
											<input type="hidden" name="bc_s_date" value="<%= sc_dto.get(j).getBc_s_date()%>" />
											<input type="button" name="sc_changeBtn" value="수정" />
										</div>
								<%	}
								}
								
								%>
								
								
							</div>
							
							<%} 
							}
							%>
							
							<script type="text/javascript">
								//댓글 수정
								function commentChangeBtn(commentNo, member_id, bc_date, board_no){
									var commnet = "changeText"+commentNo;	// ex : changeText0 ...
									var bc_text = document.querySelector('input[name='+commnet+']').value;	//수정한 텍스트
									//console.log(commnet_text+", "+comment_data+", "+boardNo);
									$.ajax({
										type : 'POST',
										url: 'commentUpdate.bo',	//접근 문서
										data: {'member_id':member_id, 'bc_date':bc_date , 'bc_text': bc_text, 'board_no': board_no },	//{String key:value} >이 값을 넘겨주겠습니다. > 리턴타입이라고 생각하면 된다.
										dataType : "json",	//접근 문서의 종류, 어떤 타입으로 보여줄거냐	//html, text, 		
										success: $(function(){	//성공을 하면 처리해야하는 작업
											var p = $('input[name='+commnet+']').parent().children('p');	
											p.show();
											p.text(bc_text);
											$('input[name='+commnet+']').parent().children(".changeText").hide();
											$('input[name='+commnet+']').parent().children("input[name=changeBtn]").hide();
											$('input[name='+commnet+']').parent().children('a:nth-child(5)').text('수정');
											
										})					
									});
								}
							
								$(function(){
									//댓글 삭제
									$('.commentDelBtn').on('click', function(){
										var member_id = $(this).parent().children('h5:nth-child(2)').text();
										var bc_date = $(this).parent().children('h5:nth-child(3)').text();
										var commentNum = $(this).parent().children('input[name=commentNum]').val();
										var result = confirm("답글까지 전부 삭제 삭제됩니다. 정말로 삭제하시겠습니까?");
										if(result){
											//alert(commentNum);
											$.ajax({
												type : 'POST',
												url: 'commentDelete.bo',	//접근 문서
												data: {'member_id':member_id, 'bc_date':bc_date, 'board_comment_no':commentNum },	//{String key:value} >이 값을 넘겨주겠습니다. > 리턴타입이라고 생각하면 된다.
												dataType : "json",	//접근 문서의 종류, 어떤 타입으로 보여줄거냐	//html, text, 		
												success: $(function(data){
													$('#'+commentNum).html(data);
													$('#'+commentNum).remove();
													return false;
												})
											});
										}
									})
									
									//댓글 > '답글' 눌렀을때
									$(".board_small_comment").hide();
									$('.s_comments').on('click', function(){
										var change = $(this).text();
										if(change == '답글'){	
											$(this).parent().children(".board_small_comment").show();
											$(this).text('취소');	
										}else{									
											$(this).parent().children(".board_small_comment").hide();
											$(this).text('답글');
										}																			
									})
									
									$(".changeText").hide();
									$("input[name=changeBtn]").hide();		
									//댓글 > '수정' 눌렀을때
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
									// 대댓글 수정
									var sc_value = null ;
									$(".board_small_comment_list > input[name=sc_changeBtn]").hide();
									$('.board_small_comment_list > a:nth-child(3)').on('click', function(){
										var change = $(this).text();										
										if(change == '수정'){
											sc_value = $(this).parent().children("input[name=sc_value]").val();
											$(this).parent().children(".board_small_comment_list > input[name=sc_changeBtn]").show();
											$(this).parent().children("input[name=sc_value]").attr("disabled", false); //활성화
											$(this).parent().children("input[name=sc_value]").focus();
											$(this).parent().children("input[name=sc_value]").css('border','1px solid #00000030');
											$(this).text('취소');		//텍스트는 취소로 바뀜 
											//
											$(this).parent().children("input[name=sc_changeBtn]").on('click', function(){
												//버튼 누르면
												var member_id = $(this).parent().children('h5').text();
												var bc_s_date = $(this).parent().children('input[name=bc_s_date]').val();
												var bc_s_text = $(this).parent().children('input[name=sc_value]').val();												
												$.ajax({
													type : 'POST',
													url: 'smallCommentChange.bo',	//접근 문서
													data: {'member_id':member_id, 'bc_s_date':bc_s_date , 'bc_s_text': bc_s_text },	//{String key:value} >이 값을 넘겨주겠습니다. > 리턴타입이라고 생각하면 된다.
													dataType : "json",	//접근 문서의 종류, 어떤 타입으로 보여줄거냐	//html, text, 		
													success: function(){	//성공을 하면 처리해야하는 작업
														sc_value = bc_s_text.value;	
													}							
												});
												$(this).parent().children("input[name=sc_value]").css('border','none');
												$(this).parent().children("input[name=sc_value]").attr("disabled", true); //비활성화
												$(this).parent().children(".board_small_comment_list a:nth-child(3)").text('수정');
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
									
									//	대댓글 삭제
									$('.board_small_comment_list > a:nth-child(2)').on('click', function(){
										var result = confirm("답글을 정말로 삭제할까요??");
										if(result){
											/* alert("ok"); */
											var member_id = $(this).parent().children('h5').text();
											var bc_s_date = $(this).parent().children('input[name=bc_s_date]').val();
											var scNum = $(this).parent().children('input[name=scNum]').val();
											$.ajax({
												type : 'POST',
												url: 'smallCommentDel.bo',	//접근 문서
												data: {'member_id':member_id, 'bc_s_date':bc_s_date },	//{String key:value} >이 값을 넘겨주겠습니다. > 리턴타입이라고 생각하면 된다.
												dataType : "json",	//접근 문서의 종류, 어떤 타입으로 보여줄거냐	//html, text, 		
												success: $(function(data){
													$('#'+scNum).html(data);
													$('#'+scNum).remove();
													return false;
												})
											});
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
        

        