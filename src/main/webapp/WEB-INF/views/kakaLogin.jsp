<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="tag.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	#img_center { 
	position:absolute; 
	top:50%; 
	left:45%; 
	width:300px; 
	height:200px; 
	overflow:hidden; 
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="img_center">
	<img width="50px" height="50px"src="${path}/image/login/loading.gif">
	</div>
	<script>
		location.href="https://kauth.kakao.com/oauth/authorize?client_id=6284d520cdab167d1de6430fa61fb836&redirect_uri=http://localhost/adpool/kakaoLogin&response_type=code";
	</script>
</body>
</html>