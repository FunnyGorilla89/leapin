<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="DAO.LeapinDAO" %>
<!DOCTYPE html>
<html>
<head>
<%
String id = (String)session.getAttribute("id");
String e = (String)session.getAttribute("e");
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
	var id = "<%=id%>";
	var e  = "<%=e%>";
	
	console.log(id);
	console.log(e);
	
	if(id == null || id == "null"){
		$("#log_out").hide();
		$("#offer").hide();
		$("#mypage").hide();
		$("#chatting").hide();
		$("#Receivedrequest").hide();	
		$("#Receivedoffer").hide();
	}
	else{
		if(e == null || e == "null"){
			$("#sign_up").hide();
			$("#log_in").hide();
			$("#offer").hide();
			$("#Receivedrequest").hide();
		}
		else{
			 $("#log_in").hide();
			 $("#sign_up").hide();
		}
		
	}
});
</script>
<title>Insert title here</title>
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
	.detail-offer-box{
		border : 1px solid gray;
	}
	#ono{
		background-color:#f9f9f9;
		height:40px;
		border-bottom:1px solid gray;
	}
	#writer{
		border-top:1px solid gray;
	}
	.box-body{
		background-color:#f9f9f9;
	}
	.detail-offer-bottom{
		text-align:right;
		margin-top:10px;
		margin-bottom:10px;
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
	.category-name{
		display: flex;
    	justify-content: flex-start;
	}
</style>
</head>
<body>
	<header>
		<div class = "header-left">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="leapin/main.jsp">Leapin</a>
		<ul class="navbar-nav">
		  	<li class="nav-item" id = "log_out">
		      <a class="nav-link" href="#">로그아웃</a>
		    <li class="nav-item" id = "sign_up">
		      <a class="nav-link" href="http://localhost:9090/ProjectWeb1/Controller?command=SignupForm">회원가입</a>
		    </li>
		    <li class="nav-item" id ="log_in">
		      <a class="nav-link" href="leapin/Login.jsp">로그인</a>
		    </li>
		    <li class="nav-item" id = "offer">
		      <a class="nav-link" href="offer.jsp">게시판</a>
		    </li>
		     <li class="nav-item" id = "chatting">
		      <a class="nav-link" href="chat_main.jsp">채팅</a>
		    </li>
		     <li class="nav-item" id = "mypage">
		      <a class="nav-link" href="Mypage.jsp">마이페이지</a>
		    </li>
		     <li class="nav-item" id = "Receivedoffer">
		      <a class="nav-link" href="ReceivedOffer.jsp">견적서</a>
		    </li>
		     <li class="nav-item" id = "Receivedrequest">
		      <a class="nav-link" href="ReceivedRequest.jsp">요청서</a>
		    </li>
	  </ul>
	  <div class = "header-right">
			<div class="hello-user">
			<% if(id != null){ %>
				<h3><%=(dao.receive_name(id)) %>(<%=id %>)님, 안녕하세요!</h3>
			<% }else if(id == null){%>
				<h3>로그인이 필요합니다.</h3>
			<%} %>
			</div>
		</div>	
	</nav>
	</div>
	
</header>

<div class = "container">
	<div class = "main-header">
		<h2>상세 페이지(받은 견적서)</h2>
		<div class = "category-name">
		<h4>카테고리 : </h4><h4 id = "c_name">IT</h4>
		</div>
	</div>	
	
	<div class = "detail-offer">
		
		<div class = "detail-offer-box">
			<div class = "box-header">
				<h4 id = "ono">견적서 번호 : ?</h4>
				<h4 id = "writer">작성자 : ?</h4>
				<span>작성일자 : </span><span id = "date_time"></span>
			</div>
			
			<div class = "box-body area">
				<textarea id = "content" rows = "10" cols = "150"></textarea>
			</div>
		
		</div><!-- detail-offer-box -->
	</div><!-- detail-offer -->
	
	<div class = "detail-offer-bottom"> 
		<input type = "hidden" id = "delete" value = "삭제">
		<button id = "list" onclick="location.href='ReceivedOffer_list.jsp';">목록</button>
	</div>
</div><!-- container -->

</body>
</html>