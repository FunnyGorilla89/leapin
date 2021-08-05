<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Action.*" %>
<%@ page import = "DAO.*" %>
<%
	String loginId = (String)(session.getAttribute("loginId"));
	String E = (String)(session.getAttribute("E"));
	LeapinDAO dao = new LeapinDAO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
#btn_logout, #btn_board, #btn_mypage, #btn_chatting, #btn_login, #btn_signup, .right-heaeder-button-group {font-size:15px; font-weight:bold; background-color:transparent; border:0; outline:0; border-radius:5px; cursor:pointer;padding:5px;}
#btn_logout:hover, #btn_board:hover, #btn_mypage:hover, #btn_chatting:hover, #btn_login:hover, #btn_signup:hover, .right-heaeder-button-group:hover {background:#c9c9c9;}
.logo {width:120px; height:45px;}
#header-area {display: flex;justify-content: space-between;align-items: center; border-bottom: 1px solid gray; height:70px;}
.container {margin-bottom:3rem;}
.header-left {display: flex; align-items: center; margin-left: 10px;}
.h-left2 {padding-left:50px;}
.h-left2 ul {margin:0; display: flex; align-items: center;}
.h-left2 li {list-style:none;}
.h-left2 a {text-decoration:none;}
.header-right {display: flex; align-items: center;}
.hello-user{display: flex; align-items: center; padding-left:5px;}
.page-name {margin: 1rem 0rem; font-weight:bold;}
.header-button-group{height: 40px;margin-right: 20px;}
.container {margin-bottom:3rem;}
#btn_bottom_area {display: flex; justify-content: flex-end;}
#btn_back, #btn_reset {margin-right:7px;}
.top_button_group {display:flex; justify-content: flex-end;}
#btn_enterprise_trans, #btn_account_delete {margin-left:7px;}
#btn_member_change, #btn_enterprise_info_edit, #btn_account_delete {margin-left:7px;}
.array-type {display: flex; justify-content: flex-end;}
.media {border-collapse:collapse; border-bottom:0.5px solid gray; border-top:0.5px solid gray; padding:15px 0px;}
.media-body-top {display: flex; justify-content: space-between;}
.media-body-title {display: flex; align-items: center; justify-content: space-between; margin-bottom:20px;}
.media-body-title-left {display: flex;justify-content: space-between;align-items: center;width: 180px;}
.media-body-content {display: flex; justify-content: space-between;}
#list-write-offer {background-color: tomato; border-color: tomato;}
.request-name {display:flex;}
.request-name span {font-size:13px;}
.request-date {display: flex; justify-content: flex-end; padding-bottom: 20px;}
#request-agree {background-color:unset; color:black; font-weight:bold;}
#request-disagree {background-color:unset; color:black; border-color:tomato; font-weight:bold;}
.align-self-center.mr-3 {width: 90px; margin-right:20px;}
.bottom{ width:1500px; color:rgb(115,115,115); font-size:12px; text-align:center; border-top: 1px solid #e1e1e1;}
.top{ width:1500px; height:72px; border-bottom:1px solid #e1e1e1;}
.card-body{width:260px; max-width:260px;}
.menuFont{ 			
    	font-size: 16px;
    	font-weight: bold;
    	color: #fff;
    	letter-spacing:-2px; 
    	
    }
    .menuFont>img{ width:200px; height:65px; cursor:pointer; }
    .menuBox-r{
    	width:100px;
    	height: 40px;
    	font-size: 14px; 
    	font-weight: bold; 
    	color: #fff; 
    	letter-spacing:-2px; 
    	border:none;
    	padding: 8px 20px;    
    	border-radius: 4px;
    	background-color: #00c7ae;
    	margin: 13px;
    	float:right;
    }
    .menuBox-l{
    	width:100px;
    	height: 40px;
    	font-size: 14px; 
    	font-weight: bold; 
    	color: #777777; 
    	letter-spacing:-2px; 
    	border:none;
    	padding: 8px 20px;    
    	border-radius: 4px;
    	border:none;
    	background-color: #ffffff;
    	margin-top: 13px;
    	float:left;
    }
</style>
<script>
		loginId = "<%=loginId%>";
		E = "<%=E%>";
		Cno = new Array;
	$(function(){
		console.log(E);
		console.log(loginId);
		if(loginId == "null" || null){
			 
			 $("#btn_logout").hide();
			 $("#btn_board").hide();
			 $("#btn_mypage").hide();
			 $("#btn_search_receive_chat").hide();
			 $("#btn_search_receive_offer").hide();
			 $("#btn_search_receive_request").hide();
		 }else{
			 if(E == "null" || null){
				 $("#btn_login").hide();
				 $("#btn_signup").hide();
				 $("#btn_board").hide();
				 $("#btn_search_receive_request").hide();
			 }else{
				 $("#btn_login").hide();
				 $("#btn_signup").hide();
			 }
		 };
		
		$("#log_out").on('click', function(){
 			var result = confirm("로그아웃 하시겠습니까?");
 			if(result){
 				location.href="Controller?command=logout";
 			}
 		});
		
		
		$("#writerequest").on('click', function(){
			if(loginId == null || loginId == "null"){
 				alert("로그인이 필요합니다");
 				location.href = "Controller?command=LoginForm";
 			}
 			else{
 				location.href = "Controller?command=writeRequest_Form";
 			}
		});
		
		$.ajax({
				type : "post",
				url : "./Controller",
				datatype : "json",
				data : {"id" : loginId, "command" : "receivedoffer"},
				success : function(data){
					console.log(data);
					var receivedoffer = data.receivedoffer;
					
					$("#box").empty();
					var str = "";
					for(var i = 0; i < receivedoffer.length; i++){
						var date_time = receivedoffer[i].date_time;
						var c_name = receivedoffer[i].c_name;
						var e_name = receivedoffer[i].e_name;
						var cno = receivedoffer[i].cno;
						var count = parseInt(receivedoffer[i].count)-1;
						console.log("count : " + count);
						Cno.push(cno);
						//console.log(data_time);
						console.log(c_name);
						console.log(e_name);
						console.log(cno);
						str += "<li><div class='card'><div class='card-body'> ";
						str += "<span style = 'float:right;'>"+receivedoffer[i].date_time+"</span><br/> ";
						str += "<h4 class='card-title'>"+receivedoffer[i].c_name+"</h4><br/> ";
						if(count == 0){
						str += "<div class='card-p-area'><p class='card-text'>"+receivedoffer[i].e_name+"</p></div><br/> ";
						}
						else{
						str += "<div class='card-p-area'><p class='card-text'>"+receivedoffer[i].e_name+" 외 ("+count+" 명)</p></div><br/> ";	
						}
						str += "<button id = 'detail_btn' class='btn btn-primary'>자세히보기</button></div></div></li>";
						console.log(str);
					}
					
					$("#box").append(str);
				},
				error : function(request, status, error){
					console.log(request);
					console.log(status);
					console.log(error);
					alert("err");
				}
			});
		$(document).on('click',"#detail_btn", function(){
			var i = $(this).closest('li').index();
			var Cno1 = Cno[i];
			var result = confirm("해당 카테고리의 견적서 페이지로 넘어가시겠습니까?");
			if(result){
			location.href='Controller?command=Receive_offer_list_on_top&Cno='+Cno1+'';
			}
		});
		
	});
</script>
<style>
	.row{
		display:flex;
		justify-content: space-around;
	}
	.page-heading-h3{
		margin-top:50px;
	}
	ul{
		list-style:none;
	}
	.request-card{
		border:1px solid gray;
		padding:20px;
	}
	.row{
		margin-top:30px;
	}
	.request-card-header-time{
		float:right;
	}
	.request-card-title{
		margin-top:5px;
	}
	.container_box{
		border:1px solid gray;
		padding:40px;
	}
	.container{
		margin-bottom : 30px;
	}
	#writerequest{
		float:right;
		margin-right:35px;
		width:150px;
	}
	.btn-primary{
		width:220px;
	}
</style>
<title>받은 견적</title>
</head>
<body>
<header id="header-area">
	<div class="header-left">
		<div class="h-left1">
			<a href="Controller?command=Main"><img class="logo" src="leapin/Images/LeapinLogo.png"></a>
		</div>
		<div class="h-left2">
			<ul>
				<li><button type="button" class="right-heaeder-button-group" id="btn_search_receive_offer" onClick="location.href='Controller?command=receive_offer_on_top';">견적</button></li>
				<li><button type="button" class="heaeder-button-group" id="btn_board" onclick="location.href='Controller?command=Board_list_on_top';">게시판 보기</button></li>
				<li><button type="button" class="right-heaeder-button-group" id="btn_search_receive_request" onClick="location.href='Controller?command=Receive_request_list_on_top';">요청</button></li>
				<li><button type="button" class="right-heaeder-button-group" id="btn_search_receive_chat" onClick="location.href='Controller?command=chat_main_page';">채팅</button></li>
			</ul>
		</div>
	</div>
	<div class="header-right">
		<button id="btn_login" class="heaeder-button-group" onclick="location.href='Controller?command=LoginForm';">로그인</button>
		<button id="btn_signup"class="heaeder-button-group" onclick="location.href='Controller?command=SignupForm';">회원가입</button>
		<button id="btn_logout" class="heaeder-button-group" onclick="location.href='Controller?command=Logout';">로그아웃</button>
		<a id="btn_mypage" class="heaeder-button-group" type="button" onclick="location.href='Controller?command=Mypage';"><b>마이페이지</b></a>
		<div class="hello-user">
		<% if(loginId != null){ %>
			<h3><%=(dao.receive_name(loginId)) %>(<%=loginId %>)님, 안녕하세요!</h3>
		<% }else if(loginId == null){%>
			<h3>로그인이 필요합니다.</h3>
		<%} %>
		</div>
	</div>
</header>
	
	<article class = "sent-request-list">
	<section class = "container">
		
		<h2 class ="page-heading-h3" style = "font-weight:bold;">받은 견적</h2>
		<div class = "container_box">
		<ul id = "box" class = "row">
		
		<!-- <li>
		<div class="card">
			<div class="card-body">
				<span style = "float:right";>21/07/14</span><br/>
				<h4 class="card-title">비지니스</h4><br/>
				<div class="card-p-area">
					<p class="card-text">전준하님 외 2명</p>
				</div><br/>
				<a href="Controller?command=Receive_offer_list_on_top" class="btn btn-primary">자세히보기</a>
			</div>
		</div>
		</li> -->
		
		</ul>
			<div class = "writerequest">
				<button id = "writerequest" class = "btn btn-outline-info">
	  			요청서 작성
	  			</button>
			</div>
		</div>
	</section>
	</article>	
	
<nav id = "footer-bar">
	<div class = "footer-container-row container">
		<div class ="col-content-list-term">
			<span class = "text term-text">주)리핀네트워크는 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.</span><br/>
		</div>
		<ul class = "col-content-guide">
			<li class = "text">
				상호명:(주)리핀네트워크 · 대표이사:SIN WOO JIN · 개인정보책임관리자:전준하 · 주소:경기 안양시 동안구 동편로 110 동편마을3단지
			</li>
			<li class = "text">
				사업자등록번호:120-88-22325 · 통신판매업신고증:제 2021-경기안양-06081호 · 직업정보제공사업 신고번호:경기북부청 제 2021-1호
			</li>
			<li class = "text">
				고객센터:2021-06-08 · 이메일:Liphin2021@gmail.com
			</li>
			<li class = "text">
				Copyright ©Leapin Network Inc. All Rights Reserved.
			</li>
		</ul>
	</div>
</nav>

</body>
</html>