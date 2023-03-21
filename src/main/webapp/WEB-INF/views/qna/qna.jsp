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
   
   section .result_tr
   {
      display:none;
   }
   
   section #result_td
   {
      vertical-align:top;
      
   }
   
   section #qna_content
   {
      height:88px;
      padding-left:15px;
      padding-top:10px;
   }
   
   section #result_content
   {
      height:88px;
      padding-left:15px;
      padding-top:10px;
   }
   
   section #re_con
   {
      cursor:pointer;
   }
   
   section #sta
   {
      cursor:pointer;
      color:red;
      width:80px;
      height:30px;
      border:1px solid black;
      background:white;
      margin:10px;
      padding-top:3px;
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

   section #sdsd
   {
      visibility:hidden;
   }

</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

   var change=new Array(${qlist.size()});
   change.fill(0);
   
   var section;                  // 
   var section_len;
   
   //var aaaiii="";
   
   function change_result(index,QnaLen)
   {
   //   document.getElementById("immi").innerText=$("section").css("height");      jquery를 통해서 section의 값을 변경하기 전의 값을 확인
      
      /* for(i=0; i<change.length; i++)
      {
         aaaiii=aaaiii+change[i]+"/";
      }
      alert(aaaiii); */   
      
      
   //   var section=document.getElementsByTagName("section")[0].style.height;      안됨
   //   alert(document.getElementsByTagName("section")[0].style.height);         안됨
   //   document.getElementsByTagName("section")[0].style.height="3000px";         안됨
   
   //   var section=$("section").css("height");                              된다
   //   alert(section);                                                된다
   
   
      section=$("section").css("height");            // section의 hieght 값은 jquery를 통해서만 가져와진다, if문 밖에서 선언해야 한다.
      section_len=section.length;                  // ex) 800px 같은 형식으로 가져와지기 때문에 substring을 위해서 길이를 가져온다
      section=section.substring(0,section_len-2);      // px를 제거
         
      section=section*1;            //   int type일 경우에만 * 계산을 실행할 수 있으므로 간단하게 타입을 변환시킴
   //   alert(section+2000);
   
   //   alert(typeof(section));         
   //   alert(section_len);
   //   alert(section);
      
      
      if(change[index]==0)         // table-row되지 않은 tr을 열었을 때
      {
         document.getElementsByClassName("result_tr")[index].style.display="table-row";
         change[index]=1;
   
         if(QnaLen>100)            // result의 길이가 100이 넘을 경우
         {
            document.getElementsByClassName("result_tr")[index].style.height="450px";
            
            $("section").css("height", section+450);      // section의 height를 ".result_tr"의 height가 증가하는 크기만큼 증가 시킴
   //         alert($("section").css("height"));            // section의 height가 변경되었는지 alert를 통해 확인
         }
         else if(QnaLen>50)
         {
            document.getElementsByClassName("result_tr")[index].style.height="300px";
            $("section").css("height", section+300);
   //         alert($("section").css("height"));
         }
         else
         {
            $("section").css("height", section+200);
   //         alert($("section").css("height"));
         }
      }
      else                                       // table-row되어있는 tr을 닫을 때
      {
         document.getElementsByClassName("result_tr")[index].style.display="none";
         change[index]=0;
         
         if(QnaLen>100)
         {
   //         alert(section);                           // 변수 section이 if문 안에 있을경우, 오류발생
            $("section").css("height", section-450);      // section의 height를 ".result_tr"의 height가 증가했던 크기만큼 감소 시킴
   //         alert($("section").css("height"));            // section의 height가 변경되었는지 alert를 통해 확인
         }
         else if(QnaLen>50)
         {
            $("section").css("height", section-300);
   //         alert($("section").css("height"));
         }
         else
         {
            $("section").css("height", section-200);
   //         alert($("section").css("height"));
         }
      }
   }
   
   
   function num_change(id, id2, page)
   {
      location="../qna/num_change?id="+id+"&id2="+id2+"&page="+page;
   }

   
   <c:if test="${msg=='1'}">
      alert("순서를 바꿀 수 없습니다");
   </c:if>
   
</script>

</head>
<body>
   <section>
   
      <h3> 자주하는 질문 </h3>
      <div id="h3sub">자주하시는 질문들을 모두 모아봤어요.</div>
      
      <ul id="ggquick"> 고객센터
         <li><a href="../gongji/gongji">공지사항                   ></a></li>
         <li><a href="../qna/qna">자주하는 질문 ></a></li>
         <li id="sdsd"><a href="">1:1 문의 ></a></li>
      </ul>
   
      <table id="table">
         <tr>
            <c:if test="${qlist.size()==0}">
               <td colspan="4" align="center">자주묻는 질문이 없습니다.</td>
            </c:if>
         </tr>
         
         <c:if test="${qlist.size()!=0}">
         
         <tr align="center" height="60">
            <td width="100">번호</td>
            <td width="650"> 제목 </td>
         </tr>
         
         <c:forEach items="${qlist}" var="qvo" varStatus="imsi">
            <tr align="center">
                <td width="60">${(imsi.index)+1}</td>
               <td height="35" align="left">
                  <div id="re_con" onclick="change_result(${imsi.index}, ${QnaLen[imsi.index]})">
                  <c:if test="${qvo.important==1}">
                     <span style="color:#ff4400; font-size:16px;">[중요]</span>
                  </c:if>   
                     ${qvo.title}
                  </div>
               </td>
            </tr>
            
            
            <c:if test="${userid!='admin'}">
               <c:set var="td_set" value="colspan='2'"/>
            </c:if>
            
            <c:if test="${userid=='admin'}">
               <c:set var="td_set" value=""/>
            </c:if>
            
            
            <tr class="result_tr">
            
            
            <c:if test="${imsi.index==0}">
                  <c:set var="imsi2" value="0"/>
               </c:if>
               
               <c:if test="${imsi.index!=0}">
                  <c:set var="imsi2" value="${qlist.get(imsi.index-1).getId()}"/>
               </c:if>
               
               <c:if test="${imsi.index==qlist.size()-1}">
                  <c:set var="imsi3" value="0"/>
               </c:if>
               
               <c:if test="${imsi.index<qlist.size()-1}">
                  <c:set var="imsi3" value="${qlist.get(imsi.index+1).getId()}"/>
               </c:if>
               
               <c:if test="${userid=='admin'}">
               <td align="center">
                  <div>
                     <div id="num_up"> <span onclick="num_change(${qvo.id}, '${imsi2}', '${page}')" style="cursor:pointer;">▲</span> </div>
                     <div id="sta"> <a href="../qna/qna_update?id=${qvo.id}&page=${page}">수 정</a> </div>
                     <div id="sta"> <a href="../qna/qna_delete?id=${qvo.id}&page=${page}">삭 제</a>  </div>
                     <div id="num_down"> <span onclick="num_change(${qvo.id}, '${imsi3}', '${page}')" style="cursor:pointer;">▼</span> </div>
                  </div>
               </td>
               </c:if>
            
            
               <td id="result_td" ${td_set}>
               <div id="result">
                  <div id="qna_content">
                     질문 : ${qvo.title}
                  </div>
                  <div id="result_content">
                     답변 : ${qvo.result}
                  </div>
               </div>
               </td>
               
               
            </tr>
            
         </c:forEach>
            
   
            <tr>
               <td colspan="3" align="center" height="40" style="font-size:16px;">
               <c:if test="${pstart!=1 and pstart!=null}">
                  <span onclick="location='../qna/qna?page=${pstart-1}'" style="cursor:pointer;"> ◀ </span>
               </c:if>
                  
               <c:if test="${page!=1 and page!=null}">
                  <span onclick="location='../qna/qna?page=${page-1}'" id="prev" style="cursor:pointer;"> < </span>
               </c:if>
               
               
               <c:forEach begin="${pstart}" end="${pend}" var="i">
                  <c:if test="${page==i}">
                     <c:set var="page_color" value="style='color:#4776b4;'"/>
                  </c:if>
                  <c:if test="${page!=i}">
                     <c:set var="page_color" value=""></c:set>
                  </c:if>
                  
                  <c:if test="${page!=null}">
                   <span id="page" ${page_color} onclick="location='../qna/qna?page=${i}'" style="cursor:pointer;">${i}</span>
                  </c:if>
                  
                  <c:if test="${page==null}">
                     <span style="color:#4776b4;">1</span>
                  </c:if> 
                   
               </c:forEach>
      
               
               <c:if test="${page!=chong and chong!=0}">
                  <span onclick="location='../qna/qna?page=${page+1}'" id="back" style="cursor:pointer;"> > </span>
               </c:if>
               
               <c:if test="${!(pend>=chong)}">
                  <span onclick="location='../qna/qna?page=${pend+1}'" style="cursor:pointer;"> ▶ </span>
               </c:if>

               </td>
            </tr>
         
            </c:if>
         
      </table>
      
      <c:if test="${userid=='admin'}">
      <div align="center" id="guan2">
         <div id="guan">
            <a href="../qna/qna_write"> 질문 추가하기 </a>
         </div>
         <div id="guan">
            <a href="../admin/admin_page"> 관리자 페이지 </a>
         </div>
      </div>
      </c:if>
   
   </section>
</body>
</html>