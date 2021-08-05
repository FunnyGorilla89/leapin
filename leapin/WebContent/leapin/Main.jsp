<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DAO.*" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="leapin/Main.css" rel="stylesheet" type="text/css" /><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>리핀입니다.</title>
<style>
#btn_logout, #btn_board, #btn_mypage, #btn_chatting, #btn_login, #btn_signup, .right-heaeder-button-group {font-size:15px; font-weight:bold; background-color:transparent; border:0; outline:0; border-radius:5px; cursor:pointer;padding:5px;}
#btn_logout:hover, #btn_board:hover, #btn_mypage:hover, #btn_chatting:hover, #btn_login:hover, #btn_signup:hover, .right-heaeder-button-group:hover {background:#c9c9c9;}
.logo {width:120px; height:45px;}
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
.page-name {margin: 1rem 0rem 1rem 1rem; font-weight:bold;}
#btn_mypage {text-decoration:none;}
.col-content-guide {list-style:none;padding-inline-start:0px;}	
</style>
</head>
<%
	String loginId = (String)(session.getAttribute("loginId"));
	String E = (String)(session.getAttribute("E"));
	
	LeapinDAO dao = new LeapinDAO();
%>

<body>
<header id="header-area">
	<div class="header-left">
		<div class="h-left1">
			<a href="Controller?command=main"><img class="logo" src="leapin/Images/LeapinLogo.png"></a>
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
	<div class="home">
		<div id="divMiddleTop" class="middleTop">
			<div class="zoomIn">
				&nbsp;&nbsp;<img id="ct1" src="leapin/Images/서비스 찾기.PNG" style=" height:auto;"/>&emsp;&emsp;
				<img id="sc1" src="leapin/Images/고객 찾기.PNG"/>
			</div>
			<div class="middleLeft" id="divMiddleLeft"></div>
			<div class="middleRight">
				<div id="slideshow">
				     <img src="leapin/Images/메인화면 이미지(촬영).png"/>
				     <img src="leapin/Images/메인화면 이미지(인테리어).PNG"/>
				     <img src="leapin/Images/메인화면 이미지(운동).PNG"/>
				     <img src="leapin/Images/메인화면 이미지(보컬).PNG"/>
				</div>
			</div>
		</div>
		<div class="serviceTitle">
			<span>리핀 인기 기업</span><a href="Controller?command=enterprise_find" class="btn-1">전체보기 ></a>
		</div>
		<div class="serviceCenter"></div> 
			<div style="clear:both;"></div>
		</div>
	<div class="bottom"><br/><br/>
		<span style="margin-right: 35px;">주)리핀네트워크는 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.</span><br/>
		<span style="margin-right: 280px;">상호명:(주)리핀네트워크 · 대표이사:SIN WOO JIN · 개인정보책임관리자:전준하 · 주소:경기 안양시 동안구 동편로 110 동편마을3단지</span><br/>
		<span style="margin-right: 282px;">사업자등록번호:120-88-22325 · 통신판매업신고증:제 2021-경기안양-06081호 · 직업정보제공사업 신고번호:경기북부청 제 2021-1호</span><br/>
		<span style="margin-right: 703px;">고객센터:2021-06-08 · 이메일:Leapin2021@gmail.com</span><br/>
		<span style="margin-right: 704px;">Copyright ©Leapin Network Inc. All Rights Reserved.</span>
	</div>
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
	function loadHtml(url) {
		document.getElementById('divMiddleLeft').innerHTML = '<object type="text/html" data="'+url+'"></object>';
	}
 	
	$(function() {
	 	var count = 4;
		setInterval(function() {
			$("#slideshow :nth-child("+count+")").fadeOut(2000);
		    count--;
		    if(count==0)
		    	count = 4;
		    $("#slideshow :nth-child("+count+")").fadeIn(2000);
 		}, 5000);
		
		$.ajax({
		    type:"GET",
  	        url:"./Controller",
  	        dataType : "json",
  	        data : {"command" : "main_category"},
  	        success : function(data){
  	        	var category = data.category;
  	        	$("#divMiddleLeft").empty();
  	        	var str = "";
	        	str +="<div class='middleSearch'>";
				str +="<div style='font-size:30px; font-weight:1000; color:rgb(51,51,51); line-height: 1.5; margin:28px 0px 0px 8px; letter-spacing:-2px;'>어떤 서비스가<br/>필요하세요?</div>";
				str +="<div><input type='text' placeholder='서비스를 입력하세요'><button><img src='leapin/Images/검색창 돋보기.PNG'/></button></div>";
				str +="</div>";
				str +="<div class='middleCategory'></div>";
				$("#divMiddleLeft").append(str);
  	        	for(var i = 0; i < category.length; i++){
  	        		var str = "";
  	        		str +="<div class = 'categoryIcon'><div class = 'categoryImage'>";
  	        		str +="<img src='leapin/Images/카테고리이미지"+category[i].cno+".PNG'/>";
  	        		str += "<input id = 'cno' type = 'hidden' value = '"+category[i].cno+"'/>";
  	        		str +="</div><div class = 'categoryContent'>";
  	        		str +="<span>"+category[i].cname+"</span></div></div>";
  	        		$(".middleCategory").append(str);
  	       
  	        	}
	  	     	 $(document).on("click",".categoryIcon",function(){
	        		var cno = $(this).find("#cno").val();
	        		alert(cno);
	        	})
  	        },
  	        error : function(data){
  	        	
  	        }
    	});
		$.ajax({
		    type:"GET",
  	        url:"./Controller",
  	        dataType : "json",
  	        data : {"command" : "enterprise"},
  	        success : function(data){
  	        	var enterprise = data.enterprise;
  	        	var average = 0.0;
  	        	for(var i = 0; i < enterprise.length; i++){
  	        		c_number = enterprise[i].c_number;
  	        		average = enterprise[i].review_average;
  	        		var str = "";
  	        		str += "<div class='service'>";
					str += 	 "<div class='serviceImage'>";
					str += 	   "<img src='leapin/Images/"+enterprise[i].file_name+"'/>";
					str +=	 "</div>";
					str +=   "<div class='enterprise'>";
					str += 	   "<span>"+enterprise[i].name+"</span>";
					str += 	 "</div>";
					str += 	   "<div class='starpoint'>";
					str +=   	 "<img src='leapin/Images/리뷰 별.png'/><span style='color:rgb(80,80,80 font-weight:bold;);'>("+average.toFixed(1)+")"+enterprise[i].review_count+"개</span>";
					str +=     "</div>";
  	        		str += "<input id = 'c_number' type = 'hidden' value = '"+enterprise[i].c_number+"'/>";
					str += "</div>";
  	        		$(".serviceCenter").append(str);
  	        	}
  	        	$(".service").click(function(){
  	        		var c_number = $(this).find("#c_number").val();
	        		location.href="Controller?command=enterpriseInformation&c_number="+c_number;
  	        	});
  	        },
  	        error : function(data){
  	        	
  	        }
		});
		$("#ct1").on("click",function(){
			$.ajax({
			    type:"GET",
	  	        url:"./Controller",
	  	        dataType : "json",
	  	        data : {"command" : "main_category", "cno" : cno},
	  	        success : function(data){
	  	        	var category = data.category;
	  	        	$("#divMiddleLeft").empty();
	  	        	var str = "";
  	        		str +="<div class='middleSearch'>";
					str +="<div style='font-size:30px; font-weight:1000; color:rgb(51,51,51); line-height: 1.5; margin:28px 0px 0px 8px; letter-spacing:-2px;'>어떤 서비스가<br/>필요하세요?</div>";
					str +="<div><input type='text' placeholder='서비스를 입력하세요'><button><img src='leapin/Images/검색창 돋보기.PNG'/></button></div>";
					str +="</div>";
					str +="<div class='middleCategory'></div>";
					$("#divMiddleLeft").append(str);
	  	        	for(var i = 0; i < category.length; i++){
	  	        		str = "";
	  	        		str +="<div class = 'categoryIcon'><div class = 'categoryImage'>";
	  	        		str +="<img src='leapin/Images/카테고리이미지"+category[i].cno+".PNG'/>";
	  	        		str += "<input id = 'cno' type = 'hidden' value = '"+category[i].cno+"'/>";
	  	        		str +="</div><div class = 'categoryContent'>";
	  	        		str +="<span>"+category[i].cname+"</span></div></div>";
	  	        		$(".middleCategory").append(str);
	  	       
	  	        	}
	  	        	$(".service").click(function(){
	  	        		var c_number = $(this).find("#c_number").val();
		        		location.href="Controller?command=enterpriseInformation&c_number="+c_number;
	  	        	});
	  	        },
	  	        error : function(data){
	  	        	
	  	        }
	    	});
		});
		$("#sc1").on("click",function(){
		$.ajax({
		    type:"GET",
  	        url:"./Controller",
  	        dataType : "json",
  	        data : {"command" : "main_category"},
  	        success : function(data){
  	        	var category = data.category;
  	        	/* $("#divMiddleLeft").css("margin","6px 0px 0px 6px"); */
  	        	$("#divMiddleLeft").empty();
  	        	var str = "";
  	        	str += "<div style='font-size:30px; font-weight:1000; color:rgb(51,51,51); line-height: 1.5; margin-top: 24px;'>3초에 1명<br/>고객을 찾았어요</div>";
  	  			str += "<div class='menuFont' >";
  	  			str += "<button class='menuBox' style='width:220px; height:50px; margin:20px 0px 0px -1px; float:left; padding: 8px 20px;font-size: 16px; font-weight: bold; color: #fff;'>기업 등록하기</button>";
  	  			str += "</div>";
  	  			str += "<br/><br/><br/><br/>";
  	  			str += "<span style='font-size:20px; font-weight:600; color:rgb(115,115,115);'>리핀에서 새로운 도약을 시작하세요.</span>";
  	  			$("#divMiddleLeft").append(str);
  	        },
  	        
  	        error : function(data){
  	        	
  	        }
    	});
	});
 });
</script>
</body>
</html>