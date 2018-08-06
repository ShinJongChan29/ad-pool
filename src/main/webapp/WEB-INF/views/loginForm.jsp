<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
/* .center1 {
	text-align: center;
} */
</style>
<script type="text/javascript">
	$(function() {
		$('.modal-body').keypress(function(event){
			if(event.keyCode==13)
				loginAction();
		});
		$('#btn_submit').on('click', function() {
			
			loginAction();
		});
		function loginAction(){
			alert("aa");
			$.ajax({
				type : "POST",
				url : "login",
				async : false,
				data : {
					m_id : frm.m_id.value,
					m_password : frm.m_password.value
				},
				//	dataType : "json",
				//	cache : false,
				success : function(data) {

					$('#result_span').html(data + "<br>");
					if (data == "1") {
						alert("로그인??");
						history.go(-1);
					}
					console.log("1");
				},
				error : function(data) {
					alert("실패" + data);
					console.log("2");
					return false;
				}
			});
		}
	})
</script>
<body>

 <div class="modal fade" id="loginFormView" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLongTitle" aria-hidden="true">
      <div class="modal-dialog" role="document" style="width: 40%">
         <div class="modal-content">
	<div class="modal-header">
		<!-- 닫기(x) 버튼 -->
		<button type="button" class="close" data-dismiss="modal">×</button>
		<!-- header title -->
		<h4 class="modal-title">Login</h4>
	</div>
	<!-- body -->
	<div class="modal-body">
		<form action="login" method="post" id="frm">
			<span>아이디</span> <span><input type="text" name="m_id"
				id="m_id" class="form-control" autofocus="autofocus"></span> <span>패스워드</span>
			<span><input type="password" name="m_password" id="m_password"
				class="form-control" autofocus="autofocus"></span> <span
				id="result_span" class="err"><br></span>
			<button type="button" class="btn btn-primary" id="btn_submit">로그인</button>
			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>

		</form>
	</div>
	</div>
	</div>
	</div>
	
	<!-- Footer -->
</body>
</html>