<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="${path}/jqcloud2/dist/jqcloud.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${path}/jqcloud2/dist/jqcloud.min.js"></script>

	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<div id="demo"></div>
<script>
	var words = [
		  {text: "Lorem", weight: 13},
		  {text: "Ipsum", weight: 10.5},
		  {text: "Dolor", weight: 9.4},
		  {text: "Sit", weight: 8},
		  {text: "Amet", weight: 6.2},
		  {text: "Consectetur", weight: 5},
		  {text: "Adipiscing", weight: 5},
		];
		$('#demo').jQCloud(words);
</script>
<!-- <input type="button" value="클라우드 제발" id="demo"> -->
</body>
</html>
