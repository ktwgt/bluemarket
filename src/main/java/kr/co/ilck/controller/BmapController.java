package kr.co.ilck.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ilck.service.BmapService;

@Controller
public class BmapController {
	
	@Autowired
	@Qualifier("bs")
	private BmapService service;
	
	@RequestMapping("/bmap/bmap")
	public String bmap(HttpSession session, Model model)
	{
		return service.bmap(session,model);
	}
}
