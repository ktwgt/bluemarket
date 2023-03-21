<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="../resources/img/basket.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블루톡</title>

<style>
	#body
	{
		opacity:0.6;
		font-size:15px;
	}
	
	#chating_con
	{
		width:300px;
		border:1px solid red;
		padding:10px;
		margin-top:20px;
	}

	#go_room
	{
		padding:15px;
		cursor:pointer;
	}

	
	#scroll
	{
		margin:auto;
		width:417px;
		height:500px;
		overflow:auto;
		border:1px solid black;
	}
	
	#scroll_title
	{
		margin:auto;
		width:417px;
		text-align:center;
		margin-bottom:30px;
		margin-top:40px;
		font-size:22px;
		font-weight:800;
	}
	
	#not_chating
	{
		text-align:center;
		margin-top:20px;
	}
</style>

<script>

	var win_width=window.screen.width/2-249;
	var win_height=window.screen.height/2-330;

	function go_room(roomId, writer, opponent)
	{
//		location="../chat/room?writer="+writer+"&opponent="+opponent+"&roomId="+roomId;
		
		open("../chat/room?writer="+writer+"&opponent="+opponent+"&roomId="+roomId, "",
				"width=518,height=620,left="+win_width+",top="+win_height);
	}
	
	
	function bae_search()
	{
		open("baeview","","width=500,height=620");
	}
	
</script>


</head>
<body>

<c:if test="${not_chatingRoom==null}">

	<div id="scroll_title"> ${send_user.get(0).writer}님의 톡방 </div>

<div id="scroll_pre">	
	<div id="scroll">
		<table width="400" align="center" border="1" id="table">
			<c:forEach items="${clist}" var="cvo" varStatus="i">
				<tr height="150">
					<td>
					<div onclick="go_room('${cvo.roomId}','${send_user.get(i.index).writer}','${send_user.get(i.index).opponent}')" id="go_room">
						${send_user.get(i.index).opponent}님 과의 톡 <p>
						
						<div id="chating_con">
						<span id="body">${send_user.get(i.index).writer} 님  <p>
						${cvo.body} (${cvo.writeday})</span>
						</div>
					</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>	
</div>

</c:if>

<c:if test="${not_chatingRoom!=null}">
	
	<div id="scroll_title"> ${writer}님의 채팅리스트 </div>
	
	<div id="scroll_pre">	
		<div id="scroll">
			
			<div id="not_chating"> 활성화 된 채팅방이 없습니다 </div>
			
		</div>	
	</div>

</c:if>

</body>
</html>