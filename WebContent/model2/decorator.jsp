
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<fmt:requestEncoding value="utf-8"/>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
					url="jdbc:mariadb://localhost:3306/hyoni"
					user="SH" password="1234"/>
<sql:query var="rs" dataSource="${conn }">
	select * from member where memberno=?
	<sql:param>${login}</sql:param>	
</sql:query>
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
<jsp:useBean id="today" class="java.util.Date"></jsp:useBean>
<fmt:formatDate value="${today }" pattern="yyyy" var="year"/>
<fmt:formatDate value="${today }" pattern="MM" var="month"/>
<!-- �ֻ�� �� -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <a href="${path }/model2/main.me?year=${year }&month=${month}" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>ȿ��</a><!-- �ΰ� -->
  <a href="${path }/model2/logout.me?year=${year }&month=${month}" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="login"><i class="fa fa-sign-out">&nbsp;�α׾ƿ�</i></a>
  <a href="${path }/model2/member/empinfo.jsp?year=${year }&month=${month}" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="Account Settings"><i class="fa fa-user">&nbsp;��������</i></a>
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
         <c:forEach var="data" items="${rs.rows }">
         <p class="w3-center"><img src="${path }/model2/member/img/${data.picture }" class="w3-circle" style="width:100px; higth:140px;" alt="��������"></p>
         <hr>
         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> ${data.name }</p>
         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> ${data.dpt}</p>
         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> ${data.jumin.substring(0, 6)}</p>
         </c:forEach>
        </div>
       
      </div>
      
      <br>
      
      <!-- Accordion -->
      <div class="w3-card w3-round">
        <div class="w3-white">
         <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>�α���</button>
          <div id="Demo1" class="w3-hide w3-container">
          	<c:if test="${empty sessionScope.login }">
            	<a href="${path }/model2/login/loginForm.me?year=${year }&month=${month}"> �� �α���</a><br>
            </c:if>
            <a href="${path }/model2/logout.me?year=${year }&month=${month}"> �� �α׾ƿ�</a>
          </div>
         <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>�Խ���</button>
          <div id="Demo2" class="w3-hide w3-container">
            <a href="${path }/model2/board/boardlist.me?kindno=1"> �� ���� ����</a><br>
            <a href="${path }/model2/board/boardlist.me?kindno=2"> �� �ٹ�</a><br>
            <a href="${path }/model2/board/boardlist.me?kindno=3"> �� �����Խ���</a>
          </div>
         <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>�ּҷ�</button>
          <div id="Demo3" class="w3-hide w3-container">
            <a href="${path }/model2/member/emplist.me"> �� �� ���� �ּ�</a><br>
            <a href="${path }/model2/member/trememplist.me"> �� �� ���� �ּ�</a><br>
            <c:if test="${sessionScope.login==000000}">
          		<a href="${path }/model2/member/join.jsp?year=${year }&month=${month}"> �� ���� ���</a><br>
          		<a href="${path }/model2/member/empdelete.jsp?year=${year }&month=${month}"> �� ���� ����</a>
          	</c:if>
          </div>
         <button onclick="myFunction('Demo5')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>�ڷ��</button>
          <div id="Demo5" class="w3-hide w3-container">
            <a href="${path }/model2/board/boardlist.me?kindno=4"> �� ���� ��� �� ���α׷�</a>
          </div>
          
         <button onclick="myFunction('Demo7')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>��������</button>
          <div id="Demo7" class="w3-hide w3-container">
            <a href="${path }/model2/calender/calender.me?year=${year}&month=${month}"> �� ����</a>
          </div>
         <button onclick="myFunction('Demo4')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>����</button>
          <div id="Demo4" class="w3-hide w3-container">
            <a href="${path }/model2/message/messagesend.me?sort=1"> �� ����������</a><br>
            <a href="${path }/model2/message/messagesendlist.me?sort=1"> �� ���� ������</a><br>
            <a href="${path }/model2/message/messagesendlist.me?sort=2"> �� ���� ������</a>
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
      	<a href="${path }/model2/board/boardlist.me?kindno=1" class="w3-bar-item w3-button w3-hide-small w3-center w3-hover-white" title="board"  style = "font-size:1;"><i class="fa fa-clone w3-padding-large"></i>��������</a>
      </div>
      <br>
      
      <div class="w3-bar w3-theme-d2 w3-center w3-large w3-hover-white" >
      	<a href="${path }/model2/message/messagesend.me?sort=1" class="w3-bar-item w3-button w3-hide-small w3-center w3-hover-white" title="messages"  style = "font-size:1;"><i class="fa fa-envelope w3-padding-large"></i>���� ������</a>
      </div>
      <br>
      
      <div class="w3-bar w3-theme-d2 w3-center w3-large w3-hover-white">
      	<a href="${path }/model2/member/trememplist.me" class="w3-bar-item w3-button w3-hide-small w3-center w3-hover-white" title="directory"  style = "font-size:1;"><i class="fa fa-address-card-o w3-padding-large"></i>�� ����ó</a>
      </div>
      <br>
      
      <div class="w3-bar w3-theme-d2 w3-center w3-large w3-hover-white">
      	<a href="${path }/model2/calender/calender.me?year=${year}&month=${month}" class="w3-bar-item w3-button w3-hide-small w3-center w3-hover-white" title="calendar"  style = "font-size:1;"><i class=" fa fa-calendar w3-padding-large"></i>�� ��</a>
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
</script>
</body>
</html> 
