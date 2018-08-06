<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tag.jsp"%>
<style>
.high {
	color:black;
	font-weight: bold;
}
</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
 $(function(){
	$('.highlight').each(function() {
		var text = $(this).text();
		if('${keyword}'!="")
		$(this).html(text.replace('${keyword}', '\<span class="high">${keyword}\</span>' ));
		});
	
	$('#iframeImg').Disabled = true;	
	
 })

 
 
 
</script>
<!-- <script>
function like(no, pno){
	var mem_id = '${memId}';
	var nowP = pno;
	if(mem_id==""){
		alert("로그인 해주세요");
	}else{
	
	 $.ajax({
         type : "POST",
         url : "like",
         async : false,
         data : {
            no : no,
            currentP : pno
         },
         success : function(data) {
			nowP = data;
			refreshView(nowP);
         	return false;
         },
         error : function(data) {
            alert("실패" + data);
            console.log("2");
            return false;
         }
      });
	}
}
function page(pageNum){
	refreshView(pageNum);
}	
function downlike(no,pno){
	var nowP = pno;
	$.ajax({
        type : "POST",
        url : "downlike",
        async : false,
        data : {
           no : no,
           currentP : pno
        },
        success : function(data) {
			nowP = data;
			refreshView(nowP);
        	return false;
        },
        error : function(data) {
           alert("실패" + data);
           console.log("2");
           return false;
        }
     });
}

function refreshView(pno){
	$.ajax({
		type : "POST",
		url : "boardAdsView",
		async : false,
		data : {
			a_category : frm_ads.a_category.value,
			a_kind : frm_ads.a_kind.value,
			a_country : frm_ads.a_country.value,
			keyword : $('#keyword').val(),
			category : frm_ads.category.value,
			pageNum : pno,
			division : 'aj'
		},
		success : function(data) {
			$('#AdsViewView').html(data);
			console.log("1");
			return false;
		},
		error : function(data) {
			alert("실패" + data);
			console.log("2");
			return false;
		}
	});
}
</script> -->

<body>

	<!-- 영상 카드 분할 섹션 -->
	<div class="row">
		<c:if test="${empty list}">
			<h3>검색결과가 없습니다</h3>
		</c:if>

		<c:forEach var="list" items="${list}" varStatus="i">
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<c:if test="${list.a_grade !=4 }">
					<c:if test="${list.a_filename !='0' }">
						<a href="view?no=${list.a_no}"><img width="190" height="190"
							src="${path}/upload/adsImg/${list.a_loc}"
							onError="javascript:this.src='${path}/image/error.png'"></a>
					</c:if>
					<c:if test="${list.a_url !='0' }">
						<a href="view?no=${list.a_no}"><img width="190" height="190"
							src="https://img.youtube.com/vi/${list.a_loc}/0.jpg"
							onError="javascript:this.width='190',height='190',src='${path}/image/error.png'">
						</a>
					</c:if>
					</c:if>
					<c:if test="${list.a_grade ==4 }">
						
						<a href="view?no=${list.a_no}"> 
						<iframe id="iframeImg" width="190" height="142" src="${list.a_url}" disabled="disabled">
						</iframe>
						</a>
						
					</c:if>

					<div class="caption">
						<div style="height: 50px;">
							<h3 class="highlight">${list.a_subject}</h3>
						</div>
						<br>
						<div style="height: 30px;">
							<h4 align="left">
								제작 : <b class="highlight">${list.a_name}</b>
							</h4>
						</div>
						<br>
						<h5 align="left" style="font-style: italic">
							<a href="view?no=${list.a_no}" style="color: black;">view
								contents</a>
						</h5>
						<hr>
						<div class="row">
							<div class="offset-col-md-1 col-md-7">
								<p>
									<%--<c:set var="a_no" value="'/'${list.a_no}'/'"></c:set>
												 <a href="view?no=${list.a_no}" class="btn btn-primary"
													role="button">감상하기</a> --%>
									<c:if test="${like_map[list.a_no]==null}">
										<%-- 	<a href="like?no=${list.a_no}" class="btn btn-primary" role="button">좋아요</a> --%>
										<a onclick="like(${list.a_no},${pb.currentPage})"><img
											src="${path}/image/icon/likeon.png" width="30px"
											height="30px"></a>
									</c:if>
									<c:if test="${like_map[list.a_no]}">
										<a onclick="downlike(${list.a_no},${pb.currentPage})"><img
											src="${path}/image/icon/likeoff.png" width="30px"
											height="30px"></a>
										<%-- <a href="downlike?no=${list.a_no}"><img src="${path}/upload/like.png"></a> --%>
									</c:if>
								</p>
								<p>${list.a_goodcount}&nbsp;like</p>
							</div>
							<div class="col-md-3 offset-col-md-1">
								<p>
									<a href="view?no=${list.a_no}"><img
										src="${path}/image/icon/eye.png" width="30px" height="30px"></a>
								</p>
								<p>${list.a_viewcount}&nbsp;views</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:if test="${(i.index+1) % 4 == 0}">
	</div>
	<div class="row">
		</c:if>
	</c:forEach>

	</div>

	<!-- 페이지네이션 시작 -->
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
					<li><a onclick="page(${i})">${i}</a></li>
				</c:if>
				<c:if test="${i==pb.currentPage}">
					<li class="active"><a onclick="page(${i})">${i}</a></li>
				</c:if>
			</c:forEach>
			<!-- 다음 페이지로 가기 -->
			<c:if test="${pb.startPage > pb.totalPage}">
				<li><a onclick="page(${pb.endPage+1})"><span
						class="glyphicon glyphicon-chevron-right"></span></a></li>
				</li>
			</c:if>
			<!-- 맨 마지막 페이지로 가기 -->
			<li><a onclick="page(${pb.totalPage})"><span
					class="glyphicon glyphicon-step-forward"></span></a>
			<li>
		</ul>
	</div>

	<!-- 페이지네이션 끝 -->
	<%-- <div class="row1" style="clear:both;">
		<%@include file="footer.jsp" %>
	</div> --%>
</body>
</html>