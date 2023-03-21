package kr.co.ilck.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.ilck.mapper.GongjiMapper;
import kr.co.ilck.vo.GongjiVo;

@Service
@Qualifier("gs")
public class GongjiServiceImpl implements GongjiService {

	@Autowired
	private GongjiMapper mapper;
	
	@Override
	public boolean admin_check(HttpSession session)
	{
		if(session.getAttribute("userid").toString().equals("admin"))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	///////////////////////////////////		페이징 처리 메소드
	
	@Override
	public int getPage(HttpServletRequest request)
	{
		int page=1;
		if(request.getParameter("page")!=null)
			page=Integer.parseInt(request.getParameter("page"));
		
		return page;
	}
	
	@Override
	public int getPstart(int page) 
	{
		int pstart=page/10;
		if(page%10==0)
			pstart--;
		
		pstart=pstart*10+1;
		
		return pstart;
	}
	
	@Override
	public int getPend(int pstart, int chong) 
	{
		int pend=pstart+9;
		if(pend>=chong)
			pend=chong;
		
		return pend;
	}
	
	@Override
	public String gongji(HttpSession session, Model model, HttpServletRequest request) 
	{
		String userid=null;
		
		if(session.getAttribute("userid")!=null)
			userid=session.getAttribute("userid").toString();	
		
		int page=getPage(request);
		int pstart=getPstart(page);
		int chong=mapper.chong();		// parameter로 테이블 이름을 받아오는 방법으로 재사용 가능
		int pend=getPend(pstart, chong);
		
		int index=(page-1)*10;		// page번째 페이지에 보여줄 10개의 값

		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		
		
		ArrayList<GongjiVo> glist=mapper.gongji(index);
		model.addAttribute("glist", glist);
		model.addAttribute("userid", userid);
		
		return "/gongji/gongji";
	}
	
	
	@Override
	public String readnum(HttpServletRequest request) 
	{
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		
		mapper.readnum(id);
		
		return "redirect:/gongji/gongji_content?page="+page+"&id="+id;
	}
	
	
	@Override
	public String gongji_content(HttpSession session, Model model, HttpServletRequest request)
	{
		String userid=null;
			if(session.getAttribute("userid")!=null)
				userid=session.getAttribute("userid").toString();
		
		
		String id=request.getParameter("id");
		String page=request.getParameter("page");
				
		GongjiVo gvo=mapper.gongji_content(id);
		
		String content=gvo.getContent().replace("\r\n", "<br>");
		gvo.setContent(content);
		
		model.addAttribute("gvo", gvo);
		model.addAttribute("page", page);
		model.addAttribute("userid", userid);
		
		return "/gongji/gongji_content";
	}
	
	@Override
	public String gongji_delete(HttpSession session, HttpServletRequest request) 
	{
		if(admin_check(session))
		{
			String id=request.getParameter("id");
			String page=request.getParameter("page");
			
			mapper.gongji_delete(id);
			
			return "redirect:gongji?id="+id+"&page="+page;
		}
		else
		{
			return "redirect:/main/main&warring=1";
		}
	}
	
	@Override
	public String gongji_update(HttpSession session, Model model, HttpServletRequest request) 
	{
		if(admin_check(session))
		{
			String id=request.getParameter("id");
			String page=request.getParameter("page");
			
			GongjiVo gvo=mapper.gongji_content(id);					// gongji_content() 메소드를 재사용, 똑같이 gongji 테이블의 한 레코드를 불러옴
			
//			String content=gvo.getContent().replace("\r\n", "<br>");	
//			gvo.setContent(content);
			
			model.addAttribute("gvo", gvo);
			model.addAttribute("page", page);
			
			return "/gongji/gongji_update";
		}
		else
		{
			return "redirect:/main/main&warring=1";
		}
	}
	
	@Override
	public String gongji_update_ok(HttpSession session, HttpServletRequest request, GongjiVo gvo) 
	{
		if(admin_check(session))
		{
			String page=request.getParameter("page");
			String id=gvo.getId()+"";
			
			mapper.gongji_update_ok(gvo);
			
			return "redirect:/gongji/gongji_content?page="+page+"&id="+id;
		}
		else
		{
			return "redirect:/main/main&warring=1";
		}
	}
	
	@Override
	public String gongji_write(HttpSession session) 
	{
		if(admin_check(session))
		{
			return "/gongji/gongji_write";
		}
		else
		{
			return "redirect:/main/main&warring=1";
		}
	}
	
	@Override
	public String gongji_write_ok(HttpSession session, GongjiVo gvo) 
	{
		if(admin_check(session))
		{
			mapper.gongji_write_ok(gvo);
			
			return "redirect:/gongji/gongji";
		}
		else
		{
			return "redirect:/main/main&warring=1";
		}
	}
	
	
}














