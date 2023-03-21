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
	}
	
	section #form
	{
		text-align:center;
	}

	section textarea
	{
		width:420px;
		height:205px;
		resize:none;
		margin-top:20px;
	}
	
	section input[type=text]
	{
		width:420px;
		height:35px;
		font-size:16px;
		margin-top:30px;
	}
	
	section #check
	{
		width:430px;
		hegiht:5px;
		margin-left:285px;
		padding-top:10px;
		text-align:left;
	}
	
	section input[type=submit], input[type=button]
	{
		width:103px;
		height:45px;
		margin-top:30px;
		margin-left:15px;
		margin-right:15px;
		background:white;
		cursor:pointer;
		border:1px solid black;
	}

</style>

<script>
	function true_check()
	{
//		alert(document.lwy.title.value.length);
//		alert(document.lwy.content.innerText.length);	// textarea 에서 innerText.length 로 접근하면 값을 불러오지 못한다.
		
		if(document.lwy.title.value.length==0)
		{
			alert("제목을 입력해주세요");
			return false;
		}
		else if(document.lwy.content.value.length==0)
		{
			alert("내용을 입력해주세요");
			return false;
		}
		else
		{
			return true;	
		}
	}
</script>

</head>
<body>
	<section>
	
		<form method="post" name="lwy" action="qna_write_ok" onsubmit="return true_check()">
		<div id="form">
			<div>
				<input type="text" name="title" placeholder="제목">
			</div>
			<div id="check">
				<input type="checkbox" name="important" value="1"> 중요공지 체크
			</div>
			<div>
				<textarea rows="10" cols="40" name="result" placeholder="내용"></textarea>
			</div>
			<div>
				<input type="submit" value="글쓰기"> <input type="button" value="취소" onclick="location='../qna/qna'">
			</div>
		</div>
		</form>
	
	</section>
</body>
</html>