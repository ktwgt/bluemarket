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
   }
   section #guan2
   {
      position:relative;
      left:40px;
      top:-130px;
   }
   section #guan
   {
      width:120px;
      height:30px;
      border:1px solid purple;
      margin-top:50px;
      padding-top:9px;
      text-align:center;
      display:inline-block;
      margin-left:20px;
   }
   
   section a
   {
      text-decoration:none;
      color:black;
   }
   
   section #content:hover
   {
      color:#4776b4;
      text-decoration:underline;
      cursor:pointer;
   }
   h3 {
      position:relative;
      display:inline-block;
      left:170px;
      top:-132px;
      font-size:25px;
      font-weight:500;
   }
   #h3sub {
      position:relative;
      display:inline-block;
      left:185px;
      top:-135px;
      font-size:13px;
      color:#808080;
      font-weight:300;
   }
   #table {
      position:relative;
      border-top:2px solid black;
      border-collapse:collapse;
      left:170px;
      top:-146px;
       width:840px;
       font-size:14px;
       font-weight:300;
   }
   #table tr:first-child {
      border-bottom:1px solid black;
   }
   #table tr, td {
      border-bottom:1px solid #eeeeee;
   }
   
   #ggquick {
      position:relative;
      display:inline-block;
      left:-420px;
      top:0px;
      font-size:26px;
   }
   #ggquick > li {
      position:relative;
      top:35px;
      width:140px;
      height:50px;
      list-style:none;
      font-size:14px;
      border:1px solid #dddddd;
      align:center;
      padding-left:5px; 
   }
   #ggquick > li > a {
      position:relative;
      left:5px;
      top:15px;
   }
   #ggquick > li > a:hover {
      color:#4776b4;
      text-decoration:underline; 
   }
   
   section #sdsd
   {
      visibility:hidden;
   }

</style>
</head>
<body>
   <section>
   
      <h3> 공지사항 </h3>
      <div id="h3sub">블루마켓의 새로운 소식을 한곳에서 확인하세요.</div>
      
      <ul id="ggquick"> 고객센터
         <li><a href="../gongji/gongji">공지사항                   ></a></li>
         <li><a href="../qna/qna">자주하는 질문 ></a></li>
         <li id="sdsd"><a href="">1:1 문의 ></a></li>
      </ul>
   
      <table id="table">
         <tr align="center" height="60">
            <td width="70">번호</td>
            <td>제목</td>
            <td>조회수</td>
            <td>작성일</td>
         </tr>
         <c:if test="${glist.size()==0}">
            <td colspan="4" align="center">공지가 없습니다.</td>
         </c:if>
         <c:forEach items="${glist}" var="gvo" varStatus="i">
            <tr align="center" height="35">
               <td>${(i.index)+1}</td>
               <td width="570" align="left">
                  <c:if test="${gvo.important==1}">
                     <span style="color:#ff4400;">[중요]</span>
                  </c:if>
                  
                  <a href="../gongji/readnum?page=${page}&id=${gvo.id}" id="content">${gvo.title}</a>
               </td>
               <td width="80">${gvo.readnum}</td>
               <td width="100">${gvo.writeday}</td>
            </tr>
         </c:forEach>
               
            <tr>
               <td colspan="3" align="center" height="40" style="font-size:16px;">
               <c:if test="${pstart!=1 and pstart!=null}">
                  <span onclick="location='../gongji/gongji?page=${pstart-1}'" style="cursor:pointer;"> ◀ </span>
               </c:if>
                  
               <c:if test="${page!=1 and page!=null}">
                  <span onclick="location='../gongji/gongji?page=${page-1}'" id="prev" style="cursor:pointer;"> < </span>
               </c:if>
               
               
               <c:forEach begin="${pstart}" end="${pend}" var="i">
                  <c:if test="${page==i}">
                     <c:set var="page_color" value="style='color:#4776b4;cursor:pointer;'"/>
                  </c:if>
                  <c:if test="${page!=i}">
                     <c:set var="page_color" value=""></c:set>
                  </c:if>
                  
                  <c:if test="${page!=null}">
                   <span id="page" ${page_color} onclick="location='../gongji/gongji?page=${i}'" style="cursor:pointer;">${i}</span>
                  </c:if>
                  
                  <c:if test="${page==null}">
                     <span style="color:#4776b4;">1</span>
                  </c:if>
                  
               </c:forEach>
      
               
               <c:if test="${page!=chong and chong!=0}">
                  <span onclick="location='../gongji/gongji?page=${page+1}'" id="back" style="cursor:pointer;"> > </span>
               </c:if>
               
               <c:if test="${!(pend>=chong)}">
                  <span onclick="location='../gongji/gongji?page=${pend+1}'" style="cursor:pointer;"> ▶ </span>
               </c:if>

               </td>
            </tr>
      </table>
      
      <c:if test="${userid=='admin'}">
      <div align="center" id="guan2">
         <div id="guan">
            <a href="../gongji/gongji_write"> 글쓰기 </a>
         </div>
         <div id="guan">
            <a href="../admin/admin_page"> 관리자 페이지 </a>
         </div>
      </div>
      </c:if>
      
   </section>
</body>
</html>