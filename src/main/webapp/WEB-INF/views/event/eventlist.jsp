<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:1000px;
		margin:auto;
	}
</style>
</head>
<body>
	<section>
	
		<c:forEach items="${elist}" var="evo">
			<img src="../resources/event/${evo.img}" width="1000" height="310">
		</c:forEach>
	
	
		<!-- <img src="../resources/main/1.jpg" width="1000" height="310">
		<img src="../resources/main/2.jpg" width="1000" height="310">
		<img src="../resources/main/3.jpg" width="1000" height="310">
		<img src="../resources/main/4.jpg" width="1000" height="310">
		<img src="../resources/main/5.jpg" width="1000" height="310"> -->
	</section>
</body>
</html>