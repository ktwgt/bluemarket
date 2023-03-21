package kr.co.ilck.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ilck.service.ChatService;
import kr.co.ilck.vo.ChatVo;

@Controller
public class ChatController {

	@Autowired
	@Qualifier("cs")
	private ChatService service;
	
	
	@RequestMapping("/chat/room_check")
	public String room_check(Model model, HttpSession session, HttpServletRequest request)
	{
		return service.room_check(model, session, request);
	}
	
	@RequestMapping("/chat/room")
	public String showRoom(Model model, int roomId, HttpSession session, HttpServletRequest request)		// param은 get방식으로 보낸 값과 이름이 같을 경우 받아준다
	{
		return service.showRoom(model, roomId, session, request);
	}
	
	
	@RequestMapping("/chat/doAddMessage")
	@ResponseBody
	public Map doAddMessage(int roomId, String writer, String body, String opponent)
	{
		return service.doAddMessage(roomId, writer, body, opponent);
	}
	
	
	@RequestMapping("/chat/getMessages")
	@ResponseBody
	public Map getMessages(int roomId)
	{
		return service.getMessages(roomId);
	}
	
	
	@RequestMapping("/chat/getMessagesFrom")
	@ResponseBody
	public Map getMessagesFrom(int roomId, int from)
	{
		return service.getMessagesFrom(roomId, from);
	}
	
	@RequestMapping("/chat/chating_list")
	public String chating_list(Model model, HttpSession session)
	{
		return service.chating_list(model, session);
	}
	
	
	
	/////////////////////////////////// 임시
	
	
	@RequestMapping("/chat/warning")
	public String warning()
	{
		return "/chat/warning";
	}

	
}





