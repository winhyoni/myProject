<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>비밀번호 번경</title>
</head>
<body>
<div class="w3-card-4">
						<div class="w3-container w3-blue-grey">
							<h2>비밀번호번경</h2>
						</div>
						
						<form  class="w3-container"  action="passchange.me" method="post">
							<input type="hidden" name="year" value="${param.year }">
							<input type="hidden" name="month" value="${param.month }">
							<p>
								<label class="w3-text-dark-grey"><b>사원번호</b></label> <input
									class="w3-input w3-border w3-sand" name="memberno" type="text">
							</p>
							<p>
								<label class="w3-text-dark-grey"><b>비밀번호</b></label> <input
									class="w3-input w3-border w3-sand" name="pass" type="password">
							</p>
							<p>
								<input class="w3-btn w3-blue-grey w3-right" style="height:20%;width:30%" type="submit"
									value="확인">
							</p>
						</form>
					</div>
</body>
</html>