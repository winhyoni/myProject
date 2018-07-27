<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<title>보낸 쪽지함</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<script type="text/javascript">
	function pagego(page) {
		sf.pageNum.value=page;
		sf.submit();
	}
</script>
<form class="w3-container w3-card-4" action="messagesendlist.me" method="post" name="sf">
	<input type="hidden" name="pageNum" value="1">
	<input type="hidden" name="sort" value="${sort }">
	<c:if test="${sort==1 }">
		<h3>보낸 쪽지 검색</h3>
	</c:if>
	<c:if test="${sort==2 }">
		<h3>받은 쪽지 검색</h3>
	</c:if>
	<select class="w3-select" name="column">
		<option value="" disabled selected>선택하세요</option>
		<option value="subject">제목</option>
		<option value="content">내용</option>
		<c:if test="${sort==1 }">
		<option value="receivemem">받은 사람</option>
		</c:if>
		<c:if test="${sort==2 }">
		<option value="sendmem">보낸 사람</option>
		</c:if>
	</select>
	<script type="text/javascript">
		document.sf.column.value="${param.column}";
	</script>
	<input class="w3-input w3-animate-input" style="width:100%" type="text" name="find" value="${find}">
	<input class="w3-btn w3-blue-grey w3-right" type="submit" value="검색">
</form>
<div class="w3-container">
	<c:if test="${sort==1 }">
		<h2>보낸 쪽지함</h2>
	</c:if>
	<c:if test="${sort==2 }">
		<h2>받은 쪽지함</h2>
	</c:if>  
  <table class="w3-table-all w3-hoverable">
    <thead>
      <tr class="w3-light-grey">
        <th>순서</th>
        <th>제목</th>
        <th>내용</th>
        <th>날짜</th>
        <th>열람여부</th>
      </tr>
    </thead>
    <c:forEach var="mes" items="${list }">
    <tr>
      <td align="center">${sendmesnum}</td>
      <c:set var="sendmesnum" value="${sendmesnum - 1 }"></c:set>
      <td align="center"><a href="messageinfo.me?sort=${sort}&no=${mes.no}">${mes.subject}</a></td>
      <td align="center">${mes.content}</td>
      <fmt:formatDate value="${mes.regdate}" pattern="yyyy-MM-dd" var="regnow"/>
      <td align="center">${regnow}</td>
      <c:if test="${mes.kindno==0}">
      		<td align="center">X</td>
      </c:if>
      <c:if test="${mes.kindno==1}">
      		<td align="center">O</td>
      </c:if>
    </tr>
    </c:forEach>
  </table>
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
  	<input class="w3-btn w3-blue-grey w3-right" type="button" onclick="location.href='messagesend.me?sort=1'" value="쪽지 보내기">
  </div>

</body>
</html> 
