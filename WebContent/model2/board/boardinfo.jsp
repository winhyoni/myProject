<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>정보</title>

</head>
<body>
<script type="text/javascript">
  function dispupd(d) {
	  var disp = document.getElementById(d);
	  if (disp.style.display == 'none') {
		  disp.style.display = 'block';
	  } else {
		  disp.style.display = 'none';
	  }
  }
  function replyedisp(d) {
	  var disp = document.getElementById(d);
	  if (disp.style.display == 'none') {
		  disp.style.display = 'block';
	  } else {
		  disp.style.display = 'none';
	  }
  
  }

</script>
<div class="w3-card-4">
	<div class="w3-container w3-grey">
		<c:if test="${kindno==1 }">
			<h2>공지사항 정보</h2>
		</c:if>
		<c:if test="${kindno==2 }">
			<h2>앨범 정보</h2>
		</c:if>
		<c:if test="${kindno==3 }">
			<h2>자유게시판 정보</h2>
		</c:if>
		<c:if test="${kindno==4 }">
  			<h2>자료실 정보</h2>
  		</c:if>
	</div>
		<p>
			<label class="w3-text-dark-grey"><b>제목</b></label> 
			<input class="w3-input w3-border w3-light-gray" name="subject" type="text" value="${board.subject}" readonly="readonly">
		</p>
		<p>
			<label class="w3-text-dark-grey"><b>내용</b></label> 
			<textarea class="w3-input w3-border w3-light-gray" rows="20" cols="60" name="content" readonly="readonly">${board.content}</textarea>
		</p>
		<p>
			<label class="w3-text-dark-grey"><b>첨부파일</b></label> 
			<a class="w3-input w3-border w3-light-gray" href="file/${board.file1}" download>${board.file1}</a>
		</p>
		
		<p>
			<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="location.href='boardlist.me?pageNum=${pageNum}&kindno=${kindno }'" value="목록">
			<c:if test="${kindno==1 && sessionScope.login==000000}">
			<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="location.href='revisionboard.me?no=${board.no}&pageNum=${pageNum}&kindno=${kindno }'" value="수정">
			<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="location.href='deleteboard.me?no=${board.no}&pageNum=${pageNum}&kindno=${kindno }'" value="삭제">
			</c:if>
			<c:if test="${kindno!=1}">
			<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="location.href='revisionboard.me?no=${board.no}&pageNum=${pageNum}&kindno=${kindno }'" value="수정">
			<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="location.href='deleteboard.me?no=${board.no}&pageNum=${pageNum}&kindno=${kindno }'" value="삭제">
			</c:if>
			<br>
			<br>
		</p>
</div>

<div class="w3-container w3-card-4"> 
   <h2>댓글</h2>
   <table class="w3-table-all w3-hoverable">
    <thead>
      <tr class="w3-light-grey" >
        <th width="80" height="20" style="text-align:center;">이름</th>
        <th width="200" height="20" style="text-align:center;">내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
        <th width="80" height="20" style="text-align:center;">날짜</th>
        <th width="50" height="20" >&nbsp;</th>
        <th width="50" height="20" >&nbsp;</th>
        <th width="50" height="20" >&nbsp;</th>
      </tr>
    </thead>
    <c:forEach var="reply" items="${list }"  varStatus="stat">
   	<tr>
      <td width="80" height="20" style="text-align:center;">${reply.name }</td>
      <td width="200" height="20" style="text-align:left;">
      	<c:if test="${reply.reflevel > 0 }">
		<c:forEach begin="1" end="${reply.reflevel }">&nbsp;&nbsp;</c:forEach>
		→
		</c:if>
      	${reply.content }</td>
      <fmt:formatDate value="${reply.regdate}" pattern="MM-dd" var="replynow"/>
      <td width="80" height="20" style="text-align:center;">${replynow}</td>
      <td width="50" height="20" style="text-align:center;"><a href="javascript:dispupd('replyedisp${stat.index}')">답글</a></td>
      <td width="50" height="20" style="text-align:center;"><a href="javascript:dispupd('updatedisp${stat.index}')">수정</a></td>
      <td width="50" height="20" style="text-align:center;"><a href="replydelete.me?replyno=${reply.replyno }&no=${reply.no}&pageNum=${pageNum}&kindno=${kindno}">삭제</a></td>

   <tr>
   <td colspan="6">
   <form method="post" action="updatereply.me">
   <div id="updatedisp${stat.index}" style="display: none" >
   <input type="hidden" name="kindno" value="${kindno}">
   <input type="hidden" name="replyno" value="${reply.replyno}">
   <input type="hidden" name="no" value="${reply.no}">
   <input type="hidden" name="pageNum" value="${pageNum}">
   <textarea class="w3-input w3-border w3-right" rows="1" cols="90" name="updatecontent"></textarea>
   <input class="w3-btn w3-blue-grey w3-right" width="30%" type="submit" value="수정">
   </div>
   </form>
   </td>
   </tr>

   <tr>
   <td colspan="6">
   <form method="post" action="rereply.me">
   <div id="replyedisp${stat.index}" style="display: none"> 
   <input type="hidden" name="kindno" value="${kindno}">
   <input type="hidden" name="replyno" value="${reply.replyno}">
   <input type="hidden" name="no" value="${reply.no}">
   <input type="hidden" name="pageNum" value="${pageNum}">
   <textarea class="w3-input w3-border w3-right" name="recontent" rows="1" cols="90"></textarea>
   <input class="w3-btn w3-blue-grey w3-right" width="30%" type="submit" value="답변">
   </div>
   </form>
   </td>
   </tr>
  
   </c:forEach>
  </table>
</div>
<form class="w3-container w3-card-4" action="replyreg.me" method="post">
  <p>      
  <label class="w3-text-gray"><b>입력하세요</b></label>
   <input type="hidden" name="kindno" value="${kindno}">
  <input type="hidden" name="no" value="${board.no}">
  <input type="hidden" name="pageNum" value="${pageNum}">
  <input class="w3-input w3-border" name="replycontent" type="text">
  </p>
  <p>
  <input class="w3-btn w3-blue-grey w3-right" style="height:10%;width:30%" type="submit" value="댓글 등록">
  </p>
</form>
</body>
</html>