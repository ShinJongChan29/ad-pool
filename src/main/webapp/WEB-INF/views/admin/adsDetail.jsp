<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(function() {
		$('#adsupdateBtn').on('click', function() {
			$('.adsDetail_td').removeAttr('disabled');
		});
	
	})
	function preNext(str){
		$.post('nextDetail','preNext='+str
				+'&a_grade='+${selAds.a_grade}
				+'&a_no='+${selAds.a_no},function(data){
					fadeVIew(data);
				});
	}
	

</script>
<body>
	<h2 class="text">Ads 상세보기</h2>
		<span>이미지<span style="margin-left:25%">&nbsp;</span>동영상<br></span>
	<div class="detailAdscontent" style="display:inline-flex;">
	<c:if test="${selAds.a_filename !='0' }">
		<img width="190" height="190"
			src="${path}/upload/adsImg/${selAds.a_loc}"
			onError="javascript:this.src='${path}/image/error.png'">
		<span style="margin-left:5%">&nbsp;</span>
		<video width="190" height="190" controls>
  			<source src="${path}/upload/adsVideo/${selAds.a_filename}" type="video/mp4">
		</video>
	</c:if>

	<c:if test="${selAds.a_url !='0' }">
		<img width="190" height="190"
			src="https://img.youtube.com/vi/${selAds.a_loc}/0.jpg"
			onError="javascript:this.src='${path}/image/error.png'">
		<span style="margin-left:5%">&nbsp;</span>
		<iframe width="190" height="190"
			src="https://www.youtube.com/embed/${selAds.a_loc }" frameborder="0"
			allow="autoplay; encrypted-media" allowfullscreen></iframe>	
	</c:if>
	</div>
	<div class="left" style="text-align: left">
		<button id="adsupdateBtn" class="btn btn-info">변경</button>
		<c:if test="${selAds.a_grade == 3}">
		<button onclick="adsPermit('disagree')" class="btn btn-success">Agree</button>
		</c:if>
		<c:if test="${selAds.a_grade == 2}">
		<button onclick="adsPermit('agree')" class="btn btn-default">Agree</button>
		</c:if>
	</div>
	<div class="right" style="text-align:right">
	<c:if test="${selAds.rn!=1}">
		<button onclick="preNext('previous')">이전</button>
	</c:if>	
		<button onclick="preNext('next')">다음</button>
		
	</div>
	<form id="frm_adsDetail" action="admemberupdate">
		<table class="table table-hover table-bordered">

			<tr>
				<td>No</td>
				<td><input class="form-control adsDetail_td" type="hidden"
					name="a_no" value="${selAds.a_no}">${selAds.a_no}</td>
			</tr>
			<tr>
				<td>Subject</td>
				<td><input class="form-control adsDetail_td" name="a_subject"
					type="text" disabled="disabled" value="${selAds.a_subject}"></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input class="form-control adsDetail_td" name="a_name"
					type="text" disabled="disabled" value="${selAds.a_name}"></td>
			</tr>
			<tr>
				<td>Content</td>
				<td><textarea name="a_content"
						class="form-control adsDetail_td" disabled="disabled">${selAds.a_name}</textarea>
			</tr>
			<tr>
				<td>Category</td>
				<td><select name="a_category" class="form-control adsDetail_td" disabled="disabled">
						<option value="${selAds.a_category}">>${selAds.a_category}</option>
						<option value="Sports">Sports</option>
						<option value="TV">TV</option>
						<option value="Drama">Drama</option>
				</select></td>
			</tr>
			<tr>
				<td>Country</td>
				<td><select name="a_country" class="form-control adsDetail_td" disabled="disabled">
						<option value="${selAds.a_country}">>${selAds.a_country}</option>
						<option value="Korea">Korea</option>
						<option value="Japan">Japan</option>
						<option value="America">America</option>
				</select></td>
			</tr>
			<tr>
				<td>Kind</td>
				<td><select name="a_kind" class="form-control adsDetail_td" disabled="disabled">
						<option value="${selAds.a_kind}">>${selAds.a_kind}</option>
						<option value="Personal">Personal</option>
						<option value="Enterprise">EntrerPrise</option>
				</select></td>
			</tr>
			<tr>
				<td>Grade</td>
				<td><select name="a_grade" class="form-control adsDetail_td" disabled="disabled">
						<option value="${selAds.a_grade}">>${selAds.a_grade}</option>
						<option value=1>1</option>
						<option value=2>2</option>
						<option value=3>3</option>
						<option value=4>4</option>
				</select>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${selAds.a_viewcount}</td>
			</tr>
			<tr>
				<td>좋아요</td>
				<td>${selAds.a_goodcount}</td>
			</tr>
			<tr>
				<td>작성날짜</td>
				<td>${selAds.a_date}</td>
			</tr>
			<tr>
				<td>파일 종류</td>
				<td><c:if test="${selAds.a_url=='0'}">
					FileUpload
					</c:if> <c:if test="${selAds.a_filename=='0'}">
					URL
					</c:if></td>
			</tr>
			<tr>
				<td>파일이름/URL</td>
				<td><c:if test="${selAds.a_url=='0'}">
						<input type="hidden" name="a_url" value="0">
						<input class="form-control adsDetail_td" name="a_filename"type="text" value="${selAds.a_filename}" disabled="disabled">
					</c:if> <c:if test="${selAds.a_filename=='0'}">
							<input type="hidden" name="a_filename" value="0">
						<input class="form-control adsDetail_td" name="a_url"type="text" value="${selAds.a_url }" disabled="disabled">
					</c:if></td>
			</tr>
			<tr>
				<td>삭제여부</td>
				<td><select name="a_del" class="form-control adsDetail_td" disabled="disabled">
						<option value="${selAds.a_del}">>${selAds.a_del}</option>
						<option value="N">N</option>
						<option value="Y">Y</option>
				</select></td>
			</tr>
	
			<tr>
				<td>이미지/아이디값</td>
				<td><input class="form-control adsDetail_td" type="text" name="a_loc" value="${selAds.a_loc}" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td>태그</td>
				<td><input class="form-control adsDetail_td" type="text" name="a_tag" value="${selAds.a_tag}" disabled="disabled"></td>
			</tr>
			<tr>

			</tr>
			<tr>

			</tr>
		</table>
	</form>
	<button onclick="adsUpdate()" class="btn btn-primary">수정완료</button>
	<button onclick="adsdel('Y')" class="btn btn-warning">삭제하기</button>
	<button onclick="adsdel('DB')" class="btn btn-danger">완전삭제</button>
	
</body>
</html>