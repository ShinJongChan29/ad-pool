<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main_header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	$(function() {
		$('#cboardDisp').load(
				'${path}/noticeList?ncategory=${ncategory}&pageNum=${pageNum} #cslist');
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container"></div>
	<div class="wrapper" id="notice">
		<div class="tapmenu centered">
			<!-- 공지사항 게시판 뷰 시작 -->
			<c:if test="${ncategory=='ntc'}">
				<h2>공지사항</h2>
				<table class="table table-hover">
					<tr>
						<th style="width: 10%; background-color: ghostwhite;">제목</th>
						<td>${notice.n_subject}</td>
					</tr>
					<tr>
						<th style="width: 10%; background-color: ghostwhite;">작성자</th>
						<td>${notice.n_name}</td>
					</tr>
					<tr>
						<th style="width: 10%; background-color: ghostwhite;">조회수</th>
						<td>${notice.n_count}</td>
					</tr>
					<tr>
						<th style="width: 10%; background-color: ghostwhite;">작성일</th>
						<td>${notice.n_date}</td>
					</tr>
					<tr>
						<th style="width: 10%; background-color: ghostwhite;">내용</th>
						<td><pre
								style="font-family: godo; font-size: 1.2em; background-color: white; border: unset;">${notice.n_content}</pre></td>
					</tr>
				</table>
				<div align="center">
					<c:if test="${not empty sessionScope.admin}">
						<a class="btn btn-warning"
							href="csUpdateForm?ncategory=${ncategory}&pageNum=${pageNum}&no=${notice.n_no}">수정</a>
						<a class="btn btn-danger" href="csDeleteForm?ncategory=${ncategory}&pageNum=${pageNum}&no=${notice.n_no}">삭제</a>
					</c:if>
					<a class="btn btn-primary"
						href="${path}/noticeList?ncategory=ntc&pageNum=${pageNum}">목록</a>
				</div>
			</c:if>
			<!-- 공지사항 게시판 뷰 종료 -->


			<!-- faq 게시판 뷰 시작 -->
			<c:if test="${ncategory=='faq'}">
				<h2>FAQ / 자주하는 질문</h2>
				<table class="table table-hover">
					<tr>
						<th style="width: 10%; background-color: ghostwhite;">제목</th>
						<td>${notice.n_subject}</td>
					</tr>
					<tr>
						<th style="width: 10%; background-color: ghostwhite;">작성자</th>
						<td>${notice.n_name}</td>
					</tr>
					<tr>
						<th style="width: 10%; background-color: ghostwhite;">조회수</th>
						<td>${notice.n_count}</td>
					</tr>
					<tr>
						<th style="width: 10%; background-color: ghostwhite;">작성일</th>
						<td>${notice.n_date}</td>
					</tr>
					<tr>
						<th style="width: 10%; background-color: ghostwhite;">내용</th>
						<td><pre
								style="font-family: godo; font-size: 1.2em; background-color: white; border: unset;">${notice.n_content}</pre></td>
					</tr>
				</table>
				<div align="center">
					<c:if test="${not empty sessionScope.admin}">
						<a class="btn btn-warning"
							href="csUpdateForm?ncategory=${ncategory}&pageNum=${pageNum}&no=${notice.n_no}">수정</a>
						<a class="btn btn-danger" href="csDeleteForm?ncategory=${ncategory}&pageNum=${pageNum}&no=${notice.n_no}">삭제</a>
					</c:if>
					<a class="btn btn-primary"
						href="${path}/noticeList?ncategory=faq&pageNum=${pageNum}">목록</a>
				</div>
			</c:if>
			<!-- faq 게시판 뷰 종료 -->


			<!-- 고객센터 게시판 뷰 시작 -->
			<c:if test="${ncategory=='csm'}">
				<h2>고객의 소리, 항상 귀기울이겠습니다~ 띠롱</h2>
				<table class="table table-hover">
					<tr>
						<th style="width: 10%; background-color: ghostwhite;">제목</th>
						<td>${customer.c_subject}</td>
					</tr>
					<tr>
						<th style="width: 10%; background-color: ghostwhite;">작성자</th>
						<td>${customer.c_name}</td>
					</tr>
					<tr>
						<th style="width: 10%; background-color: ghostwhite;">IP</th>
						<td>${customer.c_ip}</td>
					</tr>
					<tr>
						<th style="width: 10%; background-color: ghostwhite;">조회수</th>
						<td>${customer.c_count}</td>
					</tr>
					<tr>
						<th style="width: 10%; background-color: ghostwhite;">작성일</th>
						<td>${customer.c_date}</td>
					</tr>
					<tr>
						<th style="width: 10%; background-color: ghostwhite;">내용</th>
						<td><pre
								style="font-family: godo; font-size: 1.2em; background-color: white; border: unset;">${customer.c_content}</pre></td>
					</tr>
				</table>
				<div align="center">
					<c:if test="${customer.c_mid == member.m_id}">
						<a class="btn btn-warning"
							href="csUpdateForm?ncategory=${ncategory}&pageNum=${pageNum}&no=${customer.c_no}">수정</a>
						<a class="btn btn-danger" href="csDeleteForm?ncategory=csm&pageNum=${pageNum}&no=${customer.c_no}">삭제</a>
					</c:if>
					<a class="btn btn-success"
						href="csInsertForm?ncategory=csm&pageNum=${pageNum}&nm=${customer.c_no}">답변</a>
					<a class="btn btn-primary"
						href="${path}/noticeList?ncategory=csm&pageNum=${pageNum}">목록</a>
				</div>
			</c:if>
			<!-- 고객센터 게시판 뷰 종료 -->
			
			<hr>
			<div id="cboardDisp"></div>
		</div>
	</div>
	<div class="row1" style="clear:both;">
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html>
