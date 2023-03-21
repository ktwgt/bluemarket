package kr.co.ilck.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ilck.vo.PanmaeVo;
import kr.co.ilck.vo.SingoVo;

import org.springframework.ui.Model;

public interface PanmaeService {
   public String panmae(HttpSession session,Model model);
   public void getJung(HttpServletRequest request,PrintWriter out);
   public void getSo(HttpServletRequest request,PrintWriter out);
   public void getCode(HttpServletRequest request,PrintWriter out);
   public String panmae_ok(HttpSession session,HttpServletRequest request) throws IOException;
   public String readnum(HttpServletRequest request);
   public String plist(HttpServletRequest request, Model model);
   public String pcontent(HttpServletResponse response,HttpServletRequest request, Model model , HttpSession session);
   public void wishadd(HttpSession session, HttpServletRequest request, PrintWriter out);
   public String liststate(HttpServletRequest request,Model model);

   public String singo_insert(HttpSession session, HttpServletRequest request, Model model);
	
   public String singo_insert_ok(HttpServletRequest request, SingoVo svo);


}