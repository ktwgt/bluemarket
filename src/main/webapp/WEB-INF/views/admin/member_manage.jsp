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
	
	section #page
	{
		cursor:pointer;
	}
	
	section #prev
	{
		margin-right:15px;
	}
	
	section #back
	{
		margin-left:15px;
	}
	
	section #search
	{
		padding-bottom:20px;
	}

	section select
	{
		padding-top:4px;
		padding-bottom:2px;
	}
	
	section input[type=text]
	{
		padding-top:4px;
		padding-bottom:2px;
	}
	
	section input[type=submit]
	{
		height:25px;
	}
	
	section #guan
	{
		width:120px;
		height:30px;
		border:1px solid purple;
		margin-top:50px;
		padding-top:9px;
		text-align:center;
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
	
	<div align="center"><h3><a href="../admin/member_manage"> 회원 관리 </a></h3></div>
		<table width="700" border="1" align="center">
			<caption id="search">
				<form method="post" action="member_manage">
					<input type="hidden" name="clk" value="1">
					<select name="where">
						<option value="userid">userid</option>
						<option value="name">이름</option>
					</select>
					<input type="text" name="search" placeholder="검색어 입력">
					<input type="submit" value="검색">
				</form>
			</caption>
			<tr align="center">
				<td> UserId </td>
				<td> 이 름 </td>
				<td width="170"> 상 태 </td>
				<td width="100"> 관 리 </td>
			</tr>
			<c:forEach items="${mlist}" var="mvo">
			<c:if test="${mlist.size()==null}">
				<td colspan="4">회원이 없습니다.</td>
			</c:if>
			<c:if test="${mvo.userid!=admin}">
			
				<tr align="center" height="35">
					<td>${mvo.userid}</td>
					<td>${mvo.name}</td>
					
					<c:if test="${mvo.state==0}">
						<td> 일반회원 </td>
					</c:if>
					
					<c:if test="${mvo.state==1}">	<!-- 신고 받은 회원을 먼저 거래정지를 시켜놓음 -->
						<td> 임시정지 </td>
					</c:if>
					
					<c:if test="${mvo.state==2}">	<!-- 신고 사실이 확인될 경우 영구정지를 시켜 앞으로 활동하지 못하고 다시 가입하지 못하게 함 -->
						<td> 영구정지 </td>
					</c:if>
					
					<c:if test="${mvo.state==3}">
						<td> 회원탈퇴 </td>
					</c:if>
					
					<c:if test="${mvo.state==4}">
						<td> 탈퇴신청 </td>
					</c:if>
					
					<td> <a href="../admin/member_profile?id=${mvo.id}" style="color:blue; font-size:14px; font-weight:600;"> 클릭 </a></td>
				</tr>
				
			</c:if>
			
			</c:forEach>
			
			
			<c:if test="${clk!=null}">
				<c:set var="clk_evt" value="&clk=1"/>
			</c:if>


				<tr>
					<td colspan="5" align="center">
					<c:if test="${pstart!=1 and pstart!=null}">
						<span onclick="location='../admin/member_manage?page=${pstart-1}&where=${where}&search=${search}${clk_evt}'" style="cursor:pointer;"> ◀ </span>
					</c:if>
						
					<c:if test="${page!=1 and page!=unll}">
						<span onclick="location='../admin/member_manage?page=${page-1}&where=${where}&search=${search}${clk_evt}'" id="prev" style="cursor:pointer;"> < </span>
					</c:if>
					
					
					<c:forEach begin="${pstart}" end="${pend}" var="i">
					
						<c:if test="${page==i}">
							<c:set var="page_color" value="style='color:red;'"/>
						</c:if>
						<c:if test="${page!=i}">
							<c:set var="page_color" value=""></c:set>
						</c:if>
						
						<c:if test="${page!=null}">
						 <span id="page" ${page_color} onclick="location='../admin/member_manage?page=${i}&where=${where}&search=${search}${clk_evt}'">${i}</span>
						</c:if>
						
						<c:if test="${page==null}">
							<span style="color:red;">1</span>
						</c:if>
						
					</c:forEach>
		
					
					<c:if test="${page!=chong}">
						<span onclick="location='../admin/member_manage?page=${page+1}&where=${where}&search=${search}${clk_evt}'" id="back" style="cursor:pointer;"> > </span>
					</c:if>
					
					<c:if test="${!(pend>=chong)}">
						<span onclick="location='../admin/member_manage?page=${pend+1}&where=${where}&search=${search}${clk_evt}'" style="cursor:pointer;"> ▶ </span>
					</c:if>

					</td>
				</tr>
		</table>
		
		<div align="center">
			<div id="guan"><a href="../admin/admin_page"> 관리자 페이지 </a></div>
		</div>
		
	</section>
</body>
</html>




