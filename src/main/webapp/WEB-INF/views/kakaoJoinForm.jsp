<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="main_header.jsp"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<div class="container">
			<h2>KAKAO 추가 입력사항</h2>
				<form action="kakaoJoin" id="frm_kakao">
					<table class="table table-bordered table-hover">
						<tr>
							<td>패스워드</td>
							<td><input type="password" name="kakao_password" autofocus="autofocus" class="form-control" required="required"></td>
						</tr>
						<tr>
							<td>Email</td>
							<td><input type="email" name="kakao_email" required="required" class="form-control"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="kakao_address"class="form-control" required="required" autofocus="autofocus"></td>
						</tr>
					</table>
						<button onclick="javascript:frm_kakao.sumbit()"class="btn btn-primary">가입</button>
						<button onclick=""class="btn btn-danger">취소</button>
				</form>			
		</div>
	</div>
</body>
</html>