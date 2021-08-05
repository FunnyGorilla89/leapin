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
  
<title>로그인 페이지</title>
<style>
#btn_logout, #btn_board, #btn_mypage, #btn_chatting, #btn_login, #btn_signup, .right-heaeder-button-group {font-size:15px; font-weight:bold; background-color:transparent; border:0; outline:0; border-radius:5px; cursor:pointer;padding:5px;}
#btn_logout:hover, #btn_board:hover, #btn_mypage:hover, #btn_chatting:hover, #btn_login:hover, #btn_signup:hover, .right-heaeder-button-group:hover {background:#c9c9c9;}
.logo {width:120px; height:45px;}
.was-valu_idated {width: 400px; margin: auto;}
#login-logo-area {text-align:center;}
#login-table-logo {width: 100%;}
#header-area {display: flex;justify-content: space-between;align-items: center; border-bottom: 1px solid gray; height:70px;}
.container {margin-bottom:3rem; height:500px;}
.header-left {display: flex; align-items: center; margin-left: 10px;}
.h-left2 {padding-left:50px;}
.h-left2 ul {margin:0; display: flex; align-items: center;}
.h-left2 li {list-style:none;}
.h-left2 a {text-decoration:none;}
.header-right {display: flex; align-items: center;}
.header-button-group{height: 40px;margin-right: 20px;}
.hello-user{display: flex; align-items: center; padding-left:5px;}
.page-name {margin: 1rem 0rem 0rem 1rem; font-weight:bold;}
#btn_mypage {text-decoration:none;}
#form-btn_login2 {display: flex; justify-content: flex-end;}
.col-content-guide {list-style:none;}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
  		
  		$("#btn_login2").click(function(){
  			var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
  			var u_id = $("#u_id").val();
  			var pwd = $("#pwd").val();
  			
  			$("#u_id_result").empty();
  			$("#pwd_result").empty();
  			
  			/*if(!getCheck.test(u_id)){
  				alert("형식에 맞게 아이디를 입력해주세요");
  				$("#u_id").val("");
  				$("#u_id").focus();
  				return false;
  			}
  			
  			if(u_id == "" || u_id == " "){
  				alert("아이디를 입력해주세요");
  				$("#u_id").focus();
  				return false;
  			}
  			
  			if(u_id.length < 8){
  				alert("아이디를 8자 이상 입력해주세요");
  				$("#u_id").val("");
  				$("#u_id").focus();
  				return false;
  			}
  			
  			if(u_id == pwd){
  				alert("아이디와 비밀번호가 같습니다.");
  				$("#pwd").focus();
  				return false;
  			}
  			
  			if(!getCheck.test(pwd)){
  				alert("형식에 맞게 비밀번호를 입력해주세요");
  				$("#pwd").val("");
  				$("#pwd").focus();
  				return false;
  			}
  			
  			if(pwd == "" || pwd == " "){
  				alert("비밀번호를 입력해주세요")
  				$("#pwd").focus();
  				return false;
  			}
  			
  			if(pwd.length < 8){
  				alert("비밀번호는 8자리 이상 입력해주세요.");
  				$("#pwd").val("");
  				$("#pwd").focus();
  				return false;
  			}*/
  			
  			$.ajax({
  				type:"post",
  				url:"./Controller",
  				datatype:"json",
  				data:{"u_id" : u_id, "pwd" : pwd, "command" : "Login"},
  				success : function(data){            // data : JSON객체     ---- { "id":"testtest", "result":0 }
  					console.log(data.result);        // data.id ----> "testtest"
  					//location.href="main.jsp";		 // data.result --> 0
  					if(data.result==0) {
  						alert("로그인 성공!");
  						location.href = "Controller?command=Main";
  					}
  				},
  				error : function(request, status, error){
  					alert("err");
  				}
  				
  			});
  			
  		});
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
	<h2 class="page-name" style="color:blue;">LOGIN PAGE</h2>
<div class="container">

  <div class="was-valu_idated">
    	
	<div class="form-group" id="login-logo-area">
		<img id="login-table-logo" src="leapin/Images/LeapinLogo.png"/>
	</div>
     <div class="form-group">
     	<input type = "hidden" name = "command" value = "login">
      <label for="u_id">아이디 :</label>
      <input type="text" class="form-control" id="u_id" placeholder="아이디를 입력해주세요(영문  + 숫자 4~12자리)" name="u_id" required>
           
      <div id = "u_id_result" class="valu_id-feedback"></div>
      <div class="invalu_id-feedback"></div>
    </div>
    
    <div class="form-group">
      <label for="pwd">비밀번호 :</label>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력해주세요 (영문 + 숫자 8~12자리)" name = "pwd" required>
      <div id = "pwd_result" class="valu_id-feedback"></div>
      <div class="invalu_id-feedback"></div>
    </div>
  	<div class="form-group" id="form-btn_login2">
   		<button id = "btn_login2" type="submit" class="btn btn-primary">로그인</button>
    </div>
</div>
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
				Copyright ©Leapin Network Inc. All Rights Reserved.
			</li>
		</ul>
	</div>
</nav>
<script>
	$(function(){
		$('#pwd').on('keydown', function (event) {
	  		if (event.keyCode == 13) { // 엔터키
	 			$("#btn_login2").click();
	  		return false;
	  			
	  		}
	  	});
	});
</script>
</body>
</html>