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
	    height:800px;
		margin:auto;
		padding-top:10px;
		text-align:center;
	}

	section ul li
	{
		display:inline-block;
		list-style-type:none;
		border:1px solid purple;
		width:150px;
		height:35px;
		text-align:center;
		padding-top:13px;
		margin:15px;
	}
	
	section a
	{
		color:black;
		text-decoration:none;
	}

</style>
</head>
<body>
	<section>
	
	<div id="main">
		<ul>
			<li><a href="../admin/member_manage">회원관리</a></li>
			<li><a href="../admin/singo_manage">신고관리</a></li>
			<li><a href="../admin/event_manage">이벤트 관리</a></li>
			<li><a href="../gongji/gongji">공지사항</a></li>
			<li><a href="../qna/qna">QnA 관리</a></li>
		</ul>
	</div>
	
	</section>
</body>
</html>