package kr.co.ilck.service;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.ilck.mapper.MainMapper;
import kr.co.ilck.vo.EventVo;
import kr.co.ilck.vo.MemberVo;
import kr.co.ilck.vo.PanmaeVo;


@Service
@Qualifier("ds")
public class MainServiceImpl implements MainService {

	@Autowired
	private MainMapper mapper;
	
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
	public String main(HttpServletRequest request, Model model)
	{
		ArrayList<PanmaeVo> plist=mapper.main();
		for(int i=0;i<plist.size();i++)
		{
			if(plist.get(i).getTitle().length()>=14)
			{
			   String title=plist.get(i).getTitle().substring(0,14)+"...";
			   plist.get(i).setTitle(title);
			}
		}
		ArrayList<EventVo> elist=mapper.eventlist();
		
		model.addAttribute("elist", elist);
		model.addAttribute("plist",plist);
		
		return "/main/main";
	}

	@Override
	public String pro_search(Model model, HttpServletRequest request) {
		
			String search="";
			if(request.getParameter("search")!=null)
				search=request.getParameter("search");
			
//			System.out.println(where+"/"+search+"/"+index);
		
//			ArrayList<PanmaeVo> plist=mapper.pro_search(search,index);
//			model.addAttribute("plist", plist);
			model.addAttribute("search", search);
//			model.addAttribute("pcode", "");
	
		return "redirect:/panmae/plist";
	}
	
}
