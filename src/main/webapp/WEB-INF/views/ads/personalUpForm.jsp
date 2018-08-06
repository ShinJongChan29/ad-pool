<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main_header.jsp"%>
<%@ include file="../sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(function() {

		$('#selectURL').on("click", function() {
			$('#a_url').removeAttr("disabled");
			$('#a_upload').attr("disabled", "true");
		});
		$('#selectFile').on("click", function() {
			$('#a_url').attr("disabled", "true");
			$('#a_upload').removeAttr("disabled");

		});
	})
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container"></div>
	<div class="wrapper">
		<div class="tapmenu centered">
			<h1>개인 파일 업로드</h1>
			<form action="adsupload" method="post" enctype="multipart/form-data">
				<table class="table table hover">
					<tr>
						<th colspan="3" style="text-align: right;">
						<input type="radio"
							name="checkU" id="selectURL" value="selectURL" checked="checked">URL</th>
						<th colspan="4" style="text-align: center"><input
							type="radio" name="checkU" id="selectFile" value="selectFile">FileUpload
						</th>
					</tr>
					<tr>
						<th colspan="3" style="text-align: center">카테고리</th>
						<th colspan="4" style="text-align: left"><select
							name="a_category">
								<option value="Sports">Sports</option>
								<option value="TV">TV</option>
								<option value="Drama">Drama</option>
						</select></th>
					</tr>
					<tr>
						<th colspan="2">제작자명<span class="glyphicon glyphicon-user"></span></th>
						<td colspan="5">${member.m_id}</td>
					</tr>
					<tr>
						<th colspan="2">제목</th>
						<td colspan="5"><input type="text" name="a_subject"
							required="required" class="form-control" autofocus="autofocus"></td>
					</tr>
					<tr>
						<th colspan="2">내용</th>
						<td colspan="5"><textArea name="a_content"
								class="form-control" required="required"></textArea></td>
					</tr>
					<tr>
						<th colspan="2">URL주소</th>
						<td colspan="5"><input type="text" id="a_url" name="a_url"
							class="form-control"></td>
					</tr>
					<tr>
						<th colspan="2">파일 <span class="glyphicon glyphicon-folder-open"></span></th>
						<td colspan="5"><input type="file" id="a_upload" name="file"
							accept="image/*,video/*" disabled="disabled"></td>
					</tr>
					<tr>
					<th colspan="2">태그</th>
					<td><input type="text" name="tag" maxlength="10" class="form-control"></td>
					<td><input type="text" name="tag" maxlength="10" class="form-control"></td>
					<td><input type="text" name="tag" maxlength="10" class="form-control"></td>
					<td><input type="text" name="tag" maxlength="10" class="form-control"></td>
					<td><input type="text" name="tag" maxlength="10" class="form-control"></td>
					</tr>
					<tr align="right">
						<th colspan="7"><input type="submit" class="btn btn-primary"
							value="확인"></th>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
<%@include file="../footer.jsp"%>