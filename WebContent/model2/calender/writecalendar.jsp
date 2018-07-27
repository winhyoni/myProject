<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>일정등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<form class="w3-container w3-card-4" action="writecalendar.me" method="post" name="sf">
	<h3>일정 검색</h3>
	<input type="hidden" name="kindno" value="${param.kindno}">
	<input class="w3-input w3-animate-input" style="width:100%" type="text" name="year" placeholder="등록 할 년도를 입력하세요">
	<select class="w3-select" name="month">
		<option value="" disabled selected>선택하세요</option>
		<option value="01">1월</option>
		<option value="02">2월</option>
		<option value="03">3월</option>
		<option value="04">4월</option>
		<option value="05">5월</option>
		<option value="06">6월</option>
		<option value="07">7월</option>
		<option value="08">8월</option>
		<option value="09">9월</option>
		<option value="10">10월</option>
		<option value="11">11월</option>
		<option value="12">12월</option>
	</select>
	<script type="text/javascript">
		document.sf.month.value="${param.month}";
	</script>
	<select class="w3-select" name="day">
		<option value="" disabled selected>선택하세요</option>
		<option value="1">1일</option>
		<option value="2">2일</option>
		<option value="3">3일</option>
		<option value="4">4일</option>
		<option value="5">5일</option>
		<option value="6">6일</option>
		<option value="7">7일</option>
		<option value="8">8일</option>
		<option value="9">9일</option>
		<option value="10">10일</option>
		<option value="11">11일</option>
		<option value="12">12일</option>
		<option value="13">13일</option>
		<option value="14">14일</option>
		<option value="15">15일</option>
		<option value="16">16일</option>
		<option value="17">17일</option>
		<option value="18">18일</option>
		<option value="19">19일</option>
		<option value="20">20일</option>
		<option value="21">21일</option>
		<option value="22">22일</option>
		<option value="23">23일</option>
		<option value="24">24일</option>
		<option value="25">25일</option>
		<option value="26">26일</option>
		<option value="27">27일</option>
		<option value="28">28일</option>
		<option value="29">29일</option>
		<option value="30">30일</option>
		<option value="31">31일</option>
	</select>
	<script type="text/javascript">
		document.sf.day.value="${param.month}";
	</script>
	
	<p>
		<label class="w3-text-dark-grey"><b>제목</b></label> 
		<input class="w3-input w3-border w3-light-gray" name="subject" type="text">
	</p>
	<p>
		<label class="w3-text-dark-grey"><b>내용</b></label> 
		<textarea class="w3-input w3-border w3-light-gray" rows="20" cols="30" name="content"></textarea>
	</p>
	<input class="w3-btn w3-blue-grey w3-right" type="button" onclick="javascript:writecalendar_submit()" value="등록">
</form>
<script type="text/javascript">
	function writecalendar_submit() {
		if(sf.year.value == ''){
			alert('년도를 입력하세요')
			sf.year.focus();
			return;
		}else if(sf.month.value == ''){
			alert('월을 선택해주세요')
			sf.month.focus();
			return;
		}else if(sf.day.value == ''){
			alert('일을 선택해주세요')
			sf.day.focus();
			return;
		}else if(sf.subject.value == ''){
			alert('제목을 입력하세요')
			sf.subject.focus();
			return;
		}else if(sf.content.value == ''){
			alert('내용을 입력하세요')
			sf.content.focus();
			return;
		}
		sf.submit();//강제로 submit 실행하기
	}
</script>
</body>
</html>