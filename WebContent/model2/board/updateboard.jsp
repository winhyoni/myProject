<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>����</title>
</head>
<body>

<div class="w3-card-4">
	<div class="w3-container w3-grey">
		<c:if test="${kindno==1 }">
			<h2>�������� ����</h2>
		</c:if>
		<c:if test="${kindno==1 }">
			<h2>�ٹ� ����</h2>
		</c:if>
		<c:if test="${kindno==3 }">
			<h2>�����Խ��� ����</h2>
		</c:if>
		<c:if test="${kindno==4 }">
  			<h2>�ڷ�� ����</h2>
  		</c:if>
	</div>
						
	<form  class="w3-container"  action="updateboardreg.me" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="no" value="${board.no}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="file2" value="${board.file1}">
		<input type="hidden" name="kindno" value="${kindno}">
		<p>
			<label class="w3-text-dark-grey"><b>����</b></label> 
			<input class="w3-input w3-border w3-light-gray" name="subject" type="text" value="${board.subject }">
		</p>
		<p>
			<label class="w3-text-dark-grey"><b>����</b></label> 
			<textarea class="w3-input w3-border w3-light-gray" rows="20" cols="60" name="content">${board.content }</textarea>
		</p>
		
		<p>
			<label class="w3-text-dark-grey"><b>÷������</b></label>
			<c:if test="${!empty board.file1 }">
			<div id="file_desc" class="w3-input w3-border w3-light-gray">
				<a href="file/${board.file1}">${board.file1}</a>
				<a href="javascript:file_delete()">[÷�����ϻ���]</a>
			</div>
			<br>
			</c:if>
			<input class="w3-input w3-border w3-light-gray" name="file1" type="file">		
		</p>
		<p>
			<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="javascript:board_submit()" value="�������� ����">
		</p>
	</form>
</div>
<script type="text/javascript">
	function board_submit() {
		if(f.subject.value == ''){
			alert('������ �Է��ϼ���')
			f.subject.focus();
			return;
		}else if(f.content.value == ''){
			alert('������ �Է��ϼ���')
			f.content.focus();
			return;
		}
		f.submit();//������ submit �����ϱ�
	}
	function file_delete() {
		f.file2.value="";
		file_desc.style.display="none";
	}
</script>
</body>
</html>