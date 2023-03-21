package kr.co.ilck.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ilck.service.PanmaeService;
import kr.co.ilck.vo.PanmaeVo;
import kr.co.ilck.vo.SingoVo;

@Controller
public class PanmaeController {

   @Autowired
   @Qualifier("pm")
   private PanmaeService service;
   
   @RequestMapping("/panmae/pnew")
   public String panmae(HttpSession session,Model model)
   {
      return service.panmae(session,model);
   }
   
   @RequestMapping("/panmae/getjung")
   public void getjung(HttpServletRequest request,PrintWriter out)
   {
      service.getJung(request,out);
   }
   
   @RequestMapping("/panmae/getso")
   public void getso(HttpServletRequest request,PrintWriter out)
   {
      service.getSo(request,out);
   }
   
   @RequestMapping("/panmae/getcode")
   public void getcode(HttpServletRequest request,PrintWriter out)
   {
      service.getCode(request,out);
   }


   @RequestMapping("/panmae/panmae_ok")
   public String panmae_ok(HttpSession session, HttpServletRequest request) throws IOException
   {
      
      return service.panmae_ok(session, request);
      
   }
   @RequestMapping("/panmae/readnum")
   public String readnum(HttpServletRequest request)
   {

      return service.readnum(request);

   }

   @RequestMapping("/panmae/plist")
   public String plist(HttpServletRequest request, Model model)
   {
      return service.plist(request,model);
   }


   @RequestMapping("/panmae/pcontent")
   public String pcontent(HttpServletResponse response,HttpServletRequest request, Model model,HttpSession session)
   {

      return service.pcontent(response,request, model , session);
   }



   @RequestMapping("/panmae/wishadd")
   public void wishadd(HttpSession session, HttpServletRequest request, PrintWriter out)
   {
      service.wishadd(session,request,out);
   }
   
   @RequestMapping("/panmae/liststate")
   public String liststate( HttpServletRequest request, Model model)
   {
      return service.liststate( request, model);

   }

   @RequestMapping("/panmae/singo_insert")
   public String singo_insert(HttpSession session, HttpServletRequest request, Model model)
   {
	   return service.singo_insert(session, request, model);
   }
   
   @RequestMapping("/panmae/singo_insert_ok")
   public String singo_insert_ok(HttpServletRequest request, SingoVo svo)
   {	   
	   return service.singo_insert_ok(request, svo);
   }


   
   
   
   
}