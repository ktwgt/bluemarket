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
   section div {
   }
    #mimage {
     position:relative;
     top:-8px;
     width:1000px;
     height:310px;
     overflow:hidden;
     margin:auto;

    }
    #msub {
     width:3000px;
     height:300px;
     margin-left:0px;

    }
    #maintitle{
       position:relative;
       top:0px;
    }
    #mquality {
       position:relative;
       display:inline-block;
       left:3px;
       top:13px;
    }
       #table {
       position:relative;
       top:0px;
       margin-top:20px;
       margin-bottom:20px;
    }
    #table tr {
      display:none;    
    }
    #table td {
       border:1px solid #cccccc;
       padding:0px;
       width:196px;
       height:275px;
    }
    #table #ptitle {
       font-size:13px;
       display:inline-block;
       padding-top:5px;
       padding-left:5px; 
       align:left;
       width:190px;
    }
    #table #pprice {
       position:relative;
       font-weight:bold;
       top:-3px;
       left:2px;
       align:left;
       display:inline-block;
       width:100px;
       font-size:14px;
       padding-left:3px;
    }
    #table #pwriteday {
       position:relative;
       left:22px;
       display:inline-block;
       font-size:10px;
       width:65px;
       top:-4px;
    }
    #loaddiv {
       position:relative;
       width:1000px;
       height:35px;
       left:0px;
       top:-10px;
       display:inline-block;
       font-size:18px;
       background:#4776b4;
       color:white;
       text-align:center;
    }
    #loaddiv > a {
       position:relative;
       width:300px;
       height:40px;
       border:1px solid black;
       left:480px;
       text-decoration:none;
       color:black;
 
    }

</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){
    $("tr").slice(0, 5).show(); // 초기갯수
    $("#load").click(function(e){ // 클릭시 more
        e.preventDefault();
        $("tr:hidden").slice(0, 5).show(); // 클릭시 more 갯수 지저정
        if($("tr:hidden").length == 0){ // 컨텐츠 남아있는지 확인
            alert("게시물의 끝입니다."); // 컨텐츠 없을시 alert 창 띄우기 
        }
    });
});

   $(function()
   {
          move();
          
         $("#mimage").mouseover(function()
         {
            clearInterval(ss);
         });
         $("#mimage").mouseout(function()
         {
              move();
         });
         
            
       
   });
   function move()
   {
      ss=setInterval(function()
      {
         $("#msub").animate(
         {
            marginLeft:"-1000px"
         },2000,function()
                {
                    $("#msub > img").eq(0).insertAfter( $("#msub > img").eq(elen-1) );
                    $("#msub").css("margin-left","0px");
                });
      },4000);
   }
      
 </script>
</head>
<body>
   <div id="mimage">
      <div id="msub">
         <c:forEach items="${elist}" var="evo">
			<img src="../resources/event/${evo.img}" width="1000" height="310" class="ev_img">
		</c:forEach>
      </div>
   </div>
   
    	<script>
	var elen=document.getElementsByClassName("ev_img").length;
//	   alert(elen);
	</script> 
      
   
   <section>

      <div id="maintitle" style="font-size:25px;font-weight:500;flow:left;display:inline-block;">오늘의 상품을 추천해드려요</div>
      <div id="mquality"><img src="../resources/main/quality.png" width="50" height="50"></div>
      <table align="center" id="table">
         <tr>
            <c:forEach items="${plist}" var="pvo" varStatus="sts">
            <td>
               <div align="center" style="border-bottom:1px solid #cccccc;"><a href="../panmae/readnum?pcode=${pvo.pcode}"><img src="../resources/product/${pvo.cimg}" width="196" height="210"></a></div>                  
                    <div id="ptitle"> ${pvo.title}</div> <p>        
                <div id="pprice"> <fmt:formatNumber value="${pvo.price}" type="number" pattern="#,###"/>원 </div> 
                <div id="pwriteday">${pvo.writeday}</div>
            </td>
            <c:if test="${sts.count%5 == 0}">
         </tr>
          <tr>
            </c:if>
            </c:forEach>
         </tr>
         
      </table>
      <a href="#" id="load"><div id="loaddiv">더 보기 ▽</div></a>
   </section>
</body>
</html>