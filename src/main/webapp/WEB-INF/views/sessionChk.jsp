<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="id" value="${sessionScope.member}"/>
	<c:set var="admin" value="${sessionScope.admin}"/>
	<c:if test="${empty id and empty admin}">
		<script type="text/javascript">
			alert("로그인 해주세요");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>