package kr.co.ilck.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MainService {
	
	public int getPage(HttpServletRequest request);
	
	public int getPstart(int page);
	
	public int getPend(int pstart, int chong);
	
	public String main(HttpServletRequest request, Model model);

	public String pro_search(Model model, HttpServletRequest request);
}
