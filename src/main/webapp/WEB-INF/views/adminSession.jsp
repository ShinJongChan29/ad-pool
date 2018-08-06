<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="tag.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="id" value="${sessionScope.admin }"/>
	<c:if test="${empty id}">
		<script type="text/javascript">
			alert("접근 권한이 없습니다");
			location.href="main";
		</script>
	</c:if>
</body>
</html>