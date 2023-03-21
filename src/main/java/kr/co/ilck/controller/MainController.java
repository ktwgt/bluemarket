package kr.co.ilck.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import kr.co.ilck.service.MainService;

@Controller
public class MainController {

	@Autowired
	@Qualifier("ds")
	private MainService service;
	
	@RequestMapping("/")
	public String home()
	{
		return "redirect:/main/main";
	}
	
	@RequestMapping("/main/main")
	public String main(HttpServletRequest request, Model model)
	{
		return service.main(request,model);
	}

	
	@RequestMapping("/main/pro_search")
	public String pro_search(Model model, HttpServletRequest request)
	{
		return service.pro_search(model,request);
	}
	
}
