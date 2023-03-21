package kr.co.ilck.mapper;

import java.util.ArrayList;

import kr.co.ilck.vo.EventVo;
import kr.co.ilck.vo.PanmaeVo;

public interface MainMapper {
	
	public ArrayList<PanmaeVo> main();
	
	public ArrayList<EventVo> eventlist();
}
