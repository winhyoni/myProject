<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>�������</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<form class="w3-container w3-card-4" action="writecalendar.me" method="post" name="sf">
	<h3>���� �˻�</h3>
	<input type="hidden" name="kindno" value="${param.kindno}">
	<input class="w3-input w3-animate-input" style="width:100%" type="text" name="year" placeholder="��� �� �⵵�� �Է��ϼ���">
	<select class="w3-select" name="month">
		<option value="" disabled selected>�����ϼ���</option>
		<option value="01">1��</option>
		<option value="02">2��</option>
		<option value="03">3��</option>
		<option value="04">4��</option>
		<option value="05">5��</option>
		<option value="06">6��</option>
		<option value="07">7��</option>
		<option value="08">8��</option>
		<option value="09">9��</option>
		<option value="10">10��</option>
		<option value="11">11��</option>
		<option value="12">12��</option>
	</select>
	<script type="text/javascript">
		document.sf.month.value="${param.month}";
	</script>
	<select class="w3-select" name="day">
		<option value="" disabled selected>�����ϼ���</option>
		<option value="1">1��</option>
		<option value="2">2��</option>
		<option value="3">3��</option>
		<option value="4">4��</option>
		<option value="5">5��</option>
		<option value="6">6��</option>
		<option value="7">7��</option>
		<option value="8">8��</option>
		<option value="9">9��</option>
		<option value="10">10��</option>
		<option value="11">11��</option>
		<option value="12">12��</option>
		<option value="13">13��</option>
		<option value="14">14��</option>
		<option value="15">15��</option>
		<option value="16">16��</option>
		<option value="17">17��</option>
		<option value="18">18��</option>
		<option value="19">19��</option>
		<option value="20">20��</option>
		<option value="21">21��</option>
		<option value="22">22��</option>
		<option value="23">23��</option>
		<option value="24">24��</option>
		<option value="25">25��</option>
		<option value="26">26��</option>
		<option value="27">27��</option>
		<option value="28">28��</option>
		<option value="29">29��</option>
		<option value="30">30��</option>
		<option value="31">31��</option>
	</select>
	<script type="text/javascript">
		document.sf.day.value="${param.month}";
	</script>
	
	<p>
		<label class="w3-text-dark-grey"><b>����</b></label> 
		<input class="w3-input w3-border w3-light-gray" name="subject" type="text">
	</p>
	<p>
		<label class="w3-text-dark-grey"><b>����</b></label> 
		<textarea class="w3-input w3-border w3-light-gray" rows="20" cols="30" name="content"></textarea>
	</p>
	<input class="w3-btn w3-blue-grey w3-right" type="button" onclick="javascript:writecalendar_submit()" value="���">
</form>
<script type="text/javascript">
	function writecalendar_submit() {
		if(sf.year.value == ''){
			alert('�⵵�� �Է��ϼ���')
			sf.year.focus();
			return;
		}else if(sf.month.value == ''){
			alert('���� �������ּ���')
			sf.month.focus();
			return;
		}else if(sf.day.value == ''){
			alert('���� �������ּ���')
			sf.day.focus();
			return;
		}else if(sf.subject.value == ''){
			alert('������ �Է��ϼ���')
			sf.subject.focus();
			return;
		}else if(sf.content.value == ''){
			alert('������ �Է��ϼ���')
			sf.content.focus();
			return;
		}
		sf.submit();//������ submit �����ϱ�
	}
</script>
</body>
</html>