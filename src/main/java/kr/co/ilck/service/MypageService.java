package kr.co.ilck.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import kr.co.ilck.vo.CalVo;

@Repository
public interface MypageService {

	public String mypage(HttpSession session, Model model,HttpServletRequest request) throws IOException;
	
	public String shop(HttpSession session, Model model,HttpServletRequest request) throws IOException;

	public String wishdel(HttpServletRequest request,Model model);

	public String chgstate(HttpServletRequest request,Model model);
	
	public String mupdate(HttpServletRequest request, Model model);

	public String mdelete(HttpServletRequest request,HttpSession session);

	public String mupdate_ok(HttpSession session, HttpServletRequest request) throws IOException;


}
