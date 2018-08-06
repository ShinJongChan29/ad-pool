<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		var chkId = 1;
		var chkPw = 1;
		var chkPw2 = 1;
		var chkName = 1;
		var chkAddress = 1;
		var chkEmail = 1;
	
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
	        	$.post('idChk', 'join_id=' + joinfrm.join_id.value, function(data) {
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
				joinfrm.join_password.focus();
				return false;
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
			$('#join_address').html("<br>");
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
	
</script>
</head>
<body>

	<div class="modal-header">
		<!-- 닫기(x) 버튼 -->
		<button type="button" class="close" data-dismiss="modal">×</button>
		<!-- header title -->
		<h4 class="modal-title">회원가입</h4>
	</div>
	<!-- body -->
	<div class="modal-body">
		<div style="text-align: left">
			<form action="join" method="post" id="joinfrm">

				<span>아이디</span> <input type="text" name="m_id" id="join_id"
					class="form-control"> 
					<span id="idChk" class="err"><br></span>
				<span>패스워드</span> <input type="password" name="m_password"
					id="join_password" class="form-control"> <span id="pwChk"
					class="err"><br></span> <span>패스워드확인</span> <input
					type="password" name="m_password2" id="join_password2"
					class="form-control"> <span id="pwChk2" class="err"><br></span>
				<span>이름</span> <input type="text" name="m_name" id="join_name"
					class="form-control"> <span id="nameChk" class="err"><br></span>
				<span>주소</span> <input type="text" name="m_address" id="join_address"
					class="form-control"> <span id="addressChk" class="err"><br></span>
				<%-- <div id="addressAPI">
				<%@include file="addressAPI.jsp" %>
			</div> --%>
				<span>이메일</span> <input type="text" name="m_email" id="join_email"
					class="form-control"> <span id="emailChk" class="err"><br></span>
				<span id="resultChk" class="err"><br></span>
				<button type="button" class="btn btn-primary" id="sub_btn">확인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</form>
		</div>
	</div>
	<!-- Footer -->
	<div class="modal-footer"></div>

</body>
</html>