<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false" isELIgnored="false"%>

<html>
<head>
	<title>依存性の注入</title>
</head>
<body>



<h3>依存性の注入</h3>
<button type="button" onclick="location.href='smoke'">タバコを吸う</button><br>

<h4><c:out value="${smokingMessage}"/></h4><br>

<button type="button" onclick="location.href='./'">灰皿</button>

</body>
</html>
