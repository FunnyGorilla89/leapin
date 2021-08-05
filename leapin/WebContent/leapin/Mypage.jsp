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
<link rel = "stylesheet" type = "text/css" href = "/leapin/Mypage.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>My page</title>
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
.hello-user{display: flex; align-items: center;}
.header-button-group{height: 40px;margin-right: 20px;}
.input-r1 {height:35px; width:300px; background-color:#e0e0e0; border:none; color:#404040; border-radius:4px; margin-left:300px; cursor:pointer;}
.input-r2 {height:35px; width:300px; background-color:#e0e0e0; border:none; color:#404040; border-radius:4px; margin-left:300px; cursor:pointer;}
.input-r3 {height:35px; width:300px; background-color:#e0e0e0; border:none; color:#404040; border-radius:4px; margin-left:300px; cursor:pointer;}
.input-r4 {height:35px; width:145px; background-color:#e0e0e0; border:none; color:#404040; border-radius:4px; float:left; margin-right:10px; margin-left:300px; cursor:pointer;}
.input-r5 {height:35px; width:145px; background-color:#e0e0e0; border:none; color:#404040; border-radius:4px; float:left; cursor:pointer;}
.pagecenter {margin:auto;}
.page-name {margin: 1rem 0rem; font-weight:bold;}
.mypage-main {margin:auto; width:1000px; margin-top: 3.125rem; margin-bottom: 3.125rem;}
.mypage-left-side {float:left; margin-right:50px}
.mypage-right-side {float:left;}
.mypage-left-button {width:300px; height:50px;}
.mypage-left-button#info-edit {width:140px; height:50px; margin-right: 8px;}
.mypage-left-button#my-logout {width:140px; height:50px;}
.mypage-right-button {width:300px; height:50px;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
<article class = "sent-request-list">
<div class = "container">
	<% if(loginId != null){ %>
	<h2 class ="page-name">마이페이지</h2><br/>
	<h2 class ="mypageh2"></h2>
		<div class="pagecenter">
			<div class="mypage-main">
				<div class="mypage-left-side">
					<input class="mypage-left-button" type="button" value="받은견적서보기" onClick="location.href='./Controller?command=Receive_offer_on_top';"><br/><br/>
					<input class="mypage-left-button" type="button" value="거래내역" onClick="location.href='./Controller?command=Deal_List_page';"><br/><br/>
					<input class="mypage-left-button" id="info-edit" type="button" value="개인정보수정" onClick="location.href='Controller?command=PwcheckForm';">&nbsp;
					<input class="mypage-left-button" id="my-logout" type="submit" value="로그아웃" onClick="location.href='Controller?command=Logout';">
				</div>
				<%if(E != null){ %>
				<div class="mypage-right-side">
					<input class="mypage-right-button" type="button" value="받은요청서보기" onClick="location.href='Controller?command=Receive_request_list_on_top';"><br/><br/>
				</div>
				<% } %>
				<div style="clear:both;"></div>	<!-- float left/right로 영역이 분할되었을경우 꼭 clear:both로 마무리 -->
			</div>
		</div><!-- page_center -->
	<% }else{ %>
		<div class="pagecenter">
			<div class="mypage-main">
			<h3 style="color:red;">로그인후에 이용가능한 페이지입니다.</h3>
			<button type="button" name="btn_login" value="로그인" onClick="location.href='../Controller?command=LoginForm';">로그인페이지</button>
			<div style="clear:both;"></div>	<!-- float left/right로 영역이 분할되었을경우 꼭 clear:both로 마무리 -->
			</div>
		</div>
	<% } %>
</div>
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
				Copyright ©Liphin Network Inc. All Rights Reserved.
			</li>
		</ul>
	</div>
</nav>
</body>
</html>