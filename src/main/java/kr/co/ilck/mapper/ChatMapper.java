package kr.co.ilck.mapper;

import java.util.ArrayList;

import kr.co.ilck.vo.ChatVo;

public interface ChatMapper {
	
	public boolean room_check(String writer, String opponent);
	
	public int send_roomId(String writer, String opponent);
	
	public int new_roomId();
	
	public void addMessage(ChatVo cvo);

	public ArrayList<ChatVo> getMessages(int roomId);

	public ArrayList<ChatVo> getMessagesFrom(int roomId);
	
	public ArrayList<ChatVo> chating_list(String writer);
	
	public boolean chating_list_check(String writer);
	
}
