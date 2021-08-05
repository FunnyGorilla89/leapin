<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "DAO.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<%
	String loginId = (String)(session.getAttribute("loginId"));
	String E = (String)(session.getAttribute("E"));
 	String ono = (String)request.getParameter("ono"); 
 	LeapinDAO dao = new LeapinDAO();
 	%>
  <title>채팅세부페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
 <style>
  
#btn_logout, #btn_board, #btn_mypage, #btn_chatting, #btn_login, #btn_signup, .right-heaeder-button-group {font-size:15px; font-weight:bold; background-color:transparent; border:0; outline:0; border-radius:5px; cursor:pointer;padding:5px;}
#btn_logout:hover, #btn_board:hover, #btn_mypage:hover, #btn_chatting:hover, #btn_login:hover, #btn_signup:hover, .right-heaeder-button-group:hover {background:#c9c9c9;}
.logo {width:120px; height:45px;}
#header-area {display: flex;justify-content: space-between;align-items: center; border-bottom: 1px solid gray; height:70px;}
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

	#file_download{
		cursor: pointer;
	}
	
</style>
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
	
	<div class = "container" style = 'max-width :900px;'>
		
		<div class = "container justify-content-between" style = 'max-width :900px; display : flex;'>
	<div>
	<h2>채팅</h2>
	</div>
	<div>
	<span id = "output_name" class = 'text-info'></span>
	<button class = "btn btn-outline-primary" id = "btn_close">돌아가기</button>
	</div>
	</div>
		<div id = "messagebox" style = "overflow : auto;  max-height : 300px; border : 1px solid black; background:#ECECEC; ">
		
		</div>
		<div  style = "border : 1px solid black">
		<textarea class = "form-control" rows = "2" id = "text_box" style = " overflow : auto; "></textarea>
		<form id = "fileUploadForm" method = "post" enctype ="multipart/form-data">
		<div style = "display: flex; flex-wrap: wrap;  justify-content: space-between">
			
		<div>
			<input type = "file" name = "file" id = "file"  class = "form-control"/>
		</div>
		<div>
		<input type = "submit" class = "btn btn-primary" id = "submit_btn" value = "전송">
		</div>
		</div>
		</form>
		</div>
	</div>
	
	  <script>
		  
			 loginId = "<%=loginId%>";
			 E = "<%=E%>";
			 ono = "<%=ono%>";
			 var sock = new WebSocket('ws://localhost:9090/leapin/echo/' + ono);
			 var message;    // for testing
	 
			 output_name = "";
			 output_id = "";
			 file_name = "";
			
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
					type:"POST",
		  	        url:"./Controller",
		  	        dataType : "json",
		  	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		  	        data : {"id" : loginId, "ono" : ono, "command" : "chat_log"},
		  	        success : function(data){
		  	        	var chat = data.dbdata;
		  	        	var input_id = chat[0].input_id;
		  	        	var e_name = data.e_name;
		  	        	console.log(e_name);
		  	        	if(e_name == null){
		  	        		
			  	        	if(input_id == loginId){
				  	        	output_id = chat[0].output_id;
				  	        	output_name = chat[0].output_name;	  	        		
			  	        	}else{
			  	        		output_id = chat[0].input_id;
				  	        	output_name = chat[0].input_name;
			  	        	}
		  	        	}else{
		  	        		output_name = e_name;
		  	        		if(input_id == loginId){
				  	        	output_id = chat[0].output_id;
			  	        	}else{
			  	        		output_id = chat[0].input_id;
			  	        	}
		  	        		
		  	        	}
		  	        	
		  	     
			 			$("#output_name").append(output_name);
		  	        	for(var i = 0; i < chat.length; i++){
		  	        		if(loginId == chat[i].input_id){
			  	        		if(chat[i].content != "" && chat[i].content != null && chat[i].content != "null"){
			  	        			$("#messagebox").append("<span style = 'float : right;'>"+chat[i].content + "</span><br/>");
			  	        			scroll();
			  	        		}
			  	        		
			  	        		if(chat[i].file_name != null && chat[i].file_name !="null"){
				  	  	  			console.log(getContextPath());
				  	  	  		if(!/\.(gif|jpg|jpeg|png)$/i.test(chat[i].file_name)){
					  				$('#messagebox').append("<div id = 'file_download' class = 'text-primary' style = 'float : right;'><span id = 'file'>"+ chat[i].file_name +"</span><span> 파일 내려받기 </span></div><br/>");
					  			}else{
					  				
						  			$('#messagebox').append("<div style = 'display: flex; flex-direction: column; justify-content: flex-end; align-items: flex-end;'><img src ='" +getContextPath()+ "/upload/" + chat[i].file_name + "' style = ' max-width: 200px; float : right;'></div><div id = 'file_download' class = 'text-primary' style = 'float : right;'><span id = 'file'>"+ chat[i].file_name +"</span><span> 파일 내려받기 </span></div><br/>");
					  			}
				  	  	  		scroll();
			  	  	  			}
		  	        		}else{
		  	        			if(chat[i].content != "" && chat[i].content != null && chat[i].content != "null"){
		  	        				$("#messagebox").append("<span style = 'float : left;'>"+output_name + " : " + chat[i].content + "</span><br/>");		
		  	        				scroll();
		  	        			}
							
		  	        			if(chat[i].file_name != null && chat[i].file_name !="null"){
		  	        				if(!/\.(gif|jpg|jpeg|png)$/i.test(chat[i].file_name)){
		  	      	  				$('#messagebox').append("<div id = 'file_download' class = 'text-primary'><span id = 'file'>"+ chat[i].file_name +"</span><span> 파일 내려받기 </span></div><br/>");
		  	      	  			}else{
		  	      	  				
				  	  	  			$('#messagebox').append("<div style = 'display: flex; flex-direction: column; align-items: flex-start;'>"+output_name + " : <img src ='" +getContextPath()+ "/upload/" + chat[i].file_name + "' style = ' max-width: 200px; float : left;'></div><div id = 'file_download' class = 'text-primary'><span id = 'file'>"+ chat[i].file_name +"</span><span> 파일 내려받기 </span></div><br/>");
		  	      	  			}
				  	  	  		scroll();
			  	  	  			}
		  	        		}	
		  	        	}
		  	        },
		  	        error : function(data){
		  	        	
		  	        }
			 });		 
			 
	 

	  	/* if (sock != null && sock !== undefined && sock.readyState !== WebSocket.CLOSED) {
	  		$('#messagebox').append('웹소켓이 이미 연결되었습니다.<br>');
	  		scroll();
	  		return;
	  	} */
	  	
	  	// 서버와 연결이 완료된후 자동호출됨
	  	sock.onopen = function (event) {
	  		$('#messagebox').append('연결되었습니다.<br>');
	  		scroll();
	  	}
	  	
	  	// onmessage는 서버로부터 메시지를 받았을때 호출됨
	  	sock.onmessage = function (event) {
	  		onMessage(event);
	  		console.log(event);
	  		var message = event.data;
	  		marray = message.split("/");
	  		var str = output_name + " : " + marray[0] + '<br>';
	  		
	  		$('#messagebox').append(str);
	  		if(marray[3] != null && marray[3] !="null"){
	  			console.log(getContextPath());
	  			if(!/\.(gif|jpg|jpeg|png)$/i.test(marray[3])){
	  				$('#messagebox').append("<div id = 'file_download' class = 'text-primary'><span id = 'file'>"+ marray[3] +"</span><span> 파일 내려받기 </span></div><br/>");
	  			}else{
	  				
		  			$('#messagebox').append("<div style = 'display: flex; flex-direction: column; justify-content: flex-end; align-items: flex-end;'><img src ='" +getContextPath()+ "/upload/" + marray[3] + "' style = ' max-width: 200px; float : left;'></div><div id = 'file_download' class = 'text-primary' style = 'float : left;'><span id = 'file'>"+ marray[3] +"</span><span> 파일 내려받기 </span></div><br/>");
	  			}
	  		}
	  		scroll();
	  	};
	  	
	  	sock.onclose = function (event) {
	  		$('#messagebox').append('연결이 끊어졌습니다.<br>');
	  		scroll();
	  	}
	  
	  function onMessage(event){
		  console.log(event);
	  }

	  

	  function send() {
		  console.log("sendstart1");
	  	var message = $('#text_box').val();
	  	if (message == '' && file_name == null) {
	  		return;
	  	}	
	  	console.log("file_name1 : " + file_name);
	  	
	  	console.log('message : ' + message);
	  	console.log('output_id : ' + output_id);
	  	sock.send(message+"/"+output_id + "/" + loginId + "/" + file_name);
	  	
	  	var str = '<span style="float : right;">' + message  + '</span><br/>';
	  	$('#messagebox').append(str);
	  	if(file_name != null && file_name !="null"){
	  		if(!/\.(gif|jpg|jpeg|png)$/i.test(file_name)){
  				$('#messagebox').append("<div id = 'file_download' class = 'text-primary' style = 'float : right'><span id = 'file'>"+ file_name +"</span><span> 파일 내려받기 </span></div><br/>");
  			}else{
  				
	  			$('#messagebox').append("<div style = 'display: flex; flex-direction: column; justify-content: flex-end; align-items: flex-end;'><img src ='" +getContextPath()+ "/upload/" + file_name + "' style = ' max-width: 200px; float : right;'></div><div id = 'file_download' class = 'text-primary' style = 'float : right;'><span id = 'file'>"+ file_name +"</span><span> 파일 내려받기 </span></div><br/>");
  			}
  		}
	  	scroll();
	  	
	  	$('#text_box').val('');	
	  	var agent = navigator.userAgent.toLowerCase();
	  //파일초기화
	  if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
	      $("#file").replaceWith($("#file").clone(true));
	  }else{
	      $("#file").val("");
	  }

	  }

	  
	  function scroll() {
	  	var top = $('#messagebox').prop('scrollHeight');
	  	$('#messagebox').scrollTop(top);
	  }


	  	$('#btn_close').on('click', function (event) {
	  		sock.close();
	  	});
	  	
	  	$('#submit_btn').on('click', function (event) {
	  		console.log("click");
	  	//preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음 
			event.preventDefault();          
		    // Get form         
		    var form = $('#fileUploadForm')[0];  
		    console.log(form);
		    // Create an FormData object          
		    var data = new FormData(form);  	   
		    console.log(data);
		    // disabled the submit button       
		    $("#submit_btn").prop("disabled", true);   
		    
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
		        	alert("complete");    
		        	file_name = data;
		        	console.log("file_name2 : " + file_name);
		        	$("#submit_btn").prop("disabled", false);      
	  				send();
		        },          
		        error: function (e) {  
		        	console.log("ERROR : ", e);     
		            $("#submit_btn").prop("disabled", false);    
		            alert("fail");  
		         }     
			});  
		    console.log("sendstart2");
	  	});
	  	
	  	$('#text_box').on('keydown', function (event) {
	  		if (event.keyCode == 13) { // 엔터키
	 			$("#submit_btn").click();
	  		return false;
	  			
	  		}
	  	});
	  	
	  	$(document).on("click","#file_download",function(){
	  		var file = $(this).children("#file").text();
	  		alert(file);
	  		location.href = getContextPath() + "/downloadAction?file=" + file;
	  	});
	  function getContextPath() {
			var hostIndex = location.href.indexOf( location.host ) + location.host.length;
			return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
		}
	  	
			
  </script>
</body>
</html>
