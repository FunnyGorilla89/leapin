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
<title>Enterprise trans page</title>
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
.col1 {width:150px;}
.col2 {display: flex; justify-content: flex-start;}
#btn_bottom_area {display: flex; justify-content: flex-end;}
#btn_back, #btn_reset {margin-right:7px;}
.top_button_group {display:flex; justify-content: flex-end;}
#btn_enterprise_trans, #btn_account_delete {margin-left:7px;}
#btn_member_change, #btn_enterprise_info_edit, #btn_account_delete {margin-left:7px;}
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
	<%-- <h2 class ="mypageh2"><%=dao.receive_name(loginId)%></h2> --%>
		<div class="pagecenter">
			<div class="mypage-main">
				<%if(E==null){ %>
				<div class="top_button_group">
					<!-- <div class="enterprise-trans">
						<button class="btn btn-primary" type="button" id="btn_enterprise_trans" name="btn_trans" onClick="location.href='Enterprise_trans.jsp';">기업회원전환</button>
					</div> -->
					<div>
						<button class="btn btn-primary" type="button" id="btn_account_delete" onClick="location.href='../Controller?command=Account_delete';">회원탈퇴</button>
					</div>
				</div><br/>
				<%}else if(E!=null){ %>
				<div class="top_button_group">
					<div class="member_change">
						<button class="btn btn-primary" type="button" id="btn_member_change" name="btn_member_change">일반회원전환</button>
					</div>
					<div>
						<button class="btn btn-primary" type="button" id="btn_enterprise_info_edit" name="btn_enterprise_info_edit" onClick="location.href='Enterprise_info_edit.jsp';">기업정보수정</button>
					</div>
					<div>
						<button class="btn btn-primary" type="button" id="btn_account_delete" name="btn_account_delete">회원탈퇴</button>
					</div>
				</div><br/>
				<% } %>
				<div id = "mypage_body">
				<h3>기업회원전환</h3><br/>
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
							<td class="col1"><label for="c_number">사업자번호</label></td>
							<td colspan="2"><input class="form-control" type="text" id="c_number" name="c_number" placeholder="사업자번호 10자리를 입력해주세요" required/></td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="enterprise_name">상호명</label></td>
							<td colspan="2"><input class="form-control" type="text" id="enterprise_name" name="enterprise_name" placeholder="상호를 입력해주세요"/></td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="ceo_name">대표자명</label></td>
							<td colspan="2"><input class="form-control" type="text" id="ceo_name" name="ceo_name" placeholder="대표자이름을 입력해주세요"/></td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="email">이메일</label></td>
							<td colspan="2"><input class="form-control" type="text" id="email" name="email" placeholder="이메일 작성을 해주세요"/></td>
						</tr>
						<tr class="form-group">
							<td class="col1">회사번호</td>
							<td colspan="2"><input class="form-control" type="text" id="tel" name="tel" placeholder="회사전화번호를 입력해주세요"/></td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="postcode">우편번호</label><button id = "zip-btn" class="btn btn-primary" onclick = "sample4_execDaumPostcode()" style="background-color:#3498db; color:white; font-size:15px; border-radius:20px; border:none; float:right; cursor:pointer;">우편번호 찾기</button></td>
							<td colspan="2"><input class="form-control" type="text" id="postcode" name="postcode"/></td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="roadAddress">주소</label></td>
							<td colspan="2"><input class="form-control" type="text" id="roadAddress" name="roadAddress"/></td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="detail_address">상세주소</label></td>
							<td colspan="2"><input class="form-control" type="text" id="detail_address" name="edit_detail_address"/></td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="service_area">서비스지역</label></td>
							<td colspan="2"><input class="form-control" type="text" id="service_area" name="service_area" placeholder="서비스지역을 입력해주세요"/></td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="content">기업소개</label></td>
							<td colspan="2"><textarea cols="50" rows="2" class="form-control" id="content" name="content" placeholder="기업소개를 입력해주세요"></textarea></td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="service_content">서비스소개</label></td>
							<td colspan="2"><textarea cols="50" rows="5" class="form-control" id="service_content" name="service_content" placeholder="서비스소개를 입력해주세요"></textarea></td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="file">파일첨부</label></td>
							<td colspan="2">
								<div class="file-upload preview-image">
									<form id="fileUploadForm" method = "post" enctype ="multipart/form-data">
							    	<input type="file" id="file" name="file" class="upload-hidden"> 
									</form>
								</div>
							</td>
						</tr>
						<tr class="form-group">
							<td class="col1"><label for="category">카테고리</label></td>
							<td colspan="2" id="category_area">
								<!-- <label><input class="form-control" type="checkbox" id="category1" name="category1" value="1"/>웹개발</label> -->
							</td>
						</tr>
						<tr class="form-group">
							<td colspan="3"></td>
						</tr>
						<tr class="form-group">
							<td class="col1"></td>
							<td id="btn_bottom_area" class="col2" colspan="2">
							<input id="btn_back" class="btn btn-primary" type="button" onClick="location.href='Controller?command=Mypage';" value="뒤로가기"/>
							<input id="btn_enterprise_trans" class="btn btn-primary" type="submit"  value="작성완료"/></td>
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

$(function(){
	
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
			alert("알 수 없는 에러 [" + error + "]");
			alert("!!");
		}
	});
	
	$("#btn_enterprise_trans").click(function(){
		var c_number = $("#c_number").val();
		var e_name = $("#enterprise_name").val();
		var ceo_name = $("#ceo_name").val();
		var email = $("#email").val();
		var tel = $("#tel").val();
		var postcode = $("#postcode").val();
		var roadAddress = $("#roadAddress").val();
		var detail_address = $("#detail_address").val();
		var address = (postcode + " " + roadAddress + " " + detail_address);
		var service_area = $("#service_area").val();
		var content = $("#content").val();
		var service_content = $("#service_content").val();
		var file = $("#file").val()
		console.log(file);
		var file_name = file.split("\\");
		console.log(file_name);
		var file_real_name = file_name[file_name.length-1];
		console.log(file_real_name);
		var category = $("#category_list").val();
		var getname= RegExp(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/);
		var getnum = RegExp(/[0-9]/);
		var getEnga = RegExp(/[a-z]/); 
		var getEngA = RegExp(/[A-Z]/); 
		/* var c = id.charAt(0); */
		
		if(e_name == ""){
			alert("상호를 입력해주세요");
			$("#enterprise_name").focus();
			return false;
		}
		
		if(!getname.test(e_name)){
			alert("상호 형식에 맞게 입력해주세요");
			$("#enterprise_name").focus();
			return false;
		}
		
		if(ceo_name == ""){
			alert("대표자이름을 입력해주세요");
			$("#ceo_name").focus();
			return false;
		}
		
		if(!getname.test(ceo_name)){
			alert("대표자이름 형식에 맞게 입력해주세요");
			$("#ceo_name").focus();
			return false;
		}
		if(file_real_name!=null && file_real_name != "" && file_real_name != "null"){
			console.log(file_name);
			upload();
		}
	
	$.ajax({
		type:"post",
		url:"./Controller",
		data:{"c_number":c_number, "e_name":e_name, "ceo_name":ceo_name, "email":email, 
			"tel":tel, "service_area":service_area, "content":content, "service_content":service_content, 
			"file_name":file_real_name, "address": address, "cno":category, "command":"Enterprise_trans"},
		datatype:"json",
		success: function(data){
			var checkN = data.checkN;

			if(checkN=="1" || checkN==1){
				alert("전환완료");
				location.href="Controller?command=main";
			}else{
				alert("기업회원 전환이 되지 않았습니다.!!!!");
				location.href="Controller?command=Enterprise_transForm";
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
				url:"../Controller",
				datatype:"json",
				data:{"command":"Member_change"},
				success:function(data){
					var result = data;
					var changeN = result.changeN;
					if(changeN==1){
						alert("정상적으로 전환되었습니다.");
						location.href ='Controller?command=Mypage';
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
					if(deleteN=="1" || deleteN==1){
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
function upload(){
	event.preventDefault();          
    // Get form         
    var form = $('#fileUploadForm')[0];  
    console.log(form);
    // Create an FormData object
    var data = new FormData(form);  	   
    console.log(data);
    // disabled the submit button       
    $("#btn_enterprise_trans").prop("disabled", true);   
    
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
        	$("#btn_enterprise_trans").prop("disabled", false);  
        },          
        error: function (e) {  
        	console.log("ERROR : ", e);     
            $("#btn_enterprise_trans").prop("disabled", false);    
            alert("fail");  
         }     
	});  
	
}
</script>
</body>
</html>