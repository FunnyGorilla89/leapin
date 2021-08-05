<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DAO.*" %>
<!DOCTYPE html>
<html>
<head>
<%
String loginId = (String)session.getAttribute("loginId");
String E = (String)session.getAttribute("E");
LeapinDAO dao = new LeapinDAO();
%>
<meta charset="UTF-8">
<link rel = "stylesheet" type = "text/css" href = "leapin/Sign_up.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원가입</title>
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
.hello-user{display: flex; align-items: center;}
.header-button-group{height: 40px;margin-right: 20px;}
.input-r1 {height:35px; width:300px; background-color:#e0e0e0; border:none; color:#404040; border-radius:4px; margin-left:300px; cursor:pointer;}
.input-r2 {height:35px; width:300px; background-color:#e0e0e0; border:none; color:#404040; border-radius:4px; margin-left:300px; cursor:pointer;}
.input-r3 {height:35px; width:300px; background-color:#e0e0e0; border:none; color:#404040; border-radius:4px; margin-left:300px; cursor:pointer;}
.input-r4 {height:35px; width:145px; background-color:#e0e0e0; border:none; color:#404040; border-radius:4px; float:left; margin-right:10px; margin-left:300px; cursor:pointer;}
.input-r5 {height:35px; width:145px; background-color:#e0e0e0; border:none; color:#404040; border-radius:4px; float:left; cursor:pointer;}
.pagecenter {margin:auto;}
.page-name {margin: 1rem 0rem; font-weight:bold;}
.mypage-main {margin:auto; width:1000px; margin-top: 3.125rem; margin-bottom: 3.125rem;}
.mypage-left-side {float:left; margin-right:50px}
.mypage-right-side {float:left;}
.mypage-left-button {width:300px; height:50px;}
.mypage-left-button#info-edit {width:140px; height:50px; margin-right: 8px;}
.mypage-left-button#my-logout {width:140px; height:50px;}
.mypage-right-button {width:300px; height:50px;}
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

<article class = "sent-request-list">
<section class = "container">
		<div class="All">
		<h1 class ="page-heading-h1">리핀에 오신 것을 환영합니다.</h1>
			<div class="card">
				
				<div class = "user-camera">
				<img src ="leapin/Images/user.png" style="width:100px; margin-left:160px;"><img src ="leapin/Images/camera-icon.png" onclick="camera()" style="width:20px; margin-left:-25.7px; margin-top: 60px; cursor:pointer;"><br/>
				</div>
				
				<div class = "form-group">
					<label for="u_id"><b style="font-size:17px; white-space">아이디</b></label><br/>
					<input class = "form-control" type="text" id = "u_id" name="u_id" placeholder="아이디을 입력하세요" style="height:40px;" size=50 required"/><button type = "submit" id = "id_chk" class = "btn btn-outline-primary">중복체크</button><br/>	
				</div>

				<div class = "form-group">
					<label for="pw"><b style="font-size:17px;">비밀번호</b></label><br/>
					<input class = "form-control" type="password" id = "pwd" name="pwd" placeholder="비밀번호를 입력하세요." style="height:40px;" size=50 required><br/>
				
					<label for="p_chk"><b style="font-size:17px;">비밀번호 확인</b></label><br/>
					<input class = "form-control" type="password" id = "p_chk" name="p_chk" style="height:40px;" size=50 required>			
				</div>
				
				<div class = "form-group">
					<label for="name"><b style="font-size:17px; white-space">이름</b></label><br/>
					<input class = "form-control" type="text" id = "name" name="name" placeholder="이름을 입력하세요." style="height:40px;" size=50 required>
				</div>
				
				<div class = "form-group">
					<label for="postcode"><b style="font-size:17px;">우편 번호</b></label><button class = "btn btn-outline-primary" id = "zip-btn" onclick = "sample4_execDaumPostcode()">우편번호 찾기</button><br/>
					<input type="text" id = "postcode" name="zip-code" placeholder = "우편번호" style="height:40px;" size=5><br/><br/>
				
					<label for="roadAddress"><b style="font-size:17px;">주소 입력</b></label><br/>
					<input type="text" id = "roadAddress" name="roadaddress" style="height:40px;" size=50 readonly><br/>
			
					<label for="detail-address"><b style="font-size:17px;">상세 주소</b></label><br/>
					<input class = "form-control" type="text" id = "detail-address" name="detail-address" style="height:40px;" size=50 required><br/>
				</div>	
				
				<div class = "form-group">
					<label for="phone"><b style="font-size:17px;">핸드폰 번호</b></label>
				<input class = "form-control" type="number" id = "phone" name="phone" placeholder = "ex) 00011112222" style="height:40px;" size=50 required>
				</div>
				
				<div class = "form-group">
		 			<span style="font-size:12px; padding:0px 0px 0px 35px;">리핀의 </span><span style="color:#00c7ae; font-size:12px;"><u><b>이용약관</b></u></span><span style="font-size:12px;"> 및</span>
					<span style="font-size:12px; text-align:center;">유저의 허락 없이 게시물을 올리지 않습니다.</span><br/>
		 			<span style="color:#00c7ae; font-size:12px; padding:0px 0px 0px 100px;"><u><b> 개인정보 처리방식</b></u></span><span style="font-size:12px;"> 에 동의합니다.</span>		
				</div>
		 
		 		<button class = "btn btn-outline-primary" id= "Sign_up" type = "submit">회원 가입</button>
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
<script>

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
            // 법정동명이 있을 경우  추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
           
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
        }
    }).open();
}
		loginId = "<%=loginId%>";
		E  = "<%=E%>";
	$(function(){
		
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
		
		$("#id_chk").click(function(){
			var u_id = $("#u_id").val();
			
			 $.ajax({
	             type : "post",
	             url : "./Controller",
	             datatype : "json",
	             data : {"id" : u_id, "command" : "id_chk"},
	             success : function(data){
	            	 console.log(data);
	            	 console.log(data.id_chk);
	            	 if(data.id_chk == 0){
	            		 alert("중복된 아이디입니다.");
	            	 }
	            	 else{
	            		 alert("사용 가능한 아이디입니다.");
	            	 }
	             },
	             error : function(request, status, error){
	            	 alert("알 수 없는 에러 [" + error + "]");
	             }
	         });
		});
		$("#Sign_up").click(function(){
			var u_id = $("#u_id").val();
			var pwd = $("#pwd").val();
			var p_chk = $("#p_chk").val();
			var name = $("#name").val();
			var address = $("#roadAddress").val();
			var phone = $("#phone").val();
			var getname= RegExp(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/);
			var getnum = RegExp(/[0-9]/);
			var getEnga = RegExp(/[a-z]/); 
			var getEngA = RegExp(/[A-Z]/); 
			
			if(u_id == ""){
				alert("아이디를 입력해주세요"); 
				$("#u_id").focus(); 
				return false; 
				}
			
			/*if(c == getnum.test(u_id)){
				alert("아이디는 영대소문자로 시작해야합니다.");
				$("#id").focus(); 
				return false;
			}*/
			
			if(u_id == pwd){
				alert("아이디와 패스워드가 같습니다"); 
				$("#id").focus(); 
				return false; 
				}

			if(pwd != p_chk){
				alert("비밀번호를 확인해주세요"); 
				$("#pwd").focus(); 
				$("#pwd").val(""); 
				$("#p_chk").val(""); 
				return false; 
				}
			
			if(pwd == ""){
				alert("비밀번호 입력해주세요"); 
				$("#pwd").focus(); 
				return false; 
				}

			if(p_chk == ""){
				alert("비밀번호 확인란을 입력해주세요");
				$("#p_chk").focus();		
				return false;
			}
			
			if(name == ""){
				alert("이름을 입력해주세요");
				$("#name").focus();
				return false;
			}
			
			if(!getname.test(name)){
				alert("이름형식에 맞게 입력해주세요");
				$("#name").focus();
				return false;
			}
			var command = "Sign_up";
			console.log("command : " + command);
			$.ajax({
				type : "post",
				url : "./Controller",
				data : {"id" : u_id, "pw" : pwd, "name" : name, "address" : address, "phone" : phone, "command" : command},
				datatype : "json",
				success : function(data){
					console.log(data);
					console.log(data.Sign_up);
					var Sign_up = data.Sign_up;
					console.log(Sign_up);
					if(Sign_up == "1"){
						alert("회원가입이 완료되었습니다.");
						location.href="Controller?command=main";
					}
					else{
						alert("정보를 다시 확인해주시길 바랍니다.");
					}
				},
				error : function(request, status, error){
						alert("알 수 없는 에러 [" + error + "]");
				}
			});
			
			
		});
		$(function(){
			$('#phone').on('keydown', function (event) {
		  		if (event.keyCode == 13) { // 엔터키
		  			alert($("#phone").val());
		 			$("#Sign_up").click();
		  		return false;
		  			
		  		}
		  	});
		});
	});
</script>
</body>
</html>