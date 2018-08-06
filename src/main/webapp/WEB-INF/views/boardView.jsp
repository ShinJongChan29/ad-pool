<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="main_header.jsp"%>
<%@ include file="tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AD-POOL</title>
</head>
<script>
	$(function() {

		var a_country;
		var a_category;
		var a_kinds;
		var k;
		$('.dropdown-menu li a').on(
				"click",
				function() {
					selectVal = $(this).attr('data-value');
					parentId = $(this).parent().parent('ul').attr('id');
					/* $('#viewSelect').html("<br/>&nbsp;&nbsp;"+selectVal).css('font-size','13px'); */
					if (parentId == 'country') {
						$('#viewCountry').html("<br/>" + selectVal).css(
								'font-size', '13px');
						a_country = selectVal;
					} else if (parentId == 'category') {
						$('#viewCategory').html("<br/>" + selectVal).css(
								'font-size', '13px');
						category = selectVal;
					} else if (parentId == 'kinds') {
						if (selectVal == "person")
							k = "개인";
						else if (selectVal == "company")
							k = "기업";
						$('#viewKinds').html("<br/>" + k).css('font-size',
								'13px');
						a_kinds = selectVal;
					}
				});
		$('#searchView').on(
				'click',
				function() {
					$('input[name=a_country]').val(a_country);
					$('input[name=a_category]').val(a_category);
					$('input[name=a_kind]').val(k);
					alert($('input[name=a_country]').val() + " / "
							+ $('input[name=a_category]').val() + " / "
							+ $('input[name=a_kind]').val());
					frm_ads.submit();
				});
	});
</script>
<body>
	<div id="adsView">
		<div class="wrapper">
			<div class="container">
				<div class="card">
					<c:if test="${category=='top'}">
						<h1>인기 광고 영상</h1>
					</c:if>
					<c:if test="${category=='latest'}">
						<h1>최신 광고 영상</h1>
					</c:if>
					<c:if test="${category=='public'}">
						<h1>공공 광고 영상</h1>
					</c:if>
					<c:if test="${category=='enterprise'}">
						<h1>기업 광고 영상</h1>
					</c:if>
					<c:if test="${category=='competition'}">
						<h1>공모전 영상</h1>
					</c:if>
					<div class="search">
						<nav class="navbar navbar-default" style="width: 75%">
							<div class="container-fluid">
								<!-- 검색창 -->
								<div class="navbar-header" style="padding-left: 5%;">
									<button type="button" class="navbar-toggle collapsed"
										data-toggle="collapse"
										data-target="#bs-example-navbar-collapse-1">
										<span class="sr-only">Toggle navigation</span> <span
											class="icon-bar"></span> <span class="icon-bar"></span> <span
											class="icon-bar"></span>
									</button>
									<a class="navbar-brand" href="#">Search</a>
								</div>

								<!-- Collect the nav links, forms, and other content for toggling -->
								<div class="collapse navbar-collapse"
									id="bs-example-navbar-collapse-1">
									<ul class="nav navbar-nav" id="searchTag">
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false">국가

												<span class="sr-only">(current)</span><span class="caret"></span>
												<span id="viewCountry"></span>
										</a>
											<ul class="dropdown-menu" role="menu" id="country">
												<li><a href="#" data-value="Korea">Korea</a></li>
												<li><a href="#" data-value="Japan">Japan</a></li>
												<li><a href="#" data-value="America">America</a></li>
											</ul></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false">카테고리

												<span class="caret"></span> <span id="viewCategory"></span>
										</a>
											<ul class="dropdown-menu" role="menu" id="category">
												<li><a href="#" data-value="Sports">Sports</a></li>
												<li><a href="#" data-value="TV">TV</a></li>
												<li><a href="#" data-value="Drama">Drama</a></li>
											</ul></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false">종류

												<span class="caret"></span> <span id="viewKinds"></span>
										</a>
											<ul class="dropdown-menu" role="menu" id="kinds">
												<li><a href="#" data-value="company">기업</a></li>
												<li><a href="#" data-value="person">개인</a></li>
											</ul></li>
									</ul>
									<form id="frm_ads" action="" class="navbar-form navbar-right">
										<div class="form-group">
											<input type="text" class="form-control" name="keyword"
												placeholder="Search">
										</div>
										<input type="hidden" value="${category }" name="category">
										<input type="hidden" value="" name="a_country"> <input
											type="hidden" value="" name="a_category"> <input
											type="hidden" value="" name="a_kind">
										<button class="btn btn-default" id="searchView">검색하기</button>
									</form>
								</div>
								<!-- /.navbar-collapse -->
							</div>
							<!-- /.container-fluid -->
						</nav>
					</div>


					<%-- 	<form action="latest">
				<!-- 액션이 생략되면 기본적으로 리스트로 돌아감 -->
				<input type="hidden" name="pageNum" value="1">

				<!-- 내가 검색한 옵션이 그대로 유지하기 위해 사용 -->
				<select name="search">
					<c:forTokens var="sh" items="국가, 카테고리, 종류" delims="," varStatus="i">
						<c:if test="${uf[i.index]==board.search}">
							<option value="${t[i.index]}" selected="selected">${sh}</option>
						</c:if>
						<c:if test="${uf[i.index]!=board.search}">
							<option value="${uf[i.index]}">${sh}</option>
						</c:if>
					</c:forTokens>
				</select> <input type="text" name="keyword"> <input type="submit"
					value="확인"> --%>

					<!-- 영상 카드 분할 섹션 -->
					<div class="row">
						<c:forEach var="list" items="${list}" varStatus="i">
							<div class="col-sm-6 col-md-3">
								<div class="thumbnail">
									<c:if test="${list.a_upload !='0' }">
										<img width="190" height="190"
											src="${path}/upload/adsImg/${list.a_img}">
									</c:if>
									<c:if test="${list.a_url !='0' }">
										<img width="190" height="190"
											src="https://img.youtube.com/vi/${list.a_img}/0.jpg">
									</c:if>

									<div class="caption">
										<h3>${list.a_subject}</h3>
										<p>${list.a_content}</p>
										<p>조회수 : ${list.a_viewcount}</p>
										<p>등록일 : ${list.a_date}</p>
										<p>좋아요 : ${list.a_goodcount}</p>
										<p>
											<a href="#" class="btn btn-primary" role="button">감상하기</a> <a
												href="#" class="btn btn-default" role="button">좋아요</a>
										</p>
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
								<li><a href="latest?pageNum=1"
									&search=${board.search}&keyword=${board.keyword}><span
										class="glyphicon glyphicon-step-backward"></span></a></li>
								<!-- 이전 페이지로 가기 -->
								<li><a
									href="latest?pageNum=${pb.startPage - 1}&search=${board.search}&keyword=${board.keyword}"><span
										class="glyphicon glyphicon-chevron-left"></span></a></li>
							</c:if>
							<!-- 페이지 리스트 -->
							<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
								<c:if test="${i!=pb.currentPage}">
									<li><a
										href="latest?pageNum=${i}&search=${board.search}&keyword=${board.keyword}">${i}</a></li>
								</c:if>
								<c:if test="${i==pb.currentPage}">
									<li class="active"><a
										href="latest?pageNum=${i}&search=${board.search}&keyword=${board.keyword}">${i}</a></li>
								</c:if>
							</c:forEach>
							<!-- 다음 페이지로 가기 -->
							<%-- <c:if test="${pb.startPage < pb.totalPage}">
						<li><a
							href="latest?pageNum=${pb.endPage + 1}&search=${board.search}&keyword=${board.keyword}"><span
								class="glyphicon glyphicon-chevron-right"></span></a></li>
					</c:if>
					<!-- 맨 마지막 페이지로 가기 -->
					<li><a
						href="latest?pageNum=${pb.totalPage}&search=${board.search}&keyword=${board.keyword}"><span
							class="glyphicon glyphicon-step-forward"></span></a>
					<li> --%>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>