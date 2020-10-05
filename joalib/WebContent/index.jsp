<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">

<style type="text/css">

	* {
	    color: #171b37;
	    font-family: 'Gothic A1', sans-serif;
	    font-family: 'Roboto', sans-serif;
	    padding: 0; margin: 0;
	    letter-spacing: -1px;
	}
	body{
	    background-color: #f9f9f9;
	}
	nav{
		clear: both;
	    width: 98%;
    	margin: auto;
	}
	a {
	    text-decoration: none;
	}
	#logo_joa{
		height: 60px;
	    margin: 25px auto 0 auto;
	    display: block;
	}
	header > div{
		float: right;
		margin-right: 25px;
	}
	header > div > div{
		display: inline-block;
	}
	header > div > div >  a{
	    text-decoration: none;
	    font-size: 15px;
	    margin: 0px 10px;
	    color: rgb(23 27 55 / 0.3);
        font-weight: 300;
        z-index: 1;
    	position: relative;
    	transition: all 0.2s;
	}
	.clickCircle {
		background-color: #fdde55;
	    width: 30px;
	    height: 30px;
	    display: inline-block;
	    left: 35px;
	    top: 8px;
	    position: relative;
	    border-radius: 100%;
	    margin-left: -30px;
	    opacity: 0;
	    transition: all 0.2s;
	}
	#MainMenu{
		 border-bottom: 1.5px solid rgb(23 27 55 / 0.25);
		 height: 44px;
		 transition: all 0.4s;
		 position: absolute;
		 width: 98%;
    	margin: 0 auto;
	}
	#MainMenu > ul{
		display: inline-block;
    	margin: 15px 30px 0 30px;
    	width: 95%;
    	height: 30px;
    	transition: all 0.2s;
    	
	}
	#MainMenu > ul > li {
		float: left;
	    /* background-color: #1176ce; */
	    display: block;
	    width: 20%;
	    height: 100%;
	    text-align: center;
	    transition: all 0.2s;
	}
	#MainMenu > ul > li > a{
		opacity: 30%;
	}
	#MainMenu > ul > li > a > span{
		font-size: 17px;
	    display: inline-block;
	    font-weight: 400;
	    overflow: hidden;
	    width: 0%;
	    /* margin-left: 5px; */
	    top: 1px;
	    position: relative;
	    transition: all 0.4s;
	}
	#MainMenu > ul > li > a > img{
	    width: 7%;
	}
	#mainMenuSub{
		overflow: hidden;
	    width: 100%;
	    height: 300px;
	    position: absolute;
	    z-index: 4;
	    transition: all 0.4s;
	}
	#MainMenu > ul > li > ul {
		overflow: hidden;
    	/* display: none; */
    	margin-top: 10px;
    	height: 0px;
    	transition: all 0.4s;
	}
	#MainMenu > ul > li > ul > li{    
	    font-family: 'Gothic A1', sans-serif;
	    letter-spacing: -3px;
	    display: block;
	    padding: 10px 0;
	    opacity: 30%;
	    font-size: 19px;
	    font-weight: 400;
	    transition: all 0.2s;
	}
	#MainMenu > ul > li > ul > li:first-child{
		margin-top: 20px;
	}
	section{
    	width: 1280px;
	    height: 800px;
	    border-bottom: 1px solid;
	    margin: auto;
	}
	#searchBar{
		display: none;
		opacity: 0;
		width: 60%;
		height: 45px;
	    margin: 70px auto 0 auto;
	    border: 2.5px solid #ffde55;
	    border-radius: 12px;
	    transition: all 0.4s;
	}
	#searchBar > input[type=text]{
	    letter-spacing: -2px;
		float: left;
	    width: 91%;
	    height: 100%;
	    font-size: 20px;
	    padding-left: 15px;
	    border: 0px;
	    background-color: #ffffff00;
	    opacity: 75%;
	}
	#searchBar > input[type=image]{
		width: 30px;
	    display: inline-block;
	    clear: both;
	    margin: auto;
	    padding-top: 8px;	
	    opacity: 0.7;
    	margin-right: 10px;
	}
	#searchBar2 {
		position: relative;
    	top: 350px;
		width: 80%;
	    margin: auto;
	    border: 2px solid rgb(23 27 55 / 0.3);
	    border-radius: 10px;
	}
	#searchBar2 > input[type=text]{
	    letter-spacing: -2px;
		display: inline-block;
	    height: 45px;
	    width: 90%;
	    border: none;
	    background-color: #ffffff00;
	    margin: 5px 0;
	    padding-left: 25px;
	    font-size: 22px;
	    opacity: 75%;
	}
	#searchBar2 > input[type=image]{
		width: 40px;
	    position: absolute;
	    margin: 8px 15px;
	    opacity: 65%;
	}
	.smallMenuSize{
		width: 1750px;
		overflow: hidden;
		height: 300px;
		position: absolute;
    	left: 0;
	}
	#myPageMenu{
		background-color: red;
	    width: 100%;
	    height: 250px;
	}
	#loginForm {
		display: none;
	    margin: 20px auto;
	    width: 570px;
	    /* box-shadow: 15px 10px 10px rgba(0,0,0,5%); */
	    box-shadow: 0px 0px 10px rgba(0,0,0,0%);
	    border-radius: 20px;
	    padding: 25px 70px;	
	    transition: all 0.4s;
	    opacity: 0;
	}
	#loginForm > div {
		width: 80%;
	    display: inline-block;
	    margin: 0;
	}
	#loginForm > div > input[type=text], 
	#loginForm > div > input[type=password]{
		display: block;
	    width: 85%;
	    height: 35px;
	    margin: 10px auto;
	    padding-left: 10px;
	    font-size: 20px;
	    opacity: 75%;
	    font-weight: 300;
	}
	#loginForm > input[type=button]{
		display: inline;
	    width: 110px;
	    height: 80px;
	    position: relative;
	    top: -20px;
	    border-radius: 25%;
	    font-size: 30px;
	    background-color: rgb(23 27 55 / 40%);
	    color: white;
	    font-weight: 500;
	    opacity: 80%;
	    border: 0px;
	    transition: all 0.4s;
	}
	#loginForm > a{
		opacity: 30%;
	    margin-left: 15px;
	    font-size: 18px;
	    font-weight: 500;
	}
	#menuMyInfo {
		opacity: 0;
		display: none;
	}
	#menuMyInfo > div{
		display: inline-block;
		width: 45%;
	    margin-left: 50px;
	    padding: 20px 0;
	    /* background-color: aqua; */
	}
	#menuMyInfo > div > #menuMyInfoImg{
		margin-left: 15%;
		display: inline-block;
	    overflow: hidden;
	    border-radius: 100%;
	    width: 150px;
	    height: 150px;
	    border: 2px solid rgb(23 27 55 / 45%);
	}
	#menuMyInfo > div > #menuMyInfoImg > img {
		width: 100%;
	}
	#menuMyInfo > div > #menuMyInfoDiv{
		display: inline-block;
	    position: relative;
	    top: -15px;
   		margin-left: 30px;
	}
	#menuMyInfo > div > #menuMyInfoDiv > h1{
		font-weight: 500;
    	font-size: 50px;
    	margin-top: -10px;
    	opacity: 80%;
	}
	#menuMyInfo > div > #menuMyInfoDiv > h3{
	    margin-top: 27px;
	    font-weight: 300;
	    opacity: 80%;
	    display: inline-block;
	    font-size: 22px;
	    background-color: #ffde55;
	    padding: 0 5px;
	}
	#menuMyInfo > div > #menuMyInfoDiv> a{
		font-size: 20px;
	    font-weight: 600;
	    opacity: 40%;
	    margin-left: 80px;
	    font-size: 15px;
	}
	#menuMyInfo > div > #menuMyInfoDiv > h5{
		font-weight: 300;
	    font-size: 20px;
	    margin: 0;
	    opacity: 30%;
	}
	#menuMyInfo > div > #menuMyAlarm{
	    max-height: 200px;
	    width: 100%;
	    /* background-color: aqua; */
	    padding: 10px 5px;
	    overflow: auto;
	}
	#menuMyInfo > div:last-child{
		position: absolute;
	}
	#menuMyInfo > div > h3{
	    font-size: 20px;
	    font-weight: 400;
	    opacity: 70%;
	    padding-left: 10px;
	    border-bottom: 4px solid #ffde55;
	    
	}
	#menuMyAlarm > p  {
		margin: 3px 0;
	}
	#menuMyAlarm > p > a:nth-child(1){
		margin-right: 10px;
	}
	#menuMyAlarm > p > a:nth-child(2){
		font-size: 17px;
	    opacity: 70%;
	}
	
	#loginForm:hover{	box-shadow: 15px 10px 10px rgba(0,0,0,5%);	}
	#loginForm > input[name=menu_loginBtn]:hover{	background-color: rgb(23 27 55 / 85%);	}
	#loginForm > a:hover {	text-decoration: underline;	opacity: 50%;	}
	#MainMenu > ul > li:hover > a > span {	width: 90px;	}
	
	input:focus { outline: none; }
	
</style>

</head>
<body>
	<form action="">
	<header>
		<img alt="JOA Library" src="img/Logo_1.png" id="logo_joa"/>
		
		<div>
			<%
			String member_id = null;
			String member_name = null;
			if((String)session.getAttribute("member_id") != null){//세션값이 있으면 
				member_id = (String)session.getAttribute("member_id");
				member_name = (String)session.getAttribute("member_name");%>
			<div><span class="clickCircle"></span><a href='memberLogout.mem'>LOGOUT</a></div>
			<%}else{	//세션값이 없으면%>
			<div><span class="clickCircle"></span><a href='userLogin.html'>LOGIN</a></div>
			<div><span class="clickCircle"></span><a href='userJoinRule.html'>JOIN</a></div>
			<%}%>
		</div>
		<nav>
			<div id="MainMenu">
			<ul>
				<li><a href="#"><img alt="Search_icon" src="img/icon_search.png" /><span>Search</span></a></li>
				<li><a href="#"><img alt="Books_icon" src="img/icon_book.png" /><span>Books</span></a>
					<ul>
						<li><a href="#" >신착도서</a></li>
						<li><a href="#" >베스트셀러</a></li>
						<li><a href="#" >희망도서 신청</a></li>
					</ul>
				</li>
				<li><a href="#"><img alt="Guidance_icon" src="img/icon_guide.png" /><span>Guidance</span></a>
					<ul>
						<li><a href="#" >도서관 안내</a></li>
						<li><a href="#" >도서 대여 및 예약</a></li>
						<li><a href="#" >질문과 답변</a></li>
						<li><a href="#" >멤버 가이드</a></li>
					</ul>
				</li>
				<li><a href="#"><img alt="Community_icon" src="img/icon_community.png" /><span>Community</span></a>
					<ul>
						<li><a href="#" >공지사항</a></li>
						<li><a href="#" >자유게시판</a></li>
						<li><a href="#" >불량 도서 신고</a></li>
						<li><a href="#" >중고 도서 나눔</a></li>
					</ul>
				</li>
				<li><a href="#"><img alt="Mypage_icon" src="img/icon_my.png" /><span>MyPage</span></a></li>
			</ul>
			
			<div id="mainMenuSub">
			
				<div id="searchBar">
					<input type="text" placeholder="도서를 검색하세요! ヾ(´｡••｡`)ﾉ"  />
					<input type="image" src="img/icon_search.png" alt="searchingBtn">
				</div>
			<%if(member_id == null){%>
				<div id="loginForm">
						<div ><input type="text" placeholder="ID"	/><input type="password" placeholder="PASSWORD"	/></div>
						<input type="button" name="menu_loginBtn" value="LOGIN" />
						<a href="#">회원이 아니신가요?</a>
				</div>
			<% }else{ %>
				<div id="menuMyInfo">
					<div>
						<div id="menuMyInfoImg"><img alt="프로필" src="img/icon_search.png"></div>
						<div id="menuMyInfoDiv">
							<h5>level 1</h5>
							<h1>userid</h1>
							<h3>1000 P</h3>
							<a>포인트 내역</a>
						</div>
					</div>
					<div>
						<h3>알림</h3>
						<div id="menuMyAlarm">
							<p><a>X</a><a>알림 뭐가 떴어</a></p>
							<p><a>X</a><a>알림 뭐가 떴어</a></p>
						</div>
					</div>
				</div>
				<%} %>
			</div>
			</div>
			
			
		</nav>
	</header>
	
	
	
	<section>
		<!-- 검색바 -->
		<article id="searchBar2">
			<input type="text" placeholder="찾으시는 도서를 검색하세요!	:-)"  />
			<input type="image" src="img/icon_search.png" alt="searchingBtn">
		</article>
	</section>
	
	<section>
		<article></article>
		<article></article>
	</section>
	
	<section>
	</section>
	
	</form>
	<footer>
	</footer>
</body>
<script type="text/javascript">
	 $(function(){
		 $('header > div > div > a').hover(function(){
			 $(this).css("fontWeight","400"),
			 $(this).css("fontSize","17px"),
			 $(this).css("color","rgb(23 27 55 / 0.6)"),
			 $(this).parent().children('span').css("opacity","1");
		 },function(){
			 $(this).css("fontWeight","300"),
			 $(this).css("fontSize","15px"),
			 $(this).css("color","rgb(23 27 55 / 0.3)"),
			 $(this).parent().children('span').css("opacity","0");
		 });
		 $('#MainMenu > ul>li:last-child').hover(function(){
			 $('#searchBar').css("display","none"),
			 $('#loginForm').css("display","block"),
			 $('#menuMyInfo').css("display","block"),
			 $('#mainMenuSub').css("height","245px"),
			 $('#mainMenuSub > #menuMyInfo').css("opacity","1");
			 $('#mainMenuSub > #loginForm').css("opacity","1");
		 },function(){
			 $('#mainMenuSub').css("height","0px"),
			 $('#mainMenuSub > #loginForm').css("opacity","0");
			 $('#mainMenuSub > #menuMyInfo').css("opacity","0");
		 });
		 
		$('#MainMenu').hover(function(){
			$(this).css("height","300px");
		},function(){
			$(this).css("height","44px");
		});
		$('#MainMenu > ul>li:first-child').hover(function(){
			//$(this).css("backgroundColor","red");
			$('#loginForm').css("display","none"),
			$('#menuMyInfo').css("display","none"),
			$('#searchBar').css("display","block");
			$('#mainMenuSub').css("height","245px"),
			$('#mainMenuSub > #searchBar').css("opacity","1");
		},function(){
			$('#mainMenuSub').css("height","0px");
			$('#mainMenuSub > #searchBar').css("opacity","0");
		});
		$('#mainMenuSub').hover(function(){
			$(this).css("height","245px");
			$(this).children('div').css("opacity","1");
		},function(){
			$(this).css("height","0px");
			$(this).children('div').css("opacity","0");
		});
		
		
		$('#MainMenu > ul > li').hover(function(){
			$(this).children('a').css("opacity","75%"),
			$(this).children('ul').css("height","250px");
		},function(){
			$(this).children('a').css("opacity","30%"),
			$(this).children('ul').css("height","0px");
		}); 
		
		$('#MainMenu ul li ul li').hover(function(){
			$(this).css("opacity","80%"),
			$(this).css("fontSize","23px"),
			$(this).css("fontWeight","600");
		},function(){
			$(this).css("opacity","30%"),
			$(this).css("fontSize","19px"),
			$(this).css("fontWeight","400");
		});
		 
	}) 
</script>
</html>
