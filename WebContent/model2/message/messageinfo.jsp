<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>상세정보</title>
</head>
<body>

<div class="w3-card-4">
	<div class="w3-container w3-grey">
		<c:if test="${sort==1 }">
			<h2>보낸쪽지 상세정보</h2>
		</c:if>
		<c:if test="${sort==2 }">
			<h2>받은쪽지 상세정보</h2>
		</c:if>
		
	</div>
						
	<form  class="w3-container"  action="messagedelete.me" method="post" name="f">
		<input type="hidden" name="sort" value="${sort}">
		<input type="hidden" name="no" value="${no}">
		<p>
			<label class="w3-text-dark-grey"><b>받는 사람 사번</b></label> 
			<input class="w3-input w3-border w3-light-gray" name="receivemem" type="text" value="${mes.receivemem }" readonly="readonly">
		</p>
		<p>
			<label class="w3-text-dark-grey"><b>보내는 사람</b></label> 
			<input class="w3-input w3-border w3-light-gray" name="sendmem" type="text" value="${mes.sendmem }" readonly="readonly">
		</p>
		<p>
			<label class="w3-text-dark-grey"><b>제목</b></label> 
			<input class="w3-input w3-border w3-light-gray" name="subject" type="text" value="${mes.subject }" readonly="readonly">
		</p>
		<p>
			<label class="w3-text-dark-grey"><b>내용</b></label> 
			<textarea class="w3-input w3-border w3-light-gray" rows="20" cols="60" name="content" readonly="readonly">${mes.content }</textarea>
		</p>
		<p>
			<label class="w3-text-dark-grey"><b>첨부파일</b></label> 
			<a class="w3-input w3-border w3-light-gray" href="file/${mes.file1}" download>${mes.file1}</a>
		</p>
		<p>
			<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="location.href='messagesendlist.me?sort=${sort}'" value="목록">
			<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="submit" value="삭제">
		</p>
	</form>
</div>

</body>
</html>