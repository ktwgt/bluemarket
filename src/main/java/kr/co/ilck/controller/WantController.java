package kr.co.ilck.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ilck.service.WantService;
import kr.co.ilck.vo.WantVo;

@Controller
public class WantController {

	@Autowired
	@Qualifier("ws")
	private WantService service;
	
	@RequestMapping("/want/write")
	public String write(HttpSession session)
	{
		return service.write(session);
	}
	
	@RequestMapping("/want/write_ok")
	public String write_ok(HttpServletRequest request, HttpSession session) throws Exception
	{
		return service.write_ok(request, session);
	}
	
	@RequestMapping("/want/list")	
	public String list(HttpServletRequest request, Model model)
	{
		return service.list(request,model);
	}
	@RequestMapping("/want/content")
	public String content(HttpServletRequest request, Model model, HttpSession session)
	{
		return service.content(request,model,session);
	}
	@RequestMapping("/want/readnum")
	public String readnum(HttpServletRequest request)
	{
		return service.readnum(request);
	}
	@RequestMapping("/want/delete")
	public String delete(HttpServletRequest request)
	{
		return service.delete(request);
	}
	
	@RequestMapping("/want/update")
	public String update(HttpServletRequest request, Model model)
	{
		return service.update(request,model);
	}
	@RequestMapping("/want/update_ok")
	public String update_ok(HttpServletRequest request,WantVo wvo,HttpSession session) throws IOException
	{
		return service.update_ok(request,wvo,session);
	}
	

}
