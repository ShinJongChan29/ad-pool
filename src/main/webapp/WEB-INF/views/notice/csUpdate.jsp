<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="../sessionChk.jsp" %> --%>
<%@ include file="../main_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("수정성공 ! 대박");
		location.href="noticeList?ncategory=${ncategory}&pageNum=${pageNum}";
	</script>
</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("실패, 돌아가시오");
		history.go(-1);
	</script>
</c:if>
</body>
</html>