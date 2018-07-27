<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>����������</title>
</head>
<body>

<div class="w3-card-4">
	<div class="w3-container w3-grey">
		<h2>���� ������</h2>
	</div>
						
	<form  class="w3-container"  action="messagesendreg.me" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="sort" value="${sort}">
		<p>
			<label class="w3-text-dark-grey"><b>�޴� ��� ���</b></label> 
			<input class="w3-input w3-border w3-light-gray" name="receivemem" type="text">
		</p>
		<p>
			<label class="w3-text-dark-grey"><b>������ ���</b></label> 
			<input class="w3-input w3-border w3-light-gray" name="sendmem" type="text" value="${mem.memberno }" readonly="readonly">
		</p>
		<p>
			<label class="w3-text-dark-grey"><b>����</b></label> 
			<input class="w3-input w3-border w3-light-gray" name="subject" type="text">
		</p>
		<p>
			<label class="w3-text-dark-grey"><b>����</b></label> 
			<textarea class="w3-input w3-border w3-light-gray" rows="20" cols="60" name="content"></textarea>
		</p>
		<p>
			<label class="w3-text-dark-grey"><b>÷������</b></label> 
			<input class="w3-input w3-border w3-light-gray" name="file1" type="file">
		</p>
		<p>
			<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="button" onclick="javascript:message_submit()" value="������">
		</p>
	</form>
</div>
<script type="text/javascript">
	function message_submit() {
		if(f.receivemem.value == ''){
			alert('�޴� ��� ����� �Է��ϼ���')
			f.receivemem.focus();
			return;
		}else if(f.subject.value == ''){
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
</script>
</body>
</html>