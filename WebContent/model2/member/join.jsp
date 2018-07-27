<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<title>직원등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body>

<form action="join.me" class="w3-container w3-card-4 w3-light-grey w3-text-dark-grey w3-margin"
	  method="post" name="f">
<input type="hidden" name="year" value="${param.year}">
<input type="hidden" name="month" value="${param.month}">
<script type="text/javascript">
	console.log("${param.year}");
</script>
<h2 class="w3-center">직원 등록</h2>

<div class="w3-row w3-section">
	<div class="w3-container w3-center">
  			<img src="" class="w3-round w3-center" alt="사진없음" style="width:100px; higth:140px;" id="pic">
	</div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="memberno" type="text" placeholder="사원번호">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="name" type="text" placeholder="이름">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="jumin" type="text" placeholder="주민번호">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="pass" type="text" placeholder="비밀번호">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="tel" type="text" placeholder="전화번호">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="email" type="text" placeholder="이메일">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="gender" type="text" placeholder="성별">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="dpt" type="text" placeholder="부서">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="position" type="text" placeholder="직급">
    </div>
</div>

<input type="hidden" name="picture" value="">

<input class="w3-btn w3-blue-grey w3-right" type="button" onclick="javascript:join_submit()" value="등록">
<input class="w3-btn w3-blue-grey w3-right" type="reset" value="다시작성">
<input class="w3-btn w3-blue-grey w3-right" type="button" onclick="javascript:win_open()" value="사진등록">
</form>
<script type="text/javascript">
	function win_open() {
		var op = "width=500, height=200, scrollbars=yes, left=50, top=150";
		open("memberimgForm.jsp", "picture", op);
	}
	
	function join_submit() {
		if(f.memberno.value == ''){
			alert('사번을 입력하세요')
			f.memberno.focus();
			return;
		}else if(f.name.value == ''){
			alert('이름을 입력하세요')
			f.name.focus();
			return;
		}else if(f.jumin.value == ''){
			alert('주민번호를 입력하세요')
			f.jumin.focus();
			return;
		}else if(f.pass.value == ''){
			alert('비밀번호를 입력하세요')
			f.pass.focus();
			return;
		}else if(f.tel.value == ''){
			alert('전화번호를 입력하세요')
			f.tel.focus();
			return;
		}else if(f.email.value == ''){
			alert('메일을 입력하세요')
			f.email.focus();
			return;
		}else if(f.gender.value == ''){
			alert('성별을 입력하세요')
			f.gender.focus();
			return;
		}else if(f.dpt.value == ''){
			alert('부서를 입력하세요')
			f.dpt.focus();
			return;
		}else if(f.position.value == ''){
			alert('직급을 입력하세요')
			f.position.focus();
			return;
		}
		f.submit();//강제로 submit 실행하기
	}
</script>
</body>
</html> 
