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
<title>Member info edit page</title>
<!-- <link rel = "stylesheet" type = "text/css" href = "leapin/Mypage.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
#btn_logout, #btn_board, #btn_mypage, #btn_chatting, #btn_login, #btn_signup, .right-heaeder-button-group {font-size:15px; font-weight:bold; background-color:transparent; border:0; outline:0; border-radius:5px; cursor:pointer;padding:5px;}
#btn_logout:hover, #btn_board:hover, #btn_mypage:hover, #btn_chatting:hover, #btn_login:hover, #btn_signup:hover, .right-heaeder-button-group:hover {background:#c9c9c9;}
.logo {width:120px; height:45px;}
#header-area {display: flex;justify-content: space-between; align-items: center; border-bottom: 1px solid gray; height:70px;}
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
.col1 {width:150px;}
.col2 {display: flex; justify-content: flex-start;}
#btn_bottom_area {display: flex; justify-content: flex-end;}
#btn_back, #btn_reset {margin-right:7px;}
.top_button_group {display:flex; justify-content: flex-end;}
#btn_enterprise_trans, #btn_account_delete {margin-left:7px;}
#btn_member_change, #btn_enterprise_info_edit, #btn_account_delete {margin-left:7px;}
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
	<% if(loginId!=null){ %>
	<h2 class ="page-name">마이페이지</h2><br/>
	<h2 class ="mypageh2"><%=dao.receive_name(loginId)%></h2>
		<div class="pagecenter">
			<div class="mypage-main">
				<%if(E==null){ %>
				<div class="top_button_group">
					<div class="enterprise-trans">
						<button class="btn btn-primary" type="button" id="btn_enterprise_trans" name="btn_trans" onClick="location.href='Controller?command=Enterprise_transForm';">기업회원전환</button>
					</div>
					<div>
						<button class="btn btn-primary" type="button" id="btn_account_delete" onClick="location.href='Controller?command=Account_delete';">회원탈퇴</button>
					</div>
				</div><br/>
				<%}else if(E!=null){ %>
				<div class="top_button_group">
					<div class="member_change">
						<button class="btn btn-primary" type="button" id="btn_member_change" name="btn_member_change">일반회원전환</button>
					</div>
					<div>
						<button class="btn btn-primary" type="button" id="btn_enterprise_info_edit" name="btn_enterprise_info_edit" onClick="location.href='./Controller?command=Enterprise_info_editForm';">기업정보수정</button>
					</div>
					<div>
						<button class="btn btn-primary" type="button" id="btn_account_delete" name="btn_account_delete">회원탈퇴</button>
					</div>
				</div><br/>
				<% } %>
				<div id = "mypage_body">
				<h3>개인정보수정</h3><br/>
					<table class="table table-hover">
						<thead>
						<tr>
							<th>항목명</th>
							<th colspan="2">수정항목</th>
						</tr>
						</thead>
						<tbody>
						<tr class="form-group">
							<td class="col1">아이디</td>
							<td colspan="2"><span class="form-control" id="id" style="color:#c2c2c2;"><%=loginId%></span></td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="edit_pw">비밀번호</label></td>
							<td colspan="2"><input class="form-control" type="password" id="edit_pw" name="edit_pw"/></td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="edit_pw2">비밀번호확인</label></td>
							<td colspan="2"><input class="form-control" type="password" id="edit_pw2" name="edit_pw2"/></td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="edit_name">이름</label></td>
							<td colspan="2"><input class="form-control" type="text" id="edit_name" name="edit_name" value="<%=dao.receive_name(loginId)%>"/></td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="edit_postcode">우편번호</label><button id = "zip-btn" class="btn btn-primary" onclick = "sample4_execDaumPostcode()" style="background-color:#3498db; color:white; font-size:15px; border-radius:20px; border:none; float:right; cursor:pointer;">우편번호 찾기</button></td>
							<td colspan="2"><input class="form-control" type="text" id="edit_postcode" name="edit_postcode"/></td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="edit_roadAddress">주소</label></td>
							<td colspan="2"><input class="form-control" type="text" id="edit_roadAddress" name="edit_roadAddress"/></td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="edit_detail_address">상세주소</label></td>
							<td colspan="2"><input class="form-control" type="text" id="edit_detail_address" name="edit_detail_address"/></td>
						</tr>
						<tr class="form-group">
							<td class="col1">핸드폰번호</td>
							<td colspan="2"><input class="form-control" type="text" id="edit_phone" name="edit_phone" value="<%=dao.receive_phone(loginId)%>"/></td>
						</tr>
						<tr class="form-group">
							<td colspan="3"></td>
						</tr>
						<tr class="form-group">
							<td class="col1"></td>
							<td id="btn_bottom_area" class="col2" colspan="2">
							<input id="btn_back" class="btn btn-primary" type="button" onClick="location.href='Mypage.jsp';" value="뒤로가기"/>
							<input id="btn_member_info_edit" class="btn btn-primary" type="submit"  value="수정완료"/></td>
						</tr>
						</tbody>
					</table>
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

	loginId = "<%=loginId%>";
	E = "<%=E%>";
	
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
	            document.getElementById('edit_postcode').value = data.zonecode;
	            document.getElementById("edit_roadAddress").value = roadAddr;
	        }
	    }).open();
	}

	
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
	

	
	$("#edit_phone").on("input",function(){
        var regex = /^01\d\d{3,4}\d{4}$/;
        var result = regex.exec($("#phone").val());
       
       if(result != null){
          $(".phone.regex").html("");  
       }else{
           $(".phone.regex").html("올바른 번호가 아닙니다");
       }
   })
	
	$("#btn_member_info_edit").click(function(){
		var pw = $("#edit_pw").val();
		var p_chk = $("#edit_pw2").val();
		var name = $("#edit_name").val();
		var postcode = $("#edit_postcode").val();
		var roadAddress = $("#edit_roadAddress").val();
		var detail_address = $("#edit_detail_address").val();
		var address = (postcode + " " + roadAddress + " " + detail_address);
		var phone = $("#edit_phone").val();
		var getname= RegExp(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/);
		var getnum = RegExp(/[0-9]/);
		var getEnga = RegExp(/[a-z]/); 
		var getEngA = RegExp(/[A-Z]/); 

		if(pw != p_chk){
			alert("비밀번호를 확인해주세요"); 
			$("#edit_pw").focus(); 
			$("#edit_pw").val(""); 
			$("#edit_pw2").val(""); 
			return false; 
			}
		
		if(pw == ""){
			alert("비밀번호 입력해주세요"); 
			$("#edit_pw").focus(); 
			return false; 
			}

		if(p_chk == ""){
			alert("비밀번호 확인란을 입력해주세요");
			$("#edit_pw2").focus();		
			return false;
		}
		
		if(name == ""){
			alert("이름을 입력해주세요");
			$("#edit_name").focus();
			return false;
		}
		
		if(!getname.test(name)){
			alert("이름형식에 맞게 입력해주세요");
			$("#edit_name").focus();
			return false;
		}
	
	$.ajax({
		type:"post",
		url:"./Controller",
		data:{"eid":loginId, "epw":pw, "ename":name, "eaddress": address, "ephone":phone, "command":"Member_info_edit"},
		datatype:"json",
		success: function(data){
			console.log(data);
			var result = data;
			var checkN = result.checkN;
			if(checkN=="1"){
				alert("수정완료");
				location.href="Controller?command=Mypage";
			}else{
				alert("수정이 완료되지 않았습니다.");
				location.href="Controller?command=Member_info_edit_page";
			}
		},
		error : function(request, status, error){
			alert("알 수 없는 에러 [" + error + "]");
		}
	});	//ajax
	
	}); //function("#btn_info_edit")
	
	/////////////////////// btn_info_edit ///////////////////////////////////
	
	$("#btn_member_change").click(function(){
		var result = confirm("일반회원으로 전환하시겠습니까?");
		if(result){
			/* location.href='../Controller?command=Member_change'; */
			/* $("#mypage_body").empty();
			var str = "";
			str += "<div>일반회원전환페이지</div>";
			$("#mypage_body").append(str); */
			$.ajax({
				type:"post",
				url:"./Controller",
				datatype:"json",
				data:{"command":"Member_change"},
				success:function(data){
					var result = data;
					var changeN = result.changeN;
					if(changeN==1){
						alert("정상적으로 전환되었습니다.");
						location.href ='Controller?command=main';
					}else if(changeN==0){
						alert("전환되지않았습니다.");
						location.href ='Controller?command=Member_info_edit_page';
					}
				},
				error:function(request, status, error){
					alert("code:" + request.status + "\n" + "error:" + error);
				}
				
			});
		} //if문
		
	});
	
	/////////////////////// btn_account_delete ///////////////////////////////////
	
	$("#btn_account_delete").click(function(){
		var result = confirm("정말로 탈퇴하시겠습니까?");
		if(result){
			$.ajax({
				type:"post",
				url:"./Controller",
				datatype:"json",
				data:{"command":"Account_delete"},
				success:function(data){
					var result = data;
					var deleteN = result.deleteN;
					console.log(deleteN);
					if(deleteN==1){
						alert("정상 탈퇴처리되었습니다.");
						location.href ='Controller?command=main';
					}else if(deleteN==0){
						alert("탈퇴처리되지 않았습니다.");
						location.href ='Controller?command=Member_info_edit_page';
					}
				},
				error:function(request, status, error){
					alert("code:" + request.status + "\n" + "error:" + error);
				}
				
			});
		}
	});
	
});
</script>
</body>
</html>