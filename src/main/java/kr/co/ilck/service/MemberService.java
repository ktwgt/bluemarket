package kr.co.ilck.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.ilck.vo.MemberVo;

public interface MemberService {
	
	public String member_input_ok(MemberVo mvo);
	public void userid_check(HttpServletRequest request,PrintWriter out);
	public void email_check(HttpServletRequest request,PrintWriter out);
	//public String member_view(HttpSession session, Model model);
	public String member_edit(HttpSession session, Model model);
	public String member_edit_ok(HttpSession session, MemberVo mvo,HttpServletRequest request) throws IOException;
	public String out(HttpSession session);
	public void message_send(HttpServletRequest request,PrintWriter out);
}
