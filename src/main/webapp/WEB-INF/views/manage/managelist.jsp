<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <style>
        .h{
            margin: 20px 0px 32px;

        }
        .search-box {
            position: relative;
            width: 300px;
            height: 40px;
        }

        .search-box input[type="text"] {
            width: 100%;
            height: 100%;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            padding-right: 40px;
        }

        .search-box button[type="submit"] {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            width: 30px;
            height: 30px;
            background-color: transparent;
            border: none;
            cursor: pointer;
        }

        .search-box button[type="submit"]:focus {
            outline: none;
        }

        .search-box button[type="submit"] i.fas {
            font-size: 20px;
            color: #aaa;
        }

        .search-box input[type="text"]:focus + button[type="submit"] i.fas {
            color: #333;
        }
        a {
           color:black;
        }
        #sujung{
        margin-top:2px;
        
        }
        
    </style>
    <script>
        function getchangenum(num)
        {

            location = "sustate?num="+num;


        }
        function getchangestate(state)
        {
            location="sellstate?state="+state;
        }
        
        function del(pcode)
        {
           if(confirm("정말 삭제하시겠습니까?"))
                {
              location="mdelete?pcode="+pcode;

                }

     
       }
        
    </script>

</head>

<body>
<div class="h" width="1024" height="100" align="center">
    <form class="search-box" method="post" action="managelist">
        <input type="text" name="search" value="${search}" placeholder="검색어를 입력하세요">
        <button type="submit" value="검색"><img src="../resources/img/search.svg"></button>
    </form>
    <form name="manage" method="post" action="managelist">
        <select name="num" onchange="getchangenum(this.value)" >
            <option> 개 수 </option>
            <option value="10">10개씩</option>
            <option value="30">30개씩</option>
            <option value="50">50개씩</option>

        </select>

        <select id="state" onchange="getchangestate(this.value)">
            <option >전 체</option>
            <option value="1">판매중</option>
            <option value="2">예약중</option>
            <option value="3">판매완료</option>
        </select>
    </form>

</div>
<br>

        <table width="920" align="center" border="1">
           <tr align="center">
            <td width="170">메인이미지</td>

            <td width="70">판매상태</td>

            <td> 상품명 </td>

            <td width="100"> 가격 </td>
            <td>등록일</td>
               <td width="50">관리</td>
           </tr>
            <tr>
            <c:forEach items="${mlist}" var="mvo">
                <input type="hidden" name="userid" value="${mvo.userid}">
                <input type="hidden" name="id" value="${mvo.id}">
                <input type="hidden" name="pcode" value="${mvo.pcode}">
                <td> <span onclick="location='../panmae/readnum?pcode=${mvo.pcode}'"><img src="../resources/product/${mvo.cimg}" width="170" height="100"></span></td>

                <td align="center">
                    <c:if test="${mvo.sstate==0}"> 판매중 </c:if>
                    <c:if test="${mvo.sstate==1}"> 예약중</c:if>
                    <c:if test="${mvo.sstate==2}"> 판매완료</c:if>
                </td>
                <td align="center"> ${mvo.title} </td>
                <td align="center"> <fmt:formatNumber value="${mvo.price}" pattern="#,###" type="number"/>원</td>
                <td align="center"> ${mvo.writeday} </td>
                <td align="center"> <a id="sujung" href="../manage/mupdate?pcode=${mvo.pcode}">수정</a>
               
                
                  <span onclick="del('${mvo.pcode}')" id="delete" style="color:red;cursor:pointer;">삭제</span>
                </td>
            </tr>

            </c:forEach>


        </table>

</body>
</html>