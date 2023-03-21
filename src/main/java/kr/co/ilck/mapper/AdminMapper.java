package kr.co.ilck.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.ilck.vo.EventVo;
import kr.co.ilck.vo.GongjiVo;
import kr.co.ilck.vo.MemberVo;
import kr.co.ilck.vo.SingoVo;

public interface AdminMapper {
	
	public int chong(String tableName);
	
	public int chong2(String tableName, int singo_table_state);
	
	public ArrayList<MemberVo> member_manage(int index);
	
	public ArrayList<MemberVo> member_search(String where, String search, int index);
	
	public MemberVo member_profile(String id);
	
	public void member_state(int state, String id);
	
	public HashMap<String, String> member_guel(String userid);
	
	public ArrayList<SingoVo> singo_manage(int index);
	
	public ArrayList<SingoVo> singo_manage2(int singo_table_state, int index);
	
	public void singo_stop(String userid);
	
	public void singo_num(String userid);
	
	public void singo_del(String id);
	
	public SingoVo singo_profile(String id);
	
	public void guel_stop(String id);
	
	public boolean member_state_chk(String userid);
	
	public void member_state_up(String userid);
	
	public void singo_state_up(String id);
	
	public int member_state_value(String singo_userid);
	
	public String getPanmae_pcode(int panmae_id);
	
	
	
	
	public ArrayList<EventVo> event_manage();
	
	public void event_delete(String id);
	
	public void event_add_ok(String title, String img);
	
}
