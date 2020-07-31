
		//중복확인 버튼 이벤트
		var sameBtnCheck = 0;

		$(function(){
			$('input[name=member_id_check]').click(function(){
				var checkhide = document.querySelectorAll('.checkhide');
				var checkMesseage = document.querySelector('#idCheck');	
				var member_id = document.querySelector('input[name=member_id]');
				sameBtnCheck = 0;
				//값이 null일때
				if(member_id.value.length < 1 ){
					alert("아이디를 입력해주세요");
					member_id.focus();
				}else if(member_id.value.length < 5 || member_id.value.length > 10){
					member_id.focus();
					checkhide[0].style.opacity = '80%';
					checkhide[0].style.color = 'red';
					$('#idCheck').text("");
				}else{
					//아이디 값이 null이 아닐때								
					checkhide[0].style.color = '#41414f';
					checkhide[0].style.opacity = '55%';
					// checkMesseage.style.display = 'block';
					$('#idCheck').text("");
					$.ajax({
						url: 'join_Id_db.jsp',	//접근 문서
						data: {'id':member_id.value},	//{String key:value} >이 값을 넘겨주겠습니다. > 리턴타입이라고 생각하면 된다.
						dataType: 'html',	//접근 문서의 종류, 어떤 타입으로 보여줄거냐	//html, text, 		
						success: function(req){	//성공을 하면 처리해야하는 작업
							$('#idCheck').append(req);
							sameBtnCheck = 1;
						}								
					});
				}
		  	})
		  })		

		//공백체크
		function nullCheck(){
			var member_id = document.querySelector('input[name=member_id]');
			var member_pw = document.querySelector('input[name=member_pw]');
			var member_pw_check = document.querySelector('input[name=member_pw_check]');
			var member_name = document.querySelector('input[name=member_name]');
			var member_tel2 = document.querySelector('input[name=member_tel2]');
			var member_tel3 = document.querySelector('input[name=member_tel3]');
			var member_email_id = document.querySelector('input[name=member_email_id]');
			var member_email_adress = document.querySelector('input[name=member_email_adress]');
			var member_birth = document.querySelector('input[name=member_birth]');
			var postcode = document.querySelector('input[name=postcode]');
			var favoite_books = document.querySelectorAll('input[name=favoite_books]');
			var checkhide = document.querySelectorAll('.checkhide');	//안내 메세지
			var samecheck = document.querySelector('#samecheck');
			
			if(sameBtnCheck == 1 ){
				//아이디 비밀번호 자릿수 확인
				if (member_id.value.length < 4 || member_id.value.length > 11) {
					member_id.focus();
					checkhide[0].style.opacity = '80%';
					checkhide[0].style.color = 'red';
					checkhide[1].style.color = '#41414f';
					checkhide[1].style.opacity = '55%';
				}else if (member_pw.value.length < 7 || member_pw.value.length > 21){
					member_pw.focus();
					checkhide[1].style.opacity = '80%';
					checkhide[1].style.color = 'red';
					checkhide[0].style.color = '#41414f';
					checkhide[0].style.opacity = '55%';
				}else if(member_pw.value != member_pw_check.value ){
					member_pw_check.focus();
					samecheck.style.color = '#316210';
					samecheck.style.opacity = '80%';
				}
				// 나머지 null 체크
				else if (member_name.value.length < 1){
					alert("이름을 입력해주세요.");
					member_name.focus();
				}else if(member_tel2.value.length < 1 || member_tel3.value.length < 1 ){
					alert("전화번호를 입력해주세요.");
					member_tel2.focus();
				} else if (member_email_id.value.length < 1 || member_email_adress.value.length < 1){
					alert("이메일을 입력해주세요.");
					member_email_id.focus();
				}else if(postcode.value.length < 1){
					alert("주소를 입력해주세요.");
					postcode.focus();
				}else if( $("input[name=favoite_books]:checked").length < 1){
					alert("관심분야를 1 - 3개 이내로 선택해주세요.");
				}else {
					checkhide[0].style.opacity = '55%';
					checkhide[0].style.color = '#41414f';
					checkhide[1].style.opacity = '55%';
					checkhide[1].style.color = '#41414f';
					samecheck.style.opacity = '0%';
						//next 버튼 눌렀을때 효과				
				    	$('#join1').css("height", "0px"),
				    	$('#join2').css("height", "700px"),
				    	$('#sidemenuBlook > div').css("top", "-175px"),
				    	window.scroll({ top: 0, left: 0, behavior: 'smooth' });
					    //prev 버튼 눌렀을때 효과
					    $("input[name=prev]").on("click", function(){ 
					    	$('#join1').css("height", "950px"),
					    	$('#join2').css("height", "0px"),
					    	$('#sidemenuBlook > div').css("top", "-100px")
					    });
				}
			}else if(sameBtnCheck == 0){
				alert("중복 체크를 확인해주세요.");
			}

			
		}


		//생년월일
		var today = new Date();
		var yyyy = today.getFullYear();	//올해 년도

		todayMax = (yyyy-13)+'-'+12+'-'+31;
		document.getElementById("member_birth").setAttribute("max", todayMax);	// 오늘 날짜 이전의 값만 선택된다.



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
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
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
	                document.getElementById("city").value = data.sido;	//서울, 경기, ... 시/도만 표시됨
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	            }
	        }).open();
	    }


    

