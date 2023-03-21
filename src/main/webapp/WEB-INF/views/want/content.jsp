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
      margin-top:50px;
   }
   section #title {
            width:1000px;
            height:450px;
            margin:auto;
        }
        section #title > #left {
            width:500px;
            height:450px;
            float:left;

        }
        section #title > #right {
            width:500px;
            height:450px;
            float:right;
            position:relative;
        }
       section #wtitle {
            font-size:20px;
            color:black;
            font-weight:900; 
        }
              section #pri {
            font-size:40px;
            color:black;
            font-weight:400; 

        }
        #won{
            font-size: 28px;
            font-weight: 400;
            margin-right: 1px;
            margin-bottom: 4px;
 
        }
              #hrs{
            width: 480px;

        }
        #hrs div{
            display: inline-block;
            font-weight: 600;


        }  
               #readnum{
            margin-right: 300px;
            margin-bottom: 2px;
        } 
               section #btn {
            position:absolute;
            top:355px;
            
        }
                section #btn span{
            display: inline-block;
            width: 160px;
            height: 40px;
            text-align: center;
            font-weight: 600;

        }
                #gim{
            font:22px "Noto Sans KR", sans-serif;
            color: #ffffff;
            background:#cccccc;

        }
                #bolt{
            font:22px "Noto Sans KR", sans-serif;
            color: #ffffff;
            background:#4776b4; 

        }
        #wtext {
             color:black;
             font-size:14px;
        }
           #qqqq
      {
         float:right;
         margin-left:6px;
         margin-top:9px; 
      }
      #eye {
         position:relative;
         top:5px;
      }


</style>
</head>
<body>
   <section>
     <div id="title">
      <div align="center" id="left"><img src="../resources/want/${wvo.fname}" width="400"></div>
      <div id="right">
         <div id="wtitle">${wvo.title}</div>
           <div id="pri"><fmt:formatNumber value="${wvo.wprice}" pattern="#,###" type="number"/>
                <span id="won">원</span>
            </div>
            
            <hr>
      
           <span id="hrs">
             
                <div id="wurw">작성자: ${wvo.userid} | 작성일: ${wvo.writeday} | <span id="eye"><img src="../resources/img/eye.png"></span><span id="qqqq"> ${wvo.readnum}</span>  </div>
             
                <div id="readnum"> </div>
         </span>
   
          
          <p>
          
          <div id="wtext">${wvo.content}</div>
          
          <p>
          
          <div id="btn">
                    <span id="gim" onclick="location='list'" style="cursor:pointer"> 목록 </span>
                    <c:if test="${userid!=null and wvo.userid!=userid}">
                       <span id="bolt" style="cursor:pointer" onclick="go_room_check()"> 블루톡 </span>
                    </c:if>
            </div> 
        </div>      
     </div>

        
   </section>
   <script>
   function go_room_check()
   {
      var opponent='${wvo.userid}';
      
      open("../chat/room_check?&opponent="+opponent, "",
            "width=550,height=620,left="+win_width+",top="+win_height);

//      alert(win_width+"////"+win_height);
//      alert(writer+"/"+opponent);
   }
   </script>
</body>
</html>