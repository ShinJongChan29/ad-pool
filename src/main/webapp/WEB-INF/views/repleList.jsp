<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tag.jsp"%>
<%@ include file="jquerycss.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function rDelete(a_no, r_no){
		var temp = confirm("정말 삭제하시겠습니까?");
		if(temp){
			$.post('rDelete',"a_no="+a_no+"&r_no="+r_no, function(data){
			
		alert('삭제 성공');
		$('#re_view').html(data);
			});
		}
}	
function rInsert(a_no, r_no){
	$('#td_'+r_no).append('<span>답글 : </span> <textarea name="r_content" cols="100" rows="3" id="rRt" onfocus="this.value = this.value;""></textarea>');
	$('#btn_'+r_no).html(
			'<button onclick="rUp('+a_no+','+r_no+')" class="btn btn-success btn-sm" style="margin-bottom: 5.5%;">확인</button>'
			+" "+'<button onclick="lst('+a_no+')" class="btn btn-info btn-sm" style="margin-bottom: 5.5%;">취소</button>');
	$('#rRt').focus().val();
}
function rUpdate(a_no,r_no){
	var txt = $('#td_'+r_no).text();
	$('#td_'+r_no).html(
			'<textarea name="r_content" cols="100" rows="3" id="rt">'+txt+'</textarea>');
	$('#btn_'+r_no).html(
			'<button onclick="up('+a_no+','+r_no+')" class="btn btn-success btn-sm" style="margin-bottom: 5.5%;">확인</button>'
			+" "+'<button onclick="lst('+a_no+')" class="btn btn-info btn-sm" style="margin-bottom: 5.5%;">취소</button>');
	$('#rt').focus();
}
function lst(a_no) {
	$('#re_view').load('repleList?a_no='+a_no);
}
function up(a_no, r_no){
	var sendData="r_content="+$("#rt").val()+"&a_no="+a_no+"&r_no="+r_no;
	$.post('rUpdate',sendData,function(data){
		alert('수정 성공');
		$('#re_view').html(data);
	});
}
function rUp(ano, rno){
	var rStep = $('#td_'+rno).attr('data-value');
	var rRef = $('#btn_'+rno).attr('data-value');
	var sData ="r_content="+'@'+$('#reId_'+rno).text() +' '+$('#rRt').val()+"&a_no="+ano+"&r_no="+rno+"&r_re_step="+rStep+"&r_ref="+rRef;
	$.post('rInsert',sData, function(data){
		alert('입력 성공');
		$('#re_view').html(data);
	});
}

</script>
</head>
<body>
	<div style="clear: both; margin: 20px;">
		<h3 class="text-primary">댓글 목록</h3>

		<div class="reple-contents">

			<c:forEach var="rd" items="${repleList}">

				<div id="reple-contextArea_${rd.r_no}"
					style="margin-bottom: 20px; width: 75%;">
					<c:if test="${rd.r_re_level > 0 }">
						<script>
									$('#reple-contextArea_'+'${rd.r_no}').css('margin-left','${rd.r_re_level*100}');
							</script>
					</c:if>
					<c:if test="${rd.r_del=='y'}">
						<div style="margin: 30px 10px;">
							<h4 style="color: #555;">삭제된 댓글입니다.</h4>
						</div>
					</c:if>
					<c:if test="${rd.r_del!='y'}">
						<div class="circle" style="width: 50px; height: 50px;">
						<c:if test="${rd.r_grade <4}">
							<img src="${path}/upload/profile/${rd.r_mpicture}" width="50px"
								height="50px">
						</c:if>
						<c:if test="${rd.r_grade >=4}">
							<img src="${rd.r_mpicture}" width="50px" height="50px">
						</c:if>
						</div>
						<h5>
							작성자: <span id="reId_${rd.r_no}">
							<c:if test="${rd.r_grade >= 4}">
								${rd.r_name}
							</c:if>
							<c:if test="${rd.r_grade <4 }">
								${rd.r_mid}
							</c:if>
							<c:if test="${rd.r_grade ==5}">
								<img src="${path}/image/icon/naver_square_16x16.png">
							</c:if>
							<c:if test="${rd.r_grade ==4}">
								<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" 
								width="16px" height="16px">
							</c:if>
							<c:if test="${rd.r_grade <4}">
								<img src="${path}/image/adpool-logo/stand.png" width="16px" height="16px">
							</c:if>	
							</span>
						</h5>
						<span id="td_${rd.r_no}" data-value="${rd.r_re_step}"><h4
								style="color: #555;">${rd.r_content}</h4></span>

						<span id="btn_${rd.r_no}" data-value="${rd.r_ref }"> <c:if
								test="${member != null}">
								<button class="btn btn-primary btn-sm"
									onclick="rInsert(${rd.a_no},${rd.r_no})">답글</button>
							</c:if> <c:if test="${rd.r_mid==member.m_id}">
								<!-- 실제는 작성자와 로그인한 사람과 비교 -->
								<button class="btn btn-warning btn-sm"
									onclick="rUpdate(${rd.a_no},${rd.r_no})">수정</button>
								<button class="btn btn-danger btn-sm"
									onclick="rDelete(${rd.a_no},${rd.r_no})">삭제</button>
							</c:if></span>
						<hr>
					</c:if>
				</div>
			</c:forEach>
	<!-- 페이지네이션/더보기 시작 -->
	<div align="center">
		<button onclick="paging(${pageNum})" class="btn btn-default" style="height: 27px; margin-right: 25%;">
			<h5 style="margin-top: 0px;">Read More</h5>
		</button>
	</div>
	<!-- 페이지네이션/더보기 끝 -->
		</div>
	</div>

	<br>
</body>
</html>