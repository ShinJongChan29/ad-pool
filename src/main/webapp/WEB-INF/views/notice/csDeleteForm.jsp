<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp"%>
<%@ include file="../main_header.jsp"%>
<%@ include file="../tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function pwChk() {
		if (frm.m_password2.value != frm.m_password.value) {
			alert("암호가 일치하지 않습니다.");
			frm.m_password.focus();
			frm.m_password.value = "";
			return false;
		}
	}

	var delCon = confirm;
	function csDel() {
		alert("정말로 삭제하시겠습니까?");
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<div class="tapmenu centered">

			<!-- 공지사항 삭제 시작 -->
			<c:if test="${ncategory=='ntc'}">
				<h2 class="text-primary">공지사항 삭제</h2>
				<form action="csDelete?ncategory=${ncategory}" method="post"
					name="frm" onclick="return pwChk()">
					<input type="hidden" name="m_password2" value="${member.m_password}">
					<input type="hidden" name="pageNum" value="${pageNum}">
					<input type="hidden" name="n_no" value="${notice.n_no}">
					<fieldset>
						<legend>암호 입력</legend>
						<input type="password" name="m_password" required="required"
							autofocus="autofocus">
							<hr>
						<button onclick="csDel()" class="btn btn-danger">확인</button>
						<input type="button" value="취소" class="btn btn-success" onclick="history.go(-1)">
					</fieldset>
				</form>
			</c:if>
			<!-- 공지사항 삭제 종료 -->

			<!-- FAQ 삭제 시작 -->
			<c:if test="${ncategory=='faq'}">
				<h2 class="text-primary">FAQ 삭제</h2>
				<form action="csDelete?ncategory=${ncategory}" method="post"
					name="frm" onclick="return pwChk()">
					<input type="hidden" name="m_password2" value="${member.m_password}">
					<input type="hidden" name="pageNum" value="${pageNum}">
					<input type="hidden" name="n_no" value="${notice.n_no}">
					<fieldset>
						<legend>암호 입력</legend>
						<input type="password" name="m_password" required="required"
							autofocus="autofocus">
							<hr>
						<button onclick="csDel()" class="btn btn-danger">확인</button>
						<input type="button" value="취소" class="btn btn-success" onclick="history.go(-1)">
					</fieldset>
				</form>
			</c:if>
			<!-- FAQ 삭제 종료 -->

			<!-- 고객 게시글 삭제 시작 -->
			<c:if test="${ncategory=='csm'}">
				<h2 class="text-primary">게시글 삭제</h2>
				<form action="csDelete?ncategory=${ncategory}" method="post"
					name="frm" onclick="return pwChk()">
					<input type="hidden" name="m_password2" value="${member.m_password}">
					<input type="hidden" name="pageNum" value="${pageNum}">
					<input type="hidden" name="c_no" value="${customer.c_no}">
					<fieldset>
						<legend>암호 입력</legend>
						<input type="password" name="m_password" required="required"
							autofocus="autofocus">
							<hr>
						<button onclick="csDel()" class="btn btn-danger">확인</button>
						<input type="button" value="취소" class="btn btn-success" onclick="history.go(-1)">
					</fieldset>
				</form>
			</c:if>
			<!-- 고객 게시글 삭제 종료 -->

		</div>
	</div>
</body>
</html>
<%@ include file="../footer.jsp"%>