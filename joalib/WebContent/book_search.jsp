<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import = "com.joalib.board.action.dbAction" %>
<%@ page import="com.joalib.DAO.DAO" %>
<%@ page import="com.joalib.DTO.BoardDTO" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/aaa_booksearch.css">
<link rel="stylesheet" type="text/css" href="css/lib_top.css">
	<link rel="stylesheet" type="text/css" href="css/search.css">
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
					<li>HOME</li> | <li>로그아웃</li> | <li>포인트충전</li>
				</ul>
			</nav>
			<div class="clearF"></div>
			<!--탑메뉴-->
			<nav id="topMenuBorder">
				<ul id="top_menu">
					<li><a href="#">자료검색</a>
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
							<li><a href="">내가 쓴 글</a></li>
							<li><a href="">포인트</a></li>
							<li><a href="">정보 수정/ 탈퇴</a></li>
						</ul>
					</li>
				</ul>
				<d
				iv id="window_menu"></div>
			</nav>
		 </div>
		 <script src="js/lib_top.js"></script>
		 <script src="js/search.js"></script>
	 </header>



<section id="book_search_size">
<div class="search">
				<div id="search_title">도서검색</div>
				<div id="search_box">
					<!--검색어-->
					<div id="hbz-searchbox" action="/search" method="get">
						<select id="select_search">
							<option name="all">전체</option>
							<option>도서명</option>
							<option>저자</option>
							<option>출판사</option>
						</select>
						<input type="text" id="hbz-input" name="q" placeholder="Search..." />
						<input type="hidden" name="max-results" value="8" />
						<input id="hbz-submit" type="submit" value="Search" />
					</div>


				</div>
		  
				<div id="category_box">
					<!--카테고리검색-->
					<ul>
						<li><input type="checkbox" id="all"><label for="all">총류</label></li>
						<li><input type="checkbox" id="religion"><label for="religion">종교</label></li>
						<li><input type="checkbox" id="history"><label for="history">역사·지리·관광</label></li>
						<li><input type="checkbox" id="social_science"><label for="social_science">사회과학</label></li>
						<li><input type="checkbox" id="philosophy"><label for="philosophy">철학·심리학·윤리학</label></li>
						<li><input type="checkbox" id="descriptive_science"><label for="descriptive_science">기술과학</label></li>
						<li><input type="checkbox" id="art"><label for="art">예술</label></li>
						<li><input type="checkbox" id="pure_science"><label for="pure_science">순수과학</label></li>
						<li><input type="checkbox" id="literature"><label for="literature">문학</label></li>
						<li><input type="checkbox" id="language"><label for="language">어학</label></li>
					</ul>
					<!-- 검색바에 맞춰서 정렬할 것임 -->
			</div>
		</div>

<main class="page-content">

  <%
  for(int i=0; i<=11; i++){
  %>
  <div class="card">
    <div class="content">
      <h2 class="title"></h2>
      <span class="btn">관심도서</span>
      <span class="loan">대출가능</span>
    </div>
  </div>
  <%} %>
  
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
	  					  			ArrayList[] pageList = new ArrayList[totalPage];	//전체 페이지를 관리하는 배열 > ex) pageList(0) = 첫번째 페이지
	  					  			
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
			<!-- 페이징 -->
			<div class="pagination">
				<a href="#" class="prev"><i class="fa fa-angle-double-left"></i> Prev</a>
				<%		
			  	for (int iCount = startPage; iCount <= endPage; iCount++) {
			  	       out.print(" <a href='board.jsp?sitePage="+iCount+"' class='page-number'> "+iCount+ "</a>");	
			  	}
		  		%>
		  		<a href="#" class="next">Next <i class="fa fa-angle-double-right"></i></i></a>
			</div>
  </section>
  <footer>
		 <div id="footer_size">
			(변경해야함) Library | 04524 서울특별시 중구 세종대로 110 | 전화번호: 02)120, 2133-0300~1</br>
			이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00 /월요일,공휴일 휴관
		</div>
	 </footer>
  
  
  
  
</main>
</body>
</html>