package kr.co.ilck.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ilck.service.QnaService;
import kr.co.ilck.vo.QnaVo;

@Controller
public class QnaController {

	@Autowired
	@Qualifier("qs")
	private QnaService service;
	
	@RequestMapping("/qna/qna")
	public String qna(HttpSession session ,Model model, HttpServletRequest request)
	{
		return service.qna(session, model, request);
	}
	
	@RequestMapping("/qna/qna_write")
	public String qna_write(HttpSession session)
	{
		return service.qna_write(session);
	}
	
	@RequestMapping("/qna/qna_write_ok")
	public String qna_write_ok(HttpSession session, QnaVo qvo)
	{
		return service.qna_write_ok(session, qvo);
	}
	
	@RequestMapping("/qna/num_change")
	public String num_change(HttpSession session, HttpServletRequest request)
	{
		return service.num_change(session, request);
	}
	
	@RequestMapping("/qna/qna_delete")
	public String qna_delete(HttpSession session, HttpServletRequest request)
	{
		return service.qna_delete(session, request);
	}
	
	@RequestMapping("/qna/qna_update")
	public String qna_update(HttpSession session ,Model model, HttpServletRequest request)
	{
		return service.qna_update(session, model, request);
	}
	
	@RequestMapping("/qna/qna_update_ok")
	public String qna_update_ok(HttpSession session , HttpServletRequest request, QnaVo qvo)
	{
		return service.qna_update_ok(session, request, qvo);
	}
	
}










