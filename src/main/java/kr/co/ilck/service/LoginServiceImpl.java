package kr.co.ilck.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.ilck.mapper.LoginMapper;
import kr.co.ilck.vo.MemberVo;

@Service
@Qualifier("ls")
public class LoginServiceImpl implements LoginService {
   
   @Autowired
   private LoginMapper mapper;
   
   @Override
   public String login(HttpServletRequest request,Model model)
   {   
      String chk=request.getParameter("chk");
      model.addAttribute("chk",chk);
      return "/login/login";
   }
   
   @Override
   public String login_ok(MemberVo mvo, HttpSession session)
   {
      MemberVo mvo2=mapper.login_ok(mvo);
      if(mvo2==null)
      {
         return "redirect:/login/login?chk=1";
      }
      else
      {
         if(mvo2.getUserid().equals("admin"))
         {
            session.setAttribute("userid", mvo2.getUserid());
            session.setAttribute("name", mvo2.getName());
            return "redirect:/admin/admin_page";
         }
         else
         {
            session.setAttribute("userid", mvo2.getUserid());
            session.setAttribute("name", mvo2.getName());
            return "redirect:/main/main";
         }
      }   
   }
   @Override
   public String login_ok2(MemberVo mvo, HttpSession session,HttpServletRequest request,PrintWriter writer,HttpServletResponse response,Model model) throws IOException
   {
      String kakaoemail=request.getParameter("kakaoemail");
      String kakaoname=request.getParameter("kakaoname");
            
      mvo.setEmail(kakaoemail);
      mvo.setName(kakaoname);
        System.out.println(mvo.getEmail());
        System.out.println(mvo.getName());
      //System.out.println(mvo.getEmail());
        
        
        String name=kakaoname;
        String email=kakaoemail;
      
      MemberVo mvo2=mapper.kakao_ok(mvo);
      if(mvo2==null)
      {      
         return "redirect:../member/member_input?chk=1&name="+URLEncoder.encode(name)+"&email="+email;
      }
      else
      {
         session.setAttribute("userid", mvo2.getUserid());
         session.setAttribute("name", mvo2.getName());
         return "redirect:/main/main";
      }
      
   }
   
   @Override
   public String logout(HttpSession session)
   {
      session.invalidate();
      return "redirect:/main/main";
   }
   
   @Override
   public void userid_search(HttpServletRequest request, PrintWriter out) {
       String name=request.getParameter("name");
       String email=request.getParameter("email");
       String userid=mapper.userid_search(name,email);
       if(userid==null)
       {
          out.print("1");
       }
       else
       {
          out.print(userid);
       }
   }
   @Override
   public void pwd_search(HttpServletRequest request, PrintWriter out) {
       String name=request.getParameter("name");
       String email=request.getParameter("email");
       String userid=request.getParameter("userid");
       String pwd=mapper.pwd_search(name,email,userid);
       if(pwd==null)
       {
          out.print("1");
       }
       else
       {
          out.print(pwd);
       }
   }
}	