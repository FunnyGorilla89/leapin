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
		var cno = new Array;
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
		 
		 $.ajax({
				type:"post",
				url:"./Controller",
				data:{"command":"Get_category"},
				datatype:"json",
				success: function(data){
					console.log(data);
					var category = data.category;
					console.log(category);
					console.log(category[0]);
					console.log(category[0].cno);
					var str = "";
						str += "<select id = 'category_list'>";
					for(i = 0; i < category.length; i++){
						var cno = category[i].cno;
						var cname = category[i].c_name;
						str += "<option value = '"+cno+"'>"+cname+"</option>";
					}
					str +="</select>"
						$("#category_area").append(str);
				},
				error : function(request, status, error){
					alert("??? ??? ?????? ?????? [" + error + "]");
					alert("!!");
				}
			});
		
		$("#log_out").on('click', function(){
 			var result = confirm("???????????? ???????????????????");
 			if(result){
 				location.href="./Controller?command=logout";
 			}
 		});
		
		$("#send-request").on('click', function(){
			var content = $("#content").val();
			var cno = $("#category_list").val();
			var file = $("#file").val();
			console.log(file);
			var fake = file.split("\\");
			console.log(fake);
			var file_real_name = fake[fake.length-1];   
			console.log(file_real_name);
			if(file_real_name != null && file_real_name != "null" && file_real_name != ""){
				console.log(file_real_name);
				upload();
			}
			$.ajax({
				type:"post",
				url:"./Controller",
				datatype:"json",
				data:{"id" : loginId, "content" : content, "cno" : cno, "file_real_name" : file_real_name, "command" : "writeRequest"},
				success : function(data){
					console.log(data);
					var result = data.result;
					console.log(result);
					if(result != "0"){
							alert("????????? ????????? ?????????????????????.");
							location.href="Controller?command=Receive_offer_on_top";
					}
					else{
						alert("???????????? ??????????????????.");	
					}
				},
				error : function(request, status, error){
					alert("err");
				}
			});
		});
		
		$("#back-page").on('click', function(){
			location.href="./Controller?command=Receive_offer_on_top";
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
	    $("#send-request").prop("disabled", true);   
	    
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
	        	alert("??????????????? ?????? ????????? ???????????????.");
	        	file_name = data;
	        	console.log("file_name2 : " + file_name);
	        	$("#send-request").prop("disabled", false);  
	        },          
	        error: function (e) {  
	        	console.log("ERROR : ", e);     
	            $("#send-request").prop("disabled", false);    
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
<title>?????? ??????</title>
</head>
<body>
<header id="header-area">
	<div class="header-left">
		<div class="h-left1">
			<a href="Controller?command=Main"><img class="logo" src="leapin/Images/LeapinLogo.png"></a>
		</div>
		<div class="h-left2">
			<ul>
				<li><button type="button" class="right-heaeder-button-group" id="btn_search_enterprise" onClick="location.href='????????????.jsp';">????????????</button></li>	<!-- ???????????? -->
				<li><button type="button" class="right-heaeder-button-group" id="btn_search_customer" onClick="location.href='????????????.jsp';">????????????</button></li>	<!-- ???????????? -->
				<li><button type="button" class="right-heaeder-button-group" id="btn_search_receive_offer" onClick="location.href='????????????_????????????.jsp';">??????</button></li>
				<li><button type="button" class="right-heaeder-button-group" id="btn_search_receive_request" onClick="location.href='????????????_????????????.jsp';">??????</button></li>
			</ul>
		</div>
	</div>
	<div class="header-right">
		<button id="btn_logout" class="heaeder-button-group" onclick="location.href='http://localhost:9090/ProjectWeb1/Controller?command=Logout';">????????????</button>
		<button id="btn_board" class="heaeder-button-group" onclick="location.href='http://localhost:9090/ProjectWeb1/Controller?command=Board';">????????? ??????</button>
		<button id="btn_login" class="heaeder-button-group" onclick="location.href='http://localhost:9090/ProjectWeb1/Controller?command=LoginForm';">?????????</button>
		<button id="btn_signup"class="heaeder-button-group" onclick="location.href='http://localhost:9090/ProjectWeb1/Controller?command=SignupForm';">????????????</button>
		<a id="btn_mypage" class="heaeder-button-group" type="button" href="http://localhost:9090/ProjectWeb1/leapin/Mypage.jsp"><b>???????????????</b></a>
		<div class="hello-user">
		<% if(loginId != null){ %>
			<h5><%=(dao.receive_name(loginId)) %>(<%=loginId %>)???, ???????????????!</h5>
		<% }else if(loginId == null){%>
			<h3>???????????? ???????????????.</h3>
		<%} %>
		</div>
	</div>
</header>
<article class = "sent-request-list">
<section class = "container">
		<h1 class ="page-heading-h1">????????? ??????</h1>
			<div class = "header header-left search">
			<form>
				<div class = "input-group">
					<span>
						<img src = "leapin/Images/search.png"/>
					</span>
					<div id = "category_area">
						
					</div>
				</div>
			</form>
			</div>
			<div style = "display : flex; align-items: baseline">	
				<h3>????????? :</h3>
					<%if(loginId != null){%>
						<h3><span style = "margin-left : 20px;"><%=(dao.receive_name(loginId))%></span></h3>
					<%} %>
						
			</div>

			<div class = "requset-body-title">
			<h2>????????? ????????? ??????????????????</h2>
			</div>
			<div>
				<textarea form = "inform" id = "content" rows="10" cols="40" autofocus required wrap = "hard" style = "width : 100%" ></textarea>
			</div>
			<div class = "request-body-button">
			<div class = "body-button-left">
				<div style = "display:flex; margin-top:10px;">
					<span style= "font-size:20px; margin-right:5px;">???????????? : </span>
					<form id="fileUploadForm" method = "post" enctype ="multipart/form-data">
				    	<input type="file" id="file" name="file" class="upload-hidden"> 
					</form>
				</div>
			</div>
			<div class = "body-button-right">
			<button type = "submit" class = "btn btn-primary" id = "send-request" style = "float:right; margin-top:-35px;">?????????</button>
			<button class = "btn btn-primary" id = "back-page" style = "float:right; margin-top:-35px; margin-right:10px;">???????????????</button>
			</div>
		</div>
	<br/><br/>
	</section>
	<section class = "recommended-services container">
		<h2 class = "heading" style = "margin-top:30px;">?????? ?????????</h2>
		<div class = "main-service-card-list row">
			<div class = "main-service-card">
				<div class = "thumb">
					<img src = "https://dmmj3ljielax6.cloudfront.net/upload/service/service_popular_382.jpg?d=300x300"/>
				</div>
				<div class = "title">
				????????? ?????? ??????
				</div>
			</div>
			<div class = "main-service-card">
				<div class = "thumb">
				<img src = "https://dmmj3ljielax6.cloudfront.net/upload/service/service_popular_585.jpg?d=300x300"/>
				</div>
				<div class = "title">
				??????????????? ??????
				</div>
			</div>
			<div class = "main-service-card">
				<div class = "thumb">
				<img src = "https://dmmj3ljielax6.cloudfront.net/upload/service/f8ccaec5-93c2-49eb-ba7e-712505f9d9e7.jpg?d=300x300"/>
				</div>
				<div class = "title">
				??? ??????
				</div>
			</div>
			<div class = "main-service-card">
				<div class = "thumb">
				<img src = "https://dmmj3ljielax6.cloudfront.net/upload/service/featured_service_d8223271-d95d-4711-8eb8-c8aa120d2f6e.png?d=300x300"/>
				</div>
				<div class = "title">
				????????? ?????? ??????
				</div>
			</div>
		</div>
	</section>
</article>
<nav id = "footer-bar">
	<div class = "footer-container-row container">
		<div class ="col-content-list-term">
			<span class = "text term-text">???)????????????????????? ??????????????????????????? ??????????????? ???????????? ????????? ?????? ???????????? ???????????? ???????????? ?????? ??????, ???????????? ?????? ????????? ????????? ????????? ????????????????????? ????????????.</span><br/>
		</div>
		<ul class = "col-content-guide">
			<li class = "text">
				?????????:(???)?????????????????? ?? ????????????:SIN WOO JIN ?? ???????????????????????????:????????? ?? ??????:?????? ????????? ????????? ????????? 110 ????????????3??????
			</li>
			<li class = "text">
				?????????????????????:120-88-22325 ?? ????????????????????????:??? 2021-????????????-06081??? ?? ???????????????????????? ????????????:??????????????? ??? 2021-1???
			</li>
			<li class = "text">
				????????????:2021-06-08 ?? ?????????:Liphin2021@gmail.com
			</li>
			<li class = "text">
				Copyright ??Liphin Network Inc. All Rights Reserved.
			</li>
		</ul>
	</div>
</nav>
</body>
</html>