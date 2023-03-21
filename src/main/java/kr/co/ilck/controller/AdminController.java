package kr.co.ilck.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ilck.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	@Qualifier("as")
	private AdminService service;
	// 관리자 메인페이지	
	@RequestMapping("/admin/admin_page")
	public String admin_page(HttpSession session)
	{
		return service.admin_page(session);
	}
	// 관리자 회원관리
	@RequestMapping("/admin/member_manage")
	public String member_manage(HttpSession session, Model model, HttpServletRequest request)
	{
		return service.member_manage(session, model, request);
	}
	// 관리자 회원관리 처리페이지
	@RequestMapping("/admin/member_profile")
	public String member_profile(HttpSession session, Model model, HttpServletRequest request)
	{
		return service.member_profile(session, model, request);
	}
	// 관리자 회원관리 회원상태 처리
	@RequestMapping("/admin/member_state")
	public String member_state(HttpSession session, HttpServletRequest request)
	{
		return service.member_state(session, request);
	}	
	// 관리자 신고관리
	@RequestMapping("/admin/singo_manage")
	public String singo_manage(HttpSession session, Model model, HttpServletRequest request)
	{
		return service.singo_manage(session, model, request);
	}
	// 관리자 신고관리 삭제
	@RequestMapping("/admin/singo_del")
	public String singo_del(HttpSession session, HttpServletRequest request)
	{
		return service.singo_del(session, request);
	}
	
	@RequestMapping("/admin/singo_profile")
	public String singo_profile(HttpSession session, Model model, HttpServletRequest request)
	{
		return service.singo_profile(session, model, request);
	}
	
	@RequestMapping("/admin/singo_up")
	public String singo_up(HttpSession session, HttpServletRequest request)
	{
		return service.singo_up(session, request);
	}	
	
	@RequestMapping("/admin/event_manage")
	public String event_manage(HttpSession session, Model model)
	{
		return service.event_manage(session, model);
	}
	
	
	@RequestMapping("/admin/event_delete")
	public String event_delete(HttpSession session, HttpServletRequest request)
	{
		return service.event_delete(session, request);
	}
	
	@RequestMapping("/admin/event_add")
	public String event_add(HttpSession session)
	{
		return service.event_add(session);
	}
	
	
	@RequestMapping("/admin/event_add_ok")
	public String event_add_ok(HttpSession session, HttpServletRequest request) throws Exception
	{
		return service.event_add_ok(session, request);
	}
	
	
	
}
















