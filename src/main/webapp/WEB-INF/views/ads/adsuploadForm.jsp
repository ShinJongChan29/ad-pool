<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
		var countryO = $('#countryOption');
		var acou = $('input[name=a_country]');
		countryO.on('change',function(){
			acou.val(countryO.val());
		});
		var categoryO = $('#categoryOption');
		var acate=$('input[name=a_category]');
		categoryO.on('change',function(){
			acate.val(categoryO.val());
		});
		acate.val(categoryO.val());
		acou.val(countryO.val());
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<h2 class="text-primary">파일 업로드</h2>
		<form action="adsupload" method="post" enctype="multipart/form-data">
			<table class="table table hover">
				<tr>
					<th colspan="24" style="text-align: center"><input
						type="radio" name="checkU" id="selectURL" value="selectURL"
						checked="checked">&nbspURL&nbsp&nbsp <input type="radio"
						name="checkU" id="selectFile" value="selectFile">&nbsp&nbspFileUpload</th>
				</tr>
				<tr>
					<th colspan="4" width="120px">국가</th>
					<th colspan="6"><input type="text" name="a_country"
						class="form-control"></th>
					<th colspan="6"><select class="form-control" id="countryOption"
						style="width: 150px">
							<c:forEach var="counlist" items="${counlist}">
								<option value="${counlist.a_country}">${counlist.a_country }</option>
							</c:forEach>
					</select></th>

					<th colspan="2" style="text-align: right;">카테고리</th>
					<th colspan="3"><input type="text" name="a_category"
						class="form-control"></th>
					<th colspan="3"><select class="form-control" id="categoryOption"
						style="width: 150px">
							<c:forEach var="catelist" items="${catelist}">
								<option value="${catelist.a_category}">${catelist.a_category}</option>
							</c:forEach>
					</select></th>
				</tr>
								<tr>
					<th colspan="4" width="120px">분류</th>
					<th colspan="12"><select name="a_kind" class="form-control"
						style="width: 125px">
							<option value="Enterprise" selected="selected">Enterprise</option>
							<option value="Public">Public</option>
							<option value="Personal">Personal</option>
					</select></th>

					<th colspan="2" style="text-align: right;">등급</th>
					<th colspan="6"><select name="a_grade" class="form-control"
						style="width: 75px">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
					</select></th>
				</tr>
				<tr>
					<th colspan="6">제목<span class="glyphicon glyphicon-user"></span></th>
					<td colspan="18"><input type="text" name="a_subject"
						required="required" class="form-control" autofocus="autofocus"></td>
				</tr>
				<tr>
					<th colspan="6">제작자명</th>
					<td colspan="18"><input type="text" name="a_name"
						class="form-control" required="required"></td>
				</tr>
				<tr>
					<th colspan="6">내용</th>
					<td colspan="18"><textArea name="a_content"
							class="form-control" required="required"></textArea></td>
				</tr>
				<tr>
					<th colspan="6">태그</th>
					<td colspan="4"><input type="text" name="tag" maxlength="10"
						class="form-control"></td>
					<td colspan="4"><input type="text" name="tag" maxlength="10"
						class="form-control"></td>
					<td colspan="4"><input type="text" name="tag" maxlength="10"
						class="form-control"></td>
					<td colspan="4"><input type="text" name="tag" maxlength="10"
						class="form-control"></td>
					<td colspan="4"><input type="text" name="tag" maxlength="10"
						class="form-control"></td>
				</tr>
				<tr>
					<th colspan="6">URL주소</th>
					<td colspan="18"><input type="text" id="a_url" name="a_url"
						class="form-control"></td>
				</tr>
				<tr>
					<th colspan="6">파일 <span
						class="glyphicon glyphicon-folder-open"></span></th>
					<td colspan="18"><input type="file" id="a_upload" name="file"
						class="form-control" accept="image/*,video/*" disabled="disabled"></td>
				</tr>
				<tr>
					<th colspan="24"><input type="submit" class="btn btn-primary"
						value="확인"></th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>