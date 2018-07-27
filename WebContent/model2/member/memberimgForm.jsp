<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>사진등록</title>
</head>
<body>
<div class="w3-card-4">
						<div class="w3-container w3-blue-grey">
							<h2>사진등록</h2>
						</div>
						<form  class="w3-container"  action="memberimg.me" method="post" enctype = "multipart/form-data">
							<input class="w3-button w3-dark-grey w3-round-xxlarge" type="file" name="picture">
							<input class="w3-button w3-dark-grey w3-round-xxlarge" type= "submit" value="사진등록">
						</form>
</div>
</body>
</html>