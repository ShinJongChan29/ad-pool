<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../tag.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<style>
	td{
		text-align:center;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${path}/css/chart.css" rel="stylesheet">
</head>
<body>
	<h2>Keyword List</h2>
	<c:forEach var="btnArr" items="${btnArr}">
		<c:if test="${btnArr != temp }">
			<button class="btn btn-default" onclick="adKeyList('${btnArr}')">${btnArr}</button>
		</c:if>	
		<c:if test="${btnArr == temp }">
			<button class="btn btn-primary" onclick="adKeyList('${btnArr}')">${btnArr}</button>
		</c:if>	
	</c:forEach>
	<table class="table table-hover table-striped" style="text-align:center">
		<tr>
			<th style="text-align:center;width:10%;">Keyword</th>
			<th style="text-align:center;width:10%;">Count</th>
			<th style="text-align:center;width:auto%;">통계</th>
		</tr>	
		<c:forEach var="keyList" items="${keyList}" varStatus="i">
		<tr>
			<td width="10%">${keyList.k_keyword}</td>
			<td width="10%">${keyList.cnt}</td>
			<td width="">
			
			<div class="charts">
			<c:if test="${i.index==0}">
			<div  class="charts__chart chart--p${intArr[i.index]} 
			chart--lg CHART--RED chart--hover"><span style="font-size:18px">${doubleArr[i.index]}%</span></div>
			</c:if>
			<c:if test="${i.index==1}">
			<div  class="charts__chart chart--p${intArr[i.index]} 
			chart--lg CHART--GREEN chart--hover"><span style="font-size:18px">${doubleArr[i.index]}%</span></div>
			</c:if>
			<c:if test="${i.index==2}">
			<div  class="charts__chart chart--p${intArr[i.index]} 
			chart--lg CHART--BLUE chart--hover"><span style="font-size:18px">${doubleArr[i.index]}%</span></div>
			</c:if>
			<c:if test="${i.index>2}">
			<div  class="charts__chart chart--p${intArr[i.index]} 
			chart--lg CHART--DEFAULT chart--hover"><span style="font-size:18px">${doubleArr[i.index]}%</span></div>
			</c:if>
			</div>
			</td>
		</tr>
		<tr>
			
		</tr>
		</c:forEach>
	</table>
	

	
</body>
</html>