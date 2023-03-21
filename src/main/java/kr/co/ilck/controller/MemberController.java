package kr.co.ilck.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ilck.service.MemberService;
import kr.co.ilck.vo.MemberVo;

@Controller
public class MemberController {

	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	@RequestMapping("/member/member_input")
	public String member_input(Model model,HttpServletRequest request)
	{
	    String chk="";
		if(request.getParameter("chk")!=null)
		    chk=request.getParameter("chk");

		String name="";
		if(request.getParameter("name")!=null)
			name=request.getParameter("name");
		
		String email="";
		if(request.getParameter("email")!=null)
			email=request.getParameter("email");
		
		model.addAttribute("name", name);
		model.addAttribute("chk",chk);
		model.addAttribute("email",email);
		
		
		return "/member/member_input";
	}
	
	@RequestMapping("/member/member_input_ok")
	public String member_input_ok(MemberVo mvo)
	{
		return service.member_input_ok(mvo);
	}
	/* 회원정보 보기 => 마이페이지에 통합
	@RequestMapping("/member/member_view")
	public String member_view(HttpSession session, Model model)
	{
		return service.member_view(session,model);
	}
	*/
	@RequestMapping("/member/userid_check")
	public void userid_check(HttpServletRequest request, PrintWriter out)
	{
		service.userid_check(request,out);
	}
	
	@RequestMapping("/member/email_check")
	public void email_check(HttpServletRequest request, PrintWriter out)
	{
		service.email_check(request, out);
	}
	
	@RequestMapping("/member/member_edit")
	public String member_edit(HttpSession session,Model model)
	{
		return service.member_edit(session,model);
	}
	
	@RequestMapping("/member/member_edit_ok")
	public String member_edit(HttpSession session, MemberVo mvo,HttpServletRequest request) throws IOException
	{
		return service.member_edit_ok(session,mvo,request);
	}
	
	@RequestMapping("/member/out")
	public String out(HttpSession session)
	{
		return service.out(session);
	}
	@RequestMapping("/member/message_send")
	public void message_send(HttpServletRequest request,PrintWriter out)
	{
		service.message_send(request,out);
	}
}
