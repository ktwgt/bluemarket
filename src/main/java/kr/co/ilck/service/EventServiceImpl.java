package kr.co.ilck.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.ilck.mapper.EventMapper;
import kr.co.ilck.vo.EventVo;

@Service
@Qualifier("es")
public class EventServiceImpl implements EventService {

	@Autowired
	private EventMapper mapper;
	
	@Override
	public String eventlist(Model model)
	{
		ArrayList<EventVo> elist=mapper.eventlist();
		model.addAttribute("elist", elist);
		
		return "/event/eventlist";
	}
}
