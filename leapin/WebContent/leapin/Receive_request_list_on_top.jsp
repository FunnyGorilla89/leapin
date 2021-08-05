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
<title>Receive_request_list_on_top</title>
<!-- <link rel = "stylesheet" type = "text/css" href = "leapin/Mypage.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
#request-agree:hover {background-color:#007bff;}
#request-disagree:hover {background-color:tomato;}    
.align-self-center.mr-3 {width: 90px; margin-right:20px;}
.bottom{ width:1500px; color:rgb(115,115,115); font-size:12px; text-align:center; border-top: 1px solid #e1e1e1;}
.top{ width:1500px; height:72px; border-bottom:1px solid #e1e1e1;}
#btn_send_offer_view {background-color:tomato; color:white; border:0.5px solid tomato;}
#btn_send_offer_view:hover {background-color:firebrick;}
#pending_payment {width: 184px;}
#current-status {width: 90px;}
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
    #file_download{
		cursor: pointer;
	}
</style>
<script>
		loginId = "<%=loginId%>";
		 E = "<%=E%>";
		 Rno = new Array;
		 Rid = new Array;
		 Rname = new Array;
		 Rcontent = new Array;
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
	<h2 class ="page-name">받은요청 리스트</h2><br/>
	<%-- <h2 class ="mypageh2"><%=dao.receive_name(loginId)%></h2> --%>
		<div class="pagecenter">
			<div class="mypage-main">
				<div id = "mypage_body">
				<div id="category-name"><h3><%=dao.enterprise_category_name(loginId)%></h3></div><br/>
			
						<ul class="list-unstyled">
							<!-- 받은요청 테이블 생성 -->
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
				Copyright ©Liphin Network Inc. All Rights Reserved.
			</li>
		</ul>
	</div>
</nav>
<script>
$(function(){
	$.ajax({
		type:"post",
		url:"./Controller",
		data:{"id":loginId, "command":"Get_request_info"},
		datatype:"json",
		success: function(data){
			var r_info = data.r_info;
			console.log(r_info);
			console.log(data.o_info);
			var o_info = data.o_info;
			var o_content = new Array;
			var o_file_name = new Array;
			var o_date_time = new Array;
			var o_price = new Array;
			for(var i = 0; i < o_info.length; i++){
				o_content.push(o_info[i].o_content);
				o_file_name.push(o_info[i].o_file_name);
				o_date_time.push(o_info[i].o_date_time);
				o_price.push(o_info[i].o_price);
			}
			var str = "";
				var j = 0;
			for(var i = 0; i < r_info.length; i++){
				var rno = r_info[i].rno;
				Rno.push(rno);
				var rid = r_info[i].rid;
				Rid.push(rid);
				var oid = r_info[i].oid;
				var content = r_info[i].content;
				Rcontent.push(content);
				var cno = r_info[i].cno;
				var date_time = r_info[i].date_time;
				console.log("date_time : " + date_time);
				var state = r_info[i].state;
				var hitcount = r_info[i].hitcount;
				var file_name = r_info[i].file_name;
				var warning_cnt = r_info[i].warning_cnt;
				var rname = r_info[i].request_name;
				Rname.push(rname);
				console.log("rname : " + rname);
				console.log("file_name : " + file_name);
				console.log("content : " + content);
				console.log("state : " + state);
				if(state == "거래완료"){
				 	continue;
				}else{
				str += "<li class='media' id='media_id'>";
				str += "<img class='align-self-center mr-3' src='leapin/Images/user.png' alt='User image'>";
				str += "<div class='media-body'><div class='media-body-top'>";
				str += "<div class='media-body'>";
		    	str += "<div class='media-body-top'>";
			    str += "<div class='request-name'><h5 class='mt-0 mb-1' id='request-user'>"+rname+"</h5>&nbsp;<span>(신고횟수:"+warning_cnt+"&nbsp;회)</span></div>";
			    str += "<div class='request-date'><span>"+date_time+"</span></div>";
			    str += "</div>";
			    str += "<div class='media-body-title'>";
			    str += "<div class='media-body-title-left'>";
			    str += "<button type='button' class='btn btn-primary' id='current-status' value='"+state+"' disabled>"+state+"</button>";
			    str += "</div>";
			    str += "<div class='media-body-title-right'>";
				    if(state == "대기"){
				    str += "<button type='button' class='btn btn-primary' id='request-agree'>수락</button>&nbsp;&nbsp;";
				    str += "<button type='button' class='btn btn-primary' id='request-disagree'>거절</button>";
				    }else{
				    str += "<button type='button' class='btn btn-primary' id='pending_payment' disabled>결제대기중..</button>";	
				    }
		     	str += "</div>";
		     	str += "</div>";
		     	str += "<div class='media-body-content'>";
		     	str += "<div class='media-body-content-left'>";
		     	str += "<button type='button' class='btn btn-primary' data-toggle='modal' data-target='#openModal"+rno+"'>내용보기</button>";
		     	str += "</div>";
		     	str += " <div class='media-body-content-right'>";
		     		if(state == "진행중"){
		     			
		     		str += "<button type='button' id='btn_send_offer_view' class='btn btn-primary' data-toggle='modal' data-target='#myModal"+rno+"'>보낸견적보기</button>&nbsp;<button type='button' id = 'chat_btn' class='btn btn-primary'>채팅</button>";		
		     		
		     		str += "<div class='modal fade' id='myModal"+rno+"'>";
		     		str += "<div class='modal-dialog modal-lg'>";
		     		str += "<div class='modal-content'>";
		     		str += "<div class='modal-header'>";
		     		str += "<h4 class='modal-title'>보낸 견적</h4>";
		     		str += "<button type='button' class='close' data-dismiss='modal'>&times;</button>"; 
		     		str += " </div>";
		     		str += "<div class='modal-body'>"+o_content[j]+"</div>";
		     		if(o_file_name[j] != null && o_file_name[j] != "null" && o_file_name[j] != ""){
		     			
		     		str += "<div class='modal-body-content'><span style = 'font-weight:bold; margin-left:15px;'>파일이름 : </span>"+o_file_name[j]+"</div>";
		     		}
		     		console.log(o_file_name[j]);
		     		str += "<div class='modal-footer'>";
		     		str += "<button type='button' class='btn btn-secondary' data-dismiss='modal'>Close</button>";
		     		str += "</div></div></div></div>";
		     		j++;
		     		}
		     	str += "</div>";
		     	str += "<div class='modal fade' id='openModal"+rno+"'>";
		     	str += "<div class='modal-dialog modal-lg'>";
		     	str += "<div class='modal-content'>";
		     	str += "<div class='modal-header'>";
		     	str += "<h4 class='modal-title'>요청 내용</h4>";
		     	str += "<button type='button' class='close' data-dismiss='modal'>&times;</button>";
		     	str += "</div>";     
		     	str += "<div class='modal-body'>"+content+"</div>";
				str += "<div class='modal-footer'>";
				if(file_name != null && file_name != "null" && file_name != ""){
					console.log("file_name : " + file_name);
				str += "<div id = 'file_download' class = 'text-primary'><span id = 'file'>"+file_name+"</span> 내려받기</div>"
					
				}
				str += "</div>";
				str += "<button type='button' class='btn btn-secondary' data-dismiss='modal'>창닫기</button></div>";
				str += "</div></div></div>";
				str += "</div></div></li>";
				}
			}
				$(".list-unstyled").append(str);
				
		},
		error : function(request, status, error){
			alert("알 수 없는 에러 [" + error + "]");
			alert("!!");
		}
	});
	
	$(document).on("click","#request-agree",function(){
		var i = $(this).closest('li').index();
		var rno = Rno[i];
		var rname = Rname[i];
		var rid = Rid[i];
		var rcontent = Rcontent[i];
		var result = confirm("견적서 작성페이지로 넘어가시겠습니까?");
		if(result){
			location.href='Controller?command=Write_offerForm&rno='+rno+'&rname='+rname+'&rcontent='+rcontent+'&rid='+rid+'';
		}

	});
	
	$(document).on("click","#request-disagree",function(){
		var i = $(this).closest('li').index();
		var rno = Rno[i];
		var result = confirm("해당 받은요청서를 거절하시겠습니까?");
		if(result){
			$.ajax({
				type:"post",
				url:"./Controller",
				data:{"id":loginId, "rno":rno, "command":"Disagree_delete_receive_request"},
				datatype:"json",
				success: function(data){
					var result = data.deleteN;
					if(result=="1" || result==1){
						alert("요청번호("+rno+") 받은요청서가 삭제되었습니다.");
						location.href='Controller?command=Receive_request_list_on_top';
					}
				}
			});
		}
	});
	
	$(document).on('click',"#chat_btn", function(){
		var i = $(this).closest('li').index();
		var rno = Rno[i];
		console.log(rno);
		var result = confirm("요청자와의 보낸 기업과의 채팅을 하시겠습니까?");
		if(result){
			location.href = 'Controller?command=chat_log_page&rno='+rno+'';
		}
		
	});
	$(document).on("click","#file_download",function(){
  		var file = $(this).children("#file").text();
  		location.href = getContextPath() + "/downloadAction?file=" + file;
  	});
	
});
function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}
</script>
</body>
</html>

<!-- <button type='button' class='btn btn-primary' id='list-write-offer'>견적서작성</button>
		     			<button type='button' class='btn btn-primary' id='request-state' disabled>결제대기중..</button>-->

