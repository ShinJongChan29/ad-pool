<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="tag.jsp" %>
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
      width: 400px;
      height: 300px;
    }
  </style>
</head>

<body>
  
  <div id="cloud"></div>

  <script>

  	 var $c = $('#cloud');
  	/*  var some_words = [
        {
            text: 'Zero',
            weight: 0,
            html: { 'test': 'just testing' }
        },
        {
            text: 'Minus three',
            weight: -3,
            link: '#'
        },
        {
            text: 'Minus point fiftyfive',
            weight: -0.55
        },
        {
            text: 'Two',
            weight: '2.0',
            link: { href: '#', test: "testing" },
            handlers: {
                click: function() {
                    $(this).data("testHandler", "Handler works!");
                }
            },
            afterWordRender: function() {
                this.data("testCallback", "Callback works!");
            },
            html: { "class": "mycustomclass" }
        }
    ];

     var words_with_color = [
        { text: 'Abc', weight: 100, color: '#e31a1c' },
        { text: 'Def', weight: 5, color: '#bd0026' },
        { text: 'Ghi', weight: 7, color: '#bd0026' }
    ];

     var words2 = [
        { text: 'Abc', weight: 10 },
        { text: 'Def', weight: 9.5 },
        { text: 'Ghi', weight: 9.0 },
        { text: 'A2bc', weight: 8.5 },
        { text: 'D2ef', weight: 8 },
        { text: 'G2hi', weight: 7.5 },
        { text: 'A3bc', weight: 7 },
        { text: 'D3ef', weight: 6.5 },
        { text: 'G3hi', weight: 6 },
    ]; */

    /*$c.jQCloud(some_words,  {
    	delay: 10,
    	afterCloudRender: function() {
    		var text = $c.text();
    		console.log(text);
    	}
    });*/

	/*$c.jQCloud(some_words, {
			classPattern: 'word-{n}',
            colors: ["#800026", "#bd0026", "#e31a1c", "#fc4e2a", "#fd8d3c", "#feb24c", "#fed976", "#ffeda0", "#ffffcc"],
            fontSize: ['50px', '40px', '20px'],
	});*/

/* 	$c.jQCloud(words2, {
		'elliptic':'elliptic',

	}); */
 
	var $c = $('#cloud');
	var words = [
  {text: "Lorem", weight: 13},
  {text: "Ipsum", weight: 10.5},
  {text: "Dolor", weight: 9.4},
  {text: "Sit", weight: 8},
  {text: "Amet", weight: 6.2},
  {text: "Consectetur", weight: 5},
  {text: "Adipiscing", weight: 5},
  /* ... */
];
	$c.jQCloud(words, {
		'elliptic':'elliptic',

	});

	
	
	
	
	

  </script>
</body>
</html>


