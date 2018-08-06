$(function() {
		$('.modal-body').keypress(function(event){
			if(event.keyCode==13)
				loginAction();
		});
		$('#btn_submit').on('click', function() {
			loginAction();
		});
		function loginAction(){
			$.ajax({
				type : "POST",
				url : "login",
				async : false,
				data : {
					m_id : loginfrm.m_id.value,
					m_password : loginfrm.m_password.value
				},
				//	dataType : "json",
				//	cache : false,
				success : function(data) {
					
					if (data == "1") {
						alert("로그인성공");
						location.reload();
					}
					$('#result_span').html(data+"<br>");
					console.log("1");
				},
				error : function(data) {
					alert("실패" + data);
					console.log("2");
					return false;
				}
			});
		}
		
		var chkId = 1;
		var chkPw = 1;
		var chkPw2 = 1;
		var chkName = 1;
		var chkAddress = 1;
		var chkEmail = 1;
		var chkPhone2 = 1;
		var chkPhone3 = 1;
	
		$('#join_id').bind("blur", function() {
			if (!joinfrm.join_id.value) {
				$('#idChk').html("아이디를 입력하세요<br>");
				joinfrm.join_id.focus();
				return false;
			}else if(joinfrm.join_id.value.length < 3 || joinfrm.join_id.value.length > 12 ){
				$('#idChk').html("아이디는 3글자 이상 12글자 이하입니다<br>");
				joinfrm.join_id.focus();
				return false;
			}else if(joinfrm.join_id.value.indexOf(" ") >= 0) {
	            $('#idChk').html("아이디에 공백을 사용할 수 없습니다<br>");
	            joinfrm.join_id.focus();
	            return false;
	        }else{
	        	$.post('idChk', 'm_id=' + joinfrm.join_id.value, function(data) {
	        		var str = data;
	        		if(str == "1"){
	        			$('#idChk').html("중복된 아이디입니다<br>");
	        		}else{
						$('#idChk').html("사용가능한 아이디입니다<br>");
						chkId = 0;
	        		} 
				});
	        	
	        }
			
		});
		$('#join_password').bind("blur",function(){
			if(!joinfrm.join_password.value){
				$('#pwChk').html("비밀번호를 입력하세요<br>");
				/*joinfrm.join_password.focus();
				return false;*/
			}else if(joinfrm.join_password.value.length<6 || joinfrm.join_password.value.length >12){
				$('#pwChk').html("비밀번호는 6글자 이상 12글자 이하입니다<br>");
				joinfrm.join_password.focus();
				return false;
			}else {
				$('#pwChk').html("<br>");
				chkPw = 0;
			}
		});
		$('#join_password2').bind("blur",function(){
			if(joinfrm.join_password.value != joinfrm.join_password2.value){
				$('#pwChk2').html("비밀번호와 비밀번호확인이 틀립니다<br>");
			}else{ 
				$('#pwChk2').html("<br>");
				chkPw2 = 0;
			}
		});
		$('.join_phone').bind("blur",function(){
			var regex= /[^0-9]/g;
			if(joinfrm.join_phone2.value.match(regex)||joinfrm.join_phone3.value.match(regex)){
				$('#phoneChk').html("번호만 입력해주세요 <br>");
			}else if(joinfrm.join_phone2.value.length<3||joinfrm.join_phone3.value.length<4){
				$('#phoneChk').html("정확한 번호를 입력해주세요 <br>");
			}
			else{ 
				$('#phoneChk').html("<br>");
				chkPhone2 = 0;
			}
		});
	
		$('#join_name').bind("blur",function(){
			var reg_name = /[0-9]/;
			if(joinfrm.join_name.value.length<2 || joinfrm.join_name.value.length>6){
				$('#nameChk').html("이름은 2글자이상 6글자 이하입니다<br>");
			}else if(joinfrm.join_name.value.match(reg_name)){
				$('#nameChk').html("숫자는 사용할 수 없습니다<br>");
			}else {
				$('#nameChk').html("<br>");
				chkName = 0;
			}
		});
		$('#join_email').bind("blur",function(){
			var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!joinfrm.join_email.value.match(regEmail)){
				$('#emailChk').html("이메일을 형식에 맞춰서 입력하세요<br>");
			}else {
				$('#emailChk').html("<br>");
				chkEmail = 0;
			}
		});
		$('#join_address').bind("blur",function(){
			if(!joinfrm.join_address.value){
				$('#addressChk').html("주소를 입력하세요<br>");
			}else{
			$('#addressChk').html("<br>");
			chkAddress = 0;
			}
		});
	
	$('#sub_btn').click(function(){
		var chkRe = chkId + chkPw + chkPw2 + chkName + chkAddress +  chkEmail;
		if(chkRe>0){
			$('#resultChk').html("다시 입력하세요<br>");
			return false;
		}else{
			alert("가입 성공");
			joinfrm.submit();
		}
		
	});
	})
	