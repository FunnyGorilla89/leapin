<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "Action.*" %>
<%@ page import = "DAO.*" %>
<%
	String loginId = (String)(session.getAttribute("loginId"));
	String E = (String)(session.getAttribute("E"));
	String pagenum = request.getParameter("pagenum");
	String cno = request.getParameter("Cno");
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
#state_btn{width:90px;}
#chat_btn{width:90px;}
.media-body-title{display: flex; align-items: center; justify-content: flex-end; margin-bottom: 20px;}
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
	E  = "<%=E%>";
	cno = parseInt("<%=cno%>");
	console.log("cno : " + cno);
	r_content = "";
	r_file_name = "";
	Ono = new Array;
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
		type : "post",
		url : "./Controller",
		datatype : "json",
		data:{"id" : loginId, "command" : "receivedofferlist", "cno" : cno},
		success : function(data){
			console.log(data);
			var receivedofferlist = data.receivedofferlist;
			console.log(receivedofferlist);
			r_content = data.r_content;
			r_file_name = data.r_file_name;
			console.log("r_content : " + r_content);
			$("#box").empty();
			
			var str = "";
			
			for(var i = 0; i < receivedofferlist.length; i++){
				var ono = receivedofferlist[i].ono;
				Ono.push(ono);
				var rno = receivedofferlist[i].rno;
				var name = receivedofferlist[i].name;
				var content = receivedofferlist[i].content;
				var cno = receivedofferlist[i].cno;
				var date_time = receivedofferlist[i].date_time;
				var state = receivedofferlist[i].state;
				var file_name = receivedofferlist[i].file_name;
				var price = receivedofferlist[i].price;
				var e_name = receivedofferlist[i].e_name;
				var c_name = receivedofferlist[0].c_name;
				$("#c_name").text(c_name);
				var warning_cnt = receivedofferlist[i].warning_cnt;
				console.log(ono);
				console.log(rno);
				console.log(name);
				console.log(content);
				console.log(cno);
				console.log(date_time);
				console.log(state);
				console.log(file_name);
				console.log(price);
				console.log(e_name);
				console.log(c_name);
				console.log(warning_cnt);
				
				if(state == "거래완료" || state == "대기"){
					continue;
				}
				else if(state == "진행중"){
					str += "<li class='media'><img class='align-self-center mr-3' src='leapin/Images/user.png' alt='User image'>";
					str += "<div class='media-body'><div class='media-body-top'>";
					str += "<div class='request-name'><h5 class='mt-0 mb-1' id='request-user'>"+e_name+"</h5>&nbsp;<span>(신고횟수:"+warning_cnt+"회)</span></div>";
					str += "<div class='request-date'><span>"+date_time+"</span></div></div>";
					str += "<div class='media-body-title'><div class='media-body-title-right'><button type='button' id = 'state_btn' class='btn btn-primary' disabled>"+state+"</button></div></div>";
					str += "<div class='media-body-content'><div class='media-body-content-left'>";
					str += "<button type='button' class='btn btn-primary content-look' data-toggle='modal' data-target='#openModal"+ono+"'>내용보기</button></div>";
					str += " <div class='media-body-content-right'><button type='button' id = 'chat_btn' class='btn btn-primary'>채팅</button></div>";
					str += "<div class='modal fade' id='openModal"+ono+"'><div class='modal-dialog modal-lg'><div class='modal-content'>";
					str += "<div class='modal-header'><h4 class='modal-title'>견적 내용</h4><button type='button' class='close' data-dismiss='modal'>&times;</button></div>";
					str += "<div class='modal-body'>"+content+"<div class = 'modal-body-right' style = 'float:right; font-weight:bold;'><span>가격 : </span>"+price+"<span>원</span></div>";
					str += "<div class='modal-footer'>";
					if(file_name != null || file_name != "null" || file_name != ""){
						str += "<div id = 'file_download' class = 'text-primary'><span id = 'file'>"+file_name+"</span> 내려받기</div>"
					}
					str += "<button type='button' class='btn btn-secondary' data-dismiss='modal'>창닫기</button></div>";
					str += "</div></div></div></div></div></li>";
					//Cno.push(receivedoffer[i].Cno);
				}
					
			}
			
			$("#box").append(str);

		},
		error : function(request, status, error){
			alert("err");
		}
	});
	
	$("#my_request").on('click', function(){
 				$("#my_request_body").empty();
 				
 				$("#my_request_body").append("<div class = 'content'>"+r_content+"</div>");
 				if(r_file_name != ""){
 				$("#my_request_body").append("<div class = 'file_name'><span style = 'font-weight:bold;'>파일 이름 : </span>"+r_file_name+"</div>"); 					
 				}
			
		});
	$(document).on('click',"#chat_btn", function(){
		var i = $(this).closest('li').index();
		var Ono1 = Ono[i];
		console.log(Ono1);
		var result = confirm("견적서를 보낸 기업과의 채팅을 하시겠습니까?");
		if(result){
			location.href = 'Controller?command=chat_log_page&Ono='+Ono1+'';
		}
		
	});
	
	/*$(".content-look").on('click',function(){
		if(loginId == null || loginId == "null"){
			alert("로그인이 필요합니다.");
			location.href ="Controller?command=LoginForm";
		}
		else{	// 견적서 내용보기마다 다른 견적서의 내용이 나와야 하므로 수정해야함.
			$.ajax({
				type:"post",
				url:"./Controller",
				datatype:"json",
				data : {"content" : content, "command" : "sentoffer"},
				success : function(data){
					console.log(data);
					var sentoffer = data.sentoffer;
					console.log(sentoffer);
					
					$(".modal-body").empty();
					
					$(".modal-body").append(sentoffer);
					
				},
				error : function(request, status, error){
					alert("err");
				}
			});
		}
	
	});*/
	
	$("#log_out").on('click', function(){
			var result = confirm("로그아웃 하시겠습니까?");
			if(result){
				location.href="./Controller?command=Logout";
			}
	});
  	$('[data-toggle="popover"]').popover();
		    	
});
</script>
<title>받은 견적서 리스트</title>
<style>
	.main-header{
		display:flex;
		justify-content: space-between;
	}
	#my_request{
		margin-top:40px;
    	height:50px;
	}
	.select_box{
		padding:.8em .5em;
		border-radius:8px;
		border: 1px solid #999;
		margin-right:15px;
	}
	.main-header-right{
		margin-bottom:10px;
		align-items: flex-end;
	}
	.main-header-right > div > button{
		margin-left : 10px;
	}
	table{
		border-collapse:collapse;
	}
	table,th,td{
		border:1px solid black;
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
				<li><button type="button" class="right-heaeder-button-group" id="btn_search_receive_offer" onClick="location.href='Controller?command=Receive_offer_on_top';">견적</button></li>
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
	<h2 class ="page-name">받은견적 리스트</h2><br/>
	<%-- <h2 class ="mypageh2"><%=dao.receive_name(loginId)%></h2> --%>
		<div class="pagecenter">
			<div class="mypage-main">
				<div id = "mypage_body">
				<div id="category-name"><h3 id = "c_name">IT</h3></div><br/>
					<div class="array-type">
						<button type="button" id="my_request" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
						   내가 작성한 요청서보기
						 </button>
						 
				 <!-- The Modal -->
				  <div class="modal fade" id="myModal">
				    <div class="modal-dialog modal-lg">
				      <div class="modal-content">
				      
				        <!-- Modal Header -->
				        <div class="modal-header">
				          <h4 class="modal-title">내가 작성한 요청서 내용</h4>
				          <button type="button" id = "my_request" class="close" data-dismiss="modal">&times;</button>
				        </div>
				        
				        <!-- Modal body -->
				        <div id = "my_request_body"class="modal-body">
				          
				        </div>
				        
				        <!-- Modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        </div>
				        
				      </div>
				    </div>
				  </div><!-- 내가 작성한 요청서 보기 모달 -->
						 
					</div><br/>
						<ul id = "box" class="list-unstyled"><!-- 여기 안에 append -->
						 	
							    
							
								    	
				
							    	

										
										
										  
										      

										        
										     
										        
						
						 	<li class="media">
							    <img class="align-self-center mr-3" src="leapin/Images/user.png" alt="User image">
							    <div class="media-body">
							    	<div class="media-body-top">
								    	<div class="request-name"><h5 class="mt-0 mb-1" id="request-user">견적서2</h5>&nbsp;<span>(신고횟수:7&nbsp;회)</span></div>
								    	<div class="request-date"><span>2021/07/15</span></div>
							    	</div>
							    	<div class="media-body-title">
							    		<div class="media-body-title-left">
							    			<button type="button" class="btn btn-primary" disabled>대기중</button>
							    		</div>
							    		<div class="media-body-title-right">
							    			<span>가격 : </span><span>150000</span>
							    		</div>							    		
							    	</div>
							    	<div class="media-body-content">
							    		<div class="media-body-content-left">
							    		<button type="button" class="btn btn-primary content-look" data-toggle="modal" data-target="#openModal">
										    내용보기
										  </button>
										 </div>
										 <div class="media-body-content-right">
								    		<button type="button" class="btn btn-primary">
											   	채팅
											  </button>
											</div>
										  <div class="modal fade" id="openModal">
										    <div class="modal-dialog modal-lg">
										      <div class="modal-content">
										      
										        <div class="modal-header">
										          <h4 class="modal-title">견적 내용</h4>
										          <button type="button" class="close" data-dismiss="modal">&times;</button>
										        </div>
										        
										        <div class="modal-body">
										          	
										        </div>
										        
										        <div class="modal-footer">
										        <div class='file-upload preview-image'>
										        	<form id='fileUploadForm' method = 'post' enctype ='multipart/form-data'>
													<input type='file' id='file' class='upload-hidden'>
													</form>
												</div>
										          <button type="button" class="btn btn-secondary" data-dismiss="modal">창닫기</button>
										        </div>
										        
										      </div>
										    </div>
										  </div>
							    	</div>
							    </div>
						  	</li>
						  	<li class="media">
							    <img class="align-self-center mr-3" src="leapin/Images/user.png" alt="User image">
							    <div class="media-body">
							    	<div class="media-body-top">
								    	<div class="request-name"><h5 class="mt-0 mb-1" id="request-user">견적서3</h5>&nbsp;<span>(신고횟수:3&nbsp;회)</span></div>
								    	<div class="request-date"><span>2021/07/15</span></div>
							    	</div>
							    	<div class="media-body-title">
							    		<div class="media-body-title-left">
							    			<button type="button" class="btn btn-primary" disabled>진행중</button>
							    			</div>
							    	</div>
							    	<div class="media-body-content">
							    		<div class="media-body-content-left">
							    		<button type="button" class="btn btn-primary content-look" data-toggle="modal" data-target="#openModal">
										    내용보기
										  </button>
										 </div>
										 <div class="media-body-content-right">
								    		<button type="button" class="btn btn-primary">
											   	채팅
											  </button>
											</div>
										  <div class="modal fade" id="openModal">
										    <div class="modal-dialog modal-lg">
										      <div class="modal-content">
										      
										        <div class="modal-header">
										          <h4 class="modal-title">견적 내용</h4>
										          <button type="button" class="close" data-dismiss="modal">&times;</button>
										        </div>
										        
										        <div class="modal-body">
										          	
										        </div>
										        
										        <div class="modal-footer">
										          <button type="button" class="btn btn-secondary" data-dismiss="modal">창닫기</button>
										        </div>
										        
										      </div>
										    </div>
										  </div>
							    	</div>
							    </div>
						  	</li>
						</ul>
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
				Copyright ©Leapin Network Inc. All Rights Reserved.
			</li>
		</ul>
	</div>
</nav>






</body>
</html>