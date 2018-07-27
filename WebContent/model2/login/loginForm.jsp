<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<html>
<title>ȿ�� ����������Ʈ</title>
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

<!-- �ֻ�� �� -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <a href="loginForm.me?year=${year }&month=${month}" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>ȿ��</a><!-- �ΰ� -->
  <a href="loginForm.me?year=${year }&month=${month}" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="login"><i class="fa fa-sign-in">&nbsp;�α���</i></a>
  <a href="javascript:logincheck()" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="Account Settings"><i class="fa fa-user">&nbsp;��������</i></a>
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
							<h2>�α���</h2>
						</div>
						
						<form  class="w3-container"  action="login.me?year=${year }&month=${month}" method="post">
							<p>
								<label class="w3-text-dark-grey"><b>���̵�</b></label> <input
									class="w3-input w3-border w3-sand" name="memberno" type="text">
							</p>
							<p>
								<label class="w3-text-dark-grey"><b>��й�ȣ</b></label> <input
									class="w3-input w3-border w3-sand" name="pass" type="password">
							</p>
							<p>
								<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button"
									onclick="location.href='${path }/model2/loginchange/ini.jsp?year=${year }&month=${month}'" value="�ʱ�ȭ"> 
								<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button"
									onclick="location.href='${path }/model2/loginchange/passchange.jsp?year=${year }&month=${month}'" value="����">
								<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="submit"
									value="�α���">
							</p>
						</form>
					</div>
		</div>
      <br>
      
      <!-- Accordion -->
      <div class="w3-card w3-round">
        <div class="w3-white">
         <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>�α���</button>
          <div id="Demo1" class="w3-hide w3-container">
          	<a href="loginForm.me?year=${year }&month=${month}"> �� �α���</a><br>
          	<c:if test="${!empty sessionScope.login }">
          		<a href="logout.me?year=${year }&month=${month}"> �� �α׾ƿ�</a>
          	</c:if>
         </div>
         <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>�Խ���</button>
          <div id="Demo2" class="w3-hide w3-container">
            <a href="javascript:logincheck()"> �� ���� ����</a><br>
            <a href="javascript:logincheck()"> �� �ٹ�</a><br>
            <a href="javascript:logincheck()"> �� �����Խ���</a>
          </div>
         <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>�ּҷ�</button>
          <div id="Demo3" class="w3-hide w3-container">
            <a href="javascript:logincheck()"> �� �� ���� �ּ�</a><br>
            <a href="javascript:logincheck()"> �� �� ���� �ּ�</a><br>
          </div>
         <button onclick="myFunction('Demo5')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>�ڷ��</button>
          <div id="Demo5" class="w3-hide w3-container">
            <a href="javascript:logincheck()"> �� ���� ��� �� ���α׷�</a><br>
          </div>
         <button onclick="myFunction('Demo7')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>��������</button>
          <div id="Demo7" class="w3-hide w3-container">
            <a href="javascript:logincheck()"> �� ����</a>
          </div>
         <button onclick="myFunction('Demo4')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>����</button>
          <div id="Demo4" class="w3-hide w3-container">
            <a href="javascript:logincheck()"> �� ����������</a><br>
            <a href="javascript:logincheck()"> �� ���� ������</a><br>
            <a href="javascript:logincheck()"> �� ���� ������</a>
          </div>
        </div>      
      </div>
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
      
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
      	<div class="w3-content w3-section" style="max-width:100%;max-heigt:100%;">
      		<img class="mySlides w3-animate-fading" src="../../companyimg/company1.jpg" style="height:150px;width:100%">
  			<img class="mySlides w3-animate-fading" src="../../companyimg/company2.jpg" style="height:150px;width:100%">
  			<img class="mySlides w3-animate-fading" src="../../companyimg/company3.jpg" style="height:150px;width:100%">
  			<img class="mySlides w3-animate-fading" src="../../companyimg/company4.jpg" style="height:150px;width:100%">
		</div>
      </div>
      
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
  			<div class="w3-container w3-grey">
				<h2 align="center">${month }��</h2>
  			</div>
  
  			<c:set var="a" value="0"></c:set>
  			<c:set var="doneLoop" value="false"/> 
  			<table class="w3-table-all w3-centered">
				<tr><th>��</th><th>��</th><th>ȭ</th><th>��</th><th>��</th><th>��</th><th>��</th></tr>
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
      	<a href="javascript:logincheck()" class="w3-bar-item w3-button w3-hide-small w3-center w3-hover-white" title="board"  style = "font-size:1;"><i class="fa fa-clone w3-padding-large"></i>��������</a>
      </div>
      <br>
      
      <div class="w3-bar w3-theme-d2 w3-center w3-large w3-hover-white" >
      	<a href="javascript:logincheck()" class="w3-bar-item w3-button w3-hide-small w3-center w3-hover-white" title="messages"  style = "font-size:1;"><i class="fa fa-envelope w3-padding-large"></i>���� ������</a>
      </div>
      <br>
      
      <div class="w3-bar w3-theme-d2 w3-center w3-large w3-hover-white">
      	<a href="javascript:logincheck()" class="w3-bar-item w3-button w3-hide-small w3-center w3-hover-white" title="directory"  style = "font-size:1;"><i class="fa fa-address-card-o w3-padding-large"></i>�� ����ó</a>
      </div>
      <br>
      
      <div class="w3-bar w3-theme-d2 w3-center w3-large w3-hover-white">
      	<a href="javascript:logincheck()" class="w3-bar-item w3-button w3-hide-small w3-center w3-hover-white" title="calendar"  style = "font-size:1;"><i class=" fa fa-calendar w3-padding-large"></i>�� ��</a>
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
//�����̵�
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
	alert("�α����� ���ּ���");
}
</script>
</body>
</html> 
 
 