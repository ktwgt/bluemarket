<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
</head>
<style>
    #section {
        width:1000px;
        height:500px;
        margin:auto;
    }
    #section #title {
        width:440px;
        height:28px;
        border:1px solid #4776b4;;
        outline:none;
    }
    #section #content {
        width:440px;
        height:120px;
        border:1px solid #4776b4;;
        outline:none;
    }
    #section #submit {
        width:200px;
        height:32px;
        border:1px solid #4776b4;;
        outline:none;
        background:white;
        color:purple;
        font-size:15px;
        font-weight:900;
    }
</style>
<script>

</script>
<body>
<div id="section">
    <form method="post" action="singo_insert_ok">
    <input type="hidden" name="panmae_id" value="${panmae_id}">
    <input type="hidden" name="userid" value="${userid}">
        <table width="600" align="center">
            <caption> <h3> 신고폼 작성 </h3></caption>
            <tr>
                <td>신고할 유저아이디 </td>
                <td> <input type="text" name="singo_userid" value="${singo_userid}" readonly></td>
            </tr>

            <tr>
                <td> 내 용 </td>
                <td> <textarea name="content" id="content"></textarea> </td>
            </tr>

            <tr>
                <td colspan="2" align="center"> <input type="submit" value="신고하기" id="submit"> </td>
            </tr>
        </table>
    </form>

  ]

</div>
</body>
</html>
