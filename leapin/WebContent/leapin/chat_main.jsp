<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DAO.*"%>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <title>채팅세부페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <%
	String loginId = (String)(session.getAttribute("loginId"));
	String E = (String)(session.getAttribute("E"));
	LeapinDAO dao = new LeapinDAO();
%>
<script>
	loginId = "<%=loginId%>";
	 E = "<%=E%>";
	ono = new Array;
	ono2 = new Array;
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

		 $.ajax({
			 	type:"POST",
	  	        url:"./Controller",
	  	        dataType : "json",
	  	        data : {"id" : loginId, "command" : "chat_main"},
	  	        success : function(data){
	  	        	console.log(data);
	  	        	console.log("data.dbdata : " + data.dbdata);
	  	        	console.log("data.dbdata2 : " + data.dbdata2);
	  	        	var chat = data.dbdata;
	  	        	var chat2 = data.dbdata2;
	  	        	console.log(chat2);
	  	        	for(var i = 0; i < chat.length; i++){
	  	        		var str = "";
	  	        		str += "<div class='chat-content'><div class='message-box'><div class='picture'>";
	  	        		str += "<img src='Images/"+chat[i].file_name+"' title='"+chat[i].e_name+"'/> </div>";
	  	        		str += "<div class='message'><span>"+chat[i].e_name+"</span>";
	  	        		str += "<p>"+chat[i].content+"</p></div></div></div>";
	  	        		$("#chat_body").append(str);
	  	        		ono.push(chat[i].ono); 	        		
	  	        	}
	  	        	
		  	       	for(var i = 0; i < chat2.length; i++){
	  	        		var str = "";
	  	        		str += "<div class='chat-content2'><div class='message-box'><div class='picture'>";
	  	        		str += "<img src='Images/user.png'/> </div>";
	  	        		str += "<div class='message'><span>"+chat2[i].e_name+"</span>";
	  	        		str += "<p>"+chat2[i].content+"</p></div></div></div>";
	  	        		$("#chat_body").append(str);
	  	        		ono2.push(chat2[i].ono);	
	  	        	}
		  	        	
	  	        },
	  	        error : function(data){
	  	        	
	  	        }
	  	        
		 });
		 $(document).on("click","#chat_body > .chat-content",function(){
			 var i = $(this).index();
			 alert(i);
			location.href = './Controller?command=chat_log_page&ono='+ono[i];	
		 });
		 $(document).on("click","#chat_body > .chat-content2",function(){
			 var i = $(this).index();
			 alert(i);
			location.href = './Controller?command=chat_log_page&ono='+ono2[i];	
		 });
  	});
  </script>
  <style>
  
#btn_logout, #btn_board, #btn_mypage, #btn_chatting, #btn_login, #btn_signup, .right-heaeder-button-group {font-size:15px; font-weight:bold; background-color:transparent; border:0; outline:0; border-radius:5px; cursor:pointer;padding:5px;}
#btn_logout:hover, #btn_board:hover, #btn_mypage:hover, #btn_chatting:hover, #btn_login:hover, #btn_signup:hover, .right-heaeder-button-group:hover {background:#c9c9c9;}
.logo {width:120px; height:45px;}
#header-area {display: flex;justify-content: space-between;align-items: center; border-bottom: 1px solid gray; height:70px;}
.header-left {display: flex; align-items: center; margin-left: 10px;}
.h-left2 {padding-left:50px;}
.h-left2 ul {margin:0; display: flex; align-items: center;}
.h-left2 li {list-style:none;}
.h-left2 a {text-decoration:none;}
.header-right {display: flex; align-items: center;}
.header-button-group{height: 40px;margin-right: 20px;}
.hello-user{display: flex; align-items: center; padding-left:5px;}
.page-name {margin: 1rem 0rem 1rem 1rem; font-weight:bold;}
#btn_mypage {text-decoration:none;}
.col-content-guide {list-style:none;padding-inline-start:0px;}	

  	#chat_body > div{
  		border-top : 1px solid;
  		border-bottom : 1px solid;
  		margin : 10px;
  		width : 70%;
  	}
  </style>
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
<div class = "container" style = "margin-top : 50px;">
		<h2>채팅</h2>
	
	<div class="header">
		<h2>List(enterprise)</h2>
 	</div>
 	
	<div id = "chat_body">
	</div>
	
</div>

</body>
</html>