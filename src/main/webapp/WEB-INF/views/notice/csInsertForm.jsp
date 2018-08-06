<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp"%>
<%@ include file="../main_header.jsp"%>
<%@ include file="../tag.jsp" %>
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
			
			<c:if test="${ncategory=='ntc'||ncategory=='faq'}">
			<h2 class="text-primary">관리자 게시글</h2>
				<form action="csInsert?ncategory=${ncategory}" method="post">
						<input type="hidden" name="n_name" 		value="${member.m_id}">
					<table class="table table-bordered">
						<tr>
							<th>작성자<span class="glyphicon glyphicon-user"></span></th>
							<td colspan="3">${member.m_id}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><input type="text" name="n_subject"
								required="required" class="form-control" autofocus="autofocus"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3" align="center"><textArea name="n_content"
									class="form-control" required="required"></textArea></td>
						</tr>
						<tr>
							<th>종류</th>
							<td colspan="3" align="center">
								<select name="n_grade" class="form-control">
									<option value=1>1. 공지사항</option>
									<option value=2>2. FAQ</option>
								</select>
							</td>
						</tr>
						<tr>
							<th colspan="4"><input type="submit" class="btn btn-primary"
								value="확인"></th>
						</tr>
					</table>
				</form>
			</c:if>
			
			
			<c:if test="${ncategory=='csm'}">
			<h2 class="text-primary">고객 문의 게시글</h2>
				<form action="csInsert?ncategory=${ncategory}" method="post">
					<input type="hidden" name="c_mid" 		value="${member.m_id}">
					<input type="hidden" name="c_name" 		value="${member.m_name}">
					<input type="hidden" name="pageNum" 	value="${pageNum}">
					<input type="hidden" name="c_no" 		value="${c_no}">
					<input type="hidden" name="c_ref" 		value="${c_ref}">
					<input type="hidden" name="c_re_level" 	value="${c_re_level}">
					<input type="hidden" name="c_re_step" 	value="${c_re_step}">
					<table class="table table-bordered">
						<tr>
							<th>작성자<span class="glyphicon glyphicon-user"></span></th>
							<td colspan="3">${member.m_id}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><input type="text" name="c_subject"
								required="required" class="form-control" autofocus="autofocus"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3" align="center"><textArea name="c_content"
									class="form-control" required="required"></textArea></td>
						</tr>
						<tr>
							<th colspan="4"><input type="submit" class="btn btn-primary"
								value="확인"></th>
						</tr>
					</table>
				</form>
			</c:if>
		</div>
	</div>
</body>
</html>
<%@ include file="../footer.jsp"%>