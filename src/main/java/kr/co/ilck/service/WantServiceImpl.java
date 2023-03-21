package kr.co.ilck.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.ilck.mapper.WantMapper;
import kr.co.ilck.vo.WantVo;

@Service
@Qualifier("ws")
public class WantServiceImpl implements WantService {
	@Autowired
	private WantMapper mapper;
	
	@Override
	public String write(HttpSession session)
	{
		
		if(session.getAttribute("userid")==null)
		{
			return "redirect:/login/login";
		}
		else
		{
			return "/want/write";
		}
		
	}
	
	@Override
	public String write_ok(HttpServletRequest request, HttpSession session) throws Exception
	{
		String path=request.getRealPath("resources/want");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		
		String title=multi.getParameter("title");
		String content=multi.getParameter("content");
		String userid=session.getAttribute("userid").toString();
		String fname=multi.getFilesystemName("fname");
		int wprice=Integer.parseInt(multi.getParameter("wprice"));
		
		WantVo wvo=new WantVo();
		wvo.setTitle(title);
		wvo.setContent(content);
		wvo.setUserid(userid);
		wvo.setFname(fname);
		wvo.setWprice(wprice);
		
		mapper.write_ok(wvo);
		
		return "redirect:/want/list";
	}
	
	@Override
	public String list(HttpServletRequest request, Model model)
	{
		int page;
		if(request.getParameter("page")==null)
		{
			page=1;
		}
		else
		{
			page=Integer.parseInt(request.getParameter("page"));
		}
		int index=(page-1)*20;
		
		ArrayList<WantVo> list=mapper.list(index);
		for(int i=0;i<list.size();i++)
		{
			if(list.get(i).getTitle().length()>=12)
			{
			   String title=list.get(i).getTitle().substring(0,12)+"...";
			   list.get(i).setTitle(title);
			}
			if(list.get(i).getUserid().length()>=9)
			{
				String userid=list.get(i).getUserid().substring(0,9)+"...";
				list.get(i).setUserid(userid);
			}
		}
		model.addAttribute("list",list);
		
		int pstart=page/10;
		if(page%10 == 0)
			pstart--;
		pstart=pstart*10+1;
		int pend=pstart+9;
		
		int chong=mapper.getChong();
		
		if(pend>chong)
			pend=chong;
		
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("page",page);
		
		return "/want/list";
	}
	
	@Override
	public String content(HttpServletRequest request,Model model,HttpSession session)
	{
		String id=request.getParameter("id");
		WantVo wvo=mapper.content(id);
		model.addAttribute("wvo",wvo);
		
		return "/want/content";
	}
	
	@Override
	public String readnum(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		mapper.readnum(id);
		
		return "redirect:/want/content?id="+id;
	}
	
	@Override
	public String delete(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		mapper.delete(id);
		
		return "redirect:/mypage/mypage?ww=4";
	}
	@Override
	public String update(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		
		WantVo wvo=mapper.update(id);
		
		model.addAttribute("wvo",wvo);
		
		return "/want/update";
	}
	@Override
	public String update_ok(HttpServletRequest request,WantVo wvo,HttpSession session) throws IOException
	{

		String path=request.getRealPath("resources/want");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		
		int id=Integer.parseInt(multi.getParameter("id"));
		String title=multi.getParameter("title");
		String content=multi.getParameter("content");
		String userid=session.getAttribute("userid").toString();
		String fname=multi.getFilesystemName("fname");
		int wprice=Integer.parseInt(multi.getParameter("wprice"));
		
		WantVo wvo2=new WantVo();
		wvo2.setTitle(title);
		wvo2.setContent(content);
		wvo2.setUserid(userid);
		wvo2.setFname(fname);
		wvo2.setWprice(wprice);
		wvo2.setId(id);
		
		mapper.update_ok(wvo2);
		
		return "redirect:/want/content?id="+id;	
	}
}
