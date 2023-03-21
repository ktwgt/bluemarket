package kr.co.ilck.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface BmapService {

	public String bmap(HttpSession session, Model model);

}
