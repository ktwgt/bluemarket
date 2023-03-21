package kr.co.ilck.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.ilck.mapper.BmapMapper;

@Service
@Qualifier("bs")
public class BmapServiceImpl implements BmapService {

	@Autowired
	private BmapMapper mapper;

	@Override
	public String bmap(HttpSession session, Model model) {
	

			model.addAttribute("plist", mapper.getBmap());
			
			return "/bmap/bmap";

	}
}
