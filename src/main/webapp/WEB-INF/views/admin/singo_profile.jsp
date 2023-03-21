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
	}
	
	section table
	{
		margin-top:70px;
	}
	
	section tr
	{
		text-align:center;
	}
	
	section tr td:first-child
	{
		width:120px;
	}
	
	section tr
	{
		height:30px;
	}
	
	section #guan
	{
		width:120px;
		height:30px;
		border:1px solid purple;
		margin-top:50px;
		margin-left:10px;
		padding-top:9px;
		text-align:center;
		display:inline-block;
	}
	
	section a
	{
		text-decoration:none;
		color:black;
	}
	
	section #singo
	{
		cursor:pointer;
		color:red;
		width:100px;
		height:30px;
		background:white;
		margin:10px;
		padding-top:3px;
		display:inline-block;
	}
</style>
</head>
<body>
	<section>
	
		<table width="700" border="1" align="center">
			<tr>
				<td>신고자</td>
				<td>${svo.userid}</td>
			</tr>
			<tr>
				<td>신고 대상자</td>
				<td>${svo.singo_userid}</td>
			</tr>
			<tr>
				<td height="200">신고 내용</td>
				<td>${svo.content}</td>
			</tr>
			<tr>
				<td>신고 날짜</td>
				<td>${svo.writeday}</td>
			</tr>
			<tr>
				<td height="40">신고 게시글</td>
				<td><a href="../panmae/pcontent?pcode=${pcode}" style="color:blue; font-size:14px; font-weight:600;"> 클릭 </a></td>
			</tr>
			<tr>
				<td> 비고 </td>
				<td>
				
					<c:if test="${svo.state==0}">
						<div id="singo" onclick="location='singo_up?id=${svo.id}&panmae_id=${svo.panmae_id}&singo_userid=${svo.singo_userid}'"> 신고처리 </div>
						<div id="singo" onclick="location='singo_del?id=${svo.id}'"> 신고취소 </div>
					</c:if>
					
					<c:if test="${svo.state==1}">
						<div id="singo" style="cursor:default;"> 처리완료 </div>
						
						<c:if test="${state==3}">
							| <div id="singo" onclick="location='singo_del?id=${svo.id}'"> 삭제 </div>
						</c:if>
						
					</c:if>
					
				</td>
			</tr>
			
		</table>
	
		<div align="center">
			<div id="guan"> <a href="../admin/singo_manage"> 목 록 </a></div>
		</div>
	
	</section>
</body>
</html>