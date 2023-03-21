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
		padding-top:10px;
		text-align:center;
	}
	
	section .img_class
	{
		margin-top:30px;
		margin-bottom:30px;
	}
	
	section input[type=submit], input[type=button]
	{
		width:80px;
		height:40px;
		border:1px solid purple;
		background:white;
		cursor:pointer;
	}

</style>

<script>
	function check_img()
	{
		var del_img="";
		var del_id="";
		
		var clen=document.getElementsByClassName("img_class").length;
		
		for(i=0; i<clen; i++)
		{
			if(document.getElementsByClassName("img")[i].checked)
			{
				del_img=del_img+document.getElementsByClassName("img")[i].value+",";
				del_id=del_id+document.getElementsByClassName("id")[i].value+",";
				document.getElementsByClassName("img_evt")[i].style.opacity="0.6";
			}
			else
			{
				document.getElementsByClassName("img_evt")[i].style.opacity="1";
			}
		}
		
		document.event_form.del_img.value=del_img;
		document.event_form.del_id.value=del_id;
		
	}
	
	
	function event_add()
	{
		location="../admin/event_add"
	}
	
</script>

</head>
<body>

<section>
	
	<form name="event_form" method="post" action="event_delete">
		<input type="submit" value="삭제하기"> <input type="button" value="추가하기" onclick="event_add()">
		<input type="hidden" name="del_img">
		<input type="hidden" name="del_id">
		
	<c:forEach items="${elist}" var="evo">
		<div class="img_class"> 
			<input type="hidden" value="${evo.id}" name="id" class="id">
			<input type="checkbox" value="${evo.img}" name="img" class="img"  onclick="check_img()"> 
			<img src="../resources/event/${evo.img}" width="500" height="200" class="img_evt">
		</div>
	</c:forEach>
	
		
	
	</form>
	
</section>

</body>
</html>