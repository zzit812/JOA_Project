<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@page import="com.joalib.board.action.*" %>
<%@page import="com.joalib.DAO.*" %>
<%@page import="com.joalib.DTO.*" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- 캘린더 -->
	
	<link rel="stylesheet" type="text/css" href="css/lib_top.css">
	<link rel="stylesheet" type="text/css" href="css/board_base.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
	<style>
		.commentCount{
			display: inline;
		    margin: 0 0 0 20px;
		    font-weight: 300;
		    font-size: 13px;
		    opacity: 75%;
		}
	</style>
	
	
</head>
<body>
	
	 <header>
	 <%
	 	String idCheckImpart = null;
	 %>
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
		  	<div id="board_con">
		
	  		<form>
		  		<input type="button" value="글쓰기" id="write_button" onclick="newPostBtn()"/>
			</form>	
		  	
		  		<ul>
		  			<li>게시번호</li><li>제목</li><li>회원</li><li>글쓴날짜</li><li>조회수</li>
		  		</ul>
		  		<div>
			  		<%
			  			DAO dao = new DAO();
			  			  		
	  				  	int sitePage =1 ;	//현재페이지 //초기 페이지 = 1
	  				  	if(request.getParameter("sitePage") != null){
	  				  		sitePage = Integer.parseInt(request.getParameter("sitePage"));
	  				  	}
	  				  	session.setAttribute("boardPageNum",sitePage);
	  				  	
	  				  	int countList = 10;	//한페이지당 보여지는 게시글 최대 갯수 
	  				  	int countPage = 10;	//한화면에 보여지는 페이지 최대 갯수
	  				  	int totalCount = dao.select_board_total();	//게시물 총 갯수			  	
	  				  	
	  				  	int totalPage = totalCount / countList;	//페이지 갯수
	  				  	
	  				  	if (totalCount % countList > 0) {
	  				  	    //	'전체게시글 수 / 게시글 최대 갯수' 의 나머지가 0보다 크면 페이지갯수를 플러스한다.
	  				  		totalPage++; }
	  				
	  				  	if (totalPage < sitePage) {
	  				  		sitePage = totalPage;  	} 
	  				
	  				  	int startPage = ((sitePage - 1) / 10) * 10 + 1;	//보여지는 시작 페이지
	  					
	  				  	int endPage = 1;	//보여지는 마지막 페이지
	  				  	if(totalPage < countPage){
	  				  		endPage = totalPage  ;	//만약 총게시글 페이지가 최대갯수보다 작으면 endPage = totalPage;
	  				  	}else{
	  				  		endPage = startPage + countPage - 1;
	  				  	}
			  		%>				  	
		  			<%
		  				// 페이지당 게시물을 담는다.
			  			// array 에 게시물을 담고, 배열에는 페이지를 담았다.	
			  			
			  			int count = 0; 
			  			List<BoardDTO> list = dao.select_board_all();
			  			ArrayList<BoardDTO> array;							//array 하나당 하나의 페이지 > ex) array(0).get > = 페이지의 첫번째 게시물
			  			ArrayList[] pageList = new ArrayList[totalPage];//전체 페이지를 관리하는 배열 > ex) pageList(0) = 첫번째 페이지
			  			
			  			   //게시물총수 한페이지당게시물수
			  			if(totalCount % countList == 0 ){
			  				//나눈값이 0이다.
			  				for(int x = 0; x < totalPage; x++ ){
			  					              //페이지 갯수
			  					array = new ArrayList<BoardDTO>();
			  					for(int y = 0 ; y < countList; y++){		  						
		  					array.add(list.get(count));
		  					//count 0에서 시작함. countList가 10이니까, 그만큼
		  					count++;
		  					//이게 계속올라가면서 페이지갯수까지 오르는거임
			  					}
			  					pageList[x] = array;
			  					//x가 페이지갯수만큼 돔. array에 게시글 10개를 담아놈.
			  					
			  				}
			  			}else{
			  				//나눈값이 0이 아니다.
			  				for(int x = 0; x < (totalPage-1); x++ ){
			  					
			  					
			  					array = new ArrayList<BoardDTO>();
			  					//마지막 페이지 전까지 어레이에 담는다.		  					
			  					for(int y = 0 ; y < countList; y++){		  						
		  					array.add(list.get(count));
		  					count++;
			  					}
			  					pageList[x] = array;
			  				}		  	
			  				
			  				array = new ArrayList<BoardDTO>();
			  				for(int lastCount = count ; lastCount < totalCount ; lastCount++){		  					
			  					array.add(list.get(lastCount));		  					
			  				}
			  				pageList[totalPage-1] = array;
			  			}
					%>
		  		
		  			<%
		  			for(int i = 0 ; i < pageList[sitePage-1].size() ; i++){
			  				ArrayList<BoardDTO> dtoArray = pageList[sitePage-1];
		  			%>
		  			<ul>
			  			<li><%=dtoArray.get(i).getBoard_no()%></li>
			  			<li>
				  			<a  href='boardReadPage.bo?board_num=<%=dtoArray.get(i).getBoard_no() %>' onClick=" <% dao.hitUp(dtoArray.get(i).getBoard_no()); %> " >
				  			<%=dtoArray.get(i).getBoard_title() %>
				  			<% 
				  			int commentCount = dao.CommnetCount(dtoArray.get(i).getBoard_no());
				  			if( commentCount > 0){
				  				out.print("<p class='commentCount'> ["+commentCount+"] </p>");
				  			}
				  			out.print("</a>");
				  			%>
			  			</li>
			  			<li><%=dtoArray.get(i).getMember_id() %></li>
			  			<li><%= dtoArray.get(i).getBoard_date().substring(0, 10)%></li>
			  			<li><%=dtoArray.get(i).getBoard_hit()%></li>
		  			</ul>
		  			<%} %>

		  		</div>
		  		
		  		
		  	</div>
		  	<div id="pageNumber">
		  	<%		
			  	for (int iCount = startPage; iCount <= endPage; iCount++) {
	
			  	    if (iCount == sitePage) {
			  	       out.print(" <a href='board.jsp?sitePage= "+iCount+" ' style = 'color:#9C27B0; font-weight: 600;' >"+iCount+"</a>");
			  	       
			  	       //<a href ='board.jsp?sitePage= 2' ></a>
			  	    } else {
			  	        out.print(" <a href='board.jsp?sitePage=" + iCount + "'>"+iCount+"</a>");
			  	    }		
			  	}
		  	
		  	%>
		  	</div>
		</div>
		
	 </section>

	 <footer>
		<div id="foot_size">
			(변경) Library | 04524 서울특별시 중구 세종대로 110 | 전화번호: 02)120, 2133-0300~1</br>
			이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00 /월요일,공휴일 휴관
		</div>
	 </footer><!-- Favorite -->
	 <script type="text/javascript">
	 
			function newPostBtn(){
				<% 
			  	request.setCharacterEncoding("UTF-8");
				if ( member_id != null) {
					//로그인이 되어있음
					out.print("location.href='board_write.jsp'");
				}else{
					//로그인이 안됨
					out.print("alert('로그인 후 이용가능합니다.');location.href='userLogin.html'");
				}
		  		%>
				
			}
		</script>
</body>
</html>