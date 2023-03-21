package kr.co.ilck.mapper;

import java.util.ArrayList;

import kr.co.ilck.vo.GongjiVo;

public interface GongjiMapper {
	
	public int chong();
	
	public ArrayList<GongjiVo> gongji(int index);
	
	public void readnum(String id);
	
	public GongjiVo gongji_content(String id);
	
	public void gongji_delete(String id);
	
	public void gongji_update_ok(GongjiVo gvo);
	
	public void gongji_write_ok(GongjiVo gvo);

}
