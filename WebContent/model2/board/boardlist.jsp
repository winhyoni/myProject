<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<title>�Խù� ���</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<script type="text/javascript">
	function pagego(page) {
		sf.pageNum.value=page;
		sf.submit();
	}
</script>
<form class="w3-container w3-card-4" action="boardlist.me" method="post" name="sf">
	<input type="hidden" name="pageNum" value="1">
	<input type="hidden" name="kindno" value="${kindno }">
	<h3>�Խù� �˻�</h3>
	<select class="w3-select" name="column">
		<option value="" disabled selected>�����ϼ���</option>
		<option value="subject">����</option>
		<option value="content">����</option>
		<option value="name">�ۼ���</option>
	</select>
	<script type="text/javascript">
		document.sf.column.value="${param.column}";
	</script>
	<input class="w3-input w3-animate-input" style="width:100%" type="text" name="find" value="${find}">
	<input class="w3-btn w3-blue-grey w3-right" type="submit" value="�˻�">
</form>
<div class="w3-container">
  <c:if test="${kindno==1 }">
  	<h2>�������� �Խ���</h2>
  </c:if>
  <c:if test="${kindno==2 }">
  	<h2>�� ��</h2>
  </c:if>
  <c:if test="${kindno==3 }">
  	<h2>���� �Խ���</h2>
  </c:if>
  <c:if test="${kindno==4 }">
  	<h2>�ڷ��</h2>
  </c:if>
  <c:if test="${kindno==4 || kindno==1 || kindno==3}">
  <table class="w3-table-all w3-hoverable">
    <thead>
      <tr class="w3-light-grey">
        <th>����</th>
        <th>����</th>
        <th>�ۼ���</th>
        <th>��¥</th>
        <c:if test="${kindno==4}">
        <th>�ٿ�ε�</th>
        </c:if>
        <th>��ȸ��</th>
      </tr>
    </thead>
    <c:forEach var="board" items="${list }">
    <tr>
      <td>${boardnum}</td>
      <c:set var="boardnum" value="${boardnum - 1 }"></c:set>
      <td><a href="boardinfo.me?no=${board.no }&pageNum=${pageNum}&kindno=${board.kindno}">${board.subject}</a></td>
      <td>${board.name}</td>
      <fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" var="regnow"/>
      <td>${regnow}</td>
      <c:if test="${kindno==4}">
      <td><a href="file/${board.file1}" download>�ٿ�ε�</a></td>
      </c:if>
      <td>${board.readcnt}</td>
    </tr>
    </c:forEach>
  </table>
  </c:if>
  
  <c:if test="${kindno==2}">
  <br>
  	 <c:forEach var="board" items="${list }">
  		<div class="w3-third">
    		<div class="w3-card">
    		  <a href="boardinfo.me?no=${board.no }&pageNum=${pageNum}&kindno=${board.kindno}"><img src="file/${board.file1}" style="width:100%;height:100px;"></a>
     		 	<div class="w3-container w3-center">
       		 		<h5>${board.subject}</h5>
      			</div>
    		</div>
  		</div>
  	</c:forEach>
  </c:if>
  
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
  <c:if test="${kindno==1 && sessionScope.login==000000}">
  	<input class="w3-btn w3-blue-grey w3-right" type="button" onclick="location.href='writeboard.jsp?kindno=${kindno}'" value="���">
  </c:if>
  <c:if test="${kindno!=1}">
  	<input class="w3-btn w3-blue-grey w3-right" type="button" onclick="location.href='writeboard.jsp?kindno=${kindno}'" value="���">
  </c:if>
</div>

</body>
</html> 
