<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<title>일정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<form class="w3-container w3-card-4" action="calender.me" method="post" name="sf">
	<h3>일정 검색</h3>
	<input class="w3-input w3-animate-input" style="width:100%" type="text" name="year" placeholder="년도를 입력하세요" value="${param.year }">
	<select class="w3-select" name="month">
		<option value="" disabled selected>선택하세요</option>
		<option value="1">1월</option>
		<option value="2">2월</option>
		<option value="3">3월</option>
		<option value="4">4월</option>
		<option value="5">5월</option>
		<option value="6">6월</option>
		<option value="7">7월</option>
		<option value="8">8월</option>
		<option value="9">9월</option>
		<option value="10">10월</option>
		<option value="11">11월</option>
		<option value="12">12월</option>
	</select>
	<script type="text/javascript">
		document.sf.month.value="${param.month}";
	</script>
	<input class="w3-btn w3-blue-grey w3-right" type="submit" value="검색">
</form>
<div class="w3-container">
  <h2>일정</h2>
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
  							<a href="calenderinfo.me?no=${calender.no}&year=${year}&month=${month}" style="text-shadow:1px 1px 0 #444"><font size="1">${calender.subject}</a></font>
  						</div>
					</c:if>
  				 	<c:if test="${year==setyear && month==setmonth && a==setday && calender.kindno==2}">
  				 		<div class="w3-container w3-blue">
  				 			<a href="calenderinfo.me?no=${calender.no}&year=${year}&month=${month}" style="text-shadow:1px 1px 0 #444"><font size="1">${calender.subject}</a></font>
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

<br>
<c:if test="${sessionScope.login==000000}">
	<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="location.href='writecalendar.jsp?kindno=1'" value="관리자 등록">
</c:if>

<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="location.href='writecalendar.jsp?kindno=2'" value="개인 일정 등록">

</body>
</html>