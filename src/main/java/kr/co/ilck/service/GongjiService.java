package kr.co.ilck.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.ilck.vo.GongjiVo;

public interface GongjiService {
	
	public boolean admin_check(HttpSession session);
	
	public int getPage(HttpServletRequest request);
	
	public int getPstart(int page);
	
	public int getPend(int pstart, int chong);
	
	public String gongji(HttpSession session, Model model, HttpServletRequest request);
	
	public String readnum(HttpServletRequest request);
	
	public String gongji_content(HttpSession session, Model model, HttpServletRequest request);
	
	public String gongji_delete(HttpSession session, HttpServletRequest request);
	
	public String gongji_update(HttpSession session, Model model, HttpServletRequest request);
	
	public String gongji_update_ok(HttpSession session, HttpServletRequest request, GongjiVo gvo);
	
	public String gongji_write(HttpSession session);
	
	public String gongji_write_ok(HttpSession session, GongjiVo gvo);

}
