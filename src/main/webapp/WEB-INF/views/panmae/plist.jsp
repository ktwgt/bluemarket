<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function filter_product(n)
{
    location="liststate?n="+n+"&pcode=${fpcode}&search=${search}";    
}
</script>
<style>
   section {
      width:1000px;
      margin:auto;
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
       font-size:13px;
       display:inline-block;
       padding-top:5px;
       padding-left:5px;
       align:left;
    }
    #table #price {
       position:relative;
       font-weight:bold;
       top:-3px;
       left:1px;
       display:inline-block;
       padding-left:5px;
       width:100px;
       font-size:14px;
    }
    #table #wwriteday {
       position:relative;
       left:20px;
       display:inline-block;
       font-size:10px;
       width:65px;
       top:-4px;
    }
    #ptd1:hover {
       color: #4776b4;
       text-decoration:underline;
    }
    #ptd2:hover {
       color: #4776b4;
       text-decoration:underline;
    }
    
    #ptd3:hover {
       color: #4776b4;
       text-decoration:underline;
    }
    
    #ptd4:hover {
       color: #4776b4;
       text-decoration:underline;
    }
    

</style>
</head>
<body>
<div style="display: flex; justify-content: flex-end; margin-top: 30px;">
    <div style="margin-left: auto; margin-right:auto;">
        <input type="hidden" name="pcode" value="${pvo.pcode}">
        <input type="hidden" name="writeday" value="${pvo.writeday}">
        <input type="hidden" name="price" value="${pvo.price}">
        <input type="hidden" name="readnum" value="${pvo.readnum}">
        <span onclick="filter_product(1)" id="ptd1" style="margin-right: 10px; cursor: pointer;">최신순</span>
        <span onclick="filter_product(4)" id="ptd2" style="margin-right: 10px; cursor: pointer;">인기순</span>
        <span onclick="filter_product(2)" id="ptd3" style="margin-right: 10px; cursor: pointer;">저가순</span>
        <span onclick="filter_product(3)" id="ptd4" style="margin-right: 10px; cursor: pointer;">고가순</span>
    </div>
</div>
   <section>
      <table align="center" id="table">
         <tr>
            <c:forEach items="${plist}" var="pvo" varStatus="sts">
               <td>
                  <div align="center" style="border-bottom:1px solid #cccccc;"><a href="readnum?pcode=${pvo.pcode}"><img src="../resources/product/${pvo.cimg}" width="196" height="210"></a></div>                  
                          <div id="wtitle"> ${pvo.title}</div> <p>      
                    <div id="price"><fmt:formatNumber value="${pvo.price}" type="number" pattern="#,###"/>원 </div>
                    <div id="wwriteday">${pvo.writeday}</div>
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
                  <span onclick="location='plist?pcode=${pcode}&page=${pstart-1}&search=${search}'" style="cursor:pointer;"> ◀ </span>
               </c:if>
                  
               <c:if test="${page!=1 and page!=null}">
                  <span onclick="location='plist?pcode=${pcode}&page=${page-1}&search=${search}'" id="prev" style="cursor:pointer;"> < </span>
               </c:if>
               
               
               <c:forEach begin="${pstart}" end="${pend}" var="i">
                  <c:if test="${page==i}">
                     <c:set var="page_color" value="style='color:#4776b4;cursor:pointer;'"/>
                  </c:if>
                  <c:if test="${page!=i}">
                     <c:set var="page_color" value=""></c:set>
                  </c:if>
                  
                  <c:if test="${page!=null}">
                   <span id="page" ${page_color} onclick="location='plist?pcode=${pcode}&page=${i}&search=${search}'" style="cursor:pointer;">${i}</span>
                  </c:if>
                  
                  <c:if test="${page==null}">
                     <span style="color:#4776b4;">1</span>
                  </c:if>
                  
               </c:forEach>
      
               
               <c:if test="${page!=chong and chong!=0}">
                  <span onclick="location='plist?pcode=${pcode}&page=${page+1}&search=${search}'" id="back" style="cursor:pointer;"> > </span>
               </c:if>
               
               <c:if test="${!(pend>=chong)}">
                  <span onclick="location='plist?pcode=${pcode}&page=${pend+1}&search=${search}'" style="cursor:pointer;"> ▶ </span>
               </c:if>
         </td>
       </tr>
      </table>

   </section>
</body>
</html>