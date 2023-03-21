<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
       <style>

        .inbar{
            width: 1024px;
            display: flex;
            height: 100%;
            font-size: 14px;

        }
        .regis{
            height: 100%;
            display: flex;
            -webkit-box-align: center;
            margin-right: 2rem;

        }
        .regis:first-child{
            margin-left: -0.5rem;

        }
        .registration{
            margin-top: 5px;
            padding: 0.5rem;

        }
        .regis .registration{
            color: red;
        }


        .manage{
            height:100%;
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            margin-right: 2rem;

        }

        .managebox{
            margin-top: 5px;
            padding: 0.5rem;
        }
        a{
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        #form{
            padding-top: 50px;
          width:1000px;
          height:700px;
            margin:auto;
            text-align: center;
        }
        #form #description {

            overflow:auto;
        }
        #form input[type=submit] {
            background:#4776b4;
            color:white;
        }
    </style>
    <script>
        function getjung(daecode)
        {
            var chk=new XMLHttpRequest();

            chk.onload=function()
            {

                document.pro.jung.innerHTML=decodeURI(chk.responseText);
            }

            chk.open("get","getjung?daecode="+daecode);
            chk.send();
        }

        function getso(jung)
        {
            var chk=new XMLHttpRequest();
            var dae=document.pro.dae.value;
            var daejung=dae+jung;
            //alert(daejung);
            chk.onload=function()
            {

                document.pro.so.innerHTML=decodeURI(chk.responseText);
            }

            chk.open("get","getso?daejung="+daejung);
            chk.send();
        }

        function gencode()
        {

            var dae=document.pro.dae.value;
            var jung=document.pro.jung.value;
            var so=document.pro.so.value;


            var chk=new XMLHttpRequest();
            var pcode="p"+dae+jung+so;
            chk.onload=function()
            {

                var num=chk.responseText;

                if(num.length==1)
                    num="00"+num;
                else if(num.length==2)
                    num="0"+num;

                document.pro.pcode.value=pcode+num;
            }
            chk.open("get","getcode?pcode="+pcode);
            chk.send();


        }
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  	<script>
  function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
  {
    new daum.Postcode({
        oncomplete: function(data) {
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.pro.zip.value = data.zonecode; // 우편번호
          document.pro.loca.value = addr;  // 주소
      }
    }).open();
  }
  </script>
</head>
<body>

    <nav class="inbar">
        <div class="regis">
            <a class="registration" href="/panmae/pnew/">상품등록</a>
        </div>
        <div class="manage">
            <a class="managebox" href="../manage/managelist">상품관리</a>
        </div>
    </nav>
 <hr>
<div id="form">
    <form name="pro" method="post" action="panmae_ok" enctype="multipart/form-data"  align="center">
        <table width="800" height="600" border="1" align="center">
            <tr>
                <td width="200"> 상품코드 </td>
                <td>
                    <input type="text" name="pcode" readonly>
                    <select name="dae" onchange="getjung(this.value)">
                        <option> 대분류 </option>
                        <c:forEach items="${dae}" var="dvo">
                            <option value="${dvo.code}"> ${dvo.name} </option>
                        </c:forEach>
                    </select>
                    <select name="jung" onchange="getso(this.value)">
                        <option> 중분류 </option>
                    </select>
                    <select name="so" onchange="gencode()">
                        <option> 소분류 </option>
                    </select>
                </td>
            </tr>
            <tr>
                <td> 메인이미지 </td>
                <td> <input type="file" name="cimg"> </td>
            </tr>
            <tr>
                <td> 상세이미지 </td>
                <td> <input type="file" name="pimg"></td>
            </tr>
            <tr>
                <td> 제목 </td>
                <td> <input type="text" name="title"> </td>
            </tr>
            <tr>
                <td> 상품가격 </td>
                <td> <input type="text" name="price"> </td>
            </tr>
            <tr>
                <td> 거래일정 </td>
                <td> <input type="datetime-local" name="selltime"> </td>
            </tr>
            <tr>

                <td> 거래장소 </td>
                <td><input type="text" name="zip" placeholder="우편번호" id="zip" readonly>
   					<input type="button" value="주소검색" onclick="juso_search()" id="zipbtn"> 
   					<input type="text" name="loca">
   				</td>
            </tr>
            <tr>
                <td> 상품상태</td>
                <td>
                   중고상품 <input type="radio" name="pstate" value="0">
                   새상품 <input type="radio" name="pstate" value="1">
                </td>
            </tr>

            <tr>
                <td id="description"> 상품설명 </td>
                <td><textarea cols="50" name="content" id="content"></textarea></td>
            </tr>

            <tr>
                <td colspan="2"> <input type="submit" value="상품등록"> </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>





