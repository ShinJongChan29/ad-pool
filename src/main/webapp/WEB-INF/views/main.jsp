<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="main_header.jsp"%>
<%-- <%@ include file="tag.jsp"%> --%>
<html>
<head>
<style type="text/css">
#cbtn {
	border: 5px solid gray;
	background-color: #F5F5F5;
	font-family: godo;
	font-weight: bold;
	color: #555;
	font-size: 2em;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AD-POOL</title>
</head>
<body>
	<div class="">


		<div class="contents" id="contents">
			<!-- 본문 내용 입력-->
			<div class="contents ImgGridArea">
				<!-- 본문 내용 입력-->
				<!-- ImageGridContainer <img src="${path}/bannerImage/testImage1.jpg" 
					height="100%"> -->

				<!-- 캐러셀 시작 -->
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="${path}/image/carousel/budweiser-tagwords.jpg" width="100%" alt="..."
								class="bennerImg" style="height: 650px;">
							<div class="carousel-caption" style="margin-bottom: 18%;">
								<a id="cbtn" href="http://blog.naver.com/stussy9505/221319694278" target="_blank">&nbsp;&nbsp;see this
									Campaign&nbsp;&nbsp;</a>
							</div>
						</div>
						<div class="item">
							<img src="${path}/image/carousel/mcnal.jpg" width="100%" alt="..."
								class="bennerImg" style="height: 650px;">
							<div class="carousel-caption" style="margin-bottom: 18%;">
								<a id="cbtn" href="https://blog.naver.com/stussy9505/221308246635" target="_blank">&nbsp;&nbsp;see this
									Campaign&nbsp;&nbsp;</a>
							</div>
						</div>
						<div class="item">
							<img src="${path}/image/carousel/ikea.png" width="100%" alt="..."
								class="bennerImg" style="height: 650px;">
							<div class="carousel-caption" style="margin-bottom: 18%;">
								<a id="cbtn" href="https://blog.naver.com/stussy9505/221293002294" target="_blank">&nbsp;&nbsp;see this
									Campaign&nbsp;&nbsp;</a>
							</div>
						</div>
					</div>

					<!-- Controls -->
					<!-- <a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a> -->
				</div>
				<!-- 캐러셀 끝 -->
			</div>

			<!-- main contents -->
			<div class="container-contents">
				<div class="container-header">
					<h4>Creative Advertisement</h4>
				</div>
				<div class="container-body">
					<h1>당신의 상상력을 공유하세요 :)</h1>
				</div>
			</div>

			<!-- 컨텐츠 시작 -->
			<div class="masthead">
				<div class="row">
					<div class="" style="overflow: hidden;">
						<div class="col-md-2 col-xs-12 scale">
							<a href="personalUpForm"><img src="${path}/image/small-carousel/s001.jpg"
								height="200px" /></a>
						</div>
						<div class="col-md-2 col-xs-12 scale">
							<a href="personalUpForm"><img src="${path}/image/small-carousel/s002.jpg"
								height="200px" /></a>
						</div>
						<div class="col-md-2 col-xs-12 scale">
							<a href="personalUpForm"><img src="${path}/image/small-carousel/s003.jpg"
								height="200px" /></a>
						</div>
						<div class="col-md-2 col-xs-12 scale">
							<a href="personalUpForm"><img src="${path}/image/small-carousel/s004.jpg"
								height="200px" /></a>
						</div>
						<div class="col-md-2 col-xs-12 scale">
							<a href="personalUpForm"><img src="${path}/image/small-carousel/s005.jpg"
								height="200px" /></a>
						</div>
						<div class="col-md-2 col-xs-12 scale">
							<a href="personalUpForm"><img src="${path}/image/small-carousel/s006.jpg"
								height="200px" /></a>
						</div>
					</div>
				</div>
			</div>

			<div class="contentsArea"
				style="margin-bottom: 3%; padding-left: 30px; text-align: left;">
				<h1>Latest</h1>
			</div>

			<!-- small-Carousel 시작
    ================================================== -->
			<div id="myCarousel" class="carousel slide" data-ride="carousel"
				data-interval="false">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<c:forEach begin="0" end="2" var="bList" items="${bList}">
							<iframe width="400" height="225"
								src="https://www.youtube.com/embed/${bList.a_loc}"></iframe>
						</c:forEach>
					</div>
					<div class="item">
						<c:forEach begin="3" end="5" var="bList" items="${bList}">
							<iframe width="400" height="225"
								src="https://www.youtube.com/embed/${bList.a_loc}"></iframe>
						</c:forEach>
					</div>
					<div class="item">
						<c:forEach begin="6" end="8" var="bList" items="${bList}">
							<iframe width="400" height="225"
								src="https://www.youtube.com/embed/${bList.a_loc}"></iframe>
						</c:forEach>
					</div>
				</div>

				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
			<!-- / small-carousel 끝 -->





		</div>
	</div>
</html>
<%@ include file="footer.jsp"%>