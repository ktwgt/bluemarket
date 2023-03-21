package kr.co.ilck.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.ilck.vo.PanmaeVo;
import org.springframework.ui.Model;

import java.io.IOException;

public interface ManageService {
   
   public String managelist(HttpSession session, Model model, HttpServletRequest request);
   public String sellstate(HttpServletRequest request, Model model, HttpSession session);

   public String mcontent(HttpServletRequest request, Model model, HttpSession session);

   public String sustate(HttpServletRequest request, Model model, HttpSession session);

   public String mupdate(HttpServletRequest request, Model model);

   public String mdelete(HttpServletRequest request,HttpSession session);

   public String mupdate_ok(HttpSession session, HttpServletRequest request) throws IOException;

}