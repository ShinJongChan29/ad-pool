<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function adspage(pageNum){
		alert(pageNum);
		$.post('mainAdsList', 
				{
				pageNum: pageNum+"", 
				keyword: keyword.value
				},function(data) {
			//$('#adminView').html(data);
					fadeVIew(data);
		});
	}
</script>
<body>
	<h2>AdsList</h2>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<div class="navbar-form navbar-left">
		</div>
		<div class="navbar-form navbar-right">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search"
					id="keyword" name="keyword" value="${keyword}">
			</div>
			<button type="button" onclick="adspage('${pageNum}')"
				class="btn btn-default">Ads검색</button>
		</div>
	</div>
	<table class="table table-bordered table-hover">
		<tr>
			<th>No</th>
			<th>How</th>
			<th>Subject</th>
			<th><a onclick="review('name')">Name</a></th>
			<th><a onclick="review('category')">Category</a></th>
			<th><a onclick="review('kind')">Kind</a></th>
			<th><a onclick="review('good')">GOOD</a></th>
			<th><a onclick="review('view')">View</a></th>
			<!-- 	<th>주소</th>
			<th>이메일</th>
			<th>가입날짜</th>
			<th>IP</th> !-->
		</tr>
		<c:forEach var="aList" items="${aList}">
			<tr>
				<td>${aList.a_no}</td>
				<c:if test="${aList.a_filename=='0'}">
					<td>URL</td>
				</c:if>
				<c:if test="${aList.a_url=='0'}">
					<td>FILE</td>
				</c:if>
				<td><a onclick="adsDetail('${aList.a_no}')">${aList.a_subject}</a></td>
				<td>${aList.a_name}</td>
				<td>${aList.a_category}</td>
				<td>${aList.a_kind}</td>
				<td>${aList.a_goodcount}</td>
				<td>${aList.a_viewcount}</td>
			</tr>




		</c:forEach>
	</table>
	<!--   <div style="align:center">
						<ul class="pagination">
						<c:forEach  begin="0" end="${totalPagenum}" varStatus="i">
							<li><a onclick="pagen(${i.index+1},'${para}')">${i.index+1}</a></li>
						</c:forEach>
					
						</ul>
					</div> -->

	<div align="center">
		<ul class="pagination">
			<c:if test="${pb.startPage > pb.pagePerBlock}">
				<!-- 맨 처음페이지로 가기 -->
				<li><a onclick="page(1)"><span
						class="glyphicon glyphicon-step-backward"></span></a></li>
				<!-- 이전 페이지로 가기 -->
				<li><a onclick="page(${pb.startPage-1})"><span
						class="glyphicon glyphicon-chevron-left"></span></a></li>
			</c:if>
			<!-- 페이지 리스트 -->
			<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
				<c:if test="${i!=pb.currentPage}">
					<%-- <li><a
										href="latest?pageNum=${i}&search=${board.search}&keyword=${board.keyword}">${i}</a></li> --%>
					<li><a onclick="adspage('${i}')">${i}</a></li>
				</c:if>
				<c:if test="${i==pb.currentPage}">
					<li class="active"><a onclick="adspage('${i}')">${i}</a></li>
				</c:if>
			</c:forEach>
			<!-- 다음 페이지로 가기 -->
			<c:if test="${pb.totalPage > pb.endPage}">
				<li><a onclick="adspage('${pb.endPage+1}')"><span
						class="glyphicon glyphicon-chevron-right"></span></a></li>
			</c:if>
			<!-- 맨 마지막 페이지로 가기 -->
			<c:if test="${pb.endPage>pb.totalPage}">
				<li><a onclick="adspage('${pb.totalPage}')"><span
						class="glyphicon glyphicon-step-forward"></span></a>
			</c:if>
		</ul>
	</div>


</body>
</html>