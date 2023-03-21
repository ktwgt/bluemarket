package kr.co.ilck.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import kr.co.ilck.vo.WantVo;

public interface WantService {

	public String write(HttpSession session);
	public String write_ok(HttpServletRequest request, HttpSession session) throws Exception;
	public String list(HttpServletRequest request, Model model);
	public String content(HttpServletRequest request,Model model,HttpSession session);
	public String readnum(HttpServletRequest request);
	public String delete(HttpServletRequest request);
	public String update(HttpServletRequest request, Model model);
	public String update_ok(HttpServletRequest request,WantVo wvo,HttpSession session) throws IOException;
}
