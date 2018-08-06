<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function mempage(pageNum){
		$.post('memberList', 
				{
				pageNum: pageNum, 
				am_keyword: am_keyword.value
				},function(data) {
		
			//$('#adminView').html(data);
					fadeVIew(data);
		});
	}
	function adSarchMember(){
		var param= am_keyword.value;
		alert(param);
		$.post('memberList','am_keyword='+param,function(data){
			//$('#adminView').html(data);
			fadeVIew(data);
		});
	}
	</script>

</head>
<body>
	<h2>memberList</h2>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<div class="navbar-form navbar-left">
		<button class="btn btn-primary" onclick="">탈퇴회원</button>
		</div>
		<div class="navbar-form navbar-right">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search"
					id="am_keyword" name="am_keyword" value="${keyword}">
			</div>
			<button type="button" onclick="adSarchMember()"
				class="btn btn-default">회원검색</button>
		</div>
	</div>

	<table class="table table-bordered table-hover">
		<tr>
			<th width="15%">번호</th>
			<th width="15%">아이디</th>
			<th width="15%">이름</th>
			<th width="15%">휴대폰번호</th>
			<th width="10%">삭제여부</th>
			<th width="10%">등급</th>
			<!-- 	<th>주소</th>
			<th>이메일</th>
			<th>가입날짜</th>
			<th>IP</th> !-->
		</tr>
		<c:forEach var="mList" items="${mList}" varStatus="i">
			<tr>
				<td>${i.index+1}</td>
				<td><a onclick="detail('${mList.m_id}')">${mList.m_id}</a></td>
				<td>${mList.m_name}</td>
				<td>${mList.m_phone}</td>
				<td>${mList.m_del}</td>
				<td>${mList.m_grade}</td>
			</tr>


		</c:forEach>
	</table>
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
					<li><a onclick="mempage('${i}')">${i}</a></li>
				</c:if>
				<c:if test="${i==pb.currentPage}">
					<li class="active"><a onclick="mempage('${i}')">${i}</a></li>
				</c:if>
			</c:forEach>
			<!-- 다음 페이지로 가기 -->
			<c:if test="${pb.startPage > pb.totalPage}">
				<li><a onclick="mempage('${pb.endPage+1}')"><span
						class="glyphicon glyphicon-chevron-right"></span></a></li>
			</c:if>
			<!-- 맨 마지막 페이지로 가기 -->
			<c:if test="${pb.endPage>pb.totalPage}">
				<li><a onclick="mempage('${pb.totalPage}')"><span
						class="glyphicon glyphicon-step-forward"></span></a>
			</c:if>
		</ul>
	</div>


</body>
</html>