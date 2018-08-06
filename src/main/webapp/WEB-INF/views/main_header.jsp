<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tag.jsp"%>
<%@ include file="jquerycss.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script>
	window.fbAsyncInit = function() {
		FB.init({
			appId : '687806274885257',
			cookie : true,
			xfbml : true,
			version : 'v3.0'
		});

		FB.AppEvents.logPageView();

	};

	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return;
		}
		js = d.createElement(s);
		js.id = id;
		js.src = "https://connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	function loginStatus() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}

	/* {
	    status: 'connected',
	    authResponse: {
	        accessToken: '...',
	        expiresIn:'...',
	        signedRequest:'...',
	        userID:'...'
	    }
	} */

	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}
</script>
<script type="text/javascript">
	/* 
	 Kakao.init('b9a092ee6b74c3d3e757f15670a98592');
	 function loginWithKakao() {
	 // 로그인 창을 띄웁니다.
	 Kakao.Auth.login({
	 success: function(authObj) {
	 Kakao.API.request({
	 url: '/v1/user/me',
	 success: function(res) {
	 //   alert(JSON.stringify(res));
	 $.ajax({
	 type:"post",
	 dataType:"json",
	 url:"/indb.jsp",
	 data : {
	 "email":res.kaccount_email,
	 "id":res.id,
	 "nickname":res.properties.nickname,
	 },
	 success:function(data){
	 if(data.login == "success"){
	 alert("로그인되었습니다");
	 location.href="${path}/adpool/main";
	 }
	 error:function(data){
	 alert('error:'+data.result);
	 }
	 });
	 },
	 fail: function(error) {
	 alert(JSON.stringify(error));
	 }
	 });
	 },
	 fail: function(err) {
	 alert(JSON.stringify(err));
	 }
	 });
	 }; */

	/* 	$(function() {
	 $('.topbar_ul li a').on('click', function() {
	 var sts = $(this).attr('id');
	 alert(sts);
	 $.post('loginForm',function(data){
	 $('#modal_view').append(data);
	 });
	 }); */
	/* 	$('#loginForm').click(function() {
			$('div.modal').modal({
				remote : 'loginForm'
			});
		});
		$('#joinForm').click(function() {
			$('div.modal').modal({
				remote : 'joinForm'
			});
		}) */
	/* $('#myPage').click(function() {
		$('div.modal').modal({
			remote : 'myPageForm'
		});
	}); */

	/* $('#lat').click(function(this) {
		alert($(this).attr("title"));
		sendData = $('#lat').attr("title");
		$.post("boardView", "lat=" + sendData, function(data) {
			$(".contents").html(data);
		});
	}); */

	/* function aRequest(category) {

		$.post('boardView', "category=" + category, function(data) {
			//$('#contents').html(data);
		});
		return false;
	} */

	function personal() {
		$.post('personalUpForm', function(data) {
			$('#contents').html(data);
		});
	}

	function logOut() {
		alert('로그아웃 되었습니다.');
		location.href = "logOut";
	}

	$('.dropdown-toggle').dropdown();
	$('.modal').on('shown.bs.modal', function() {
		$(this).find('[autofocus]').focus();
	});
	$(function() {
		
		<c:set var="id" value="${sessionScope.member}"/>
		<c:set var="admin" value="${sessionScope.admin}"/>
		<c:if test="${not empty id or not empty admin}">
		$('#email3')
				.html(
						"<a style='color:black' data-toggle='modal' data-target='#emailFormView'>Email보내기</a>");
		</c:if>
		
		$('#allSearchAds').on(
				'click',
				function() {
					var param = $('#all_keyword').val();
					location.href = "boardAdsView?keyword=" + param
							+ "&category=allSearch";
				});

		/* 	 $('#allSearchAds').on('click',function(){
				$('p').highlight('${keyword}');
			 }); */

		/*var count = $('#rank-list li').length;
		var height = $('#rank-list li').height();
		var index2 = 0;
		 function step(index) {
		    $('#rank-list ol').delay(1000).animate({
		        top: -height * index,
		    }, 500, function() {
			console.log("count:"+count+",height:"+height+",index:"+index+",top:"+top);
				if(index+1 == count){
		        	$('#rank-list ol').clearQueue();
				}else 
				step((index+1) % count);
		    });
		}
		step(1); */
		/* function tick3(){
			$('#rank-list ol li:first').animate({'opacity':0}, 1000, function () { $(this).appendTo($('#rank-list ol')).css('opacity', 1); });
		}
		setInterval(function(){ tick3 () }, 2000);	
		 */
		function tick2() {
			$('#rank-list ol li:first').slideUp(function() {
				$(this).appendTo($('#rank-list ol')).slideDown();
			});
		}
		setInterval(function() {
			tick2()
		}, 3000);

		$('#rank-list').hover(function() {
			$('#realTimeSearch').css('display', 'block');
		});

		$('#realTimeSearch').mouseleave(function() {
			$('#realTimeSearch').css('display', 'none');
		});
		$('#emailsub_btn').on('click',function(){
			$('#frm_email').submit();
		});
	})
		
	/* 	var listKeyword = [];
		var listKeywordc = [];
		<c:forEach var="sessionKeyword" items="${sessionKeyword}" varStatus="i">
		listKeyword.push('${sessionKeyword.k_keyword}');
		listKeywordc.push('${sessionKeyword.cnt}');
		</c:forEach>
		/* function setInterval(){	
			for(var i=0;i<list.length;i++){
				
			}
		} 
		var i = 0;
		function test1() {
			test11 = setInterval(function() {
				$('#testView').text((i + 1) + '. ' + listKeyword[i]);
				i++;
				if (i == (listKeyword.length))
					i = 0;
			}, 1000);

		}

		test1();	*/
</script>

<script>
	/* 이메일 팝업창 */
	function emailPopup() {
		window.open("emailForm", "email보내기",
				"width=600, height=400, left=100, top=50");
	}
</script>

<style>
a {
	cursor: hand;
}

.circle2 {
	width: 30px;
	height: 30px;
	-moz-border-radius: 15px;
	-webkit-border-radius: 15px;
	border-radius: 15px;
	margin: 0 10;
	background-size: 100%;
	background-repeat: no-repeat;
	background-position: center;
	background-color: white;
	overflow: hidden;
	/* background-image: url("${path}/image/profile/photo.jpg"); */
}

#rank-list a {
	color: #FFF;
	text-decoration: none;
}

/* #rank-list a:hover {
	text-decoration: underline;
} */
#rank-list {
	float: right;
	overflow: hidden;
	width: 160px;
	height: 30px;
	margin: 0;
}

#rank-list dt {
	display: none;
}

#rank-list dd {
	position: relative;
	margin: 0;
}

#rank-list ol {
	position: absolute;
	top: 0;
	left: 0;
	margin: 0;
	padding: 0;
	list-style-type: none;
}

#rank-list li {
	text-align: left;
	font-size: 20px;
	height: 30px;
	line-height: 30px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AD-POOL</title>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-inverse navbar-expand-sm navbar-fixed-top">
			<!-- 최상단 배너 목록 [회원가입 , 로그인, 서브 메뉴 등]-->
			<div class="row">
				<div class="col-md-3">
					<a class="navbar-brand" href="main"> <img alt="adpool"
						src="${path}/bannerImage/adpool-logo.png" style="height: 30px;">
					</a>
				</div>
				<div class="col-md-9" style="margin-top: 10px;">
					<ul class="topbar_ul">
						<c:if test="${sessionScope.admin!=null}">
							<li><a href="adminPage">관리자페이지</a></li>
							<li><a onclick="logOut()">로그아웃</a></li>
						</c:if>
						<c:if test="${sessionScope.admin ==null}">
							<c:if test="${sessionScope.member==null}">
								<li><a data-toggle="modal" data-target="#loginFormView"
									id="	">로그인</a></li>
								<li><a data-toggle="modal" data-target="#joinFormView"
									id="joinBtn">회원가입</a></li>


							</c:if>
						</c:if>
						<c:if test="${sessionScope.member!=null}">
							<div class="circle2">
								<c:if test="${member.m_grade >= 4}">
									<img src="${member.m_picture}" width="30px" height="30px">
								</c:if>
								<c:if test="${member.m_grade <4 }">
									<c:if
										test="${member.m_picture != null && member.m_picture != '' }">
										<img src="${path}/upload/profile/${member.m_picture}"
											width="30px" height="30px">
									</c:if>
									<c:if
										test="${member.m_picture == null || member.m_picture == ''}">
										<img src="${path}/upload/profile/photo.jpg" width="30px"
											height="30px">
									</c:if>
								</c:if>


							</div>
							<li style="font-family: godo">${member.m_name}님:)</li>
							<li><a data-toggle="modal" data-target="#exampleModalCenter"
								onclick="logOut()">로그아웃</a></li>
							<li><a href="myPageForm">MyPage</a></li>
						</c:if>
					</ul>
				</div>
			</div>





			<!-- 상단 배너 사이트 로고 등 -->
			<div class="row">
				<div class="col-md-1"></div>
				<!-- <div class="navbar-header col-md-3">
					<a class="navbar-brand" href="main" style="color: white">모든 광고
						</a> <a class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse"> <span class="icon-bar"></span>
						<span class="icon-bar"></span> <span class="icon-bar"></span>
					</a>
				</div> -->
				<div class="col-md-6">
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<!-- <li><a href="#" onclick="aRequest('최신')">최신</a></li>
							<li><a href="#" onclick="aRequest('인기')">인기</a></li>
							<li><a href="#" onclick="aRequest('공공')">공공</a></li>
							<li><a href="#" onclick="aRequest('기업')">기업</a></li> -->
							<li><a href="trendView">트렌드</a></li>
							<li><a href="${path}/boardAdsView?category=latest">최신</a></li>
							<li><a href="${path}/boardAdsView?category=top">인기</a></li>
							<li><a href="${path}/boardAdsView?category=public">공공</a></li>
							<li><a href="${path}/boardAdsView?category=enterprise">기업</a></li>
							<li><a class="dropdown-toggle" data-toggle="dropdown"
								data-expended="false">공모전<span class="sr-only"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="${path}/boardAdsView?category=competition">공모작
											전시</a></li>
									<li><a href="personalUpForm">공모작 등록</a></li>
								</ul></li>
							<%-- <li><a href="${path}/noticeList">고객센터</a></li> --%>
							<li><a class="dropdown-toggle" data-toggle="dropdown"
								data-expended="false">고객센터<span class="sr-only"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="${path}/noticeList?ncategory=ntc">공지사항</a></li>
									<li><a href="${path}/noticeList?ncategory=faq">FAQ</a></li>
									<li><a href="${path}/noticeList?ncategory=csm">고객 게시판</a></li>
									<li id="email3"><a onclick="javascript:alert('로그인해주세요')"
										id="email2">Email보내기</a></li>
									<li><a href="aboutus">about us</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
				<!-- 검색 -->
				<div class="col-md-1"></div>
				<div class="col-md-4 collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<div class="navbar-form navbar-right">
						<div class="form-group">
							<input type="text" value="${keyword}" class="form-control"
								placeholder="Search" id="all_keyword">
						</div>
						<button id="allSearchAds"
							class="btn btn-default glyphicon glyphicon-search"
							style="height: 34px; vertical-align: middle; text-align: center; padding: 0px 10px;">
						</button>
						<dl id="rank-list">
							<dt>실시간 급상승 검색어</dt>
							<dd>
								<ol>
									<c:forEach var="sessionKeyword" items="${sessionKeyword}"
										varStatus="i">
										<li style="padding-left:10px"><a href="#">${i.index+1}.
												${sessionKeyword.k_keyword}</a></li>
									</c:forEach>
								</ol>
							</dd>
						</dl>
					</div>
					<div id="realTimeSearch"
						style="border-radius: 10px; display: none; right: 20px; width: 240px; height: 300px; position: absolute; background-color: #EAEAEA;">
						<h4 class="text text-primary">실시간 검색어</h4>
						<c:forEach var="sessionKeyword" items="${sessionKeyword}"
							varStatus="i">
							<li style="padding-left:5px;list-style: none; text-align: left; margin-left: 10px">
								<a style="color: black;"
								href="boardAdsView?keyword=${sessionKeyword.k_keyword}&category=allSearch">${i.index+1}.
									${sessionKeyword.k_keyword}</a>
							</li>
						</c:forEach>
					</div>
				</div>
			</div>
		</nav>
	</div>




	<div id="modalView">
		<!-- loginModal -->
		<div id="loginModal">
			<div class="modal fade" id="loginFormView" role="dialog"
				aria-labelledby="exampleModalLongTitle" aria-hidden="true">
				<div class="modal-dialog" role="document" style="width: 40%">
					<div class="modal-content">
						<div class="modal-header">
							<!-- 닫기(x) 버튼 -->
							<button type="button" class="close" data-dismiss="modal">×</button>
							<!-- header title -->
							<h4 class="modal-title">Login</h4>
						</div>
						<!-- body -->
						<div class="modal-body">
							<form action="login" method="post" id="loginfrm">
								<span>아이디</span> <span><input type="text" name="m_id"
									id="m_id" class="form-control" autofocus="autofocus"></span> <span>패스워드</span>
								<span><input type="password" name="m_password"
									id="m_password" class="form-control"></span> <span
									id="result_span" class="err"><br></span>
								<button type="button" class="btn btn-primary" id="btn_submit">로그인</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>

								<!-- 카톡 로그인 시작 -->
								<a href="kakaLogin"> <img
									src="${path}/image/login/kakao/kakao_login_btn_large.png"
									width="90px" />
								</a> <a href="naverLogin"><img
									src="${path}/image/login/naver/naverLogin3.png" width="90px"></a>


								<script type='text/javascript'>
									//<![CDATA[
									// 사용할 앱의 JavaScript 키를 설정해 주세요.
									Kakao
											.init('b9a092ee6b74c3d3e757f15670a98592');
									function loginWithKakao() {
										// 로그인 창을 띄웁니다.
										Kakao.Auth
												.login({
													success : function(authObj) {
														alert(JSON
																.stringify(authObj));
														// 로그인 성공시, API를 호출합니다.
														Kakao.API
																.request({
																	url : '/oauth/token',

																	success : function(
																			res) {
																		console
																				.log(JSON
																						.stringify(res.kaccount_email));
																		console
																				.log(JSON
																						.stringify(res.id));
																		console
																				.log(JSON
																						.stringify(res.properties.profile_image));
																		console
																				.log(JSON
																						.stringify(res.properties.nickname));
																	},
																	fail : function(
																			error) {
																		alert(JSON
																				.stringify(error));
																	}
																});
													},
													fail : function(err) {
														alert(JSON
																.stringify(err));
													}
												});
									};
									//]]>
								</script>
								<!-- 카톡 로그인 종료 -->

								<!-- <a id="kakao-login-btn"></a>
								<a href="http://developers.kakao.com/logout"></a>
								Kakao Login
								<script type="text/javascript">
									// 사용할 앱의 JavaScript 키를 설정해 주세요.
									Kakao.init('b9a092ee6b74c3d3e757f15670a98592');
									// 카카오 로그인 버튼을 생성합니다.
									Kakao.Auth.createLoginButton({
										container : '#kakao-login-btn',
										success : function(authObj) {
										// 로그인 성공시, API를 호출합니다.
											Kakao.API.request({
												url : '/v1/user/me',
												success : function(res) {
													console.log(JSON.stringify(res.kaccount_email));
													console.log(JSON.stringify(res.id));
													console.log(JSON.stringify(res.properties.profile_image));
													console.log(JSON.stringify(res.properties.nickname));
													},
													fail : function(error) {
															alert(JSON.stringify(error));
															}
														});
													},
													fail : function(err) {
														alert(JSON.stringify(err));
													}
												});
								</script> -->

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- joinModal -->
		<div id="joinModal">
			<!-- tabindex="-1" -->
			<div class="modal fade" id="joinFormView" role="dialog"
				aria-labelledby="exampleModalLongTitle" aria-hidden="true">
				<div class="modal-dialog" role="document" style="width: 40%">
					<div class="modal-content">
						<div class="modal-header">
							<!-- 닫기(x) 버튼 -->
							<button type="button" class="close" data-dismiss="modal">×</button>
							<!-- header title -->
							<h4 class="modal-title">회원가입</h4>
						</div>
						<!-- body -->
						<div class="modal-body">
							<div style="text-align: left">
								<form action="join" method="post" id="joinfrm">
									<span>아이디</span> <input type="text" name="m_id" id="join_id"
										class="form-control" autofocus="autofocus"> <span
										id="idChk" class="err"><br></span> <span>패스워드</span> <input
										type="password" name="m_password" id="join_password"
										class="form-control"> <span id="pwChk" class="err"><br></span>
									<span>패스워드확인</span> <input type="password" name="m_password2"
										id="join_password2" class="form-control"> <span
										id="pwChk2" class="err"><br></span> <span>이름</span> <input
										type="text" name="m_name" id="join_name" class="form-control">
									<span id="nameChk" class="err"><br></span> <span>Phone<br></span>
									<div class="row">
										<div class="col-sm-4">
											<select style="width: 110%" class="form-control"
												name="m_phone">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
										</div>
										<div class="col-sm-4">
											<input style="width: 110%" type="text" maxlength="4"
												name="phone2" id="join_phone2"
												class="form-control join_phone">
										</div>
										<div class="col-sm-4">
											<input style="width: 110%" type="text" maxlength="4"
												name="phone3" id="join_phone3"
												class="form-control join_phone">
										</div>
									</div>
									<span id="phoneChk" class="err"><br></span> <span>주소</span>
									<input type="text" name="m_address" id="join_address"
										class="form-control"> <span id="addressChk"
										class="err"><br></span>
									<%-- <div id="addressAPI">
									<%@include file="addressAPI.jsp" %>
									</div> --%>
									<span>이메일</span> <input type="text" name="m_email"
										id="join_email" class="form-control"> <span
										id="emailChk" class="err"><br></span> <span
										id="resultChk" class="err"><br></span>
									<button type="button" class="btn btn-primary" id="sub_btn">확인</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">닫기</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="emailModal">
			<!-- tabindex="-1" -->

			<div class="modal fade" id="emailFormView" role="dialog"
				aria-labelledby="exampleModalLongTitle" aria-hidden="true">
				<div class="modal-dialog" role="document" style="width: 40%">
					<div class="modal-content">
						<div class="modal-header">
							<!-- 닫기(x) 버튼 -->
							<button type="button" class="close" data-dismiss="modal">×</button>
							<!-- header title -->
							<h4 class="modal-title">메일작성</h4>
						</div>
						<!-- body -->
						<div class="modal-body">
							<div style="text-align: left">
								<form action="email" method="post" id="frm_email">
									<table class="table table-hover">
										<tr>
											<th style="background-color: #F0F0F0;">보내는분</th>
											<td><input type="email" name="email" required="required"
												class="form-control" autofocus="autofocus"></td>
										</tr>
										<tr>
											<th style="background-color: #F0F0F0;">제목</th>
											<td><input type="text" class="form-control" name="title"
												required="required"></td>
										</tr>
										<tr>
											<th style="background-color: #F0F0F0;">내용</th>
											<td><textarea rows="5" cols="30" class="form-control"
													name="content" required="required"></textarea></td>
										</tr>
										<tr>
											<td colspan="2"><button type="button" class="btn btn-primary"
													id="emailsub_btn">확인</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">닫기</button></td>
										</tr>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>