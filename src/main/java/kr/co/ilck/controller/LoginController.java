package kr.co.ilck.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ilck.service.LoginService;
import kr.co.ilck.vo.MemberVo;

@Controller
public class LoginController {
   
   @Autowired
   @Qualifier("ls")
   private LoginService service;
   
   @RequestMapping("/login/login")
   public String login(HttpServletRequest request, Model model)
   {
      return service.login(request,model);
   }
   
   
   @RequestMapping("/login/login_ok")
   public String login_ok(MemberVo mvo,HttpSession session)
   {
      return service.login_ok(mvo,session);
   }
   
   @RequestMapping("/login/login_ok2")
   public String login_ok2(MemberVo mvo,HttpSession session,HttpServletRequest request,PrintWriter writer,HttpServletResponse response,Model model) throws IOException
   {
      return service.login_ok2(mvo,session,request,writer,response,model);
   }
   
   @RequestMapping("/login/logout")
   public String logout(HttpSession session)
   {
      return service.logout(session);
   }
   
   @RequestMapping("/login/userid_search")
   public void userid_search(HttpServletRequest request,PrintWriter out)
   {
      service.userid_search(request,out);
   }
   @RequestMapping("/login/pwd_search")
   public void pwd_search(HttpServletRequest request,PrintWriter out)
   {
      service.pwd_search(request,out);
   }
}