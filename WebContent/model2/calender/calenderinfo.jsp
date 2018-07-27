<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>정보보기</title>
</head>
<body>
<div class="w3-card-4">
	<div class="w3-container w3-grey">
		<c:if test="${cal.kindno==1 }">
			<h2>회사 일정 보기</h2>
		</c:if>
		<c:if test="${cal.kindno==2 }">
			<h2>개인 일정 보기</h2>
		</c:if>
		
	</div>
						
	<form  class="w3-container">
		<%-- <input name="year" type="hidden" value="${year }">
		<input name="month" type="hidden" value="${month }">
		<input name="kindno" type="hidden" value="${cal.kindno }"> --%>
		<p>
			<label class="w3-text-dark-grey"><b>제목</b></label> 
			<input class="w3-input w3-border w3-light-gray" name="subject" type="text" value="${cal.subject }" readonly="readonly">
		</p>
		<p>
			<label class="w3-text-dark-grey"><b>날짜</b></label> 
			<fmt:formatDate value="${cal.regdate}" pattern="yyyy-MM-dd" var="result"/>
			<input class="w3-input w3-border w3-light-gray" name="regdate" type="text" value="${result} " readonly="readonly">
		</p>
		<p>
			<label class="w3-text-dark-grey"><b>내용</b></label> 
			<textarea class="w3-input w3-border w3-light-gray" rows="20" cols="60" name="content" readonly="readonly">${cal.content }</textarea>
		</p>
		
		<p>
			<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="location.href='calender.me?year=${year}&month=${month }'" value="목록">
			
			<c:if test="${cal.kindno==1 && sessionScope.login=='000000'}">
				<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="location.href='calenderchange.me?kindno=${cal.kindno}&no=${cal.no }'" value="회사 일정 수정">
				<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="location.href='calenderdelete.me?no=${cal.no}&year=${year}&month=${month}'" value="회사 일정 삭제">
			</c:if>
			
			<c:if test="${cal.kindno==2 }">
				<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="location.href='calenderchange.me?kindno=${cal.kindno}&no=${cal.no }'" value="개인 일정 수정">
				<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="location.href='calenderdelete.me?no=${cal.no}&year=${year}&month=${month}'" value="개인 일정 삭제">
			</c:if>
			
		</p>
	</form>
</div>
</body>
</html>