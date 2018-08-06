<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script>
	
</script>
<style>
/**footer sub 시작 **/
.footerSub {
	margin-top:10%;
	height: 10%;
	border: 1px none;
	background-color: #f5f5f5 !important;
}

.footerBottom {
	height: 10%;
	border: 1px none;
	text-align: center;
	background-color: #555 !important;
}

.footersub_img {
	display: inline;
}

#footerlogo {
	margin-top: 3%;
	height: 40px;
}

.footersub_ul {
	list-style: none;
	display: -webkit-inline-box;
	height: 100%;
	text-align: center;
}

.footersub_ul>li {
	margin: 5px;
}
/**footer sub 끝**/
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AD-POOL</title>
</head>

<body style="clear:both;">
	<div class="footer">
		<div class="row">
			<div class="footerSub" >
				<!-- 하단 배너 -->
				<div class="col-md-offset-1 col-md-6 col-xs-12">
					<div class="footersub_img">
						<img src="${path}/bannerImage/adpool-logo.png" id="footerlogo"></img>
					</div>
				</div>
				<div class="col-md-5 col-xs-12">
					<ul class="footersub_ul">
						<li><a href="#"><img
								src="${path}/image/icon/facebook.png" width="40px" height="40px"></a>
							<h5>FaceBook</h5></li>
						<li><a href="#"><img
								src="${path}/image/icon/instagram.png" width="40px"
								height="40px"></a>
							<h5>Instagram</h5></li>
						<li><a href="#"><img src="${path}/image/icon/twitter.png"
								width="40px" height="40px"></a>
							<h5>twitter</h5>
						<li><a href="#"><img src="${path}/image/icon/youtube.png"
								width="40px" height="40px"></a>
							<h5>youtube</h5>
					</ul>
				</div>
			</div>
		</div>
		<div class="footerBottom">
			<!-- 최하단 푸터 -->
			<div class="col-md-12">
				<h3><img src="${path}/image/icon/copyright.png" width="28px" height="25px">&nbsp;Team3 Project</h3>
			</div>
		</div>
	</div></html>