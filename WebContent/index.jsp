<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="today" class="java.util.Date"></jsp:useBean>
<fmt:formatDate value="${today }" pattern="yyyy" var="year"/>
<fmt:formatDate value="${today }" pattern="MM" var="month"/>
<script>
   location.href="model2/login/loginForm.me?year=${year}&month=${month}";
</script>
