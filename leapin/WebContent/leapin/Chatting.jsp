<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅창</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href='Chatting.css' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="container">
  <div class="header">
    <h2>Messages</h2>
  </div>
  <div class="chat-box">
   <div class="chat-content">
    <div class="message-box left-img">
      <div class="picture">
        <img src="Images/기업찾기 이미지(디스페이스).PNG" title="디스페이스"/>
        <span class="time">10 mins</span>
      </div>
      <div class="message">
        <span>디스페이스</span>
        <p>.... 로 생각중인데 어떠세요?</p>
      </div>
    </div>
    <div class="message-box right-img">
      <div class="picture">
        <img src="Images/기업찾기 이미지(아이엠프로덕션).PNG" title="아이엠프로덕션"/>
        <span class="time">2 mins</span>
      </div>
      <div class="message">
       <span>아이엠프로덕션</span>
       <p>좋은 조건인거 같네요!</p>
      </div>
     </div>
    </div>
    <div class="enter-message">
     <button title="파일 첨부">+</button>
     <input type="text" placeholder="채팅하시면 됩니다."/>
     <a href="#" class="send">Send</a>
    </div>
  </div>
</div>
</form>
</body>
</html>