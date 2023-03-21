package kr.co.ilck.mapper;

import java.util.ArrayList;

import kr.co.ilck.vo.CalVo;
import kr.co.ilck.vo.MemberVo;
import kr.co.ilck.vo.PanmaeVo;
import kr.co.ilck.vo.WantVo;
import kr.co.ilck.vo.WishVo;

public interface MypageMapper {

	public MemberVo mypage(String userid);
	
	public PanmaeVo shop(String userid);

	public ArrayList<CalVo> getCal(String userid);
	
	public ArrayList<WishVo> getWish(String userid,int index);

	public ArrayList<PanmaeVo> getPanmae(String userid);

	public int getwChong(String userid);

	public void wishdel(String id);

	public int myguel(String userid);

	public int mypguel(String userid);

	public void chgstate(String sstate, String id);

	public ArrayList<WantVo> getWant(String userid);
	
	public void mdelete(String pcode);
	
	public PanmaeVo mupdate(String pcode);
	
	public void mupdate_ok(PanmaeVo pvo);

}
