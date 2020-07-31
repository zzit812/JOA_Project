<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOA LIBRARY - HOME</title>

<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400&family=Poor+Story&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<style>
	* {
		font-family: 'Noto Sans KR', sans-serif;
		color: #191B26;
		
	}
	body {
		width: 1400px;
		margin: 25px auto;
		background-color: #F2F2F2;
	}
	#logo {
		height: 150px;
		margin: 10px auto;
	    display: block;
	    opacity: 1;
	}
	#top_menu > li {
		float: left;
		height: 35px;
	    display: block;
	    margin: 5px 20px;	    
	}
	#top_menu > li > a{
		/*대메뉴*/
		font-size: 25px;		
    	font-weight: 600;		
		margin: 0 44px;
		opacity: 90%;
	}
	#top_menu > li > ul {
	    width: 180px;
		height: 0;
		overflow: hidden;
		margin: 25px 0 0 0;
		padding: 0;
		position: absolute;
		transition: all 0.4s;
	}
	
	#top_menu > li > ul > li {
		clear: both;		
		font-size: 15px;
		text-align: center;
		padding: 15px 2px;
		display: block;
	}
	#top_menu > li > ul > li > a{
		/*소메뉴*/
		transition: all 0.2s;
		font-size: 18px;
		font-weight: 400;
    	opacity: 70%;
	}
	
	#top_menu > li > ul > li:hover > a{
		font-size: 25px;
		font-weight: 500;
		opacity: 90%;
	}
	#topRightMenu{
		float: right;
	}
	#topRightMenu > li {
		float: Left;
		display: block;
    	margin: 0px 20px;
    	padding: 10px 0;	
	}
	#topRightMenu > li > a{
		opacity: 60%;
		font-weight: 500;		
	}
	
	#menuWindow{
		width: 1370px;
	    height: 0px;
	    margin: auto;
	    position: absolute;
	    margin-left: 15px;
	    z-index: 2;
	    /* background-color: red; */
	    background-color: #ececec;
	    opacity: 90%;
	    overflow: hidden;
	    transition: all 0.5s;
	}
	
	#menuWindow > img{
		float: right;
	    width: 20%;
	    margin: 0 50px 0 0;
	}
		
	a {
		text-decoration: none;
	}
	#top_menu { 
		/*background: #f5f5f5;*/
		padding: 10px 0;
	    padding-left: 30px;
	    margin: 0;
	    border-radius: 25px;
	    /* box-shadow: 0px 10px 15px rgba(0,0,0,0%); */
	    /* 맨 앞으로 보내기 */
	    z-index: 3;
    	position: relative;
    	height: 45px;
    	transition: all 0.4s;
	}
	.menuHoverEvent {
		height: 22px;
    	margin: 19px 0 0 15px;
	    width: 0px;
	    position: absolute;
	    z-index: -1;
	    background-color: #ffd63b;
	    transition: all 0.6s;
	}
	
	.rightMenuHoverEvent{
		height: 45px;
	    margin: -10px 0 0 -10px;
	    border-radius: 100%;
	    /* margin-left: -7px; */
	    width: 45px;
	    position: absolute;
	    z-index: -1;
	    background-color: #dcdcdc;
	    transition: all 0.2s;
	}	
	
	#Point_1 {
		height: 220px;
	    
	}
	#str {
		/*  font-family: 'Poor Story', cursive; */
		/* font-family: 'Gaegu', cursive; */	
		margin: 0;
	    font-weight: 100;
	    font-size: 35px;
	    text-align: center;
	    padding-top: 130px;
	}
	#Point_2 {
		margin-top: 15vh;
		height: 600px;
    	background-color: #498C6D;
    	/* 화면 꽉 차기 하기 : 띠 */
    	width: 100%;
    	text-align: center;
	    position: absolute; 
	    left: 0; 	    
	}
	
	/* scroll */
	.scroll-icon {
		bottom: 50%;
		left: 50%;
		position: absolute;
		transform: translate( -50%,-50%);
		display: block;
	}
		
	.scrollIcon > h1 {
		display: block;
		color: #F2F2F2;
		margin: 0
	}
	
	.scrollIcon > img {
		width: 40px;
	    display: block;
	    margin: 0 auto 10px auto;
	    opacity: 80%;
	}
	
	.scrollIcon {
		/*background-color: red;*/
		margin-top: 130px;
	}
	
	/* wave	 */	
	@import url(//fonts.googleapis.com/css?family=Lato:300:400);
	
	.waves {
	  position:absolute;
	  width: 100%;
	  height:15vh;
	  left:0;
	  margin-bottom:-7px; /*Fix for safari gap*/
	  min-height:100px;
	  max-height:350px;
	}

	/* Animation */	
	.parallax > use {
	  animation: move-forever 25s cubic-bezier(.55,.5,.45,.5)     infinite;
	}
	.parallax > use:nth-child(1) {
	  animation-delay: -2s;
	  animation-duration: 7s;
	}
	.parallax > use:nth-child(2) {
	  animation-delay: -3s;
	  animation-duration: 10s;
	}
	.parallax > use:nth-child(3) {
	  animation-delay: -4s;
	  animation-duration: 13s;
	}
	.parallax > use:nth-child(4) {
	  animation-delay: -5s;
	  animation-duration: 20s;
	}
	@keyframes move-forever {
	  0% {
	   transform: translate3d(-90px,0,0);
	  }
	  100% { 
	    transform: translate3d(85px,0,0);
	  }
	}
	/*Shrinking for mobile
	@media (max-width: 768px) {	
	  .waves {
	    height:40px;
	    min-height:40px;
	  }
	  .content {
	    height:30vh;
	  }
	  h1 {
	    font-size:24px;
	  }
	}
	*/
	/*color : https://color.adobe.com/ko/trends/Interaction?page=10 */
	/* action : https://codepen.io/tonkec/pen/jWmgqN */
	
/*========================================================*/


	  
</style>
</head>
<body>
<!-- 
https://www.h-point.co.kr/cu/main/index.nhd 
https://codberg.com/
http://www.efusioni.com/2019/index.jsp
http://design.samsung.com/kr/index.html
https://www.hancomm.co.kr/index.do
-->

<header>
	<img id="logo" src="img/icon_lib_7.png" />
	<nav>
	
				<ul id="top_menu">			
					
					<li><div class="menuHoverEvent"></div><a href="book_search.html">자료검색</a>
						<ul class ="sub_menu">
							<li><a href="book_search.html">도서 검색</a></li>
							<li><a href="">분야별 도서 조회</a></li>
						</ul>
					</li>
					
					<li><div class="menuHoverEvent"></div><a href="#">도서마당</a>
						<ul>
							<li><a href="">신착 도서</a></li>
							<li><a href="">베스트 셀러</a></li>
							<li><a href="">희망도서</a></li>
						</ul>
					</li>
					
					<li><div class="menuHoverEvent"></div><a href="#">이용안내</a>
						<ul>
							<li><a href="">시설안내</a></li>
							<li><a href="">자료 현황</a></li>
							<li><a href="">포인트</a></li>
							<li><a href="">도서 대여</a></li>
							<li><a href="">도서 예약</a></li>
						</ul>
					</li>	
								
					<li><div class="menuHoverEvent"></div><a href="#">커뮤니티</a>
						<ul>
							<li><a href="">공지사항</a></li>
							<li><a href="">질문과 답변</a></li>
							<li><a href="board.jsp">자유게시판</a></li>
							<li><a href="">불량도서 신고</a></li>
							<li><a href="">중고도서 나눔</a></li>
						</ul>
					</li>
					
					<li><div class="menuHoverEvent"></div><a href="mypage_main.jsp">나의서재</a>
						<ul>
							<li><a href="mypage_main.jsp">나의 서재</a></li>
							<li><a href="">서비스 이용 내역</a></li>
							<li><a href="">내가 쓴 글</a></li>
							<li><a href="">포인트</a></li>
							<li><a href="">정보 수정/ 탈퇴</a></li>
						</ul>
					</li>	
					<ul id="topRightMenu">
					<%
						String member_id = null;
						String member_name = null;
						if((String)session.getAttribute("member_id") != null){
							//세션값이 있으면 
							member_id = (String)session.getAttribute("member_id");
							member_name = (String)session.getAttribute("member_name");
							out.print("<li id='loginClick'><div class='rightMenuHoverEvent'></div><a href='memberLogout.mem'>LOGOUT</a></li>");
						}else{
							out.print("<li id='loginClick'><div class='rightMenuHoverEvent'></div><a href='userLogin.html'>LOGIN</a></li>");
							out.print("<li><div class='rightMenuHoverEvent'></div><a href='userJoinRule.html'>JOIN US</a></li>");
						}
						
					%>
					</ul>				
				</ul>
				<div id="menuWindow"> <!-- <img src="img/topMenuImg.png" /> --> </div>
				
				
				<script type="text/javascript">
					$(function(){
						$('#top_menu > li').hover(function(){
							$(this).children('.menuHoverEvent').css("width","140px"),
							$('#top_menu').css('boxShadow','0px 15px 10px rgba(0,0,0,3%)'),
							$('#menuWindow').css('height','350px'),
							$('#top_menu > li > ul').css("height","300px");
						},function(){
							$(this).children('.menuHoverEvent').css("width","0px"),
							$('#top_menu').css('boxShadow','0px 10px 30px rgba(0,0,0,0%)'),
							$('#menuWindow').css('height','0px'),
							$('#top_menu > li > ul').css("height","0px");
						}),
						
						$('#topRightMenu > li').hover(function(){
							$(this).children('a').css("opacity","90%"),
							//$(this).children('a').css("fontWeight","500"),
							$(this).children('.rightMenuHoverEvent').css("backgroundColor","#63BF8B")
						},function(){
							$(this).children('a').css("opacity","60%"),
							//$(this).children('a').css("fontWeight","300"),
							$(this).children('.rightMenuHoverEvent').css("backgroundColor","#dcdcdc")
						})
					})

				</script>
			</nav>
	</header> 
	<section>
		<!-- 배너 -->
		<div id="Point_1">
			<div id="str"></div>
		</div>
		
		<!--Waves Container-->
		<div id = "wave">
		<svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
		viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
		<defs>
		<path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
		</defs>
		<g class="parallax">
		<use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(194, 229, 242, 0.3" />
		<use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(194, 229, 242, 0.5)" />
		<use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(194, 229, 242, 0.7)" />
		<use xlink:href="#gentle-wave" x="48" y="7" fill="#498C6D" />
		</g>
		</svg>
		<div id="Point_2">
		<!-- 스크롤 아이콘 -->
			<div class="scrollIcon">
				<img alt="" src="img/searchIcon.png"  />
				 <svg version="1.1" id="icn" fill="#F2F2F2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
					 width="40px" height="60px" viewBox="0 0 40 40" enable-background="new 0 0 40 40" xml:space="preserve">
				    <polygon opacity="0" points="19.9,21 0,1.3 1.4,0 19.9,18.3 38.6,0 40,1.3 "><animate id="first" attributeName="opacity" attributeType="XML" dur="2s" from="1" to="0" repeatCount="indefinite"  begin="0.5s"/></polygon>
				    <polygon id="arrow-two" opacity="0"  points="19.9,30.9 0,11.2 1.4,9.9 19.9,28.2 38.6,9.8 40,11.2 "><animate id="second" attributeName="opacity" attributeType="XML" dur="2s" from="1" to="0" repeatCount="indefinite"  begin="1s" /></polygon>
				    <polygon id="arrow-three"  opacity="0" points="19.9,40 0,20.3 1.4,19 19.9,37.3 38.6,19 40,20.3 "><animate id="third" attributeName="opacity" attributeType="XML" dur="2s" from="1" to="0" repeatCount="indefinite"  begin="1.5s"  /></polygon>
				 </svg>
		 		 <!-- <h1>Search Book</h1> -->
		 		 
	 		 </div>
		</div>
		</div>
		<!--Waves end-->
		
		
		
		
		
		
	</section>
	<footer></footer>

</body>

	<script type="text/javascript">
	
		//타이핑 애니메이션
		var string = "Hello, JOA";
		<% if(member_id != null){ %>
			string = "<%= member_name %>님, 반갑습니다!";
		<%} %>
		
		var str = string.split("");	//split : 문자를 자르는 메서드, ""으로 되어있으니 한글자 한글자씩 자름
		var el = document.getElementById('str');		
		(function animate() {	//애니메이션
			str.length > 0 ? el.innerHTML += str.shift() : clearTimeout(running); 
			var running = setTimeout(animate, 80);	//커질수록 느려짐	
		}
		
		)();
		

		
	</script>

</html>


