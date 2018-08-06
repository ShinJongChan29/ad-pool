<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	$(function() {
		var ncategory = ${ncategory};
		/* alert($(notice).attr('id')); */
		$(ncategory).parent().addClass("active");
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="contents"></div>
	<div class="wrapper" id="notice">
		<div class="tapmenu centered">
			<h1>고객센터</h1>
			
		<div id="cslist">
			<!-- 공지사항 탭 -->
			<div>
				<nav class="navbar navbar-inverse">
					<!-- 최상단 배너 목록 [회원가입 , 로그인, 서브 메뉴 등]-->
					<div>
						<ul class="nav nav-pills nav-justified">
							<li><a href="${path}/noticeList?ncategory=ntc" id="ntc">공지사항</a></li>
							<li><a href="${path}/noticeList?ncategory=faq" id="faq">FAQ</a></li>
							<li><a href="${path}/noticeList?ncategory=csm" id="csm">고객 게시판</a></li>
						</ul>
					</div>
				</nav>
			</div>

			<c:if test="${ncategory=='ntc'}">
				<!-- 테이블 뷰 -->
				<div>
					<table class="table table-bordered table-hover">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
						<c:if test="${empty nlist}">
							<tr>
								<th colspan="5">데이터가 없습니다</th>
							</tr>
						</c:if>
						<c:if test="${not empty nlist}">
							<c:forEach var="nboard" items="${nlist}" varStatus="i">
								<tr>
									<td>${no}</td>
									<td><a style="color: black;"
										href="csView?ncategory=ntc&pageNum=${pb.currentPage}&no=${nboard.n_no}">${nboard.n_subject}</a></td>
									<td>${nboard.n_name}</td>
									<td>${nboard.n_count}</td>
									<td>${nboard.n_date}</td>
								</tr>
								<c:set var="no" value="${no - 1}"></c:set>
							</c:forEach>
						</c:if>
					</table>
					<!-- 테이블 뷰 종료 -->

					<div class="row">
						<!-- 검색 시작 -->
						<div class="col-md-9" align="left">
							<form action="noticeList?ncategory=${ncategory}">
								<input type="hidden" name="pageNum" value="1">
								<input type="hidden" name="ncategory" value="${ncategory}">

								<!-- 내가 검색한 옵션이 그대로 유지하기 위해 사용 -->
								<select name="search"
									style="height: 26; vertical-align: middle;">
									<c:forTokens var="sh" items="제목, 작성자, 내용, 제목+내용" delims=","
										varStatus="i">
										<c:if test="${t[i.index]==notice.search}">
											<option value="${t[i.index]}" selected="selected">${sh}</option>
										</c:if>
										<c:if test="${t[i.index]!=notice.search}">
											<option value="${t[i.index]}">${sh}</option>
										</c:if>
									</c:forTokens>
								</select>
								<!-- 검색옵션 유지 종료 -->
								<input type="text" name="keyword" value="${notice.keyword}"
									style="vertical-align: middle;"> <input type="submit"
									value="확인" style="vertical-align: middle;">
							</form>
						</div>
						<!-- 검색 끝 -->
						<c:if test="${not empty sessionScope.admin}">
							<div class="col-md-3" align="right">
								<a href="csInsertForm?ncategory=${ncategory}&pageNum=${pageNum}"
									class="btn btn-primary">게시글 입력</a>
							</div>
						</c:if>
					</div>

					<!-- 페이지네이션 시작 -->
					<div align="center">
						<ul class="pagination">
							<c:if test="${pb.startPage > pb.pagePerBlock}">
								<!-- 맨 처음페이지로 가기 -->
								<li><a
									href="noticeList?ncategory=${ncategory}&pageNum=1&search=${notice.search}&keyword=${notice.keyword}"><span
										class="glyphicon glyphicon-step-backward"></span></a></li>
								<!-- 이전 페이지로 가기 -->
								<li><a
									href="noticeList?ncategory=${ncategory}&pageNum=${pb.startPage - 1}&search=${notice.search}&keyword=${notice.keyword}"><span
										class="glyphicon glyphicon-chevron-left"></span></a></li>
							</c:if>
							<!-- 페이지 리스트 -->
							<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
								<c:if test="${i!=pb.currentPage}">
									<li><a
										href="noticeList?ncategory=${ncategory}&pageNum=${i}&search=${notice.search}&keyword=${notice.keyword}">${i}</a></li>
								</c:if>
								<c:if test="${i==pb.currentPage}">
									<li class="active"><a
										href="noticeList?ncategory=${ncategory}&pageNum=${i}&search=${notice.search}&keyword=${notice.keyword}">${i}</a></li>
								</c:if>
							</c:forEach>
							<!-- 다음 페이지로 가기 -->
							<c:if test="${pb.startPage < pb.totalPage}">
								<li><a
									href="noticeList?ncategory=${ncategory}&pageNum=${pb.endPage + 1}&search=${notice.search}&keyword=${customer.keyword}"><span
										class="glyphicon glyphicon-chevron-right"></span></a></li>
							</c:if>
							<!-- 맨 마지막 페이지로 가기 -->
							<li><a
								href="noticeList?ncategory=${ncategory}&pageNum=${pb.totalPage}&search=${notice.search}&keyword=${customer.keyword}"><span
									class="glyphicon glyphicon-step-forward"></span></a>
							<li>
						</ul>
					</div>
					<!-- 페이지네이션 끝 -->

				</div>
			</c:if>


			<c:if test="${ncategory=='faq'}">
				<!-- 테이블 뷰 -->
				<div>
					<table class="table table-bordered table-hover">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
						<c:if test="${empty nlist}">
							<tr>
								<th colspan="5">데이터가 없습니다</th>
							</tr>
						</c:if>
						<c:if test="${not empty nlist}">
							<c:forEach var="nboard" items="${nlist}">
								<tr>
									<td>${no}</td>
									<td><a style="color: black;"
										href="csView?ncategory=faq&pageNum=${pb.currentPage}&no=${nboard.n_no}">${nboard.n_subject}</a></td>
									<td>${nboard.n_name}</td>
									<td>${nboard.n_count}</td>
									<td>${nboard.n_date}</td>
								</tr>
								<c:set var="no" value="${no - 1}"></c:set>
							</c:forEach>
						</c:if>
					</table>
					<!-- 테이블 뷰 종료 -->

					<div class="row">
						<!-- 검색 시작 -->
						<div class="col-md-9" align="left">
							<form action="noticeList?ncategory=${ncategory}">
								<input type="hidden" name="pageNum" value="1">
								<input type="hidden" name="ncategory" value="${ncategory}">

								<!-- 내가 검색한 옵션이 그대로 유지하기 위해 사용 -->
								<select name="search"
									style="height: 26; vertical-align: middle;">
									<c:forTokens var="sh" items="제목, 작성자, 내용, 제목+내용" delims=","
										varStatus="i">
										<c:if test="${t[i.index]==notice.search}">
											<option value="${t[i.index]}" selected="selected">${sh}</option>
										</c:if>
										<c:if test="${t[i.index]!=notice.search}">
											<option value="${t[i.index]}">${sh}</option>
										</c:if>
									</c:forTokens>
								</select>
								<!-- 검색옵션 유지 종료 -->
								<input type="text" name="keyword" value="${notice.keyword}" style="vertical-align: middle;">
								<input type="submit" value="확인" style="vertical-align: middle;">
							</form>
						</div>
						<!-- 검색 끝 -->
						<c:if test="${not empty sessionScope.admin}">
							<div class="col-md-3" align="right">
								<a href="csInsertForm?ncategory=${ncategory}&pageNum=${pageNum}"
									class="btn btn-primary">게시글 입력</a>
							</div>
						</c:if>
					</div>

					<!-- 페이지네이션 시작 -->
					<div align="center">
						<ul class="pagination">
							<c:if test="${pb.startPage > pb.pagePerBlock}">
								<!-- 맨 처음페이지로 가기 -->
								<li><a
									href="noticeList?ncategory=${ncategory}&pageNum=1&search=${notice.search}&keyword=${notice.keyword}"><span
										class="glyphicon glyphicon-step-backward"></span></a></li>
								<!-- 이전 페이지로 가기 -->
								<li><a
									href="noticeList?ncategory=${ncategory}&pageNum=${pb.startPage - 1}&search=${notice.search}&keyword=${notice.keyword}"><span
										class="glyphicon glyphicon-chevron-left"></span></a></li>
							</c:if>
							<!-- 페이지 리스트 -->
							<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
								<c:if test="${i!=pb.currentPage}">
									<li><a
										href="noticeList?ncategory=${ncategory}&pageNum=${i}&search=${notice.search}&keyword=${notice.keyword}">${i}</a></li>
								</c:if>
								<c:if test="${i==pb.currentPage}">
									<li class="active"><a
										href="noticeList?ncategory=${ncategory}&pageNum=${i}&search=${notice.search}&keyword=${notice.keyword}">${i}</a></li>
								</c:if>
							</c:forEach>
							<!-- 다음 페이지로 가기 -->
							<c:if test="${pb.startPage < pb.totalPage}">
								<li><a
									href="noticeList?ncategory=${ncategory}&pageNum=${pb.endPage + 1}&search=${notice.search}&keyword=${customer.keyword}"><span
										class="glyphicon glyphicon-chevron-right"></span></a></li>
							</c:if>
							<!-- 맨 마지막 페이지로 가기 -->
							<li><a
								href="noticeList?ncategory=${ncategory}&pageNum=${pb.totalPage}&search=${notice.search}&keyword=${customer.keyword}"><span
									class="glyphicon glyphicon-step-forward"></span></a>
							<li>
						</ul>
					</div>
					<!-- 페이지네이션 끝 -->

				</div>
			</c:if>
			<!-- 공지사항, FAQ 종료 -->

			<!-- 고객게시판 시작 -->
			<c:if test="${ncategory=='csm'}">
				<!-- 테이블 뷰 -->
				<div>
					<table class="table table-bordered table-hover">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
						<c:if test="${empty clist}">
							<tr>
								<th colspan="5">데이터가 없습니다</th>
							</tr>
						</c:if>
						<c:if test="${not empty clist}">
							<c:forEach var="cboard" items="${clist}">
								<tr>
									<td>${no}</td>
									<c:if test="${cboard.c_del=='y'}">
										<td colspan="5">삭제된 글입니다</td>
									</c:if>
									<c:if test="${cboard.c_del!='y' }">
										<td title="${cboard.c_subject}"><c:if
												test="${cboard.c_re_level > 0}">
												<img alt="" src="${path}/image/ref/level.gif" height="5"
													width="${cboard.c_re_level*10}">
												<img alt="" src="${path}/image/ref/re.gif">
											</c:if> <a style="color: black;"
											href="csView?ncategory=csm&pageNum=${pb.currentPage}&no=${cboard.c_no}">${cboard.c_subject}</a>
											<c:if test="${cboard.c_count > 50}">
												<img alt="" src="${path}/image/ref/hot.gif">
											</c:if></td>
										<td>${cboard.c_name}</td>
										<td>${cboard.c_count}</td>
										<td>${cboard.c_date}</td>
									</c:if>
								</tr>
								<c:set var="no" value="${no - 1}"></c:set>
							</c:forEach>
						</c:if>
					</table>
					<!-- 테이블 뷰 종료 -->

					<div class="row">
						<!-- 검색 시작 -->
						<div class="col-md-9" align="left">
							<form action="noticeList?ncategory=${ncategory}">
								<input type="hidden" name="pageNum" value="1">
								<input type="hidden" name="ncategory" value="${ncategory}">

								<!-- 내가 검색한 옵션이 그대로 유지하기 위해 사용 -->
								<select name="search"
									style="height: 26; vertical-align: middle;">
									<c:forTokens var="sh" items="제목, 작성자, 내용, 제목+내용" delims=","
										varStatus="i">
										<c:if test="${t[i.index]==customer.search}">
											<option value="${t[i.index]}" selected="selected">${sh}</option>
										</c:if>
										<c:if test="${t[i.index]!=customer.search}">
											<option value="${t[i.index]}">${sh}</option>
										</c:if>
									</c:forTokens>
								</select>
								<!-- 검색옵션 유지 종료 -->
								<input type="text" name="keyword" value="${customer.keyword}"
									style="vertical-align: middle;"> <input type="submit"
									value="확인" style="vertical-align: middle;">
							</form>
						</div>
						<!-- 검색 끝 -->
						<div class="col-md-3" align="right">
							<a href="csInsertForm?ncategory=csm" class="btn btn-primary">게시글
								입력</a>
						</div>
					</div>

					<!-- 페이지네이션 시작 -->
					<div align="center">
						<ul class="pagination">
							<c:if test="${pb.startPage > pb.pagePerBlock}">
								<!-- 맨 처음페이지로 가기 -->
								<li><a
									href="noticeList?ncategory=csm&pageNum=1&search=${customer.search}&keyword=${customer.keyword}"><span
										class="glyphicon glyphicon-step-backward"></span></a></li>
								<!-- 이전 페이지로 가기 -->
								<li><a
									href="noticeList?ncategory=csm&pageNum=${pb.startPage - 1}&search=${customer.search}&keyword=${customer.keyword}"><span
										class="glyphicon glyphicon-chevron-left"></span></a></li>
							</c:if>
							<!-- 페이지 리스트 -->
							<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
								<c:if test="${i!=pb.currentPage}">
									<li><a
										href="noticeList?ncategory=csm&pageNum=${i}&search=${customer.search}&keyword=${customer.keyword}">${i}</a></li>
								</c:if>
								<c:if test="${i==pb.currentPage}">
									<li class="active"><a
										href="noticeList?ncategory=csm&pageNum=${i}&search=${customer.search}&keyword=${customer.keyword}">${i}</a></li>
								</c:if>
							</c:forEach>
							<!-- 다음 페이지로 가기 -->
							<c:if test="${pb.startPage < pb.totalPage}">
								<li><a
									href="noticeList?ncategory=csm&pageNum=${pb.endPage + 1}&search=${customer.search}&keyword=${customer.keyword}"><span
										class="glyphicon glyphicon-chevron-right"></span></a></li>
							</c:if>
							<!-- 맨 마지막 페이지로 가기 -->
							<li><a
								href="noticeList?ncategory=csm&pageNum=${pb.totalPage}&search=${customer.search}&keyword=${customer.keyword}"><span
									class="glyphicon glyphicon-step-forward"></span></a>
							<li>
						</ul>
					</div>
					<!-- 페이지네이션 끝 -->

				</div>
			</c:if>
			</div>
		</div>
	</div>
	
	<!-- 푸터 삽입 -->
	<div class="row1" style="clear:both;">
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html>