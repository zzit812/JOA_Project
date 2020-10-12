<%@ page language="java" contentType="text/html; charset=UTF-8	"
	pageEncoding="UTF-8"%>
<%@ page import="com.joalib.DAO.*"%>
<%@ page import="com.joalib.DTO.*"%>
<%@ page import="com.joalib.board.svc.MyBoardViewService"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOA LIBRARY</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" type="text/css" href="css/lib_mypage_main.css">
<link rel="stylesheet" type="text/css" href="css/lib_top.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<style type="text/css">
#cont_size {
	/* */
	min-height: 800px;
}

#cont_size>h1 {
	font-size: 22.5px;
	/*margin: 0;*/
	padding: 0px 0 10px 30px;
	font-weight: 400;
	border-bottom: 1px solid #e6e6e6;
}

#memberNoChange {
	margin: 0 0 15px 0;
}

#memberNoChange h5:nth-child(1) {
	background-color: #00000014;
	display: inline-block;
	font-size: 20px;
	padding: 0 10px;
	opacity: 95%;
	font-weight: 500;
	margin: 0 5px 0 20px;
	height: 28px;
}

#memberNoChange h5:nth-child(2) {
	margin: 0;
	/* background-color: green; */
	display: inline-block;
	/* margin: 0 10px; */
	font-size: 12px;
	font-weight: 300;
	opacity: 70%;
}

#memberInfo {
	background-color: #c2e5f280;
	padding: 30px;
	border-radius: 20px;
}

#memberInfo>label {
	width: 80px;
	display: inline-block;
}

#adress {
	display: inline-table;
}

#memberInfo>input {
	margin: 10px 0;
}

#memberInfo>input[name=member_name], #memberInfo>input[name=member_birth]
	{
	width: 250px;
}

#memberInfo>select[name=member_tel1] {
	margin-right: 8px;
}

#memberInfo>input[name=member_tel2], #memberInfo>input[name=member_tel3]
	{
	width: 65px;
	margin: 0 8px;
}

#memberInfo>input[name=member_email_id] {
	width: 105px;
	margin-right: 5px;
}

#memberInfo>input[name=member_email_adress] {
	width: 125px;
	margin-left: 5px;
}

#memberInfo>#adress input[type=text]:nth-child(1) {
	margin-top: 10px;
	width: 255px;
}

#memberInfo>#adress>input[type=text] {
	margin: 2px 5px 2px 0;
	width: 355px;
}
</style>
</head>

<body>
	<%
	String member_id = (String)session.getAttribute("member_id"); 
	if(member_id == null){
%>
	<script type="text/javascript">
		alert("로그인 후 이용해주세요");
		location.href="userLogin.html";
		</script>
	<%
			}else{
		%>
	<header>

		<div id="top_size">
			<!--로고-->
			<img id="logo" src="img/icon_lib.png">
			<!--탑네비-->
			<nav>
				<ul id="top_nav">
					<li><a href='home.jsp'>HOME</a></li> |
					<li><a href="memberLogout.mem">로그아웃</a></li> |
					<li>포인트충전</li>
				</ul>
			</nav>
			<div class="clearF"></div>
			<!--탑메뉴-->
			<nav id="topMenuBorder">
				<ul id="top_menu">

					<li><a href="book_search.html">자료검색</a>
						<ul class="sub_menu">
							<li><a href="">도서 검색</a></li>
							<li><a href="">분야별 도서 조회</a></li>
						</ul></li>
					<li><a href="#">도서마당</a>
						<ul>
							<li><a href="">신착 도서</a></li>
							<li><a href="">베스트 셀러</a></li>
							<li><a href="">희망도서</a></li>
						</ul></li>
					<li><a href="#">이용안내</a>
						<ul>
							<li><a href="">시설안내</a></li>
							<li><a href="">자료 현황</a></li>
							<li><a href="">포인트</a></li>
							<li><a href="">도서 대여</a></li>
							<li><a href="">도서 예약</a></li>
						</ul></li>
					<li><a href="#">커뮤니티</a>
						<ul>
							<li><a href="">공지사항</a></li>
							<li><a href="">질문과 답변</a></li>
							<li><a href="board.jsp">자유게시판</a></li>
							<li><a href="Fault_list.jsp">불량도서 신고</a></li>
							<li><a href="Donate_list.jsp">중고도서 나눔</a></li>
						</ul></li>
					<li><a href="mypage_main.jsp">나의서재</a>
						<ul>
							<li><a href="mypage_main.jsp">나의 서재</a></li>
							<li><a href="">서비스 이용 내역</a></li>
							<li><a href="mypage_myPost.jsp">내가 쓴 글</a></li>
							<li><a href="">포인트</a></li>
							<li><a href="">정보 수정/ 탈퇴</a></li>
						</ul></li>
				</ul>
				<div id="window_menu"></div>
			</nav>
		</div>
		<script src="js/lib_top.js"></script>
		<div id="title">
			<p>나의 서재</p>
		</div>
	</header>

	<section id="side_size">

		<div id="sidemenu_size">
			<div id="profile_img">
				<img src="img/character/character1.png" />
			</div>
			<h1><%=session.getAttribute("member_id")%></h1>
			<nav>
				<ul id="sidmenu_box">
					<li><a href="">나의 서재</a></li>
					<li><a href="">서비스 이용 내역</a></li>
					<li><a href="mypage_myPost.jsp">내가 쓴 글</a></li>
					<li><a href="">정보수정</a></li>
				</ul>
			</nav>
		</div>

		<div id="cont_size">
			<%
				memberinfoDAO dao = memberinfoDAO.getinstance();
				memberinfoDTO dto = dao.memberinfoSelectAll(member_id);
				//변수지정 :  수정해야하는 정보
				String[] memberTelArray = new String[3];
				String[] memberAdressArray = new String[2];
				String[] memberE_mailArray = new String[2];
				memberTelArray= dto.getMember_tel().split("-");	//배열을 10으로 해놔도, length가 저장된 만큼 뜨니깐 배열의 빈곳을 걱정 안해도 되겠구나
				memberAdressArray = dto.getMember_adress().split("/", 2);
				memberE_mailArray = dto.getMember_email().split("@",2);
				//
			%>

			<h1>정보 수정</h1>


			<form name="memberinfo" action="memberinfoChange.mem">
				<div id="memberNoChange">
					<h5><%= dto.getMember_id() %></h5>
					<h5>
						( level.
						<%= dto.getMember_level() %>
						)
					</h5>
				</div>
				<div id="memberInfo">
					<label for="member_name">이름</label><input type="text"
						name="member_name" value="<%= dto.getMember_name() %>" /><br>
					<label for="member_tel1">전화번호</label> <select name="member_tel1">
						<optgroup label="Before">
							<option value="<%= memberTelArray[0] %>"><%= memberTelArray[0] %></option>
						</optgroup>
						<optgroup label="Choice">
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="012">012</option>
							<option value="013">013</option>
							<option value="014">014</option>
							<option value="015">015</option>
						</optgroup>
					</select> -<input type="text" name="member_tel2"
						value="<%= memberTelArray[1] %>" /> -<input type="text"
						name="member_tel3" value="<%= memberTelArray[2] %>" /><br> <label
						for="member_birth">생년월일</label><input type="date"
						name="member_birth" value="<%= dto.getMember_birth() %>" /><br>
					<label for="member_email_id">이메일</label><input type="text"
						name="member_email_id" value="<%= memberE_mailArray[0] %>" /> <input
						type="text" name="member_email_adress"
						value="<%= memberE_mailArray[1] %>" /> <select
						name="member_email_adress_select"
						onchange="emailAdress(memberinfo)">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="nate.com">nate.com</option>
					</select> <br> <label for="">주소</label>
					<div id="adress">
						<!-- member_adress : address + detailAddress -->
						<!-- member_city : city -->
						<input type="text" id="postcode" name="postcode"
							placeholder="우편번호" readonly="true"> <input type="button"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="address" name="address"
							value="<%= memberAdressArray[0] %>" readonly="true"><br>
						<%if(memberAdressArray.length == 1){ %>
						<input type="text" id="detailAddress" name="detailAddress"
							placeholder="상세주소" />
						<%}else{	%>
						<input type="text" id="detailAddress" name="detailAddress"
							value="<%= memberAdressArray[1] %>" />
						<%} %>
					</div>
					<br>
				</div>
				<input type="submit" value="전송" /><input type="button" value="회원탈퇴"
					onClick="location.href = 'mypage_memberDelete.jsp';" />
			</form>


			<!-- ===================================================================================================================== -->
			<script type="text/javascript">
			
			//선택한 이메일 주소값을 인풋텍스트에 보여주기
			function emailAdress(form){
				for(var i =0 ; i < form.member_email_adress_select.length; i++){
					if (form.member_email_adress_select.options[i].selected){ 
	 				form.member_email_adress.value = form.member_email_adress_select.options[i].value;
	 				//선택된 옵션에 해당하는 값을 text타입에 넣는다.
	 				if (i == 0) {
	 					form.member_email_adress.readOnly = false;	//첫번째배열값(:직접입력)엔 활성화
	 					form.member_email_adress.focus();
	 				}else{
	 					form.member_email_adress.readOnly = true;	//그외값엔 비활성화 시킨다.
	 				}
	 			}
				}
			}
			
			//주소찾기
		    function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                var addrCity = ''; // 시/도 변수
		                var addr = ''; // 주소 변수
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('postcode').value = data.zonecode;
		               // document.getElementById("city").value = data.sido;	//서울, 경기, ... 시/도만 표시됨
		                document.getElementById("address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("detailAddress").value = '';
		                document.getElementById("detailAddress").focus();
		            }
		        }).open();
		    }
			
			</script>
			<!-- ===================================================================================================================== -->

		</div>
	</section>

	<footer>
		<div id="foot_size">
			(변경) Library | 04524 서울특별시 중구 세종대로 110 | 전화번호: 02)120, 2133-0300~1</br>
			이용시간: 화~금 09:00~19:00 / 토,일 09:00~17:00 /월요일,공휴일 휴관
		</div>
	</footer>
	<!-- Favorite -->


	<% } %>
</body>

</html>