<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@ page import = "DAO.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<%
String loginId = (String)(session.getAttribute("loginId"));
String E = (String)(session.getAttribute("E"));

LeapinDAO dao = new LeapinDAO();
String pageNum =request.getParameter("pageNum"); 	
%>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<script>

		 u_id = "<%=loginId%>";
		 pageNum = <%=pageNum%>;
	 $(function(){			 
		command = "create_board";
		 
		 if(u_id == "null" || null){
			 $("#log_out").hide();
		 }else{
			 $("#log_in").hide();
			 $("#sign_up").hide();
		 };
		 
		 $.ajax({
	  	        type:"GET",
	  	        url:"./Controller",
	  	        dataType : "json",
	  	        data : {"pageNum" : pageNum, "command" : command},
	  	        success: function(data){
	  	        	var board = data.dbdata;
	  	        	var prepage = data.prePage;
	  	        	var nextpage = data.nextPage;
	  	        	var pagination = data.pagination;
	  	        	console.log(pagination);
	  	        	console.log(board);        	
		  	  		$("#board_body").empty();  	        		
	  	        		  var html="";
	  	        		 for(var i =0;i<board.length;i++){
							/*var bno = board[i].bno;
							var title = board[i].title;
							var writer = board[i].writer;
							var writedate = board[i].writedate;
							var hitcount = board[i].hitcount;
							html+="<tr id='board_tr'><td>" + bno + "</td><td>" + title + "</td><td>" + writer + "</td><td>" + writedate + "</td><td>" + hitcount + "</td></tr>"
	  	        		*/
	  	        			html = board[i].board;
							//console.log(html);
	  	        		   $("#board_body").append(html);
	  	        		 }
	  	        	$("#pagination").empty();
	  	        
	  	        	$("#pagination").append(prepage);
	  	        	for(var i = 0; i < pagination.length; i++){
	  	        		html = pagination[i].pagination;
	  	        		$("#pagination").append(html);
	  	        	}
	  	        	$("#pagination").append(nextpage);
	  	           
	  	          	        	
	  	        },
	  	     	 error: function(request,status,error) {
	 	           console.log(error);
	 	           console.log(request);
	 	           console.log(status);
		        } 
	  	        
			});
		 
		 $("#writeBoard").on("click",function(){
				if(u_id == null){
					alert("???????????? ????????? ???????????????.");
					location.href = "Ex501_login.jsp";
				}else{
					location.href = "Ex501_write_board.jsp";
				}
			});
		 
		 $("#my_board").on("click",function(){
			 if(u_id == null || u_id == "null"){
				 alert("???????????? ????????? ???????????????.");
				 location.href = "Ex501_login.jsp";
			 }else{		
				 gets = u_id;
				 sname ="%"+gets+"%";
				 $.ajax({
			  	        type:"GET",
			  	        url:"./Controller",
			  	        dataType : "json",
			  	        data : {"id" : u_id, "pageNum" : pageNum,"mb" : "1","command" : "create_board"},
			  	        success: function(data){
			  	        	var board = data.dbdata;
			  	        	var prepage = data.prePage;
			  	        	var nextpage = data.nextPage;
			  	        	var pagination = data.pagination;
			  	        	//console.log(board);        	
				  	  		$("#board_body").empty();  	        		
			  	        		  var html="";
			  	        		 for(var i =0;i<board.length;i++){
									/*var bno = board[i].bno;
									var title = board[i].title;
									var writer = board[i].writer;
									var writedate = board[i].writedate;
									var hitcount = board[i].hitcount;
									html+="<tr id='board_tr'><td>" + bno + "</td><td>" + title + "</td><td>" + writer + "</td><td>" + writedate + "</td><td>" + hitcount + "</td></tr>"
			  	        		*/
			  	        			html = board[i].board;
			  	        		   $("#board_body").append(html);
			  	        		 }
			  	        	$("#pagination").empty();
			  	        
			  	        	$("#pagination").append(prepage);
			  	        	for(var i = 0; i < pagination.length; i++){
			  	        		html = pagination[i].pagination;
			  	        		$("#pagination").append(html);
			  	        	}
			  	        	$("#pagination").append(nextpage);
			  	           
			  	          	        	
			  	        },
			  	     	 error: function(data) {
			 	           console.log(data);
				        } 
			  	        
					});
			 }
		});
		 $("#log_out").on("click",function(){
				var result = confirm("???????????? ?????????????????? ?")
				if(result){
					$.ajax({
						type : "POST",
						url : "./log_out",
						success : function(){
							u_id = null;
							alert("???????????? ???????????????!");
						},
						error : function(){
							
						}
						
					});		
				}			
			});	 
		 $("#search_btn").on("click",function(){
			var search_type = $("#sel2").val();
			var search_value = $("#sel3").val();
			//alert(search_type);
			//alert(search_value);
			 $.ajax({
		  	        type:"GET",
		  	        url:"./Controller",
		  	        dataType : "json",
		  	        data : {"id" : u_id, "pageNum" : pageNum,"sd" : search_type,"gets" : search_value, command : "create_board"},
		  	        success: function(data){
		  	        	var board = data.dbdata;
		  	        	var prepage = data.prePage;
		  	        	var nextpage = data.nextPage;
		  	        	var pagination = data.pagination;
		  	        	
		  	        	//console.log(board);        	
			  	  		$("#board_body").empty();  	        		
		  	        		  var html="";
		  	        		 for(var i =0;i<board.length;i++){
								/*var bno = board[i].bno;
								var title = board[i].title;
								var writer = board[i].writer;
								var writedate = board[i].writedate;
								var hitcount = board[i].hitcount;
								html+="<tr id='board_tr'><td>" + bno + "</td><td>" + title + "</td><td>" + writer + "</td><td>" + writedate + "</td><td>" + hitcount + "</td></tr>"
		  	        		*/
		  	        			html = board[i].board;
								
		  	        		   $("#board_body").append(html);
		  	        		 }
		  	        	$("#pagination").empty();
		  	        
		  	        	$("#pagination").append(prepage);
		  	        	for(var i = 0; i < pagination.length; i++){
		  	        		html = pagination[i].pagination;
		  	        		$("#pagination").append(html);
		  	        	}
		  	        	$("#pagination").append(nextpage);
		  	           
		  	          	        	
		  	        },
		  	     	 error: function(data) {
		 	           console.log(data);
			        } 
		  	        
				});
		 });
		 $(document).on("click","#board_tr",function(){
			var bno = $(this).children().eq(0).html();
			var title = $(this).children().eq(1).html();
			var writer = $(this).children().eq(2).html();
			var writedate = $(this).children().eq(3).html();
			var hitcount = $(this).children().eq(4).html();
			//alert(bno+title+writer+writedate+hitcount);
			$(this).prevAll().empty();
			$(this).nextAll().empty(); 
			$(this).after("<tr><td colspan = '5'>!</td></tr>");
			
		 });
		 
	 });
</script>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="#">Leapin</a>
  
  <!-- Links -->
  <ul class="navbar-nav">
  	<li class="nav-item" id = "log_out">
      <a class="nav-link" href="Ex501_board_list.jsp">????????????</a>
    <li class="nav-item" id = "sign_up">
      <a class="nav-link" href="Ex501_register.jsp">????????????</a>
    </li>
    <li class="nav-item" id ="log_in">
      <a class="nav-link" href="Ex501_login.jsp">?????????</a>
    </li>
    <li class="nav-item" id = "board">
      <a class="nav-link" href="Ex501_board_list.jsp">?????????</a>
    </li>
  </ul>
</nav>
<section id = "boardsection">
<div class="container" style = "margin-top : 50px;">
   <div class = "row navbar">
	  <h2>?????????</h2>     
  	<div class="form-group ">
      <label for="sel1">??? ?????? ??????</label>
      <select class="form-control" id="sel1" name="sellist1" onchange = "">
        <option value = "bno">?????????</option>
        <option value = "hitcount">?????????</option>
      </select>
    </div>   
  <table class="table table-striped">
    <thead>
      <tr>
        <th>??? ??????</th>
        <th>??????</th>
        <th>?????????</th>
        <th>?????????</th>
        <th>?????????</th>
        <th>?????????</th>
        <th>?????????</th>
      </tr>
    </thead>
    <tbody id = "board_body">

    </tbody>
  </table>
</div>
<div class="container">                
  <ul id = "pagination" class="pagination justify-content-center">

  </ul>
  </div>
  
  <div class = "container">
  <div class = "row navbar">
    <div>
    	<div class="form-group row" style = "align-items: flex-end;">
	   	<div>
      <select class="form-control" id="sel2" name="sellist2">
        <option value = "writer">?????????</option>
        <option value = "title">?????????</option>
      </select>
    	</div>
    	<div>     
      <input type = "text" id = "sel3" name ="search" value = "" style = "margin-left : 20px;"/>
      <button id = "search_btn" type = "submit" class = "btn btn-outline-dark">??????</button>
    	</div>
    </div>
    </div>
  	<div>
  		<button type = "submit" id = "my_board" class = "btn btn-outline-warning">
  			?????? ????????? ?????????
  		</button>
  		<button id = "writeBoard" class = "btn btn-outline-info">
  			?????????
  		</button>
  		</div>
  		</div>
  	</div>
  </div>
</section>

</body>
</html>
