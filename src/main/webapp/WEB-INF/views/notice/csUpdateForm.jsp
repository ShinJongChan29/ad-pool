<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp"%>
<%@ include file="../main_header.jsp"%>
<%@ include file="../tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<div class="tapmenu centered">

			<!-- 공지사항 수정 시작 -->
			<c:if test="${ncategory=='ntc'}">
				<h2 class="text-primary">관리자 공지사항 수정</h2>
				<form action="csUpdate?ncategory=${ncategory}" method="post">
					<input type="hidden" name="n_name" value="${member.m_id}">
					<input type="hidden" name="pageNum" value="${pageNum}"> <input
						type="hidden" name="n_no" value="${notice.n_no}">
					<table class="table table-bordered">
						<tr>
							<th>작성자<span class="glyphicon glyphicon-user"></span></th>
							<td colspan="3">${member.m_id}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><input type="text" name="n_subject"
								required="required" class="form-control" autofocus="autofocus"
								value="${notice.n_subject}"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3" align="center"><textArea name="n_content"
									class="form-control" required="required">${notice.n_content}</textArea></td>
						</tr>
						<tr>
							<th colspan="4"><input type="submit" class="btn btn-primary"
								value="확인"></th>
						</tr>
					</table>
				</form>
			</c:if>
			<!-- 공지사항 수정 종료 -->

			<!-- FAQ 수정 시작 -->
			<c:if test="${ncategory=='faq'}">
				<h2 class="text-primary">관리자 FAQ 수정</h2>
				<form action="csUpdate?ncategory=${ncategory}" method="post">
					<input type="hidden" name="n_name" value="${member.m_id}">
					<input type="hidden" name="pageNum" value="${pageNum}"> <input
						type="hidden" name="n_no" value="${notice.n_no}">
					<table class="table table-bordered">
						<tr>
							<th>작성자<span class="glyphicon glyphicon-user"></span></th>
							<td colspan="3">${member.m_id}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><input type="text" name="n_subject"
								required="required" class="form-control" autofocus="autofocus"
								value="${notice.n_subject}"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3" align="center"><textArea name="n_content"
									class="form-control" required="required">${notice.n_content}</textArea></td>
						</tr>
						<tr>
							<th colspan="4"><input type="submit" class="btn btn-primary"
								value="확인"></th>
						</tr>
					</table>
				</form>
			</c:if>
			<!-- FAQ 수정 종료 -->

			<!-- 고객문의게시글 수정 시작 -->
			<c:if test="${ncategory=='csm'}">
				<h2 class="text-primary">고객 문의 게시글</h2>
				<form action="csUpdate?ncategory=${ncategory}" method="post">
					<input type="hidden" name="pageNum" value="${pageNum}"> <input
						type="hidden" name="c_no" value="${customer.c_no}">
					<table class="table table-bordered">
						<tr>
							<th>작성자<span class="glyphicon glyphicon-user"></span></th>
							<td colspan="3">${member.m_id}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><input type="text" name="c_subject"
								required="required" class="form-control" autofocus="autofocus"
								value="${customer.c_subject}"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3" align="center"><textArea name="c_content"
									class="form-control" required="required">${customer.c_content}</textArea></td>
						</tr>
						<tr>
							<th colspan="4"><input type="submit" class="btn btn-primary"
								value="확인"></th>
						</tr>
					</table>
				</form>
			</c:if>
			<!-- 고객문의게시글 수정 종료 -->

		</div>
	</div>
</body>
</html>
<%@ include file="../footer.jsp"%>