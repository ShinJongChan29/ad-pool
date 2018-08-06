<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="tag.jsp" %>
<html>
<head>



<meta charset="utf-8">
 <link rel="stylesheet" href="${path}/js/jqcloud.min.css">
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"   
          integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="   
          crossorigin="anonymous"></script>
  <script src="${path}/js/jqcloud.min.js"></script>
<title>Insert title here</title>

<style>
	#cloud{
		width:500px;
		height:300px;
	}
</style>
</head>
<body>














<div id="cloud"></div>
<script>
var $c = $('#cloud');
	var words = [
  {text: "Lorem", weight: 13, link:"main"},
  {text: "'<a href='#'>'Ipsum'</a>'", weight: 10.5},
  {text: "Dolor", weight: 9.4},
  {text: "Sit", weight: 8},
  {text: "Amet", weight: 6.2},
  {text: "Consectetur", weight: 5},
  {text: "Adipiscing", weight: 5},
  /* ... */
];
	$c.jQCloud(words, {
		'elliptic':'elliptic',
		 autoResize: true

	});

	
	
	
	
	
	
	
	
	
	

</script>
</body>

</html>