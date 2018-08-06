<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tag.jsp"%>
<%@ include file="main_header.jsp"%>
<html>
<script>
	function downlike(no, pno) {
		var nowP = pno;
		$.ajax({
			type : "POST",
			url : "downlike",
			async : false,
			data : {
				no : no,
				currentP : pno
			},
			//   dataType : "json",
			//   cache : false,
			success : function(data) {
				$.post('AdsFavoritList', function(data) {
					$('.profileContents').html(data);
				});
			},
			error : function(data) {
				alert("실패" + data);
				console.log("2");
				return false;
			}
		});
	}
	$(function() {
		var delBtn = $('#delConfirm');
		var modfiBtn = $('#updateConfirm');
		var fileIn = $('#files');
		delBtn.on("click", function() {
			if (confirm('정말 탈퇴 하시겠습니까?')) {
				$.post('mDel', function(data) {
					alert('정상적으로 탈퇴되었습니다.');
					location.href = data;
				});
			}
		});
		modfiBtn
				.on(
						"click",
						function() {
							var chkPw = 1;
							var chkEmail = 1;
							var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							if (myfrm.mypassword.value != '') {
								//패스워드 변경시
								if (myfrm.mypassword.value.length<6 || myfrm.mypassword.value.length >12) {
									$('#pwChk').html(
											"비밀번호는 6글자 이상 12글자 이하입니다<br>");
									myfrm.m_password.focus();
									return false;
								} else {
									$('#pwChk').html("<br>");
									chkPw = 0;
								}
							} else {
								//패스워드 미 변경시.
								$('#pwChk').html("<br>");
								chkPw = 0;
							}
							if (!myfrm.myemail.value.match(regEmail)) {
								$('#emailChk').html("이메일을 형식에 맞춰서 입력하세요<br>");
							} else {
								$('#emailChk').html("<br>");
								chkEmail = 0;
							}
							if (chkPw == 0 && chkEmail == 0) {
								alert('수정완료');
								$('#myfrm').submit();
							}

						});
		fileIn.on("change", function(evt) {
			var input = evt.target;

			var reader = new FileReader();
			reader.onload = (function(e) {
				var dataURL = reader.result;
				var output = $('#output');
				output.attr('src', dataURL);
				output.attr('width', '140px');
				output.attr('height', '140px');
			});

			reader.readAsDataURL(input.files[0]);
		});
	})
</script>
<head>
<style>
.circle {
	width: 140px;
	height: 140px;
	-moz-border-radius: 70px;
	-webkit-border-radius: 70px;
	border-radius: 70px;
	margin: auto;
	background-size: 100%;
	background-repeat: no-repeat;
	background-position: center;
	overflow: hidden;
	/* background-image: url("${path}/image/profile/photo.jpg"); */
}

.myPageArea {
	font-family: 맑은 고딕;
	margin-top: 5%;
}

h3 {
	text-align: center;
}

.profileArea {
	margin-top: 10%;
}

.vailArea {
	margin: auto;
	font-style: italic;
	width: 35%;
}

.err {
	text-align: center;
}

.menu-wrapperArea {
	display: flex;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	flex-direction: row;
	flex-wrap: wrap;
	-webkit-box-pack: justify;
	justify-content: space-between;
	padding: 35px 30px;
	padding-bottom: 0;
}

#myfarads {
	cursor: pointer;
}

.myPageFooter {
	margin-bottom: 10%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	$(function() {
		mContentArea = $('#myContentArea');
		infoValiArea = $('#infoValidateArea');
		error = $('#infoValiPwErr');
		valipw = $('#valiPw');
		myfar = $('#myfarads');
		myPro = $('#myProfile');
		mContentArea.hide();
		myfar.hide();
		valipw.focus();
		infoValiArea.on("keyup", function(e) {
			if (e.keyCode == 13) {
				sendData = {
					m_id : myfrm.m_id.value,
					m_password : valipw.val()
				};
				$.post('pwChk', sendData, function(data) {
					if (valipw.val() == data) {
						infoValiArea.toggle("drop");
						mContentArea.toggle("fast");
						myfar.toggle('drop', function() {
							myfar.animate(200);
						});
					} else {
						error.html(data);
					}
				});
			}
		});
		myfar.on('click', function() {
			$.post('AdsFavoritList', function(data) {
				$('.profileContents').html(data);
			});
		});
	})

	function like(no, pno) {
		alert('${memId}');
		var mem_id = '${memId}';
		var nowP = pno;
		if (mem_id == "") {
			alert("로그인 해주세요");
		} else {

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
	function page(pageNum) {
		refreshView(pageNum);
	}
	function downlike(no, pno) {
		var nowP = pno;
		$.ajax({
			type : "POST",
			url : "downlike",
			async : false,
			data : {
				no : no,
				currentP : 1
			//pno
			},
			success : function(data) {
				$.post('AdsFavoritList', function(data) {
					$('.profileContents').html(data);
				});
				return false;
			},
			error : function(data) {
				alert("실패" + data);
				console.log("2");
				return false;
			}
		});
	}
	
 	
</script>
<body>
	<!-- body -->
	<div class="myPageArea">
		<div class="col-md-2"></div>
		<div class="col-md-8">



			<div class="profileArea">
				<div class="menu-wrapperArea">
					<div id="myProfile">
						<h2 class="text-primary">Profile</h2>
					</div>
					<div id="myfarads">
						<h2 class="text-primary">MyFavoritAds</h2>
					</div>
				</div>

				<hr />
				<div class="profileContents">
					<form action="mUpdate" method="post" id="myfrm"
						enctype="multipart/form-data">
						<input type="hidden" name="m_id" value="${member.m_id }">
						<div class="circle">
							<c:if test="${member.m_grade>=4 }">
								<img src="${member.m_picture}" width="140px" height="140px">
							</c:if>
							<c:if test="${member.m_grade<4 }">
								<c:if
								test="${member.m_picture != null && member.m_picture != '' }">
								<img src="${path}/upload/profile/${member.m_picture}"
									width="140px" height="140px">
							</c:if>
								<c:if
								test="${member.m_picture == null || member.m_picture == ''}">
								<img src="${path}/upload/profile/photo.jpg" width="140px"
									height="140px">
							</c:if>
						</c:if>
						</div>
						<div id="infoValidateArea" class="vailArea">
							<br> <input type="password" id="valiPw" class="form-control"
								placeholder="Password...">
							<div id="infoValiPwErr" class="err"></div>
						</div>

						<div id="myContentArea">
							<h3>${member.m_id }(${member.m_name})</h3>

							<span>패스워드</span> <input type="password" name="m_password"
								id="mypassword" class="form-control"> <span id="pwChk"
								class="err"><br></span> <span>주소</span> <input type="text"
								name="m_address" id="myaddress" class="form-control"
								value="${member.m_address }"> <span id="addressChk"
								class="err"><br></span> <span>이메일</span> <input type="text"
								name="m_email" id="myemail" class="form-control"
								value="${member.m_email }"> <span id="emailChk"
								class="err"></span> <span id="resultChk" class="err"></span> <span>프로필
								사진 변경 : </span><input type="file" name="m_file" id="files">
							<div class="circle" id="examImg">
								<img id="output" src="">
							</div>
							<br>
							<div class="myPageFooter">
								<button type="button" class="btn btn-danger"
									style="float: left;" id="delConfirm">회원 탈퇴</button>
								<button type="button" class="btn btn-warning"
									style="float: right;" id="updateConfirm">수정 완료</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	<!-- Footer -->
</body>
</html>