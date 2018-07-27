<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>등록</title>
</head>
<body>

<div class="w3-card-4">
	<div class="w3-container w3-grey">
		<c:if test="${param.kindno==1 }">
			<h2>공지사항 등록</h2>
		</c:if>
		<c:if test="${param.kindno==2 }">
			<h2>앨범 등록</h2>
		</c:if>
		<c:if test="${param.kindno==3 }">
			<h2>자유게시판 등록</h2>
		</c:if>
		<c:if test="${param.kindno==4 }">
  			<h2>자료실 정보</h2>
  		</c:if>
	</div>
						
	<form  class="w3-container"  action="writeboard.me" method="post" enctype="multipart/form-data" name="f">
		<input name="kindno" type="hidden" value="${param.kindno }">
		
		<p>
			<label class="w3-text-dark-grey"><b>제목</b></label> 
			<input class="w3-input w3-border w3-light-gray" name="subject" type="text">
		</p>
		<p>
			<label class="w3-text-dark-grey"><b>내용</b></label> 
			<textarea class="w3-input w3-border w3-light-gray" rows="20" cols="60" name="content"></textarea>
		</p>
		<p>
			<label class="w3-text-dark-grey"><b>첨부파일</b></label> 
			<input class="w3-input w3-border w3-light-gray" name="file1" type="file">
		</p>
		<p>
			<c:if test="${param.kindno==1 }">
				<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="javascript:board_submit()" value="공지사항 등록">
			</c:if>
			<c:if test="${param.kindno==2 }">
				<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="javascript:board_submit()" value="앨범 등록">
			</c:if>
			<c:if test="${param.kindno==3 }">
				<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="javascript:board_submit()" value="자유게시판 등록">
			</c:if>
			<c:if test="${param.kindno==4 }">
				<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="javascript:board_submit()" value="자료실 등록">
			</c:if>
		</p>
	</form>
</div>
<script type="text/javascript">
	function board_submit() {
		if(f.subject.value == ''){
			alert('제목을 입력하세요')
			f.subject.focus();
			return;
		}else if(f.content.value == ''){
			alert('내용을 입력하세요')
			f.content.focus();
			return;
		}
		f.submit();//강제로 submit 실행하기
	}
</script>
</body>
</html>