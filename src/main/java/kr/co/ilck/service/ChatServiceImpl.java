package kr.co.ilck.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.ilck.mapper.ChatMapper;
import kr.co.ilck.vo.ChatVo;

@Service
@Qualifier("cs")
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatMapper mapper;
	
	
	@Override
	public String room_check(Model model, HttpSession session, HttpServletRequest request) 
	{
		String writer="";
		if(session.getAttribute("userid")!=null)
			writer=session.getAttribute("userid").toString();
		else
			return "redirect:/chat/warning";
		
		
		String opponent=request.getParameter("opponent");
		
//		writer="room2_writer";
//		opponent="room2_opponent";
		
		if(mapper.room_check(writer, opponent))		// writer와 opponent 값을 받아와서 전에 채팅기록이 있는지 확인
		{
//			System.out.println("true");
			
			// 채팅 기록이 있다면 기존 roomId를 model로 보내준다.
			model.addAttribute("roomId", mapper.send_roomId(writer,opponent));
		}
		else
		{
//			System.out.println("false");
			
			// 채팅 기록이 없다면 새로운 roomId를 만들어 model로 보내준다.
			model.addAttribute("roomId", mapper.new_roomId());
		}
		
//		System.out.println("/////////////////////"+writer+"//////////////////////////////////");
		
		return "redirect:/chat/room?opponent="+opponent;
	}
	
	
	@Override
	public String showRoom(Model model, int roomId, HttpSession session, HttpServletRequest request)
	{
//		System.out.println("=====================확인용======================");
		
		String writer="";												// 값을 바꿔야 한다. 사용자의 userid로 변경
		if(session.getAttribute("userid")!=null)
			writer=session.getAttribute("userid").toString();
		else
			return "redirect:/chat/warning";
		
		String opponent="";											// 값을 바꿔야 한다. 톡의 상대방의 userid로 값 변경
		if(request.getParameter("opponent")!=null)
			opponent=request.getParameter("opponent");
		else
			return "redirect:/chat/warning";
		
		
		model.addAttribute("writer", writer);
		model.addAttribute("opponent", opponent);
		
//		System.out.println("=====================확인용222222======================");
		
		return "/chat/room";
	}
	
	
	@Override
	public Map doAddMessage(int roomId, String writer, String body, String opponent) 
	{
		Map rs=new HashMap();
		
		addMessage(roomId, writer, body, opponent);					// addMessage() 메소드를 통해서 메시지를 추가한다.
		
		ArrayList<ChatVo> add_clist=mapper.getMessages(roomId);
		
		rs.put("resultCode", "S-1");
		rs.put("msg", "채팅 메시지가 추가되었습니다.");
		rs.put("add_clist", add_clist);
		
		return rs;
	}
	
	
	@Override
	public void addMessage(int roomId, String writer, String body, String opponent) 
	{
		ChatVo cvo=new ChatVo();
		cvo.setRoomId(roomId);
		cvo.setWriter(writer);
		cvo.setBody(body);
		cvo.setOpponent(opponent);
		
		mapper.addMessage(cvo);										// 메시지를 추가한다 ( DB에 값 전달 )

/*		
		System.out.println(cvo.getId());
		System.out.println(cvo.getWriter());
		System.out.println(cvo.getBody());
		System.out.println(cvo.getRoomId());
		System.out.println(cvo.getWriteday());
*/
		
	}
	

	////////////////////////////////
	@Override
	public Map getMessages(int roomId)
	{
		ArrayList<ChatVo> clist=mapper.getMessages(roomId);			// 같은 roomId를 가진 data를 모두 보내준다. ( 처음 채팅방에 접근 했을 때 실행 )
		
		for(int i=0; i<clist.size(); i++)
		{
			clist.get(i).setNum(i);									// 같은 roomId를 가진 것들의 numbering
			
			String writeday=clist.get(i).getWriteday();
			int len=writeday.length();

			writeday=writeday.substring(0,len-5);
			clist.get(i).setWriteday(writeday);
			
			String body=clist.get(i).getBody().replace("\r\n", "<br>");
			clist.get(i).setBody(body);
		}
		
		
		Map rs=new HashMap();
		rs.put("clist", clist);
		
		return rs;
	}
	////////////////////////////////
	
	
	
	
	@Override
	public Map getMessagesFrom(int roomId, int from) 
	{
		ArrayList<ChatVo> New_messages=new ArrayList();				// 새로운 메시지를 뿌려줄 List
		ArrayList<ChatVo> clist=mapper.getMessagesFrom(roomId);		// 같은 roomId를 가진 data를 가져온다
		
		for(int i=0; i<clist.size(); i++)
		{
			clist.get(i).setNum(i);									// 같은 roomId를 가진 것들의 numbering
			
			String writeday=clist.get(i).getWriteday();
			int len=writeday.length();

			writeday=writeday.substring(0,len-5);
			
			clist.get(i).setWriteday(writeday);			
//			System.out.println(writeday);
			
			
			String body=clist.get(i).getBody().replace("\r\n", "<br>");
			clist.get(i).setBody(body);
			
			
			if(clist.get(i).getNum()>=from)							// 전에 가져가서 이미 room.jsp에 뿌려준 메시지의 다음 메시지를 조건문을 통해 확인
			{
				New_messages.add(clist.get(i));						// 전에 가져가지 않은 새로운 메시지 값을 add 시킴 
			}

		}
		
//		System.out.println("size : " + clist.size());
		
		
		Map rs=new HashMap();

		rs.put("New_messages", New_messages);
		

		/*
		Iterator test=rs.keySet().iterator();
		
		while(test.hasNext())
		{
			System.out.println(rs.get(test.next()));
		}
		*/
		
		return rs;													// 전에 가져가지 않은 새로운 메시지를 return 시킨다.
	}
	
	
	@Override
	public String chating_list(Model model, HttpSession session) 
	{
//		String writer="imsi";
		String writer="";
		
		if(session.getAttribute("userid")!=null)
			writer=session.getAttribute("userid").toString();
		else
		{
//			System.out.println("service에서 오류 발생");
			return "redirect:/chat/warning";
		}
			

		if(mapper.chating_list_check(writer)==true)
		{
//			System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
			ArrayList<ChatVo> clist=mapper.chating_list(writer);			// 해당 writer의 채팅리스트를 가져온다
			
			
			ArrayList<ChatVo> send_user=new ArrayList<ChatVo>();			// writer 값과 opponent 값을 보내주기 위해 만든 List
			
			
			for(int i=0; i<clist.size(); i++)
			{		
				ChatVo cvo=new ChatVo();
				
				if(clist.get(i).getWriter().equals(writer))					// session으로 받아온 userid와 clist의 writer 값이 같을 경우
				{
					cvo.setOpponent(clist.get(i).getOpponent());
					cvo.setWriter(clist.get(i).getWriter());
					
//					System.out.println(cvo.getOpponent()+"%%%%%%%%%%%"+cvo.getWriter());
					
					send_user.add(cvo);
				}
				else														// session으로 받아온 userid와 clist의 writer 값이 다를 경우 (userid==opponent)
				{
					cvo.setOpponent(clist.get(i).getWriter());
					cvo.setWriter(clist.get(i).getOpponent());
					
//					System.out.println(cvo.getOpponent()+"%%%%%%%%%%%"+cvo.getWriter());
					
					send_user.add(cvo);	
				}
				
				String writeday=clist.get(i).getWriteday();
				int len=writeday.length();
	
				writeday=writeday.substring(0,len-5);
				
				clist.get(i).setWriteday(writeday);
				
				
				String body=clist.get(i).getBody().replace("\r\n", "<br>");
				
				int len2=body.length();
				
				if(len2>30)
				{
					body=body.substring(0,30);
					body=body+"...";
				}
				clist.get(i).setBody(body);
			}
			
			
	/////////////////////////////////////////////////////		
	//		for(int i=0; i<send_user.size(); i++)
	//		{
	//			System.out.println(send_user.get(i).getWriter()+"///////////"+send_user.get(i).getOpponent());
	//			System.out.println(i);
	//		}
	/////////////////////////////////////////////////////
			
			model.addAttribute("writer", writer);
			model.addAttribute("clist", clist);
			model.addAttribute("send_user", send_user);
		}
		else
		{
//			System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
			
			ArrayList<ChatVo> clist=new ArrayList<ChatVo>();
			ArrayList<ChatVo> send_user=new ArrayList<ChatVo>();			// writer 값과 opponent 값을 보내주기 위해 만든 List
			
			ChatVo cvo=new ChatVo();
			
			clist.add(cvo);
			send_user.add(cvo);
			
			model.addAttribute("writer", writer);
			model.addAttribute("clist", clist);
			model.addAttribute("send_user", send_user);
			model.addAttribute("not_chatingRoom", 1);
		}
		
		return "/chat/chating_list";
	}

}






