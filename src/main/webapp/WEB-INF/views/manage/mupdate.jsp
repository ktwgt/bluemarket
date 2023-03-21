<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style>
        a {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        #form input[type=submit] {
            background:blue;
            color:white;

        }

        #del {
            background:red;
            color:white;
            margin-left: 600px;
            cursor: pointer;
        }
        #up{
            margin-left: 120px;
            cursor: pointer;

        }
        #productcontent{
           width:450px;
           height:150px;
           resize:none;
        
        
        
        }
        
        
        
        
      
    </style>
</head>
<body>

<section>
<div>
    <form name="pro" method="post" action="mupdate_ok" enctype="multipart/form-data">
        <table width="800" align="center">
        <caption><h3>상품정보 수정</h3></caption>
        <input type="hidden" name="pcode" value="${pvo.pcode}">
            <tr>
                <td> 메인이미지 </td>
                <td> <input type="file" name="cimg" value="${pvo.cimg}"> </td>
            </tr>
            <tr>
                <td> 상세이미지 </td>
                <td> <input type="file" name="pimg" value="${pvo.pimg}"></td>
            </tr>
            <tr>
                <td> 제목 </td>
                <td> <input type="text" name="title" value="${pvo.title}"> </td>
            </tr>
            <tr>
                <td> 상품가격 </td>
                <td> <input type="text" name="price" value="${pvo.price}"> </td>
            </tr>
            <tr>
                <td> 거래일정 </td>
                <td> <input type="datetime-local" name="selltime" value="${pvo.selltime}"> </td>
            </tr>
            <tr>

                <td> 거래장소 </td>
                <td> <input type="text" name="loca" value="${pvo.loca}"> </td>
            </tr>
            <tr>
                <td> 상품상태</td>
                <td>
                <c:if test="${pvo.pstate==0}">
                    중고상품 <input type="radio" name="pstate" checked value="1">
                      새상품 <input type="radio" name="pstate"  value="0">
                    </c:if>
                   <c:if test="${pvo.pstate==1}"> 
                     중고상품 <input type="radio" name="pstate" value="0">
                    새상품 <input type="radio" name="pstate"  checked value="1">
                    </c:if>
                </td>
            </tr>

            <tr>
                <td id="description"> 상품설명 </td>
                <td><textarea id="productcontent" name="content" id="content">${pvo.content}</textarea></td>
            </tr>
            <br>

            <tr>
                <td colspan="2"> <input type="submit" id="up" value="상품수정" > </td>
            </tr>
        </table>

    </form>
    </div>
</section>

</body>
</html>



