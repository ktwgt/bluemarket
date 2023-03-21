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
	    height:800px;
		margin:auto;
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
	
	section #singo_table_state
	{
		margin-bottom:5px;
	}
</style>

<script>

	window.onload=function singo_table_state2()		// select 태그를 model을 이용해 받아와서 넘겨준다.
	{
		var singo_table_state2=${singo_table_state};
		
		if(singo_table_state2!=null)
			document.getElementById("singo_table_state").value=singo_table_state2;
//		alert(document.getElementById("singo_table_state").value);
//		alert();
	}

	function singo_table_state()					// select 태그가 변경될 때 location한다.
	{
		var singo_table_state=document.getElementById("singo_table_state").value;
//		alert(singo_table_state);

		location="singo_manage?singo_table_state="+singo_table_state;
	}
	


</script>


</head>
<body>
	<section>		
	
		<!-- ///////////////////////////////////////////// -->
		<!-- 신고 접수할 때 영구정지, 회원탈퇴 상태인 상대에게는 신고 기능 비활성화 필요함 -->
		
		
	<div align="center"><h3> 신고 관리 </h3></div>
	
		<select name="singo_table_state" id="singo_table_state" onchange="singo_table_state()">
			<option value="0">모두</option>
			<option value="1">처리전</option>
			<option value="2">처리완료</option>
		</select>
		<table width="1000" border="1" align="center">
			<tr align="center">
				<td>신고자</td>
				<td>신고 대상자</td>
				<td>신고 날짜</td>
				<td>회원 상태</td>
				<td>처리상태</td>
				<td>내용 확인</td>
			</tr>
			<c:if test="${slist.size()==null}">
				<td colspan="6" align="center">신고가 없습니다.</td>
			</c:if>
			<c:if test="${slist.size()!=null}">
			<c:forEach items="${slist}" var="svo">
				<tr align="center" height="35">
					<td>${svo.userid}</td>
					<td>${svo.singo_userid}</td>
					<td>${svo.writeday}</td>
					
					<c:if test="${svo.state2==0}">
						<td> 일반회원 </td>
					</c:if>
					
					<c:if test="${svo.state2==1}">	<!-- 신고 받은 회원을 먼저 거래정지를 시켜놓음 -->
						<td> 임시정지 </td>
					</c:if>
					
					<c:if test="${svo.state2==2}">	<!-- 신고 사실이 확인될 경우 영구정지를 시켜 앞으로 활동하지 못하고 다시 가입하지 못하게 함 -->
						<td> 영구정지 </td>
					</c:if>
					
					<c:if test="${svo.state2==3}">
						<td> 회원탈퇴 </td>
					</c:if>
					<c:if test="${svo.state2==4}">
                  		<td> 탈퇴신청 </td>
               		</c:if>
					<td>
						<c:if test="${svo.state==0}">
							처리중
						</c:if>
						
						<c:if test="${svo.state==1}">
							처리 완료
						</c:if>
					</td>
				
					<td> <a href="../admin/singo_profile?id=${svo.id}" style="color:blue; font-size:14px; font-weight:600;"> 클릭 </a></td>
				</tr>
			</c:forEach>
			</c:if>
				<tr>
					<td colspan="6" align="center">
					<c:if test="${pstart!=1 and pstart!=null}">
						<span onclick="location='../admin/singo_manage?page=${pstart-1}&singo_table_state=${singo_table_state}'" style="cursor:pointer;"> ◀ </span>
					</c:if>
						
					<c:if test="${page!=1 and page!=null}">
						<span onclick="location='../admin/singo_manage?page=${page-1}&singo_table_state=${singo_table_state}'" id="prev" style="cursor:pointer;"> < </span>
					</c:if>
					
					
					<c:forEach begin="${pstart}" end="${pend}" var="i">
						<c:if test="${page==i}">
							<c:set var="page_color" value="style='color:red;'"/>
						</c:if>
						<c:if test="${page!=i}">
							<c:set var="page_color" value=""></c:set>
						</c:if>
						
						<c:if test="${page!=null}">
						 <span id="page" ${page_color} onclick="location='../admin/singo_manage?page=${i}&singo_table_state=${singo_table_state}'">${i}</span>
						</c:if>
						
						<c:if test="${page==null}">
							<span style="color:red;">1</span>
						</c:if>
						
					</c:forEach>
		
					
					<c:if test="${page!=chong and chong!=0}">
						<span onclick="location='../admin/singo_manage?page=${page+1}&singo_table_state=${singo_table_state}'" id="back" style="cursor:pointer;"> > </span>
					</c:if>
					
					<c:if test="${!(pend>=chong)}">
						<span onclick="location='../admin/singo_manage?page=${pend+1}&singo_table_state=${singo_table_state}'" style="cursor:pointer;"> ▶ </span>
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