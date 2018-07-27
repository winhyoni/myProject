<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>직원 목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<script type="text/javascript">
	function pagego(page) {
		sf.pageNum.value=page;
		sf.submit();
	}
</script>
<form class="w3-container w3-card-4" action="trememplist.me" method="post" name="sf">
	<input type="hidden" name="pageNum" value="1">
	<h3>직원 검색</h3>
	<select class="w3-select" name="column">
		<option value="" disabled selected>선택하세요</option>
		<option value="memberno">사번</option>
		<option value="position">직급</option>
		<option value="name">이름</option>
	</select>
	<script type="text/javascript">
		document.sf.column.value="${param.column}";
	</script>
	<input class="w3-input w3-animate-input" style="width:100%" type="text" name="find" value=${find}>
	<input class="w3-btn w3-blue-grey w3-right" type="submit" value="검색">
</form>
<div class="w3-container" >
  <h2>전 직원 목록</h2>
  <ul class="w3-ul w3-card-4">
  	<c:forEach var="mem" items="${list }">
    <li class="w3-bar">
      <img src="img/${mem.picture}" class="w3-bar-item w3-circle w3-hide-small" style="width:85px; height:85px">
      <div class="w3-bar-item">
        <span class="w3-large">${mem.name }</span><br>
        <span style="width:20px;">${mem.memberno}</span>&nbsp;
        <span style="width:20px;">${mem.dpt}</span>&nbsp;
        <span style="width:20px;">${mem.position}</span>&nbsp;
       	<span style="width:20px;">${mem.tel}</span>&nbsp;
       	<span style="width:20px;">${mem.email}</span>&nbsp;
      </div>
    </li>
    </c:forEach>
  </ul>
  <div class="w3-container w3-center">

	<div class="w3-bar">
		<c:if test="${pageNum<=1 }">
			<a href="#" class="w3-button">&laquo;</a>
		</c:if>
		<c:if test="${pageNum>1 }">
			<a href="javascript:pagego(${pageNum - 1})" class="w3-button">&laquo;</a>
		</c:if>
  		<c:forEach var="a" begin="${startpage}" end="${endpage }">
			<c:if test="${a==pageNum }">
				<a href="#" class="w3-button">${a }</a>
			</c:if>
			<c:if test="${a!=pageNum }">
				<a href="javascript:pagego(${a })" class="w3-button">${a }</a>
			</c:if>
		</c:forEach>
  
  		<c:if test="${pageNum >= maxpage }">
			<a href="#" class="w3-button">&raquo;</a>
		</c:if>
		<c:if test="${pageNum < maxpage }">
			<a href="javascript:pagego(${pageNum+1 })" class="w3-button">&raquo;</a>
		</c:if>
	</div>

  </div>
</div>

</body>
</html>
