package kr.co.ilck.mapper;

import kr.co.ilck.vo.PanmaeVo;
import kr.co.ilck.vo.WishVo;

import java.util.ArrayList;

public interface ManageMapper {
   public ArrayList<PanmaeVo> managelist(String userid);
   //public WishVo getPid(String userid);
   public PanmaeVo mcontent(String userid);
   public ArrayList<PanmaeVo> getten(String userid);
   public ArrayList<PanmaeVo> getfifty(String userid);
   public ArrayList<PanmaeVo> getthirty(String userid);
   public ArrayList<PanmaeVo> getpanmae(String userid);
   public ArrayList<PanmaeVo> getreserv(String userid);
   public ArrayList<PanmaeVo> getcomplete(String userid);
   public void mdelete(String pcode);
   public PanmaeVo mupdate(String pcode);
   public void mupdate_ok(PanmaeVo pvo);

   public ArrayList<PanmaeVo> msearch(String userid,String search);
}