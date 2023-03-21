package kr.co.ilck.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface AdminService {
	
	public boolean admin_check(HttpSession session);
	
	public int getPage(HttpServletRequest request);
	
	public int getPstart(int page);
	
	public int getPend(int pstart, int chong);
	
	public String admin_page(HttpSession session);
		
	public String member_manage(HttpSession session, Model model, HttpServletRequest request);
	
	public String member_profile(HttpSession session, Model model, HttpServletRequest request);
	
	public String member_state(HttpSession session, HttpServletRequest request);
	
	public String singo_manage(HttpSession session, Model model, HttpServletRequest request);
	
	public String singo_del(HttpSession session, HttpServletRequest request);
	
	public String singo_profile(HttpSession session, Model model, HttpServletRequest request);
	
	public String singo_up(HttpSession session, HttpServletRequest request);
	
	public String event_manage(HttpSession session, Model model);

	public String event_delete(HttpSession session, HttpServletRequest request);

	public String event_add(HttpSession session);

	public String event_add_ok(HttpSession session, HttpServletRequest request) throws Exception;
	
}
