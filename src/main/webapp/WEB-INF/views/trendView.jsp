<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="main_header.jsp"%>
<%@ include file="tag.jsp"%>
<html>
<head>
<title>jQCloud</title>
<meta charset="utf-8">

<link rel="stylesheet" href="${path}/js/jqcloud.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="${path}/js/jqcloud.min.js"></script>
<style>
#cloud {
	width: 1000px;
	height: 400px;
	margin-left: 160px;
	/* transform: scale(1.3); */
}

a:hover {
	font-weight: bolder;
}
</style>


</head>
<body>
	<div class="container"></div>
	<div class="wrapper" style="margin-top: 30px;">
		<h1 class="text-primary" align="left" style="margin-left: 50px;">
			<img alt="" src="${path}/image/icon/cloud-computing.png" width="40px" height="40px">&nbsp;오늘의 검색어</h1>
		<div id="cloud"></div>
	</div>
	<script>
		var $c = $('#cloud');
		var words = ${trend};

		$c.jQCloud(words, {
			autoResize : true,
			classPattern: null,
			  colors: ["#ffafb0", "#ffafd8", "#fcc6f7", "#b5c7ed", "#aee4ff", "#caa6fe", "#afffba", "#ffe4af", "#dfd4e4"],
			  fontSize: function(width, height, step) {
				    return (width / 70 * step) + 'px';
				  }
		});
	</script>
</body>
</html>


