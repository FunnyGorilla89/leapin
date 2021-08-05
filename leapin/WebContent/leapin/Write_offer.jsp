<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Action.*" %>
<%@ page import = "DAO.*" %>
<%
	String loginId = (String)(session.getAttribute("loginId"));
	String E = (String)(session.getAttribute("E"));
	LeapinDAO dao = new LeapinDAO();
	String rno = request.getParameter("rno");
	String rid = request.getParameter("rid");
	String rname = request.getParameter("rname");
	String rcontent = request.getParameter("rcontent");
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
    
#offer_price_to_requester {width:50%; margin-bottom:10px;}
</style>
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
 				location.href="./Controller?command=logout";
 			}
 		});
		
		$("#btn_send_offer").on('click', function(){
			var rno = "<%=rno%>";
			console.log(rno);
			var content = $("#offer_content").val();
			var price = $("#offer_price_to_requester").val();
			var file = $("#file").val()
			var file_name = file.split("\\");
			var file_real_name = file_name[file_name.length-1];
			var command = "Write_offer";
			console.log("command : " + command)
			if(file_real_name != null && file_real_name != "" && file_real_name != "null"){
				console.log(file_name);
				upload();
			}
			$.ajax({
				type:"post",
				url:"./Controller",
				datatype:"json",
				data:{"id" : loginId, "rno":rno, "content" : content, "file_real_name": file_real_name, "price":price, "command" : command},
				success : function(data){
					console.log(data);
					var result = data.success;
					if(result=="1"){
						alert("견적서 작성이 완료되었습니다.");
						location.href="Controller?command=Receive_request_list_on_top";
					}
					
				},
				error : function(request, status, error){
					alert("견적서 작성값에 문제가 있습니다.");
				}
			});
		});
		
		$("#back-page").on('click', function(){
			location.href="./Controller?command=Receive_request_list_on_top";
		});
	});
		
		function upload(){
			event.preventDefault();          
		    // Get form         
		    var form = $('#fileUploadForm')[0];  
		    console.log(form);
		    // Create an FormData object
		    var data = new FormData(form);  	   
		    console.log(data);
		    // disabled the submit button       
		    $("#btn_send_offer").prop("disabled", true);   
		    
		    $.ajax({             
		    	type: "POST",          
		        enctype: 'multipart/form-data',  
		        url: "./upload",        
		        data: data,          
		        processData: false,    
		        contentType: false,      
		        cache: false,           
		        timeout: 600000,       
		        success: function (data) { 
		        	alert("첨부파일이 정상 업로드 되었습니다.");    
		        	file_name = data;
		        	console.log("file_name2 : " + file_name);
		        	$("#btn_send_offer").prop("disabled", false);  
		        },          
		        error: function (e) {  
		        	console.log("ERROR : ", e);     
		            $("#btn_send_offer").prop("disabled", false);    
		            alert("fail");  
		         }     
			});  
		
	}
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
	#detail_btn{
		width:250px;
		height:50px;
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
		<%if(loginId != null){%>
		<h2 class ="page-heading-h1">견적서 작성</h2><br/>
				<div id="category-name"><h3><%=dao.enterprise_category_name(loginId)%></h3></div><br/>
				<div class = "requester">	
			<div style = "display : flex; align-items: baseline">	
				<h5>요청자 :</h5>
				<h5><span style = "margin-left : 20px;"><%=rname%>(<%=rid%>)</span></h5>
			</div>
			<form>
			<div>
				<textarea form = "inform" id = "offer_content" rows="10" cols="40" placeholder="견적내용을 입력해주세요" autofocus required wrap = "hard" style = "width : 100%" required></textarea>
			</div>
			<div class="price-area">
				<input type="number" min="0" max="9999999999" id="offer_price_to_requester" name="offer_price_to_requester" placeholder="견적가격을 입력해주세요" required/>
			</div>
			</form>
			<div class = "offer-body-button">
				<div class = "body-button-left">
					<div class="file-upload preview-image">
						<form id="fileUploadForm" method = "post" enctype ="multipart/form-data">
				    	<input type="file" id="file" name="file" class="upload-hidden"> 
						</form>
					</div>
				</div>
				<div class = "body-button-right">
					<button type = "submit" class = "btn btn-primary" id = "btn_send_offer" style = "float:right; margin-top:-35px;">견적서발송</button>
					<button class = "btn btn-primary" id = "back-page" style = "float:right; margin-top:-35px; margin-right:10px;">이전페이지</button>
				</div>
			</div>
		</div>
	<br/><br/>
	</section>
		<%}else{ %>
			<h3 style="color:red;"> 로그인이 필요한 페이지 입니다.</h3><br/>
		<%} %>
	<section class = "recommended-services container">
		<h2 class = "heading" style = "margin-top:30px;">추천 서비스</h2>
		<div class = "main-service-card-list row">
			<div class = "main-service-card">
				<div class = "thumb">
					<img src = "https://dmmj3ljielax6.cloudfront.net/upload/service/service_popular_382.jpg?d=300x300"/>
				</div>
				<div class = "title">
				컴퓨터 활용 레슨
				</div>
			</div>
			<div class = "main-service-card">
				<div class = "thumb">
				<img src = "https://dmmj3ljielax6.cloudfront.net/upload/service/service_popular_585.jpg?d=300x300"/>
				</div>
				<div class = "title">
				소프트웨어 개발
				</div>
			</div>
			<div class = "main-service-card">
				<div class = "thumb">
				<img src = "https://dmmj3ljielax6.cloudfront.net/upload/service/f8ccaec5-93c2-49eb-ba7e-712505f9d9e7.jpg?d=300x300"/>
				</div>
				<div class = "title">
				웹 개발
				</div>
			</div>
			<div class = "main-service-card">
				<div class = "thumb">
				<img src = "https://dmmj3ljielax6.cloudfront.net/upload/service/featured_service_d8223271-d95d-4711-8eb8-c8aa120d2f6e.png?d=300x300"/>
				</div>
				<div class = "title">
				데이터 분석 레슨
				</div>
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
				Copyright ©Liphin Network Inc. All Rights Reserved.
			</li>
		</ul>
	</div>
</nav>
</body>
</html>