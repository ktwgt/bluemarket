package kr.co.ilck.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.ilck.vo.QnaVo;

public interface QnaService {
	
	public boolean admin_check(HttpSession session);
	public int getPage(HttpServletRequest request);
	public int getPstart(int page);
	public int getPend(int pstart, int chong);
	

	public String qna(HttpSession session, Model model, HttpServletRequest request);
	
	public String qna_write(HttpSession session);
	
	public String qna_write_ok(HttpSession session, QnaVo qvo);
	
	public String num_change(HttpSession session, HttpServletRequest request);
	
	public String qna_delete(HttpSession session, HttpServletRequest request);
	
	public String qna_update(HttpSession session ,Model model, HttpServletRequest request);
	
	public String qna_update_ok(HttpSession session , HttpServletRequest request, QnaVo qvo);
}
