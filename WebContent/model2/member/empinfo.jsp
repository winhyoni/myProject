<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<title>정보수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body>

<form action="empinfo.me" class="w3-container w3-card-4 w3-light-grey w3-text-dark-grey w3-margin"
	  method="post" name="f">
<input type="hidden" name="year" value="${param.year }">
<input type="hidden" name="month" value="${param.month }">
<h2 class="w3-center">정보수정</h2>
<c:forEach var="data" items="${rs.rows }">
<div class="w3-row w3-section">
	<div class="w3-container w3-center">
  			<img src="${path }/model2/member/img/${data.picture }" class="w3-round w3-center" alt="사진없음" style="width:100px; higth:140px;" id="pic">
	</div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="memberno" type="text" value="${data.memberno }" readonly>
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="name" type="text" value="${data.name }">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="jumin" type="text" value="${data.jumin }">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="pass" type="text" value="${data.pass}">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="tel" type="text" value="${data.tel }">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="email" type="text" value="${data.email }">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="gender" type="text" value="${data.gender }">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="dpt" type="text" value="${data.dpt }">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="position" type="text" value="${data.position }">
    </div>
</div>


<input type="hidden" name="picture" value="${data.picture }">
</c:forEach>
<input class="w3-btn w3-blue-grey w3-right" type="submit" value="수정">
<input class="w3-btn w3-blue-grey w3-right" type="button" onclick="location.href='${path }/model2/main.me?year=${param.year }&month=${param.month}'" value="취소">
<input class="w3-btn w3-blue-grey w3-right" type="button" onclick="javacript:win_open()" value="사진등록">
</form>
<script type="text/javascript">
	function win_open() {
		var op = "width=500, height=200, scrollbars=yes, left=50, top=150";
		open("memberimgForm.jsp", "picture", op);
	}
</script>
</body>
</html> 
