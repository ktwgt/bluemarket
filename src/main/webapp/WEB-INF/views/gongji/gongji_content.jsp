<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

	section
	{
		width:1000px;
		margin:auto;
		padding-top:50px;
	}
	
	section tr
	{
		text-align:center;
	}
	
	section #imsi
	{
		margin-top:30px;
	}
	
	section #guan
	{
		width:120px;
		height:30px;
		background:#4776b4;
		color:white;
		padding-top:9px;
		text-align:center;
		display:inline-block;
		margin:15px;
	}
	#guan a {
		color:white;
		text-decoration:none;
	}
	
	
	section #gongji_content
	{
		vertical-align:top;
		text-align:left;
		/* padding-top:15px;
		padding-bottom:15px;
		padding-left:15px;
		padding-right:15px; */
		padding:15px;
	}
	#table {
		border-collapse:collapse;
		position:relative;
		border-top:2px solid black;
		top:-50px;
	}
	#table tr, td {
		border-bottom:1px solid #eeeeee;
	}
	h3 {
		position:relative;
		display:inline-block;
		font-size:25px;
		font-weight:500; 
		left:450px;
		top:-50px; 
	}

</style>
</head>
<body>
	<section>
		<h3 align="center">공지사항</h3>
		<table align="center" id="table">
			<tr>
				<td height="35" width="110" style="background:#dcf5f9;">제 목</td>
				<td colspan="3" width="800" align="left" style="padding-left:5px;">
					<c:if test="${gvo.important==1}">
						<span style="color:#ff4400; font-size:16px;">[중요]</span>
					</c:if>
					${gvo.title}
				</td>
			</tr>
			<tr>
				<td height="35" style="background:#e8eff7;">조회수</td>
				<td width="250" align="left" style="padding-left:5px;">${gvo.readnum}</td>
		    </tr>
		    <tr>
				<td height="35" style="background:#e8eff7;">작성일</td>
				<td width="250" align="left" style="padding-left:5px;">${gvo.writeday}</td>
			</tr>
			<tr>
				<td colspan="3" id="gongji_content">${gvo.content}</td>
			</tr>
		</table>
	
		<div align="center" id="imsi">
			<div id="guan"> <a href="../gongji/gongji?page=${page}"> 목 록 </a></div>
			
			<c:if test="${userid=='admin'}">
				<div id="guan"> <a href="../gongji/gongji_update?id=${gvo.id}&page=${page}"> 수 정 </a></div>
				<div id="guan"> <a href="../gongji/gongji_delete?id=${gvo.id}&page=${page}"> 삭 제 </a></div>
			</c:if>
			
		</div>
	
	</section>
</body>
</html>