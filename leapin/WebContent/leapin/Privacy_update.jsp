<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" type = "text/css" href = "Privacy_update.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>개인정보 수정</title>
<script>
	function del(){
		var result = confirm("계정 탈퇴 시 모든 정보가 삭제됩니다.\n정말로 탈퇴하시겠습니까?");
		if(result){
				
		}
	}
	
	function update(){
		alert("개인정보 수정이 완료되었습니다.");
	}
</script>
</head>
<body>
<nav id ="header-bar">
<div class = "header-menu">
<img src = "Images/logo.png" class ="header header-left" />
<ul class = "header-left">
	<li>
		<a href = "">
		<span class ="header header-left content">
			받은견적
		</span>
		</a>
	</li>
	<li>
		<a href = "">
		<span class = "header header-left content">
			채팅
		</span>
		<span class = "header header-left badge">
			2
		</span>
		</a>
	</li>
	<li>
		<a href = "">
 		<span class = "header header-left content">
 			고수 찾기
 		</span>
 		</a>
	</li>
	<li>
		<div class = "header header-left search">
			<form>
				<div class = "input-group">
					<span>
						<img src = "Images/search.png"/>
					</span>
					<input type = "text" placeholder = "서비스를 검색해보세요"
					autocomplete = "off" class = "form-control p2">
				</div>
			</form>
		</div>
	</li>
</ul>
	
		<div class = "header usermenu-button header-right">
			<div class = "header-right" style = "margin-top : -2px;">
			<p>
			<span >신우진 고객님</span>
			<img src = "Images/dropdown.png">
			</p>
			</div>
			<div class = "header-right">
			<img src="Images/user.png"/>
			</div>
		</div>
	</div>
		<div class = "header-right header-top-margin">
		<img src = "Images/bell.png"/>
		</div>
</nav>
<article class = "sent-request-list">
<section class = "container">
		<div class="All">
		<h1 class ="page-heading-h1">개인정보 수정</h1>
			<div class="card">
			
				<img src ="Images/user.png" style="width:100px; margin-left:160px;"><img src ="Images/camera-icon.png" img onclick="camera()"; style="width:20px; margin-left:-25.7px; cursor:pointer;"><br/>
				<label for="input1" style="font-size:17px; white-space"><b>이름</b><br/>
				<input type="text" name="name" style="height:40px;" size=50/><p></p></label>
		
				<label for="input2" style="font-size:17px; white-space"><b>이메일</b><br/>
				<input type="email" name="email" style="height:40px;" size=50/><p></p></label>
				
				<label for="input3" style="font-size:17px;"><b>기존 비밀번호</b><br/>
				<input type="password" name="pw" style="height:40px;" size=50/><p></p></label>
		
				<label for="input4" style="font-size:17px;"><b>새로운 비밀번호</b><br/>
				<input type="password" name="pw" style="height:40px;" size=50/><p></p></label>
		
				<label for="input5" style="font-size:17px;"><b>비밀번호 확인</b><br/>
				<input type="password" name="pw" style="height:40px;" size=50/><p></p></label>
				
				<label for="input6" style="font-size:17px;"><b>우편 번호</b><input type="submit" style="background-color:#3498db; color:white; font-size:15px; border-radius:20px; border:none; float:right; margin-right:-10px;" value="우편번호 찾기" onclick="location.href''">
				<input type="text" name="zip-code" style="height:40px;" size=50/><p></p></label>
				
				<label for="input7" style="font-size:17px;"><b>주소 입력</b><br/>
				<input type="text" name="address" style="height:40px;" size=50/><p></p></label>
			
				<label for="input8" style="font-size:17px;"><b>상세 주소</b><br/>
				<input type="text" name="detail-address" style="height:40px;" size=50/><p></p></label>
		
				<label for="input9" style="font-size:17px;"><b>핸드폰 번호</b><input type="submit" style="background-color:#3498db; color:white; font-size:15px; border-radius:20px; border:none; float:right; margin-right:-10px;" value="핸드폰 인증" onclick="location.href''">
				<input type="tel" name="phone-number" style="height:40px;" size=50/><p></p></label>
		<br/>
		<br/>
			<div id="sign-up"><input type="submit" style="height:40px; width:200px; background-color:#c8e5f9; border:none; color:#323232; float:left; margin-right:26px;" value="수정 완료" onclick="update()"/></div>
			<div id="account secession"><input type="button" style="height:40px; width:200px; background-color:#fdd4d4; border:none; color:#323232;" value="계정 탈퇴" onclick="del()"/></div><br/>
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