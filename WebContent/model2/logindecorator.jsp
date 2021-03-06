<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<html>
<title>효니 개인프로젝트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5 {font-famil

y: "Open Sans", sans-serif}
</style>
<body class="w3-theme-l5">
<jsp:useBean id="today" class="java.util.Date"></jsp:useBean>
<fmt:formatDate value="${today }" pattern="yyyy" var="year"/>
<fmt:formatDate value="${today }" pattern="MM" var="month"/>

<!-- 최상단 바 -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <a href="${path }/model2/login/loginForm.me?year=${year }&month=${month}" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>효니</a><!-- 로고 -->
  <a href="${path }/model2/login/loginForm.me?year=${year }&month=${month}" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="login"><i class="fa fa-sign-in">&nbsp;로그인</i></a>
  <a href="javascript:logincheck()" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="Account Settings"><i class="fa fa-user">&nbsp;개인정보</i></a>
 </div>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white">
					<div class="w3-card-4">
						<div class="w3-container w3-blue-grey">
							<h2>로그인</h2>
						</div>
						
						<form  class="w3-container"  action="../login/login.me" method="post">
							<input type="hidden" name="year" value="${year }">
							<input type="hidden" name="month" value="${month}">
							<p>
								<label class="w3-text-dark-grey"><b>아이디</b></label> <input
									class="w3-input w3-border w3-sand" name="memberno" type="text">
							</p>
							<p>
								<label class="w3-text-dark-grey"><b>비밀번호</b></label> <input
									class="w3-input w3-border w3-sand" name="pass" type="password">
							</p>
							<p>
								<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button"
									onclick="location.href='${path }/model2/loginchange/ini.jsp?year=${year }&month=${month}'" value="초기화"> 
								<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button"
									onclick="location.href='${path }/model2/loginchange/passchange.jsp?year=${year }&month=${month}'" value="변경">
								<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="submit"
									value="로그인">
							</p>
						</form>
					</div>
		</div>
      <br>
      
      <!-- Accordion -->
      <div class="w3-card w3-round">
        <div class="w3-white">
         <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>로그인</button>
          <div id="Demo1" class="w3-hide w3-container">
          	<a href="${path }/model2/login/loginForm.me?year=${year }&month=${month}"> ● 로그인</a><br>
          	<c:if test="${!empty sessionScope.login }">
          		<a href="${path }/model2/login/logout.me?year=${year }&month=${month}"> ● 로그아웃</a>
          	</c:if>
         </div>
         <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>게시판</button>
          <div id="Demo2" class="w3-hide w3-container">
            <a href="javascript:logincheck()"> ● 공지 사항</a><br>
            <a href="javascript:logincheck()"> ● 앨범</a><br>
            <a href="javascript:logincheck()"> ● 자유게시판</a>
          </div>
         <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>주소록</button>
          <div id="Demo3" class="w3-hide w3-container">
            <a href="javascript:logincheck()"> ● 전 직원 주소</a><br>
            <a href="javascript:logincheck()"> ● 팀 직원 주소</a>
          </div>
         <button onclick="myFunction('Demo5')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>자료실</button>
          <div id="Demo5" class="w3-hide w3-container">
            <a href="javascript:logincheck()"> ● 서류 양식 및 프로그램</a>
          </div>
         <button onclick="myFunction('Demo7')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>일정관리</button>
          <div id="Demo7" class="w3-hide w3-container">
            <a href="javascript:logincheck()"> ● 일정</a>
          </div>
         <button onclick="myFunction('Demo4')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>쪽지</button>
          <div id="Demo4" class="w3-hide w3-container">
            <a href="javascript:logincheck()"> ● 쪽지보내기</a><br>
            <a href="javascript:logincheck()"> ● 보낸 쪽지함</a><br>
            <a href="javascript:logincheck()"> ● 받은 쪽지함</a>
          </div>
        </div>      
      </div>
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
      	<decorator:body></decorator:body>
      </div>   
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
      <div class="w3-bar w3-theme-d2 w3-center w3-large w3-hover-white">
      	<a href="javascript:logincheck()" class="w3-bar-item w3-button w3-hide-small w3-center w3-hover-white" title="board"  style = "font-size:1;"><i class="fa fa-clone w3-padding-large"></i>공지사항</a>
      </div>
      <br>
      
      <div class="w3-bar w3-theme-d2 w3-center w3-large w3-hover-white" >
      	<a href="javascript:logincheck()" class="w3-bar-item w3-button w3-hide-small w3-center w3-hover-white" title="messages"  style = "font-size:1;"><i class="fa fa-envelope w3-padding-large"></i>쪽지 보내기</a>
      </div>
      <br>
      
      <div class="w3-bar w3-theme-d2 w3-center w3-large w3-hover-white">
      	<a href="javascript:logincheck()" class="w3-bar-item w3-button w3-hide-small w3-center w3-hover-white" title="directory"  style = "font-size:1;"><i class="fa fa-address-card-o w3-padding-large"></i>팀 연락처</a>
      </div>
      <br>
      
      <div class="w3-bar w3-theme-d2 w3-center w3-large w3-hover-white">
      	<a href="javascript:logincheck()" class="w3-bar-item w3-button w3-hide-small w3-center w3-hover-white" title="calendar"  style = "font-size:1;"><i class=" fa fa-calendar w3-padding-large"></i>일 정</a>
      </div>
      
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>

<!-- Footer -->
<footer class="w3-container w3-theme-d3 w3-padding-16">
</footer>

<footer class="w3-container w3-theme-d5 ">
  <p class="w3-right ">made by hyoni</p>
</footer>
 
<script>
// Accordion
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-theme-d1";
    } else { 
        x.className = x.className.replace("w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-theme-d1", "");
    }
}

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}
//슬라이드
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 9000);    
}
function logincheck() {
	alert("로그인을 해주세요");
}
</script>
</body>
</html> 
 
 