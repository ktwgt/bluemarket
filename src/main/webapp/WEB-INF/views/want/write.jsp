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
      text-align:center;
      height:530px;
   }
      h3 {
      font-size:25px;
      font-weight:500;
   }
     section table {
     border-spacing:6px; 
   }
   section table td {
     font-size:13px;
   }
   table #title {
      width:450px;
      height:28px;
      border:2px solid #4776b4;
      outline:none;
   }
   table #submit {
      width:200px;
      height:32px;
      border:1px solid #4776b4;
      outline:none;
      background:white;
      color:#6495ED;
      font-size:15px;
      font-weight:900;
   }
    table #wprice {
      width:140px;
      height:28px;
      border:2px solid #4776b4;
      outline:none;
      padding-left:5px;
   }
    section #content {
      width:450px;
      height:150px; 
      border:2px solid #4776b4;
      outline:none;
      resize:none;
   } 
     section table #menu {
     border-bottom:none;
     height:50px;
   }
     section input[type=submit] {
      width:100px;
      height:32px;
      outline:none;
      border:none;
      background:white;
      color:black;
      font-weight:900;
      font-size:16px;
   }
      section input:hover[type=submit] {
       color:#4776b4;
     text-decoration:underline;
      } 
 </style>
</head>
<body>
<section>
   <form method="post" action="write_ok" enctype="multipart/form-data">
      <table width="600" align="center">
         <caption align="center"><h3>구해요 등록</h3></caption>
            <tr>
               <td> 제목 </td>
               <td align="left"> <input type="text" name="title" id="title"> </td>
             </tr>
             <tr>
               <td> 내 용 </td>
               <td align="left"> <textarea cols="40" rows="5" name="content" id="content"></textarea> </td>
             </tr>
             <tr>
               <td> 희망 가격 </td>
               <td align="left"> <input type="text" name="wprice" id="wprice" placeholder="숫자만 입력하세요"> </td>
             </tr>
             <tr>
                <td> 물품 사진 </td>
                <td align="left"> <input type="file" name="fname"> </td>
             </tr>
             <tr align="center" id="menu">
               <td colspan="2">
                  <input type="submit" style="cursor:pointer" value="글쓰기">
               </td>
             </tr> 
      </table>
   </form>
</section>
</body>
</html>