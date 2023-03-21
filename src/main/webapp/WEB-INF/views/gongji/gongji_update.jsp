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
		height:800px;
		margin:auto;
		padding-top:50px;
	}
	
	section tr
	{
		text-align:center;
	}
	
	section input[type=text]
	{
		width:640px;
		hegiht:35px;
		font-size:16px;
		outline:none;
		border:none;
	}
	
	section textarea
	{
		width:640px;
		height:510px;
		padding-top:10px;
		resize:none;
		outline:none;
		border:none;
	}
	
	section input[type=checkbox]
	{
		margin-left:20px;
	}
		
	section #btn
	{
		width:120px;
		height:50px;
		border:1px solid purple;
		background:white;
		margin:15px;
		text-align:center;
		font-size:16px;
		cursor:pointer;
	}

</style>

<script>

	window.onload=function()
	{
		var important=${gvo.important};
		
		if(important==1)
		{
//			alert(important);
			document.lwy.important.checked=true;		// important 값을 읽어와 checked
		}

		
	}

	function cursor_on(num)
	{
		var len=document.getElementsByClassName("cursor_on").length;
//		alert(len);
		
		for(i=0; i<len; i++)
			document.getElementsByClassName("cursor_on")[i].style.border="1px solid black";
		
		document.getElementsByClassName("cursor_on")[num].style.border="2px solid black";
//		alert();
	}
	
	function button_click()
	{
		var page=${page};
		var id=${gvo.id};
		
		location="../gongji/gongji_content?id="+id+"&page="+page;
	}

</script>


</head>
<body>
	<section>
	
		<form method="post" name="lwy" action="gongji_update_ok">
		<input type="hidden" name="id" value="${gvo.id}">
		<input type="hidden" name="page" value="${page}">
		
		<table width="800" border="1" align="center">
			<tr>
				<td height="40" width="100">제 목</td>
				<td colspan="2" class="cursor_on"> <input type="text" name="title" value="${gvo.title}" onclick="cursor_on(0)"></td>
			</tr>
			<tr>
				<td height="550" rowspan="2">내용</td>
				<td align="left" height="30"><input type="checkbox" name="important" id="important" value="1"> 중요공지 체크 </td>
			</tr>
			<tr>
				<td colspan="2" class="cursor_on"><textarea name="content" onclick="cursor_on(1)">${gvo.content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" height="60">
					<input type="submit" value="수정하기" id="btn">
					<input type="button" id="btn" value="취 소" onclick="button_click()">
				</td>
			</tr>
		</table>
		</form>

	
	</section>
</body>
</html>