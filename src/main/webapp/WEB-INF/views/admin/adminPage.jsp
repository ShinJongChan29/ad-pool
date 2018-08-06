<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tag.jsp"%>
<%@ include file="../main_header.jsp"%>
<!DOCTYPE html> 
<html>
<head>
<style>
.topbar_ul>li>a{
	color:white;
}
a{
	color:black;
	cursor: hand;
}

.adul>li {
	list-style: none;
}
.lackingDog{
	background-color:black;
}
</style>
<script type="text/javascript">
$(function(){
	$('#adminView').hide();
	$(".adul li").on("click",function(){
		$('.adul li').removeClass('lackingDog');
		$(this).addClass('lackingDog');
	});
});
	function adKeyList(day){
		$.post('adminKeyword','day='+day,function(data){
			$('#adminView').html(data);	
			if(day=='WriteText'){
				alert("텍스트쓰기 성공");
			}
		})
	}
	
	function detail(mid) {
		$.post('memberDetail2', 'm_id=' + mid, function(data) {
			fadeVIew(data);
		})
	}

	function detailUpdate() {
		$.ajax({
			type : "POST",
			url : "detailUpdate",
			async : false,
			data : {
				m_id : frm_detail.m_id.value,
				m_name : frm_detail.m_name.value,
				m_address : frm_detail.m_address.value,
				m_email : frm_detail.m_email.value,
				m_del : frm_detail.m_del.value,
				m_grade : frm_detail.m_grade.value

			},
			//	dataType : "json",
			//	cache : false,
			success : function(data) {
				alert("success");
				detail(frm_detail.m_id.value);
			},
			error : function(data) {
				alert("실패" + data);
				console.log("2");
				return false;
			}
		});
	}
	function pagen(num, paraa) {
		$.ajax({
			type : "POST",
			url : "mainAdsList",
			async : false,
			data : {
				pageNum : num,
				para : paraa
			},
			//	dataType : "json",
			//	cache : false,
			success : function(data) {
				fadeVIew(data);
			},
			error : function(data) {
				alert("실패" + data);
				console.log("2");
				return false;
			}
		});
	}
	function adsdel(division){
		alert(division);
		$.post(
				'adsdel',
				{
					division:division,
					no:frm_adsDetail.a_no.value
				}
				,function(data){
					if(division !='DB'){
				adsDetail(frm_adsDetail.a_no.value);
					}else alert("DB삭제");
		});
	}
	function adsPermit(division){
		alert(division);
		$.post(
			'adsPermit',
			{
				division:division,
				no:frm_adsDetail.a_no.value
			},function(data){
				adsDetail(frm_adsDetail.a_no.value);
			});	
		
	}
	function adsDetail(no){
		$.post('adsDetail','no=' +no, function(data){
			fadeVIew(data);
		});
	}
	function adsUpdate(){
		var params =$('#frm_adsDetail').serialize();
		$.post('adsdetailUpdate',params,function(data){
			adsDetail(frm_adsDetail.a_no.value);
		});
	}
	function adcomList(division) {
		$.post('mainAdsList', 'divi=' + division, function(data) {
			fadeVIew(data);
		})
	}
	function review(param) {
		$.post('mainAdsList', 'para=' + param, function(data) {
			fadeVIew(data);
		})
	}
	
	function memberList() {
	
		$.post('memberList', function(data) {
			fadeVIew(data);
		});
	}
	function adsupload() {
		$.post('adsuploadForm', function(data) {
			fadeVIew(data);
		});
	}
	function adcs(param,admin){
		$.post('noticeList',
				{ncategory:param,
				       ad :admin
		},function(data){
			fadeVIew(data);
		})
	}
	function mainAdsList() {
		$.post('mainAdsList', function(data) {
			fadeVIew(data);
		});
	}
	//fade effect
	function fadeVIew(data){
		$('#adminView').html(data).hide().fadeIn("fast");
	}
	function detaildely() {
		var temp =confirm("삭제하시겠습니까?");
		if(temp){
		$.ajax({
			type : "POST",
			url : "detaildely",
			async : false,
			data : {
				m_id : frm_detail.m_id.value,
				m_del : 'Y'

			},
			//	dataType : "json",
			//	cache : false,
			success : function(data) {
				detail(frm_detail.m_id.value);
				
			},
			error : function(data) {
				alert("실패" + data);
				console.log("2");
				return false;
			}
		});
		}
	}
	function detaildeldb() {
		var tempdel = confirm("완전 삭제?");
		if (tempdel == true) {
			$.post('detaildeldb', 'm_id=' + frm_detail.m_id.value, function(
					data) {
				memberList();
			})
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.adul{
	position:fixed;
	height:100%;
	background-color:#333;
	padding:0;
	line-height:50px;
	width:20%;
	z-index:2;
}
.adul li:hover{
	background-color:black;
	
}
.adul li a{
	color:white;
	font-size:18px;
	text-decoration: none;
}
.adul li{
	border-bottom: 1px solid darkgrey;
}
</style>
<body>
	<div class="wrapper">
	<div class="center" style="text-align: center">
					
					
					<ul class="adul">
					<li></li>
					<li><a style="font-size:28px; color: #428bca;">Admin Menu</a></li>
						<li id="test2"><a onclick="memberList()" id="test1">Member List</a></li>
						<li><a onclick="mainAdsList()">Main Ads List</a></li>
						<li><a onclick="adcomList('0')">Competition List</a></li>
						<li><a onclick="adsupload()">AdsUpload</a></li>
						<li><a onclick="adcs('ntc','admin')">Notice</a></li>
						<li><a onclick="adcs('faq','admin')">FAQ</a></li>
						<li><a onclick="adcs('csm','admin')">CSM</a></li>
						<li><a onclick="adKeyList('all')">Keyword List</a></li>
						
					</ul>
				</div>
		<div class="container">
			<div class="col-sm-3 col-md-3">
			</div>


			<div class="col-sm-9 col-md-9">
				<div id="adminView"></div>
			</div>
		</div>
	</div>

</body>
</html>