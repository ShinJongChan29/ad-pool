<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tag.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	function adcompage(pageNum){
		$.post('mainAdsList', 
				{
				pageNum: pageNum+"", 
				divi:divi.value
				},function(data) {
			$('#adminView').html(data);
		});
	}
</script>
<body>
	<h2>Competition List</h2>
		<button onclick="adcomList('0')" class="btn btn-primary">all</button>
		<button onclick="adcomList('2')" class="btn btn-danger">disagree</button>
		<button onclick="adcomList('3')"class="btn btn-success" >agree</button>
		<input type="hidden" name="divi" id="divi" value="${divi}">
			<table class="table table-bordered table-hover">
				<tr>
					<th width="10%">번호</th>
					<th width="20%">제목</th>
					<th width="15%">작성자</th>
					<th width="15%">URL/FileUpload</th>
					<th width="15%">카테고리</th>
					<th width="15%">종류</th>
					<th width="15%">등급</th>
				</tr>
				<c:forEach var="aList" items="${aList}" varStatus="i">
					<tr>
						<td>${aList.a_no}</td>
						<td><a  onclick ="adsDetail('${aList.a_no}')">${aList.a_subject}</a></td>
						<td>${aList.a_name}</td>
						<c:if test="${aList.a_filename=='0'}">
							<td>URL</td>
						</c:if>
						<c:if test="${aList.a_url=='0'}">
							<td>FILE</td>
						</c:if>
						<td>${aList.a_category}</td>
						<td>${aList.a_kind}</td>
						<td>${aList.a_grade}</td>
					</tr>
				</c:forEach>
			</table>
			<div align="center">
		<ul class="pagination">
			<c:if test="${pb.startPage > pb.pagePerBlock}">
				<!-- 맨 처음페이지로 가기 -->
				<li><a onclick="adcompage(1)"><span
						class="glyphicon glyphicon-step-backward"></span></a></li>
				<!-- 이전 페이지로 가기 -->
				<li><a onclick="adcompage(${pb.startPage-1})"><span
						class="glyphicon glyphicon-chevron-left"></span></a></li>
			</c:if>
			<!-- 페이지 리스트 -->
			<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
				<c:if test="${i!=pb.currentPage}">
				</c:if>
				<c:if test="${i==pb.currentPage}">
					<li class="active"><a onclick="adspage('${i}')">${i}</a></li>
				</c:if>
			</c:forEach>
			<!-- 다음 페이지로 가기 -->
			<c:if test="${pb.totalPage > pb.endPage}">
				<li><a onclick="adcompage('${pb.endPage+1}')"><span
						class="glyphicon glyphicon-chevron-right"></span></a></li>
			</c:if>
			<!-- 맨 마지막 페이지로 가기 -->
			<c:if test="${pb.endPage>pb.totalPage}">
				<li><a onclick="adcompage('${pb.totalPage}')"><span
						class="glyphicon glyphicon-step-forward"></span></a>
			</c:if>
		</ul>
	</div>
</body>
</html>