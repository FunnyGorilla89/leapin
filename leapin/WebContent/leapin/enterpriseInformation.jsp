<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="DTO.Enterprise_DTO" %>
<!DOCTYPE html>
<html>
<head>
<link href="leapin/enterpriseInformation.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<%
	Enterprise_DTO vo = null;
	vo = (Enterprise_DTO)(request.getAttribute("enterprise"));
	double review_average = (Double)(request.getAttribute("review_average"));
	int review_count = (Integer)(request.getAttribute("review_count"));
	String c_number = request.getParameter("c_number");

%>
<title>기업정보</title>
</head>
<script>
	var c_number = "<%=c_number%>";
	var pageNum = 1;
	
	$(function(){
		$.ajax({
		    type:"GET",
	        url:"./Controller",
	        dataType : "json",
	        data : {"command" : "enterprise_select","c_number" : c_number},
	        success : function(data){
	        	var enterprise_select = data;
	         	var average = parseFloat(enterprise_select.review_average);
	        	$("#divHomeTopEnterprise").empty();
	        	var str = "";
	        	str += "<div class='enterpriseImage'>";
				str += "<img src='leapin/Images/"+enterprise_select.file_name+"'/>";			
				str += "</div>";
				str += "<div class='title'>";
				str += "<span>"+enterprise_select.name+"</span>";
				str += "</div>";
				str += "<div class='content'>";
				str += "<span>로고 디자인</span>";
				str += "</div>";
				str += "<div class='starpoint'>";
				str += "<img src='leapin/Images/리뷰 별.png'/><span>"+average.toFixed(1)+"</span>";
				str += "<span style='font-size:12px; font-weight:400px; color:rgb(115,115,115);'>("+enterprise_select.review_count+"개)</span>";
				str += "<span style='color:#00c7ae;'>"+enterprise_select.complete+"번거래</span>";
				str += "</div>";
				$("#divHomeTopEnterprise").append(str);
				$(".introduceContent").append("<span>"+enterprise_select.content+"</span>");
				$(".detailContent").append("<span>"+enterprise_select.service_content+"</span>");
	        },
	        error : function(data){
	        	
	        }
		});
		$.ajax({
			type:"GET",
	        url:"./Controller",
	        dataType : "json",
	        data : {"command" : "review","c_number" : c_number,"pageNum" : pageNum},
	        success : function(data){
	        	var review = data.review;
	        	console.log(review);
	        	$(".reviewCenter").empty();
	        	for(var i = 0; i < review.length; i++){
		        	var str = "";
		        	str += "<br/><br/><br/>";
		        	str += "<div class='reviewId'>";
					str += "<span>"+review[i].writer+"</span>";
					str += "</div>";
					str += "<div class='reviewStarpoint'>";
					str += "<img src='leapin/Images/리뷰 별.png'/>";
					str += "<img src='leapin/Images/리뷰 별.png'/>";
					str += "<img src='leapin/Images/리뷰 별.png'/>";
					str += "<img src='leapin/Images/리뷰 별.png'/>";
					str += "<img src='leapin/Images/리뷰 별.png'/>";
					str += "</div>";
					str += "<div class='reviewDate'>";
					str += "<span>"+review[i].date_time+"</span>";
					str += "</div>";
					str += "<div class='reviewContent'><br/><br/>";
					str += "<span>"+review[i].content+"</span>";
					str += "</div>";
		        	$(".reviewCenter").append(str);
	        	}
	        	$(".review").append("<div class='reviewMore'><a href='#none' id='reviewMore' class='btn-3'>리뷰 더보기</a></div>");
	        	
	        },
	        error : function(data){
	        	
	        }
		});
        $(document).on("click",".reviewMore",function(){
       		pageNum++;
			$.ajax({
				type:"GET",
		        url:"./Controller",
		        dataType : "json",
		        data : {"command" : "review","c_number" : c_number,"pageNum" : pageNum},
		        success : function(data){
		        	var review = data.review;
		        	var result = data.result;
		        	console.log(result);
		        	for(var i = 0; i < review.length; i++){
			        	var str = "";
			        	str += "<br/><br/><br/>";
			        	str += "<div class='reviewId'>";
						str += "<span>"+review[i].writer+"</span>";
						str += "</div>";
						str += "<div class='reviewStarpoint'>";
						str += "<img src='leapin/Images/리뷰 별.png'/>";
						str += "<img src='leapin/Images/리뷰 별.png'/>";
						str += "<img src='leapin/Images/리뷰 별.png'/>";
						str += "<img src='leapin/Images/리뷰 별.png'/>";
						str += "<img src='leapin/Images/리뷰 별.png'/>";
						str += "</div>";
						str += "<div class='reviewDate'>";
						str += "<span>"+review[i].date_time+"</span>";
						str += "</div>";
						str += "<div class='reviewContent'><br/><br/>";
						str += "<span>"+review[i].content+"</span>";
						str += "</div>";
			        	$(".reviewCenter").append(str);
		        	}
		        	if(result != "2"){
		        	$(".reviewMore").hide();	
		        	}
		        },
		        error : function(data){
		        	
		        }
			});
       	});
	});
	
</script>
<body>
	<div class="top">
		<div class="menuFont"><img src="leapin/Images/LeapinLogo.png" onClick="location.href='index'" />
		<button class="menuBox">로그인</button>
		<button class="menuBox" onClick="location.href='Controller?command=enterprise_find'">기업찾기</button>
		<button class="menuBox">회원가입</button>
		</div>
	</div>
	<div class="home">
		<div class="homeTop">
			<div id="divHomeTopEnterprise" class="homeTopEnterprise"></div>
				<div class="homeTopMenu">
					<a href="#none" class="btn-2">기업정보</a>&emsp;
					<a href="#none" class="btn-2">사진/동영상</a>&emsp;
					<a href="#none" class="btn-2">리뷰</a>
				</div>
			<div style="clear:both;"></div>
		</div>
		<div class="homeIntroduce" id="divHomeIntroduce">
			<div class="introduceTop">
				<span><br/><br/>한줄 소개<br/><br/></span>
				<div class="introduceContent"></div>
			</div>
			<div class="introduceMiddle">
				<div class="middleTop">
					<div class="middleBasic">
						<div class="title">
							<span>기본정보</span>
						</div>
						<div class="introduceContent"><br/>
							<img src="leapin/Images/사람.PNG" style="width:20px; height:20px; margin:0px 0px -3px 0px;"/>
							<span>본인 인증</span><br/><br/>
							<img src="leapin/Images/트로피.PNG" style="width:20px; height:20px; margin:0px 0px -3px 0px;"/>
							<span>103회 거래</span><br/><br/>
							<img src="leapin/Images/지도표시.PNG" style="width:20px; height:20px; margin:0px 0px -3px 0px;"/>
							<span>경기도 안산</span><br/><br/>
							<img src="leapin/Images/시계.PNG" style="width:20px; height:20px; margin:0px 0px -3px 0px;"/>
							<span>연락 가능 시간:오전9시 - 오후10시</span><br/><br/>
							<img src="leapin/Images/카드.PNG" style="width:20px; height:20px; margin:0px 0px -3px 0px;"/>
							<span>안전거래,계좌이체,현금결제 가능</span>
						</div>
					</div>
					<div class="middleAdd">
						<div class="title">
						<span>추가정보</span>
						</div>
						<div class="introduceContent"><br/>
							<img src="leapin/Images/서류가방.PNG" style="width:20px; height:20px; margin:0px 0px -3px 0px;"/>
							<span>설립 4년</span><br/><br/>
							<img src="leapin/Images/사람들.PNG" style="width:20px; height:20px; margin:0px 0px -3px 0px;"/>
							<span>직원수 5명</span><br/><br/>
							<img src="leapin/Images/문서.PNG" style="width:20px; height:20px; margin:0px 0px -3px 0px;"/>
							<span>사업자등록증 등록완료</span><br/><br/>
						</div>
					</div>
				</div>
				<div class="middleOffer">
					<div class="title">
						<span>제공 서비스</span>
					</div><br/>
					<div class="serviceBox">로고 디자인</div>
				</div>
				<div class="middleDetail">
					<div class="title">
						<span>서비스 상세설명</span>
					</div>
					<div class="detailContent"></div>
				</div>
				<div class="pictureTitle" style="height:80px;">
					<div class="title">
						<br/><br/><span>기업 활동내역</span>
					</div>
				</div>
				<br/><br/>
				<div class="pictureImage">
					<div class="detailImage">
						<img src="leapin/Images/사진동영상1.PNG" style="border-radius: 10px;"/>
					</div>
					<div class="detailImage">
						<img src="leapin/Images/사진동영상2.PNG" style="border-radius: 10px;"/>
					</div>
					<div class="detailImage">
						<img src="leapin/Images/사진동영상3.PNG" style="border-radius: 10px;"/>
					</div>
					<div class="detailImage">
						<img src="leapin/Images/사진동영상4.PNG" style="border-radius: 10px;"/>
					</div>
					<div class="detailImage">
						<img src="leapin/Images/사진동영상5.PNG" style="border-radius: 10px;"/>
					</div>
					<div class="detailImage">
						<img src="leapin/Images/사진동영상6.PNG" style="border-radius: 10px;"/>
					</div>
				</div>
				<div style="clear:both;"></div>
				<div class="review">
					<div class="reviewTop">
						<div class="reviewTitle">
							<span>리뷰</span>
						</div>
						<div class="reviewTopStarpoint">
							<div class="reviewTopPoint">
								<span>5.0</span>
							</div>
							<div class="reviewTopStar">
								<img style="width:25px; height:25px;"src="leapin/Images/리뷰 별.png"/>
								<img style="width:25px; height:25px;"src="leapin/Images/리뷰 별.png"/>
								<img style="width:25px; height:25px;"src="leapin/Images/리뷰 별.png"/>
								<img style="width:25px; height:25px;"src="leapin/Images/리뷰 별.png"/>
								<img style="width:25px; height:25px;"src="leapin/Images/리뷰 별.png"/>
								</br>
								<span>51개 리뷰</span>
							</div>
						</div>
					</div>
					<div style="clear:both"></div>
					<div class="reviewCenter"><br/></div>
				</div>
				
			</div>
		</div>
	</div>
	<br/><br/><div class="bottom"><br/><br/>
		<span style="margin-right: 35px;">주)리핀네트워크는 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.</span><br/>
		<span style="margin-right: 280px;">상호명:(주)리핀네트워크 · 대표이사:SIN WOO JIN · 개인정보책임관리자:전준하 · 주소:경기 안양시 동안구 동편로 110 동편마을3단지</span><br/>
		<span style="margin-right: 282px;">사업자등록번호:120-88-22325 · 통신판매업신고증:제 2021-경기안양-06081호 · 직업정보제공사업 신고번호:경기북부청 제 2021-1호</span><br/>
		<span style="margin-right: 703px;">고객센터:2021-06-08 · 이메일:Liphin2021@gmail.com</span><br/>
		<span style="margin-right: 704px;">Copyright ©Leapin Network Inc. All Rights Reserved.</span>
	</div>
</body>
</html>