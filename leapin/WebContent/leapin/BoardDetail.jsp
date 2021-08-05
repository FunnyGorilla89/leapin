<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="DAO.LeapinDAO" %>
<!DOCTYPE html>
<html>
<head>
<%
String loginId = (String)session.getAttribute("loginId");
String E = (String)session.getAttribute("E");
LeapinDAO dao = new LeapinDAO();
%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$(function(){
	var loginId = "<%=loginId%>";
	var E  = "<%=E%>";
	
	console.log(id);
	console.log(e);
	
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
<title>상세 페이지</title>
<style>
	.container{
		margin-bottom:10px;	
	}
	.box-body{
		margin-top : 20px;
	}
	.box-header{
		border-bottom : 1px solid gray;
	}
	.detail-board-box{
		border : 1px solid gray;
	}
	#bno{
		background-color:#f9f9f9;
		height:40px;
		border-bottom:1px solid gray;
	}
	#title{
		border-top:1px solid gray;
	}
	.box-body{
		background-color:#f9f9f9;
	}
	.detail-board-bottom{
		text-align:right;
		margin-top:10px;
		margin-bottom:10px;
	}
	#update{
		width:70px;
		text-align:center;
		border-radius:5px;
		background-color:white;
	}
	#delete{
		width:70px;
		text-align:center;
		border-radius:5px;
		background-color:white;
	}
	#list{
		width:70px;
		text-align:center;
		border-radius:5px;
		background-color:white;
	}
	#submit_reply{
		border-radius:5px;		
		margin-left:10px;
		width:80px;
		font-size:18px;
		color:white;
		background-color:black;
	}
	#comments{
		margin-bottom:10px;
	}
	.reply-area{
		margin-top:10px;
	}
	.area{
		resize:none;
	}
	.reply-area{
		padding: 20px 0px 20px 0px;
	}
	.comment-row{
		margin-bottom:20px;
		border-bottom:dotted;
	}
	.comment-box{
		display: flex;
	    align-items: flex-end;
	    margin-bottom: 50px;
	}
	#comment-list-box{
		background-color:#f9f9f9;
	}
	.comment-list{
		border-bottom:1px dotted;
	}
	.re-writer{
		border:none;
		background-color:#f9f9f9;
	}
	.reply-button{
		text-align:right;
	}
	.re_warning_btn{
		border:none;
		background-color:#f9f9f9;
		color:#f49a95;
	}
	.re-content{
		border:none;
		background-color:#f9f9f9;
		white-space:pre;
		word-break:break-word;
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

<div class = "container">
	<div class = "main-header">
		<h2>상세 페이지(게시물 보기)</h2>
	</div>	
	
	<div class = "detail-board">
		<span id = "hitcount">조회수 : n</span><br/>
		<span id = "recommend">추천수 : n</span><br/>
		<span id = "warning">신고수 : n</span>
		<br/><br/>
		
		<div class = "detail-board-box">
			<div class = "box-header">
				<h4 id = "bno">글번호 : ?</h4>
				<h4 id = "writer">작성자 : ?</h4>
				<span>작성일자 : </span><span id = "date_time"></span>
				<h4 id = "title">제목 : ?</h4>
			</div>
			
			<div  class = "box-body area">
				<textarea id = "content" rows = "10" cols = "150"></textarea>
			</div>
		
		</div><!-- detail-board-box -->
	</div><!-- detail-board -->
	
	<div class = "detail-board-bottom">
		<input type = "hidden" id = "update" value = "수정"> 
		<input type = "hidden" id = "delete" value = "삭제"> 
		<button id = "list" onclick="location.href='Board.jsp';">목록</button>
	</div>
</div><!-- container -->

<div class = "container">
<div id = "comments">
	<div class = "comment-header">
	<div id = "comment-head" class = "comment-row">
		<div style = "font-size:20px;">댓글<span id = "comments-count">2</span></div>
	</div>
	</div>
	
	<div class = "comment-box">
		<textarea id = "new-comment" class = "reply-area area" name = "new_comment" rows = 5 cols = 120 placeholder = "댓글을 입력해주세요"></textarea>
		<button type = "submit" id = "submit_reply">입력</button>
	</div>
	
	<div id = "comment-list-box">
		<div class = "comment-list">
		<div class = "reply-writer">
			<input type = "text" class = "re-writer">
			<span class = "re-writedate">21-07-17 16:15:21</span>
		</div><br/>
		
		<div class = "reply-content">
			<input type = "text" class = "re-content" size = 70 maxlength='150' value = "안녕하세요~~~~~~~~~~~~~~~~~~~">
		</div><br/>
		
		<div class = "reply-button">
			<button class = "re_warning_btn">신고</button>
		</div>
		</div>
		
		<div class = "comment-list">
		<div class = "reply-writer">
			<input type = "text" class = "re-writer">
			<span class = "re-writedate">21-07-17 16:15:21</span>
		</div><br/>
		
		<div class = "reply-content">
			<input type = "text" class = "re-content" size = 70 maxlength='150' value = "안녕하세요~~~~~~~~~~~~~~~~~~~">
		</div><br/>
		
		<div class = "reply-button">
			<button class = "re_warning_btn">신고</button>
		</div>
		</div>
		
		<div class = "comment-list">
		<div class = "reply-writer">
			<input type = "text" class = "re-writer">
			<span class = "re-writedate">21-07-17 16:15:21</span>
		</div><br/>
		
		<div class = "reply-content">
			<input type = "text" class = "re-content" size = 70 maxlength='150' value = "안녕하세요~~~~~~~~~~~~~~~~~~~">
		</div><br/>
		
		<div class = "reply-button">
			<button class = "re_warning_btn">신고</button>
		</div>
		</div>
		
		<div class = "reply-writer">
			<input type = "text" class = "re-writer">
			<span class = "re-writedate">21-07-17 16:15:21</span>
		</div><br/>
		
		<div class = "reply-content">
			<input type = "text" class = "re-content" size = 70 maxlength='150' value = "안녕하세요~~~~~~~~~~~~~~~~~~~">
		</div><br/>
		
		<div class = "reply-button">
			<button class = "re_warning_btn">신고</button>
		</div>
	</div><!-- comment-list-box-->
	
</div><!-- comment -->
</div><!-- container -->
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