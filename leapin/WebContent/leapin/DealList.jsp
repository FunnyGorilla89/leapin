<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Deal list page</title>
<!-- <link rel = "stylesheet" type = "text/css" href = "leapin/Mypage.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
.col1 {width:150px;}
.col2 {display: flex; justify-content: flex-start;}
#btn_bottom_area {display: flex; justify-content: flex-end;}
#btn_back, #btn_reset {margin-right:7px;}
.top_button_group {display:flex; justify-content: flex-end;}
#btn_enterprise_trans, #btn_account_delete {margin-left:7px;}
#btn_member_change, #btn_Enterprise_info_edit, #btn_account_delete {margin-left:7px;}
#mypage_body {display: flex; justify-content: space-around;}
.card-img-bottom {margin:auto;}
.btn.btn-primary {width:100%;}
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
#request-agree:hover {background-color:#007bff;}
#request-disagree:hover {background-color:tomato;}    
.align-self-center.mr-3 {width: 90px; margin-right:20px;}
.bottom{ width:1500px; color:rgb(115,115,115); font-size:12px; text-align:center; border-top: 1px solid #e1e1e1;}
.top{ width:1500px; height:72px; border-bottom:1px solid #e1e1e1;}
#btn_send_offer_view {background-color:tomato; color:white; border:0.5px solid tomato;}
#btn_send_offer_view:hover {background-color:firebrick;}
#pending_payment {width: 184px;}
#current-status {width: 90px;}
.list-unstyled {width: 90%;}
.modal-footer {display: flex; justify-content: space-between;}
#offer-price-area {font-weight:bold;}
#modal-body-date-time {display: flex; justify-content: flex-end;}
</style>
<script>
	
	$(function(){
		loginId = "<%=loginId%>";
		 E = "<%=E%>";
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

	});
</script>
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
	<div class = "container">
	<% if(loginId!=null){ %>
	<h2 class ="page-name">마이페이지</h2><br/>
	<%-- <h2 class ="mypageh2"><%=dao.receive_name(loginId)%></h2> --%>
		<div class="pagecenter">
			<div class="mypage-main">
				<h3>거래내역</h3><br/>
				<div id = "mypage_body">
					<%if(loginId!=null && E==null){ %>
						<div class="card" style="width:300px; text-align: center;">
							<div class="card-body">
								<h4 class="card-title">완료된&nbsp;요청서</h4>
								<p class="card-text">(send request)</p>
								<button id = "request_btn" class="btn btn-primary">
									완료된요청보기
								</button> 
							</div>
							<img class="card-img-bottom" src="leapin/Images/send.png" alt="Card image" style="width:80%">
						</div>	<!-- card1 -->
					<%} %>
						<%if(E!=null){ %>
							<div class="card" style="width:300px; text-align: center;">
								<div class="card-body">
									<h4 class="card-title">완료된&nbsp;견적서</h4>
									<p class="card-text">(send offer)</p>
									<button id = "offer_btn" class="btn btn-primary">
									완료된견적보기
									</button> 
								</div>
								<img class="card-img-bottom" src="leapin/Images/send.png" alt="Card image" style="width:80%">
							</div>	<!-- card2 -->
							<div class="card" style="width:300px; text-align: center;">
								<div class="card-body">
									<h4 class="card-title">완료된&nbsp;요청서</h4>
									<p class="card-text">(send request)</p>
									<button id = "request_btn" class="btn btn-primary">
									완료된요청보기
									</button> 
								</div>
								<img class="card-img-bottom" src="leapin/Images/receive.png" alt="Card image" style="width:80%">
							</div>	<!-- card3 -->
						<%} %>
				</div>
			</div>
		</div>
	<%}else{ %>
		<div class="pagecenter">
			<div class="mypage-main">
				<h3 class="login-check-page">로그인이 필요한 페이지입니다.</h3>
			</div>
		</div>	<!-- pagecenter -->
	<%} %>
	</div>
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
				Copyright ©Liphin Network Inc. All Rights Reserved.
			</li>
		</ul>
	</div>
</nav>
<script>
$(function(){
	
	$(document).on("click","#request_btn",function(){
		
		$("#mypage_body").empty();
		
		
		 $.ajax({
			type:"post",
			url:"./Controller",
			data:{"id":loginId, "command":"Deal_list_request"},
			datatype:"json",
			success: function(data){
				console.log(data);
				var cr_info = data.cr_info;
				console.log(cr_info);
				var str = "";
				str += "<ul class='list-unstyled'>";
				
				for(i = 0; i < cr_info.length; i++){
					var c_name = cr_info[i].c_name;
					var r_content = cr_info[i].r_content
					var r_state = cr_info[i].r_state;
					var o_name = cr_info[i].name;
					var o_content = cr_info[i].o_content;
					var price = cr_info[i].price
					var o_date_time = cr_info[i].o_date_time;
					
					str += "<li class='media' id='media_id'>";
					str += "<img class='align-self-center mr-3' src='leapin/Images/user.png' alt='User image'>";
					str += "<div class='media-body'><div class='media-body-top'>";
					str += "<div class='media-body'>";
			    	str += "<div class='media-body-top'>";
				    str += "<div class='request-name'><h5 class='mt-0 mb-1' id='request-user'>"+o_name+"</h5>&nbsp;&nbsp;<span>(카테고리:"+c_name+")</span></div>";
				    str += "<div class='request-date'><span>"+o_date_time+"</span></div>";
				    str += "</div>";
				    str += "<div class='media-body-title'>";
				    str += "<div class='media-body-title-left'>";
				    str += "</div>";
				    str += "<div class='media-body-title-right'>";
			     	str += "</div>";
			     	str += "</div>";
			     	str += "<div class='media-body-content'>";
			     	str += "<div class='media-body-content-left'>";
			     	str += "<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#openModal"+i+"'>내용보기</button>";
			     	str += "</div>";
			     	str += " <div class='media-body-content-right'>";
					str += "<button type='button' id='btn_send_offer_view' class='btn btn-primary' data-toggle='modal' data-target='#myModal"+i+"'>보낸견적보기</button>";		
		     		str += "<div class='modal fade' id='myModal"+i+"'>";
		     		str += "<div class='modal-dialog modal-lg'>";
		     		str += "<div class='modal-content'>";
		     		str += "<div class='modal-header'>";
		     		str += "<h4 class='modal-title'>견적 내용</h4>";
		     		str += "<button type='button' class='close' data-dismiss='modal'>&times;</button>";
		     		str += " </div>";
		     		str += "<div class='modal-body'>"+o_content+"</div>";
		     		str += "<div class='modal-body' id='modal-body-date-time'>"+o_date_time+"</div>";
		     		str += "<div class='modal-footer'>";
		     		str += "<div><span id='offer-price-area'>견적가격&nbsp;:&nbsp;"+price+"</span></div><div><button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button></div>";
		     		str += "</div></div></div></div>";
			     	str += "</div>";
			     	str += "<div class='modal fade' id='openModal"+i+"'>";
			     	str += "<div class='modal-dialog modal-lg'>";
			     	str += "<div class='modal-content'>";
			     	str += "<div class='modal-header'>";
			     	str += "<h4 class='modal-title'>요청 내용</h4>";
			     	str += "<button type='button' class='close' data-dismiss='modal'>&times;</button>";
			     	str += "</div>";     
			     	str += "<div class='modal-body'>"+r_content+"</div>";
					str += "<div class='modal-footer'><div class='file-upload preview-image'><form id='fileUploadForm' method = 'post' enctype ='multipart/form-data'>";
					str += "<input type='file' id='file' class='upload-hidden'></form></div>";
					str += "<button type='button' class='btn btn-secondary' data-dismiss='modal'>창닫기</button></div>";
					str += "</div></div></div></div></div></li>";
					}
					str += "</ul>";
				
					$("#mypage_body").append(str);
					
			},
			error : function(request, status, error){
				alert("알 수 없는 에러 [" + error + "]");
				alert("!!");
			}
		});
	});
	
	
	$(document).on("click","#offer_btn",function(){
		$("#mypage_body").empty();
		
		
		 $.ajax({
			type:"post",
			url:"./Controller",
			data:{"id":loginId, "command":"Deal_list_offer"},
			datatype:"json",
			success: function(data){
				console.log(data);
				var co_info = data.co_info;
				console.log(co_info);
				var str = "";
				str += "<ul class='list-unstyled'>";
				
				for(i = 0; i < co_info.length; i++){
					var c_name = co_info[i].c_name;
					var r_name = co_info[i].name;
					var r_content = co_info[i].r_content
					var o_content = co_info[i].o_content;
					var price = co_info[i].price
					var r_date_time = co_info[i].r_date_time;
					var o_date_time = co_info[i].o_date_time;
					
					str += "<li class='media' id='media_id'>";
					str += "<img class='align-self-center mr-3' src='./Images/user.png' alt='User image'>";
					str += "<div class='media-body'><div class='media-body-top'>";
					str += "<div class='media-body'>";
			    	str += "<div class='media-body-top'>";
				    str += "<div class='request-name'><h5 class='mt-0 mb-1' id='request-user'>"+r_name+"</h5>&nbsp;&nbsp;<span>(카테고리:"+c_name+")</span></div>";
				    str += "<div class='request-date'><span>"+o_date_time+"</span></div>";
				    str += "</div>";
				    str += "<div class='media-body-title'>";
				    str += "<div class='media-body-title-left'>";
				    str += "</div>";
				    str += "<div class='media-body-title-right'>";
			     	str += "</div>";
			     	str += "</div>";
			     	str += "<div class='media-body-content'>";
			     	str += "<div class='media-body-content-left'>";
			     	str += "<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#openModal"+i+"'>내용보기</button>";
			     	str += "</div>";
			     	str += " <div class='media-body-content-right'>";
					str += "<button type='button' id='btn_send_offer_view' class='btn btn-primary' data-toggle='modal' data-target='#myModal"+i+"'>받은요청보기</button>";		
		     		str += "<div class='modal fade' id='myModal"+i+"'>";
		     		str += "<div class='modal-dialog modal-lg'>";
		     		str += "<div class='modal-content'>";
		     		str += "<div class='modal-header'>";
		     		str += "<h4 class='modal-title'>요청 내용</h4>";
		     		str += "<button type='button' class='close' data-dismiss='modal'>&times;</button>";
		     		str += " </div>";
		     		str += "<div class='modal-body'>"+r_content+"</div>";
		     		str += "<div class='modal-body' id='modal-body-date-time'>"+r_date_time+"</div>";
		     		str += "<div class='modal-footer'>";
		     		str += "<div><span id='offer-price-area'>확정금액&nbsp;:&nbsp;"+price+"</span></div><div><button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button></div>";
		     		str += "</div></div></div></div>";
			     	str += "</div>";
			     	str += "<div class='modal fade' id='openModal"+i+"'>";
			     	str += "<div class='modal-dialog modal-lg'>";
			     	str += "<div class='modal-content'>";
			     	str += "<div class='modal-header'>";
			     	str += "<h4 class='modal-title'>견적 내용</h4>";
			     	str += "<button type='button' class='close' data-dismiss='modal'>&times;</button>";
			     	str += "</div>";     
			     	str += "<div class='modal-body'>"+o_content+"</div>";
					str += "<div class='modal-footer'><div class='file-upload preview-image'><form id='fileUploadForm' method = 'post' enctype ='multipart/form-data'>";
					str += "<input type='file' id='file' class='upload-hidden'></form></div>";
					str += "<button type='button' class='btn btn-secondary' data-dismiss='modal'>창닫기</button></div>";
					str += "</div></div></div></div></div></li>";
					}
					str += "</ul>";
				
					$("#mypage_body").append(str);
					
			},
			error : function(request, status, error){
				alert("알 수 없는 에러 [" + error + "]");
				alert("!!");
			}
		});
	})
});
</script>
</body>
</html>