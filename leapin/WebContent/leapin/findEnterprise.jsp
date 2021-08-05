<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="leapin/findEnterprise.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script><meta charset="UTF-8">
<script>
	function myFunction() {
	    document.getElementById("myDropdown").classList.toggle("show");
	}
	window.onclick = function(event) {
		if (!event.target.matches('.dropbtn')) {
			var dropdowns = document.getElementsByClassName("dropdown-content");
			var i;
			for (i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show')) {
					openDropdown.classList.remove('show');
				}
			}
		}
	}
	function myFunction2() {
	    document.getElementById("myDropdown2").classList.toggle("show2");
	}
	window.onclick = function(event) {
		if (!event.target.matches('.dropbtn2')) {
			var dropdowns = document.getElementsByClassName("dropdown-content2");
			var i;
			for (i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show2')) {
					openDropdown.classList.remove('show2');
				}
			}
		}
	}
	function myFunction3() {
	    document.getElementById("myDropdown3").classList.toggle("show3");
	}
	window.onclick = function(event) {
		if (!event.target.matches('.dropbtn3')) {
			var dropdowns = document.getElementsByClassName("dropdown-content3");
			var i;
			for (i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show3')) {
					openDropdown.classList.remove('show3');
				}
			}
		}
	}
	//var g_data;
	$(function(){
		$.ajax({
		    type:"GET",
	        url:"./Controller",
	        dataType : "json",
	        data : {"command" : "enterprise_find_show"},
	        success : function(data){
	        	//g_data = data;
	        	var enterprise = data.enterprise;
	        	var average = 0.0;
	        	var c_number = null;
	        	$(".homeContent").empty();
	        	for(var i = 0; i < enterprise.length; i++){
	        		c_number = enterprise[i].c_number;
	 	        	average = enterprise[i].review_average;
	 	        		var str = "";
	 	        		str += "<div class='homeCenter' c_number='"+c_number+"'>";
		  	  			str += "<div class='enterpriseImage'>";
		  	  				str +="<img src='leapin/Images/"+enterprise[i].file_name+"' style='width:120px; height:120px; border-radius:10px;'/>";			
		  	  			str += "</div>";
		  	  			str += "<div class='title'>";
		  	  				str += "<span>"+enterprise[i].name+"</span>";
		  	  			str += "</div>";
		  	  			str += "<div class='content'>";
		  	  				str += "<span>"+enterprise[i].content+"</span>";
		  	  			str += "</div>";
		  	  			str += "<div class='starpoint'>";
		  	  				str += "<img src='leapin/Images/리뷰 별.png'/><span>"+average.toFixed(1)+"</span>";
		  	  				str += "<span style='font-size:12px; font-weight:400px; color:rgb(115,115,115);'>("+enterprise[i].review_count+")</span>";
		  	  				str += "<span style='color:#00c7ae;'> "+enterprise[i].complete+"번거래</span>";
		  	  			str += "</div>";
		  	  		str += "</div>";
		  	  		$(".homeContent").append(str);
 	        	}
 	        	$(".homeCenter").click(function(){
 	        		var c_nb = $(this).attr("c_number");
 	        		location.href="Controller?command=enterpriseInformation&c_number="+c_nb;
 	        	});
       	 },
        error : function(data){
        	
        }
	});
		
		 $.ajax({
			type : "GET",
			url : "./Controller",
			dataType : "json",
			data : {"command" : "enterprise_count"},
			success : function(data){
				var count = data.count;
				$("#homeTopspan").empty();
				var str = "";
				str += "<span style='font-size:17px; font-weight:600; color:rgb(51,51,51);'>"+count+"</span>";
				str += "<span style='font-size:13px;'>개의 기업</span>";
				$("#homeTopspan").append(str);
			},
			error : function(data){
				
			}
		});
	});
</script>
<title>리핀 기업찾기</title>
</head>
<body>
	<div class="top">
		<div class="menuFont"><img src="leapin/Images/LeapinLogo.png" onClick="location.href='index'"" />
		<button class="menuBox" style="width:100px; height:40px; font-size: 16px; font-weight: bold; color: #fff; letter-spacing:-2px; border:none;">로그인</button>
		<button class="menuBox" style="width:100px; height:40px; font-size: 16px; font-weight: bold; color: #fff; letter-spacing:-2px; border:none;" onClick="location.href='findEnterprise.html'">기업찾기</button>
		<button class="menuBox" style="width:100px; height:40px; font-size: 16px; font-weight: bold; color: #fff; letter-spacing:-2px; border:none;">회원가입</button>
		</div>
	</div>
	<div class="home">
		<div class="homeTop">
			<span style="font-size:35px; font-weight:600; color:rgb(51,51,51);">기업찾기</span><br/><br/>
			<span style="font-weight: 700;">리핀 > 지역,카테고리</span><br/><br/>
			<div class="dropdown">
				<button onclick="myFunction()" class="dropbtn">지역 ↴</button>
				<div id="myDropdown" name="address" class="dropdown-content">
					<a href="#">서울</a>
					<a href="#">경기</a>
					<a href="#">강원</a>
					<a href="#">충북</a>
					<a href="#">충남</a>
					<a href="#">전북</a>
					<a href="#">전남</a>
					<a href="#">경북</a>
					<a href="#">경남</a>
					<a href="#">제주</a>
				</div>
			</div>&emsp;&emsp;&emsp;&emsp;
			<div class="dropdown3">
				<button onclick="myFunction3()" class="dropbtn3">카테고리 ↴</button>
				<div id="myDropdown3" class="dropdown-content3">
					<a href="#">레슨</a>
					<a href="#">홈/리빙</a>
					<a href="#">이벤트</a>
					<a href="#">비즈니스</a>
					<a href="#">디자인/개발</a>
					<a href="#">건강/미용</a>
					<a href="#">알바</a>
					<a href="#">기타</a>
				</div>
			</div>
			<div class="dropdown2">
				<button onclick="myFunction2()" class="dropbtn2">리뷰순 ↴</button>
				<div id="myDropdown2" class="dropdown-content2">
					<a href="#">리뷰순</a>
					<a href="#">평점순</a>
					<a href="#">거래순</a>
				</div>
			</div><br/><br/>
			<div id = "homeTopspan">
				<!-- <span style="font-size:17px; font-weight:600; color:rgb(51,51,51);">2,308 </span>
				<span style="font-size:13px;">개의 기업</span> -->
			</div>
	   <!-- <select name="sort" style="float:right;">
				<option value="리뷰순">리뷰순</option>
				<option value="평점순">평점순</option>
				<option value="거래순">거래순</option>
			</select> -->
		</div>
		<div class="homeContent"></div>
	</div><br/><br/>
	<div class="bottom"><br/><br/>
		<span style="margin-right: 35px;">주)리핀네트워크는 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.</span><br/>
		<span style="margin-right: 280px;">상호명:(주)리핀네트워크 · 대표이사:SIN WOO JIN · 개인정보책임관리자:전준하 · 주소:경기 안양시 동안구 동편로 110 동편마을3단지</span><br/>
		<span style="margin-right: 282px;">사업자등록번호:120-88-22325 · 통신판매업신고증:제 2021-경기안양-06081호 · 직업정보제공사업 신고번호:경기북부청 제 2021-1호</span><br/>
		<span style="margin-right: 703px;">고객센터:2021-06-08 · 이메일:Leapin2021@gmail.com</span><br/>
		<span style="margin-right: 704px;">Copyright ©Leapin Network Inc. All Rights Reserved.</span>
	</div>
</body>
</html>