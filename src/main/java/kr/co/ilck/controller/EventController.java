package kr.co.ilck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ilck.service.EventService;

@Controller
public class EventController {

	@Autowired
	@Qualifier("es")
	private EventService service;
	
	@RequestMapping("/event/eventlist")
	public String eventlist(Model model)
	{
		return service.eventlist(model);
	}
}
