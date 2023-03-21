package kr.co.ilck.mapper;

import java.util.ArrayList;

import kr.co.ilck.vo.WantVo;

public interface WantMapper {

	public void write_ok(WantVo wvo);
	public ArrayList<WantVo> list(int index);
	public int getChong();
	public WantVo content(String id);
	public void readnum(String id);
	public void delete(String id);
	public WantVo update(String id);
	public void update_ok(WantVo wvo);
}
