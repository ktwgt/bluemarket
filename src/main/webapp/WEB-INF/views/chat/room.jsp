<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅방</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

	var Chat_roomId= ${param.roomId};		// 받아온 roomId(현재는 get방식을 통해서 직접) 값으로 초기화

	setInterval(Chat_loadNewMessages, 100);
	
	
	//폼이 발생되기 전에 한번 씩 실행
	// 즉, 엔터 한번 칠 때 마다 실행
	function Chat_addMessage(writer, body, opponent)
	{
		// './addMessage' 로 사용해도 가능
		$.post(
			'../chat/doAddMessage',		
			{
				roomId:Chat_roomId,
				writer:writer,
				body:body,
				opponent:opponent
			},
			function(data)
			{
				if(data.add_clist.length>1)			// 채팅방을 열고 첫 채팅일 때는 else를 실행
				{
					Chat_loadNewMessages();			// 메세지를 보낼 때 마다 바로바로 메세지를 출력시킨다.
				}
				else
				{
					Chat_drawMessage(data.add_clist[0]);		// 첫 채팅을 출력시킨다.
				}
				
							
			},
			'json'
		);
	}
	
	
	function Chat_drawMessage(chatMessage)
	{
		var chat_style="";
		
		if(chatMessage.writer=='${writer}')			// writer가 userid인지 opponent인지에 따라 class 값을 다르게 부여한다.
			chat_style="class='chat_right'";
		else
			chat_style="class='chat_left'";
		
		var html=chatMessage.writer + " ( " + chatMessage.writeday + " ) " + "<p>" + chatMessage.body;	// chatMessage == 가져온 data값(Map type) 의 값들 
		
		$(".chat_messages").append("<div id='chat_messages' > <div "+chat_style+">" + html +' <div/> <div/>');	// 순서대로 메세지를 <div>내용<div/> 의 형식으로 값을 준다. append를 이용하여 위에서 아래 순서로 메세지를 뿌림 
	}

	
	var Chat_lastLoadedMessageId = 0;										// 메세지를 갱신하기 위해서 필요한 값 + 처음에 모든 메세지를 가져오기 위해서 0으로 초기화
	
	function Chat_loadNewMessages()
	{
		// from의 의미 : 지금까지 불러온 채팅 내역의 다음 내역의 index
		$.get(
			'./getMessagesFrom',
			{
				roomId:Chat_roomId,
				from:Chat_lastLoadedMessageId + 1							// 지금까지 가져온 메세지의 index값 + 1
			},
			function(data) {
				for(var i=0; i<data.New_messages.length; i++)
				{
/*					
					if(data.New_messages[i].writer=='${writer}')			// writer가 userid인지 opponent인지에 따라 class 값을 다르게 부여한다.
						chat_style="class='chat_right'";
					else
						chat_style="class='chat_left'";
*/
//					data.New_messages[i].writer 가 정상적으로 순서대로 값이 넘어오는지 확인하기 위한 코드
//					document.getElementById("imsi_aa").innerText=document.getElementById("imsi_aa").innerText+data.New_messages[i].writer+"/";
					
					
					Chat_drawMessage(data.New_messages[i]);					// 가져온 메세지의 data를 이용하여 function 실행
					
					Chat_lastLoadedMessageId = data.New_messages[i].num;	// 지금까지 가져온 메세지의 index값
					
//					document.getElementById("imsi_imsi").innerText=Chat_lastLoadedMessageId;

					document.getElementById("chat_content").scrollTop=document.getElementById("chat_content").scrollHeight;	// 메세지 창의 스크롤이 항상 맨 아래로 가도록
				}
			},
			'json'
		);
	}
	
	
	
	// 처음 채팅방에 접속했을 때 이전 채팅 내역을 불러내는 메소드
	function getMessages()
	{
		$.get(
			'./getMessages',
			{
				roomId:Chat_roomId
			},
			function(data) {
				for(var i=0; i<data.clist.length; i++)
				{
/*					
					if(data.clist[i].writer=='${writer}')			// writer가 userid인지 opponent인지에 따라 class 값을 다르게 부여한다.
						chat_style="class='chat_right'";
					else
						chat_style="class='chat_left'";
*/
//					data.New_messages[i].writer 가 정상적으로 순서대로 값이 넘어오는지 확인하기 위한 코드
//					document.getElementById("imsi_aa").innerText=document.getElementById("imsi_aa").innerText+data.New_messages[i].writer+"/";
					
					
					Chat_drawMessage(data.clist[i]);					// 가져온 메세지의 data를 이용하여 function 실행
					
					Chat_lastLoadedMessageId = data.clist[i].num;	// 지금까지 가져온 메세지의 index값
					
//					document.getElementById("imsi_imsi").innerText=Chat_lastLoadedMessageId;

					document.getElementById("chat_content").scrollTop=document.getElementById("chat_content").scrollHeight;	// 메세지 창의 스크롤이 항상 맨 아래로 가도록
				}
			},
			'json'
		);
	}
	

	function submitChatMessageForm(form)				// form 태그를 파라메터로 받는다
	{
		
		if(form.body.value.length==0)
		{
			alert("내용을 입력해주세요.");						// 메세지 내용을 입력하지 않았을 경우 경고문
			form.body.focus();
			
			return false;
		}
		
		var writer=form.writer.value;					// ajax로 보내줄 값들
		var body=form.body.value;						//
		var opponent=form.opponent.value;				//
		
		form.body.value="";								// 메세지 내용을 초기화
		form.body.focus();								// 메세지 내용 입력칸으로 focus
		
		Chat_addMessage(writer, body, opponent);		// function문 실행
		
		document.getElementById("chat_content").scrollTop=document.getElementById("chat_content").scrollHeight;		// 메세지 창의 스크롤이 항상 맨 아래로 가도록
	} 
	

</script>

<style>

	#chat_content
	{
		width:500px;
		height:400px;
		overflow:auto;
		border:1px solid black;
	}

	#form_body
	{
		width:300px;
		height:100px;
		resize:none;
	}
	
	#form_div_submit
	{
		display:inline-block;
		margin-right:10px;
		margin-top:15px;
		float:left;
	}

	#form_div_body
	{
		display:inline-block;
		margin-top:15px;
		margin-right:10px;
	}
	
	.chat_left	/* 실제 왼쪽 */
	{
		margin-top:20px;
		margin-bottom:30px;
		margin-left:15px;
		padding-top:10px;
		padding-bottom:10px;
		padding-left:25px;
		padding-right:15px;
		width:155px;
		display:block;
		text-align:left;
		border:1px solid black;
		background:gray;
		
	}
	
	.chat_right		/* 실제 오른쪽 */
	{
		margin-top:20px;
		margin-bottom:25px;
		margin-left:269px;
		padding-top:10px;
		padding-bottom:10px;
		padding-left:15px;
		padding-right:30px;
		width:155px;
		display:block;
		text-align:left;
		border:1px solid black;
		background:yellow;
	}
	
	#newMsg_chk
	{
		display:none;
		width:70px;
		height:40px;
		padding-top:10px;
		text-align:center;
		background:red;
	}
	
</style>

</head>
<body onload="getMessages()">

	<h1>${opponent}님 과의 톡</h1>
	
	<!-- 판매글 탭에서 블루톡을 눌렀을 때, writer값과 opponent값을 받아와서
	 	 mapper에서 select roomId from chat where writer=writer && opponent=opponent 를 통해서  roomId 가져오기 구현해야됌
	-->


 <!-- <div id="imsi_aa"></div> 	writer와 opponent의 값을 확인하기 위함	-->
 
 <div onclick="Chat_loadNewMessages()" id="newMsg_chk"> 버튼 </div>


<div id="chat_content">
	<div class="chat_messages">
		
	</div>
</div>

	<form onsubmit="submitChatMessageForm(this); return false;">
		<input type="hidden" name="opponent" value="${opponent}">
			<input type="hidden" name="writer" value="${writer}">	<!-- input type="hidden" 으로 해서 session으로 userid를 받아오기 -->

		<div id="form_div_submit">
			<input type="submit" value="전송" id="form_submit">	
		</div>
		
		<div id="form_div_body">
			<textarea name="body" placeholder="내용" autocomplete="off" id="form_body"></textarea>	
		</div>

	</form>
	

</body>
</html>