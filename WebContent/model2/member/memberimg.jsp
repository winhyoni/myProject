<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	img=opener.document.getElementById("pic");
	img.src="img/${filename}";
	opener.document.f.picture.value="${filename}";
	self.close();
</script>