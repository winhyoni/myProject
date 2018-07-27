<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%request.setAttribute("login", request.getSession().getAttribute("login")); %>
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

<!-- 최상단 바 -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <a href="main.me?year=${year }&month=${month}" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>효니</a><!-- 로고 -->
  <a href="logout.me?year=${year }&month=${month}" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="login"><i class="fa fa-sign-out">&nbsp;로그아웃</i></a>
  <a href="member/empinfo.jsp?year=${year }&month=${month}" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="Account Settings"><i class="fa fa-user">&nbsp;개인정보</i></a><!-- 개인정보보기 아이콘 -->
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
        <div class="w3-container">
         <h4 class="w3-center">My Profile</h4>
         <p class="w3-center"><img src="${path }/model2/member/img/${picture }" class="w3-circle" style="height:106px;width:106px" alt="사진없음"></p>
         <hr>
         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> ${name}</p>
         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> ${dpt}</p>
         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> ${birth}</p>
        </div>
      </div>
      <br>
      
      <!-- Accordion -->
      <div class="w3-card w3-round">
        <div class="w3-white">
         <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>로그인</button>
          <div id="Demo1" class="w3-hide w3-container">
            <c:if test="${empty sessionScope.login }">
          		<a href="/login/loginForm.me?year=${year }&month=${month}"> ● 로그인</a><br>
          	</c:if>
            <a href="logout.me?year=${year }&month=${month}"> ● 로그아웃</a>
          </div>
         <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>게시판</button>
          <div id="Demo2" class="w3-hide w3-container">
            <a href="${path }/model2/board/boardlist.me?kindno=1"> ● 공지 사항</a><br>
            <a href="${path }/model2/board/boardlist.me?kindno=2"> ● 앨범</a><br>
            <a href="${path }/model2/board/boardlist.me?kindno=3"> ● 자유게시판</a>
          </div>
         <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>주소록</button>
          <div id="Demo3" class="w3-hide w3-container">
            <a href="${path }/model2/member/emplist.me"> ● 전 직원 주소</a><br>
            <a href="${path }/model2/member/trememplist.me"> ● 팀 직원 주소</a><br>
            <c:if test="${name.equals('admin')}">
          		<a href="${path }/model2/member/join.jsp?year=${year}&month=${month}"> ● 직원 등록</a><br>
          		<a href="${path }/model2/member/empdelete.jsp?year=${year }&month=${month}"> ● 직원 삭제</a>
          	</c:if>
            
          </div>
         <button onclick="myFunction('Demo5')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>자료실</button>
          <div id="Demo5" class="w3-hide w3-container">
            <a href="${path }/model2/board/boardlist.me?kindno=4"> ● 서류 양식 및 프로그램</a>
          </div>
          
         	<jsp:useBean id="today" class="java.util.Date"></jsp:useBean>
          	<fmt:formatDate value="${today }" pattern="yyyy" var="year"/>
          	<fmt:formatDate value="${today }" pattern="MM" var="month"/>
         
         <button onclick="myFunction('Demo7')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>일정관리</button>
          <div id="Demo7" class="w3-hide w3-container">
				<a href="${path }/model2/calender/calender.me?year=${year}&month=${month}"> ● 일정</a>
          </div>
         <button onclick="myFunction('Demo4')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>쪽지</button>
          <div id="Demo4" class="w3-hide w3-container">
            <a href="${path }/model2/message/messagesend.me?sort=1"> ● 쪽지보내기</a><br>
            <a href="${path }/model2/message/messagesendlist.me?sort=1"> ● 보낸 쪽지함</a><br>
            <a href="${path }/model2/message/messagesendlist.me?sort=2"> ● 받은 쪽지함</a>
          </div>
        </div>      
      </div>
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
      
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
      	<div class="w3-content w3-section" style="max-width:100%;max-heigt:100%;">
      		<img class="mySlides w3-animate-fading" src="../companyimg/company1.jpg" style="height:150px;width:100%">
  			<img class="mySlides w3-animate-fading" src="../companyimg/company2.jpg" style="height:150px;width:100%">
  			<img class="mySlides w3-animate-fading" src="../companyimg/company3.jpg" style="height:150px;width:100%">
  			<img class="mySlides w3-animate-fading" src="../companyimg/company4.jpg" style="height:150px;width:100%">
		</div>
      </div>
      
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <div class="w3-container w3-grey">
				<h2 align="center">${month }월</h2>
  			</div>
  
  			<c:set var="a" value="0"></c:set>
  			<c:set var="doneLoop" value="false"/> 
  			<table class="w3-table-all w3-centered">
				<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>
  				<c:forEach var="i" begin="0" end="4" step="1">
  				<c:if test="${not doneLoop}">
  					<tr>
  					<c:forEach var="j" begin="0" end="6" step="1">
  						<td width="100" height="120">
  							<c:if test="${j==0}"><font color='red'></c:if>
  							<c:if test="${j==6}"><font color='blue'></c:if>
  							<c:if test="${i==0}">
  								<c:if test="${j>=dd}">
  									<c:set var="a" value="${a+1}"></c:set>
  									${a}
  								</c:if>
  								<c:if test="${j<dd}">
  									&nbsp;
  								</c:if>
  							</c:if>
  							<c:if test="${i!=0}">
  								<c:if test="${a<lastday}">
  									<c:set var="a" value="${a+1}"></c:set>
  									${a}
  								</c:if>
  								<c:if test="${a>=lastday}">
  									&nbsp;
  								</c:if>
  							</c:if>
  							<c:if test="${j==0 || j==6}">
  							</font>
  							</c:if>
  							<c:forEach var="calender" items="${list }">
  				 				<fmt:formatDate value="${calender.regdate}" pattern="yyyy" var="setyear"/>
  				 				<fmt:formatDate value="${calender.regdate}" pattern="MM" var="setmonth"/>
  				 				<fmt:formatDate value="${calender.regdate}" pattern="dd" var="setday"/>
  							 	<c:if test="${year==setyear && month==setmonth && a==setday && calender.kindno==1}">
  								<div class="w3-container w3-red">
  								<a href="${path }/model2/calender/calenderinfo.me?no=${calender.no}&year=${year}&month=${month}" style="text-shadow:1px 1px 0 #444"><font size="1">${calender.subject}</a></font>
  								</div>
								</c:if>
  				 				<c:if test="${year==setyear && month==setmonth && a==setday && calender.kindno==2}">
  				 				<div class="w3-container w3-blue">
  				 				<a href="${path }/model2/calender/calenderinfo.me?no=${calender.no}&year=${year}&month=${month}" style="text-shadow:1px 1px 0 #444"><font size="1">${calender.subject}</a></font>
  				 				</div>
								</c:if>
  				 			</c:forEach>
  						</td>
  					</c:forEach>
  					</tr>
  					<c:if test="${result>=lastday}">
						<c:set var="doneLoop" value="true"/>
  					</c:if>
  				</c:if>
  				</c:forEach>
  			</table>
        
      </div>   
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
      <div class="w3-bar w3-theme-d2 w3-center w3-large w3-hover-white">
      	<a href="${path }/model2/board/boardlist.me?kindno=1" class="w3-bar-item w3-button w3-hide-small w3-center w3-hover-white" title="board"  style = "font-size:1;"><i class="fa fa-clone w3-padding-large"></i>공지사항</a>
      </div>
      <br>
      
      <div class="w3-bar w3-theme-d2 w3-center w3-large w3-hover-white" >
      	<a href="${path }/model2/message/messagesend.me?sort=1" class="w3-bar-item w3-button w3-hide-small w3-center w3-hover-white" title="messages"  style = "font-size:1;"><i class="fa fa-envelope w3-padding-large"></i>쪽지 보내기</a>
      </div>
      <br>
      
      <div class="w3-bar w3-theme-d2 w3-center w3-large w3-hover-white">
      	<a href="${path }/model2/member/trememplist.me" class="w3-bar-item w3-button w3-hide-small w3-center w3-hover-white" title="directory"  style = "font-size:1;"><i class="fa fa-address-card-o w3-padding-large"></i>팀 연락처</a>
      </div>
      <br>
      
      <div class="w3-bar w3-theme-d2 w3-center w3-large w3-hover-white">
      	<a href="${path }/model2/calender/calender.me?year=${year}&month=${month}" class="w3-bar-item w3-button w3-hide-small w3-center w3-hover-white" title="calendar"  style = "font-size:1;"><i class=" fa fa-calendar w3-padding-large"></i>일 정</a>
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
</script>
</body>
</html> 
