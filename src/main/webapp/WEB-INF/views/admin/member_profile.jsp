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
		margin-top:100px;
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
	
	section #sta
	{
		cursor:pointer;
		color:red;
		width:100px;
		height:30px;
		border:1px solid black;
		background:white;
		margin:10px;
		padding-top:8px;
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
	
</style>
</head>
<body>
	<section>
	
		<table width="700" border="1" align="center">
			<tr>
				<td>Userid</td>
				<td>${mvo.userid}</td>
				<td rowspan="9" align="center" width="120">
				
				<c:if test="${mvo.state==0}">
					<c:set var="sta1" value="style='display:none;'"/>
				</c:if>
				
				<c:if test="${mvo.state==1}">
					<c:set var="sta2" value="style='display:none;'"/>
				</c:if>
					
				<c:if test="${mvo.state==2}">
					<c:set var="sta3" value="style='display:none;'"/>
				</c:if>
					
				<c:if test="${mvo.state==3}">
					<c:set var="sta4" value="style='display:none;'"/>
				</c:if>
				
				<c:if test="${mvo.state==4}">
					<c:set var="sta5" value="style='display:none;'"/>
				</c:if>
					
					<div onclick="location='member_state?id=${mvo.id}&state=0'" ${sta1} ${sta5} id="sta"> 일반회원 </div>
					<div onclick="location='member_state?id=${mvo.id}&state=1'" ${sta2} ${sta5} id="sta"> 임시정지 </div>
					<div onclick="location='member_state?id=${mvo.id}&state=2'" ${sta3} ${sta5} id="sta"> 영구정지 </div>
					<div onclick="location='member_state?id=${mvo.id}&state=3'" ${sta4} id="sta"> 회원탈퇴 </div>
					
				</td>
			</tr>
			<tr>
				<td>이 름</td>
				<td>${mvo.name}</td>
			</tr>
			<tr>
				<td>Email</td>
				<td>${mvo.email}</td>
			</tr>
			<tr>
				<td>phone</td>
				<td>${mvo.phone}</td>
			</tr>
			<tr>
				<td>총 게시글</td>
				<td>${map.guel}개</td>
			</tr>
			<tr>
				<td>거래완료 글</td>
				<td>${map.panmae_guel}개</td>
			</tr>
			<tr>
				<td>신고받은 횟수</td>
				<td>${mvo.singo_num}회</td>
			</tr>
			<tr>
				<td>가입일</td>
				<td>${mvo.writeday}</td>
			</tr>
			<tr>
				<td>상태</td>
				
				<c:if test="${mvo.state==0}">
					<td> 일반회원 </td>
				</c:if>
					
				<c:if test="${mvo.state==1}">
					<td> 임시정지 </td>
				</c:if>
					
				<c:if test="${mvo.state==2}">
					<td> 영구정지 </td>
				</c:if>
					
				<c:if test="${mvo.state==3}">
					<td> 회원탈퇴 </td>
				</c:if>
				
				<c:if test="${mvo.state==4}">
					<td> 탈퇴신청 </td>
				</c:if>
			</tr>
		</table>
	
		<div align="center">
			<div id="guan"> <a href="../admin/member_manage"> 목 록 </a></div>
			<div id="guan"><a href="../admin/admin_page"> 관리자 페이지 </a></div>
		</div>
	
	</section>
</body>
</html>