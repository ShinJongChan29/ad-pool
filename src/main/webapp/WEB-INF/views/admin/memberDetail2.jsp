<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#updateBtn').on('click', function() {
			$('.detail_td').removeAttr('disabled');
		});

	})
</script>
</head>
<body>
	<h2 class="text">회원 상세보기</h2>
	<div class="left" style="text-align: left">
		<button id="updateBtn" class="btn btn-info">변경</button>
	</div>
	<form id="frm_detail" action="admemberupdate">
		<table class="table table-hover table-bordered">

			<tr>
				<td>아이디</td>
				<td><input type="hidden" name="m_id" value="${mList.m_id}">${mList.m_id}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input class="detail_td form-control" name="m_name" type="text"
					disabled="disabled" value="${mList.m_name}"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input class="detail_td form-control" name="m_address" type="text"
					disabled="disabled" value="${mList.m_address}"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input class="detail_td form-control" name="m_email" type="text"
					disabled="disabled" value="${mList.m_email}"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input class="detail_td form-control" name="m_phone" type="text" disabled="disabled" value="${mList.m_phone}">
				</td>
			</tr>
			<tr>
				<td>가입날짜</td>
				<td><fmt:formatDate var="dateString" value="${mList.m_date}" pattern="yyyy-MM-dd"/>
				${dateString}​</td>
			</tr>
			<tr>
				<td>아이피</td>
				<td>${mList.m_ip}</td>
			</tr>
			<tr>
				<td>삭제여부</td>
				<td><select name="m_del">
						<option value="${mList.m_del}">>${mList.m_del}</option>
						<option value="N">N</option>
						<option value="Y">Y</option>
				</select>
			</tr>
			<tr>
				<td>등급</td>
				<td><select name="m_grade">
						<option value="${mList.m_grade}">>${mList.m_grade}</option>
						<option value=0>0</option>
						<option value=1>1</option>
						<option value=2>2</option>
						<option value=3>3</option>
						<option value=4>4</option>
				</select>
			</tr>
			<tr>
		</table>
	</form>
	<button onclick="detailUpdate()" class="btn btn-primary">수정완료</button>
	<button onclick="detaildely()" class="btn btn-warning">삭제하기</button>
	<button onclick="detaildeldb()" class="btn btn-danger">완전삭제</button>

</body>
</html>