<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="text-align:center;">
	<form method="post" action="event_add_ok" enctype="multipart/form-data"> 
		<input type="text" name="title" placeholder="제목"> <p>		
		<input type="file" name="img">
		<input type="submit" value="추가하기">
	</form>
</div>

</body>
</html>