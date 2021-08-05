<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Action.*" %>
<%@ page import = "DAO.*" %>
<%
	String loginId = (String)(session.getAttribute("loginId"));
	String E = (String)(session.getAttribute("E"));
	String pagenum = request.getParameter("pagenum");
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
<script>
loginId = "<%=loginId%>";
E = "<%=E%>";
$(function(){
	console.log(E);
	console.log(loginId);
	 if(loginId == "null" || null){
		 $("#btn_logout").hide();
		 $("#btn_board").hide();
		 $("#btn_mypage").hide();
		 $("#chatting").hide();
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
	 }
	
	$("#log_out").on('click', function(){
			var result = confirm("로그아웃 하시겠습니까?");
			if(result){
				location.href="Controller?command=logout";
			}
	});
	
	$("#back").on('click', function(){
		location.href="Controller?command=Board_list_on_top";
	});
	
	$("#submit").on('click', function(){
		var id = "<%=loginId%>";
		var title = $("#title").val();
		var content = $("#content").val();
		console.log(id);
		console.log(title);
		console.log(content);
		
		$.ajax({
			type:"POST",
  	        url:"./Controller",
  	        dataType : "json",
  	        data : {"id" : id, "title" : title, "content" : content, "command" : "WriteBoard"},
  	        success : function(data){
  	        	console.log(data);
  	        	
  	        	var update = data.update;
  	        	
  	        	if(update == 1){
  	        		alert("글 작성이 완료되었습니다.");
  	        		location.href = "Controller?command=Board_list_on_top";
  	        	}
  	        	else if(update == 0){
  	        		alert("글 작성에 실패 하였습니다.");
  	        	}
  	        	else{
  	        		alert("오류");
  	        	}
  	        },
  	        error : function(request, status, error){
  	        	alert("err");
  	        }
		});
	});
});
</script>
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
<title>게시 글 작성</title>
</head>
<body>
	<header id="header-area">
	<div class="header-left">
		<div class="h-left1">
			<a href="Controller?command=Main"><img class="logo" src="leapin/Images/LeapinLogo.png"></a>
		</div>
		<div class="h-left2">
			<ul>
				<li><button type="button" class="right-heaeder-button-group" id="btn_search_enterprise" onClick="location.href='기업찾기.jsp';">기업찾기</button></li>	<!-- 잠시보류 -->
				<li><button type="button" class="right-heaeder-button-group" id="btn_search_customer" onClick="location.href='고객찾기.jsp';">고객찾기</button></li>	<!-- 잠시보류 -->
				<li><button type="button" class="right-heaeder-button-group" id="btn_search_receive_offer" onClick="location.href='Controller?command=Receive_offer_on_top';">견적</button></li>
				<li><button type="button" class="right-heaeder-button-group" id="btn_search_receive_request" onClick="location.href='Controller?command=Receive_request_list_on_top';">요청</button></li>
			</ul>
		</div>
	</div>
	<div class="header-right">
		<button id="btn_logout" class="heaeder-button-group" onclick="location.href='http://localhost:9090/ProjectWeb1/Controller?command=Logout';">로그아웃</button>
		<button id="btn_board" class="heaeder-button-group" onclick="location.href='http://localhost:9090/ProjectWeb1/Controller?command=Board_list_on_top';">게시판 보기</button>
		<button id="btn_login" class="heaeder-button-group" onclick="location.href='http://localhost:9090/ProjectWeb1/Controller?command=LoginForm';">로그인</button>
		<button id="btn_signup"class="heaeder-button-group" onclick="location.href='http://localhost:9090/ProjectWeb1/Controller?command=SignupForm';">회원가입</button>
		<a id="btn_mypage" class="heaeder-button-group" type="button" href="http://localhost:9090/ProjectWeb1/leapin/Mypage.jsp"><b>마이페이지</b></a>
		<div class="hello-user">
		<% if(loginId != null){ %>
			<h5><%=(dao.receive_name(loginId)) %>(<%=loginId %>)님, 안녕하세요!</h5>
		<% }else if(loginId == null){%>
			<h3>로그인이 필요합니다.</h3>
		<%} %>
		</div>
	</div>
</header>

<div class="container mt-3" style = "margin-top : 50px;">
  
  <h2>글작성</h2>
  
  
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">제목</span>
      </div>
      <input type="text" class="form-control" id="title">
    </div>

   <div class="form-group">
  <label for="content">글 내용:</label>
  <textarea class="form-control" rows="20" id="content"></textarea>
	</div>
	<!-- <div class = "row container" style = "justify-content: flex-end;"> -->
	
	<button id = "back" type = "button" class = "btn btn-outline-danger">돌아가기</button>	
    <button id = "submit" type="submit" class="btn btn-outline-primary">작성하기</button>
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
</body>
</html>