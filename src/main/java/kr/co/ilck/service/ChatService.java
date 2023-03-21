package kr.co.ilck.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.ilck.vo.ChatVo;

public interface ChatService {
	
	public String room_check(Model model, HttpSession session, HttpServletRequest request);
	
	public String showRoom(Model model, int roomId, HttpSession session, HttpServletRequest request);
		
	public void addMessage(int roomId, String writer, String body, String opponent);

	public Map doAddMessage(int roomId, String writer, String body, String opponent);
	
	public Map getMessages(int roomId);
	
	public Map getMessagesFrom(int roomId, int from);
	
	public String chating_list(Model model, HttpSession session);


}
