<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<title>�������</title>
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
<h2 class="w3-center">���� ���</h2>

<div class="w3-row w3-section">
	<div class="w3-container w3-center">
  			<img src="" class="w3-round w3-center" alt="��������" style="width:100px; higth:140px;" id="pic">
	</div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="memberno" type="text" placeholder="�����ȣ">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="name" type="text" placeholder="�̸�">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="jumin" type="text" placeholder="�ֹι�ȣ">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="pass" type="text" placeholder="��й�ȣ">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="tel" type="text" placeholder="��ȭ��ȣ">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="email" type="text" placeholder="�̸���">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="gender" type="text" placeholder="����">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="dpt" type="text" placeholder="�μ�">
    </div>
</div>

<div class="w3-row w3-section">
    <div class="w3-rest">
      <input class="w3-input w3-border" name="position" type="text" placeholder="����">
    </div>
</div>

<input type="hidden" name="picture" value="">

<input class="w3-btn w3-blue-grey w3-right" type="button" onclick="javascript:join_submit()" value="���">
<input class="w3-btn w3-blue-grey w3-right" type="reset" value="�ٽ��ۼ�">
<input class="w3-btn w3-blue-grey w3-right" type="button" onclick="javascript:win_open()" value="�������">
</form>
<script type="text/javascript">
	function win_open() {
		var op = "width=500, height=200, scrollbars=yes, left=50, top=150";
		open("memberimgForm.jsp", "picture", op);
	}
	
	function join_submit() {
		if(f.memberno.value == ''){
			alert('����� �Է��ϼ���')
			f.memberno.focus();
			return;
		}else if(f.name.value == ''){
			alert('�̸��� �Է��ϼ���')
			f.name.focus();
			return;
		}else if(f.jumin.value == ''){
			alert('�ֹι�ȣ�� �Է��ϼ���')
			f.jumin.focus();
			return;
		}else if(f.pass.value == ''){
			alert('��й�ȣ�� �Է��ϼ���')
			f.pass.focus();
			return;
		}else if(f.tel.value == ''){
			alert('��ȭ��ȣ�� �Է��ϼ���')
			f.tel.focus();
			return;
		}else if(f.email.value == ''){
			alert('������ �Է��ϼ���')
			f.email.focus();
			return;
		}else if(f.gender.value == ''){
			alert('������ �Է��ϼ���')
			f.gender.focus();
			return;
		}else if(f.dpt.value == ''){
			alert('�μ��� �Է��ϼ���')
			f.dpt.focus();
			return;
		}else if(f.position.value == ''){
			alert('������ �Է��ϼ���')
			f.position.focus();
			return;
		}
		f.submit();//������ submit �����ϱ�
	}
</script>
</body>
</html> 
