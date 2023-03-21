package kr.co.ilck.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.ilck.vo.MemberVo;

public interface LoginService {
   
   public String login(HttpServletRequest request,Model model);
   public String login_ok(MemberVo mvo, HttpSession session);
   public String logout(HttpSession session);
   public String login_ok2(MemberVo mvo, HttpSession session,HttpServletRequest request,PrintWriter writer,HttpServletResponse response,Model model) throws IOException;
   public void userid_search(HttpServletRequest request,PrintWriter out);
   public void pwd_search(HttpServletRequest request,PrintWriter out);
}