<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
	   #wmaintitle{
    	position:relative;
    	top:0px;
    }
	    #table {
    	position:relative;
    	top:5px;
    	margin-top:20px;
    	margin-bottom:40px;
    }
    #table td {
    	border:1px solid #cccccc;
    	padding:0px;
    	width:196px;
    	height:275px;
    }
    #table #wtitle {
    	font-size:14px;
    	display:inline-block;
    	padding-top:5px;
    	padding-left:5px;
    	align:left;
    }
    #table #wuserid {
    	position:relative;
    	font-weight:500;
    	top:-3px;
    	left:1px;
    	display:inline-block;
    	padding-left:5px;
    	width:65px;
    	font-size:15px;
    }
    #table #wwriteday {
    	position:relative;
    	left:54px;
    	display:inline-block;
    	font-size:10px;
    	width:65px;
    	top:-4px;
    }
    #wtitleimg {
    	position:relative;
    	display:inline-block;
    	left:-135px; 
    	top:10px;
    }
    #wmainwrite {
    	position:relative;
    	display:inline-block; 
    	left:570px;

    }
    #wmainwrite a {
        	color:black;
        text-decoration:none;
    }
    #wmainwrite a:hover {
        text-decoration:underline;
    	color:#4776b4;
    }
</style>
</head>
<body>
	<section>
	<div id="wmaintitle" style="font-size:25px;font-weight:500;flow:left;display:inline-block;">구하는 물품을 등록해봐요</div> 		<div id="wmainwrite"><a href="../want/write">물품 구하러 가기 ></a></div>
	<div id="wtitleimg"><img src="../resources/img/megaphone.png" width="35" height="35"></div>
		<table align="center" id="table">
			<tr>
				<c:forEach items="${list}" var="wvo" varStatus="sts">
					<td>
						<div align="center" style="border-bottom:1px solid #cccccc;"><a href="readnum?id=${wvo.id}"><img src="../resources/want/${wvo.fname}" width="196" height="210"></a></div>						
                       	<div id="wtitle"> ${wvo.title}</div> <p>      
				        <div id="wuserid">${wvo.userid}</div>
				        <div id="wwriteday">${wvo.writeday}</div>
				    </td>
				<c:if test="${sts.count%5 == 0}">
			</tr>
		    <tr>
				</c:if>
				</c:forEach>
			 </tr>
       <!-- 페이지 출력 -->
       <tr>
         <td align="center" colspan="5" style="height:40px;border:'1'">
      <c:if test="${pstart!=1 and pstart!=null}">
						<span onclick="location='../want/list?page=${pstart-1}'" style="cursor:pointer;"> ◀ </span>
					</c:if>
						
					<c:if test="${page!=1 and page!=null}">
						<span onclick="location='../want/list?page=${page-1}'" id="prev" style="cursor:pointer;"> < </span>
					</c:if>
					
					
					<c:forEach begin="${pstart}" end="${pend}" var="i">
						<c:if test="${page==i}">
							<c:set var="page_color" value="style='color:#4776b4;cursor:pointer;'"/>
						</c:if>
						<c:if test="${page!=i}">
							<c:set var="page_color" value=""></c:set>
						</c:if>
						
						<c:if test="${page!=null}">
						 <span id="page" ${page_color} onclick="location='../want/list?page=${i}'" style="cursor:pointer;">${i}</span>
						</c:if>
						
						<c:if test="${page==null}">
							<span style="color:#4776b4;">1</span>
						</c:if>
						
					</c:forEach>
		
					
					<c:if test="${page!=chong and chong!=0}">
						<span onclick="location='../want/list?page=${page+1}'" id="back" style="cursor:pointer;"> > </span>
					</c:if>
					
					<c:if test="${!(pend>=chong)}">
						<span onclick="location='../want/list?page=${pend+1}'" style="cursor:pointer;"> ▶ </span>
					</c:if>
         </td>
       </tr>
		</table>

	</section>
</body>
</html>