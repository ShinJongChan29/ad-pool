<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="jquerycss.jsp"%>
<%@ include file="main_header.jsp"%>
<!DOCTYPE html>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=chrome" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>KakaoLink v2 Demo(Default / Feed) - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<head>

<script>

	/* 댓글창 부분 */
	$(function() {
		$("#re_view").load("repleList?a_no=${board.a_no}");
		$("#rInsert").on("click", function() {
			if (!datfrm.r_content.value) {
				alert("글을 입력 후 사용하세요");
				datfrm.r_content.focus();
				return false;
			}
			sendData = $("#datfrm").serialize() + "&a_no=" + "${board.a_no}";
			$.post("reinsert",sendData, function(data) {
				alert("댓글이 작성되었습니다.");
				datfrm.r_content.value = "";
				$('#re_view').load("repleList?a_no=${board.a_no}");
			});
		});
	});
	function paging(pageNum){
		$.post('repleList',"replyPageNo="+pageNum+"&a_no="+"${board.a_no}",function(data){
			$('#re_view').html(data);
		});
	}
</script>

<!-- 페이스북 공유창 -->
<meta property="og:title" content="${board.a_subject}" />
<meta property="og:url"
	content="http://localhost/adpool/view?no=${board.a_no}" />
<meta property="og:description" content="${board.a_tag}" />
<meta property="og:image"
	content="https://img.youtube.com/vi/${board.a_loc}/0.jpg" />
<script>
	function sharefacebook(url) {
		window.open("http://www.facebook.com/sharer/sharer.php?u=" + url);
	}
	</script>

<style type="text/css">
@media ( min-width :970px) {
	.circle {
		width: 70px;
		height: 70px;
		-moz-border-radius: 35px;
		-webkit-border-radius: 35px;
		border-radius: 35px;
		margin: auto;
		background-size: 100%;
		background-repeat: no-repeat;
		background-position: center;
		overflow: hidden;
		background-color: grey;
		float: left;
		margin-right: 20px;
	}
	.wrapper2 {
		position: relative;
		padding-top: 87px;
		border: 1px none;
		text-align: center;
		min-height: 100%;
	}
	.content-container {
		float: left;
		width: 80%;
		margin-top: 35px;
	}
	.content-container2 {
		float: right;
		width: 18%;
		height: 100%;
		margin-top: 30%;
		border: 1px solid #76767638;
	}
	.content-wrapper {
		border: 1px solid #76767638;
		width: 100%;
		margin-top: 87px;
	}
	.content-wrapper-top {
		display: -webkit-box;
		display: flex;
		-webkit-box-orient: horizontal;
		-webkit-box-direction: normal;
		flex-direction: row;
		flex-wrap: wrap;
		-webkit-box-pack: justify;
		justify-content: space-between;
		padding: 35px 30px;
		padding-bottom: 0;
		background-color: transparent;
	}
	.content-wrapper-bottom {
		padding: 35px 30px;
		padding-top: 0;
	}
	.content-social {
		display: -webkit-box;
		display: flex;
		-webkit-box-orient: horizontal;
		-webkit-box-direction: normal;
		flex-direction: row;
		flex-wrap: wrap;
		-webkit-box-pack: justify;
		justify-content: space-between;
		flex-wrap: nowrap;
		width: 100%;
	}
	.content-share>ul {
		list-style: none;
		display: inline-flex;
		margin-top: 5px;
		margin-left: -15px;
	}
	.content-counter {
		display: -webkit-box;
		display: flex;
		-webkit-box-orient: horizontal;
		-webkit-box-direction: normal;
		flex-direction: row;
		flex-wrap: nowrap;
		align-self: center;
		-webkit-box-pack: start;
		justify-content: flex-start;
		padding: 15px 10px 15px 25px;
		border-top: none;
	}
	.content-like {
		color: grey;
		display: -webkit-box;
		display: flex;
		-webkit-box-orient: horizontal;
		-webkit-box-direction: normal;
		flex-direction: row;
		flex-wrap: nowrap;
		-webkit-box-align: center;
		align-items: center;
		visibility: visible;
		width: auto;
		margin-right: 10px;
	}
	.content-comment {
		color: grey;
		display: -webkit-box;
		display: flex;
		-webkit-box-orient: horizontal;
		-webkit-box-direction: normal;
		flex-direction: row;
		flex-wrap: nowrap;
		-webkit-box-align: center;
		align-items: center;
		visibility: visible;
		width: auto;
		margin-right: 10px;
		display: -webkit-box;
	}
	.content-media {
		display: -webkit-box;
		display: flex;
		-webkit-box-orient: horizontal;
		-webkit-box-direction: normal;
		flex-direction: row;
		flex-wrap: wrap;
		-webkit-box-pack: justify;
		justify-content: space-between;
		margin: 0;
		width: 100%;
		flex-wrap: nowrap;
		border: 1px solid grey;
	}
	.tag {
		padding: 20px;
		border: 1px solid #76767638;
		width: 100%;
		text-align: left;
	}
	.tag>ul {
		list-style: none;
	}
	.description {
		padding: 20px;
		border: 1px solid #76767638;
		width: 100%;
		text-align: left;
	}

	/* .caption {
	border: 1px solid #E5E5E5;
	-webkit-box-flex: 1;
	flex: 1 0 50%;
	margin-left: 30px;
} */
	.reple {
		background-color: #fff;
		padding: 20px;
		font-size: 14px;
		/* font-size: .875rem; */
		width: 100%;
		border: 1px solid grey;
	}
}

@media ( max-width :900px ) {
	.circle {
		width: 70px;
		height: 70px;
		-moz-border-radius: 35px;
		-webkit-border-radius: 35px;
		border-radius: 35px;
		margin: auto;
		background-size: 100%;
		background-repeat: no-repeat;
		background-position: center;
		overflow: hidden;
		background-color: grey;
		float: left;
		margin-right: 20px;
	}
	.wrapper2 {
		position: relative;
		padding-top: 87px;
		border: 1px none;
		text-align: center;
		min-height: 100%;
		z-index: 1000;
	}
	.container2 {
		height: 2%;
		width: 100%;
		text-align: center;
		margin: 0px auto;
		vertical-align: middle;
	}
	.content-container {
		width: 100%;
		margin-top: 35px;
	}
	.content-container2 {
		min-height: 180%;
		width: 100%;
		border: 1px solid #76767638;
	}
	.content-share>ul {
		list-style: none;
		display: inline-flex;
	}
	.tag>ul {
		list-style: none;
	}
	.content-wrapper {
		
	}
	.content-wrapper-top {
		
	}
	.content-wrapper-bottom {
		
	}
	.content-social {
		
	}
	.content-counter {
		
	}
	.content-like {
		
	}
	.content-comment {
		
	}
	.content-media {
		
	}
	.tag {
		padding: 20px;
		border: 1px solid #76767638;
		width: 100%;
		text-align: left;
	}
	.description {
		padding: 20px;
		border: 1px solid #76767638;
		width: 100%;
		text-align: left;
	}
	.reple {
		
	}
	.row1 {
		position: absolute;
		margin-top: 680%;
	}
	.thumbnail .caption {
		padding: 9px;
		color: #333;
	}
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		/* 트위터 공유 */
		function twitter_share(){ 
			  var text = " "+":: 공유합니다!"; 
			  var url = "${a_no}"; 
			  var snsUrl = "http://twitter.com/intent/tweet?text=${path}/view?no=${board.a_no}"+encodeURIComponent(text)+" "+ url; 
			  var popup= window.open(snsUrl, "_snsPopupWindow"); 
			  popup.focus(); 
			}
		
		/* 주소 공유 */
		function copy_trackback(trb) {
			var IE=(document.all)?true:false;
			if (IE) {
				if(confirm("현재 페이지의 주소를 클립보드에 복사하시겠습니까?"))
				window.clipboardData.setData("Text", trb);
				} else {
				temp = prompt("현재 페이지의 주소입니다. Ctrl+C를 눌러 클립보드로 복사하세요", trb);
			}
		}

	</script>

	<script type='text/javascript'>
	// 카카오톡 공유
	 Kakao.init('b9a092ee6b74c3d3e757f15670a98592');
	    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
	    function sendLink() {
	      Kakao.Link.sendDefault({
	        objectType: 'feed',
	        content: {
	          title: '${board.a_subject}',
	          description: '${board.a_tag}',
	          imageUrl: 'https://img.youtube.com/vi/${board.a_loc}/0.jpg',
	          link: {
	            mobileWebUrl: 'http://localhost/adpool/view?no=${board.a_no}',
	            webUrl: 'http://localhost/adpool/view?no=${board.a_no}'
	          }
	        },
	        social: {
	          likeCount: 286,
	          commentCount: 45,
	          sharedCount: 845
	        },
	        buttons: [
	          {
	            title: '웹으로 보기',
	            link: {
	              mobileWebUrl: 'http://localhost/adpool/view?no=${board.a_no}',
	              webUrl: 'http://localhost/adpool/view?no=${board.a_no}'
	            }
	          },
	          {
	            title: '앱으로 보기',
	            link: {
	              mobileWebUrl: '${path}/adpool/view?no=${board.a_no}',
	              webUrl: '${path}/adpool/view?no=${board.a_no}'
	            }
	          }
	        ]
	      });
	    }
	</script>
	<div id="fb-root"></div>
	<div class="container">
		<div class="content-container">
			<!-- 페이지 80% -->

			<!-- 메인타이틀, 정보 시작 -->
			<div class="wrapper2">
				<div class="content-wrapper-top">
					<div>
						<h1 align="left">${board.a_subject}</h1>
					</div>
				</div>
				<div class="content-wrapper-bottom">
					<h3 align="left">${board.a_category}</h3>
					<h4 align="left">
						director: <a href="#" style="color: black;">${board.a_name}</a>
					</h4>
					<h4 align="left">Posted: ${board.a_date}</h4>
				</div>

				<!-- 페이지 분할 -->
				<hr>

				<!-- 좋아요, 공유 부분 시작 -->
				<div class="content-social">
					
					<!-- 좋아요 카운트 시작 -->
					<div class="content-counter">
						<div class="content-like">
							<h5>좋아요: ${board.a_goodcount}</h5>
						</div>
						<div class="content-comment">
							<h5>comment: ${board.replycount}</h5>
						</div>
					</div>
					<!-- 좋아요 카운트 종료 -->

					<!-- 공유하기 시작 -->
					<div class="content-share">
						<h5 style="float: left; font-size: 2em; vertical-align: middle;">share</h5>
						<ul>
							<!-- 트위터 공유하기 -->
							<li style="margin: 0 5px;"><a
								href="javascript:twitter_share();"
								onclick="twitter_share('popup.html','','scrollbars=yes,width=626,height=436')">
									<img src="${path}/image/icon/twitter.png" width="35px"
									height="35px">
							</a></li>
							
							<!-- 페이스북 공유하기 -->
							<li style="margin: 0 5px;"><a
								href="javascript:sharefacebook('http://localhost/adpool/view?no=${board.a_no}')">
									<img src="${path}/image/icon/facebook.png" width="35px"
									height="35px">
							</a></li>
							
							<!-- 카카오 공유하기 -->
							<li style="margin: 0 5px;"><a href="javascript:void(0);"
								onclick="sendLink()"> <img
									src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
									width="35px" height="35px" /></a></li>
							
							<!-- 네이버 공유하기 -->
							<li style="margin: 0 5px;">
							<span>
								<script type="text/javascript" src="https://ssl.pstatic.net/share/js/naver_sharebutton.js"></script>
								<script type="text/javascript">
								new ShareNaver.makeButton({"type": "e" , "title":"ad-pool 영상 공유::"});
								</script>
							</span>
							</li>
							
							<!-- URL 복사, 공유하기 -->
							<li style="margin: 0 5px;"><a
								href="${path}/view?no=${board.a_no}"
								onclick="copy_trackback(this.href); return false;"> <img
									src="${path}/image/icon/share.png" width="35px" height="35px"></a></li>
						</ul>
					</div>
					<!-- 공유하기 종료 -->
					
				</div>
				<!-- 좋아요, 공유 부분 종료 -->

				<!-- 영상 재생 -->
				<div class="media">
					<div class="content-media">
					<c:if test="${board.a_grade!=4 }">
						<iframe width="100%" height="480"
							src="https://www.youtube.com/embed/${board.a_loc }"
							frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</c:if>
					<c:if test="${board.a_grade ==4 }">
						<iframe width="100%" height="480" src="${board.a_url}">
					</iframe>	
					</c:if>
					</div>
				</div>

				<!-- 태그 박스 부분 -->
				<div class="tag">
					<h3>tag</h3>
					<ul>
						<c:forEach var="t" items="${tl}" begin="1">
							<li><a href="boardAdsView?category=latest&a_tag=${t}">
									<h4 style="color: hotpink;">#${t}</h4>
							</a></li>
						</c:forEach>
					</ul>
				</div>
				<!-- 태그 종료 -->

				<!-- 설명 박스 부분 -->
				<div class="description">
					<h3>Description</h3>
					<h4 style="color: #333; margin-left: 40px;">${board.a_content}</h4>
				</div>
				<!-- 설명 종료 -->



			</div>
			<!-- 메인타이틀, 정보 종료 -->
			<br> <br>
		</div>
	</div>
	<!-- 광고 공간 시작 -->
	<div class="content-container2">
		<h2>광고 공간</h2>
	</div>
	<!-- 광고 공간 종료 -->


	<!-- 댓글 창 -->
	<div class="container2">
		<div style="clear: both; margin: 20px;">
			<h3 class="text-primary" style="text-align: left">댓글 작성</h3>
			<form id="datfrm" name="datfrm" style="float: left">

				<div>
					<c:if test="${member.m_picture != null }">
						<c:if test="${member.m_grade < 4 }">
						<img src="${path}/upload/profile/${member.m_picture}" width="70px"
							height="70px" class="circle">
						</c:if>
						<c:if test="${member.m_grade >= 4 }">
						<img src="${member.m_picture}" class="circle">
						</c:if>	
					</c:if>
					<c:if test="${member.m_picture == null }">
						<img src="${path}/upload/profile/photo.jpg" width="70px"
							height="70px" class="circle">
					</c:if>
					<c:if test="${member!=null }">
						<textArea name="r_content" class="form-control"
							style="width: 970px; height: 70px;"></textArea>
						<input type="button" class="btn btn-primary"
							style="float: right; margin-top: 20px; size: em; font-size: 1.2em;"
							value="등록하기" id="rInsert">
					</c:if>
					<c:if test="${member==null }">
						로그인 후 사용가능합니다.
						</c:if>
				</div>
			</form>
		</div>
		<!-- 댓글창 종료 -->

		<!-- 댓글 목록 불러오기 -->
		<div id="re_view" style="clear: both; text-align: left"></div>

		<hr>

		<!-- 다른 영상 목록 시작 -->
		<div class="row">
			<c:forEach var="tlist" items="${tlist}" varStatus="i">
				<div class="col-sm-6 col-md-3">

					<!-- 썸네일 부분 -->
					<div class="thumbnail">
						<c:if test="${tlist.a_filename !='0' }">
							<a href="view?no=${tlist.a_no}"><img width="190" height="190"
								src="${path}/upload/adsImg/${tlist.a_loc}"
								onError="javascript:this.src='${path}/image/error.png'"></a>
						</c:if>
						<c:if test="${tlist.a_url !='0' }">
							<a href="view?no=${tlist.a_no}"><img width="190" height="190"
								src="https://img.youtube.com/vi/${tlist.a_loc}/0.jpg"
								onError="javascript:this.width='190',height='190',src='${path}/image/error.png'">
							</a>
						</c:if>
						<!-- 썸네일 부분 -->


						<div class="caption">
							<div style="height: 50px;">
								<h3 class="highlight">${tlist.a_subject}</h3>
							</div>
							<br>
							<div style="height: 30px;">
								<h4 align="left">
									제작 : <b class="highlight">${tlist.a_name}</b>
								</h4>
							</div>
							<br>
							<h5 align="left" style="font-style: italic">
								<a href="view?no=${tlist.a_no}" style="color: black;">view
									contents</a>
							</h5>
							<hr>
							<div class="row">
								<div class="offset-col-md-1 col-md-7">
									<p>
										<c:set var="a_no" value="'/'${tlist.a_no}'/'"></c:set>
										<c:if test="${like_map[tlist.a_no]==null}">
											<a onclick="like(${tlist.a_no},${pb.currentPage})"><img
												src="${path}/image/icon/likeon.png" width="30px"
												height="30px"></a>
										</c:if>
										<c:if test="${like_map[tlist.a_no]}">
											<a onclick="downlike(${tlist.a_no},${pb.currentPage})"><img
												src="${path}/image/icon/likeoff.png" width="30px"
												height="30px"></a>
										</c:if>
									</p>
									<p style="text-align: center;">${tlist.a_goodcount}&nbsp;like</p>
								</div>
								<div class="col-md-3 offset-col-md-1">
									<p>
										<a href="view?no=${tlist.a_no}"><img
											src="${path}/image/icon/eye.png" width="30px" height="30px"></a>
									</p>
									<p>${tlist.a_viewcount}&nbsp;views</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<%-- 	<div id="re_view" style="clear: both; text-align: left"></div>
					<c:forEach var="k" items="${tlist}">
						<div class="col-sm-6 col-md-3">
							<div class="thumbnail">
								<div class="caption">
									<iframe width="190" height="190" src="${k.a_url}"
										frameborder="0" allow="autoplay; encrypted-media"
										allowfullscreen></iframe>
									<h3>제목: ${k.a_subject}</h3>
									<p>작성자: ${k.a_name}</p>
									<p>조회수: ${k.a_viewcount }</p>
									<a href="view?no=${k.a_no}" class="btn btn-primary"
										role="button">감상하기</a>
								</div>
							</div>
						</div>
					</c:forEach> --%>
		<!-- 다른 영상 목록 종료 -->
	</div>


	<!-- 푸터 삽입 시작 -->
	<div class="row1" style="clear: both">
		<%@include file="footer.jsp"%>
	</div>
	<!-- 푸터 종료 -->
</body>
</html>