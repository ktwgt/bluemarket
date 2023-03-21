package kr.co.ilck.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ilck.service.GongjiService;
import kr.co.ilck.vo.GongjiVo;

@Controller
public class GongjiController {

	@Autowired
	@Qualifier("gs")
	private GongjiService service;
	
	@RequestMapping("/gongji/gongji")
	public String gongji(HttpSession session, Model model, HttpServletRequest request)
	{
		return service.gongji(session, model, request);
	}
	
	@RequestMapping("/gongji/readnum")
	public String readnum(HttpServletRequest request)
	{
		return service.readnum(request);
	}
	
	@RequestMapping("/gongji/gongji_content")
	public String gongji_content(HttpSession session, Model model, HttpServletRequest request)
	{
		return service.gongji_content(session, model, request);
	}
	
	@RequestMapping("/gongji/gongji_delete")
	public String gongji_delete(HttpSession session, HttpServletRequest request)
	{
		return service.gongji_delete(session, request);
	}
	
	@RequestMapping("/gongji/gongji_update")
	public String gongji_update(HttpSession session, Model model, HttpServletRequest request)
	{
		return service.gongji_update(session, model, request);
	}
	
	@RequestMapping("/gongji/gongji_update_ok")
	public String gongji_udpate_ok(HttpSession session, HttpServletRequest request, GongjiVo gvo)
	{
		return service.gongji_update_ok(session, request, gvo);
	}
	
	@RequestMapping("/gongji/gongji_write")
	public String gongji_update(HttpSession session)
	{
		return service.gongji_write(session);
	}
	
	@RequestMapping("/gongji/gongji_write_ok")
	public String gongji_write_ok(HttpSession session, GongjiVo gvo)
	{
		return service.gongji_write_ok(session, gvo);
	}
	
}









