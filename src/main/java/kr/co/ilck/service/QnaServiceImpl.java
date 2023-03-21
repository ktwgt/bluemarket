package kr.co.ilck.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.ilck.mapper.QnaMapper;
import kr.co.ilck.vo.QnaVo;

@Service
@Qualifier("qs")
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaMapper mapper;
	
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
	///////////////////////////////////
	
	
	@Override
	public String qna(HttpSession session, Model model, HttpServletRequest request) 
	{
		String userid=null;
		if(session.getAttribute("userid")!=null)
			userid=session.getAttribute("userid").toString();
		
		String msg=null;
		if(request.getParameter("msg")!=null)
			msg="1";
		
		int page=getPage(request);
		int pstart=getPstart(page);
		int chong=mapper.chong();		// parameter로 테이블 이름을 받아오는 방법으로 재사용 가능
		int pend=getPend(pstart, chong);
		
		int index=(page-1)*10;		// page번째 페이지에 보여줄 10개의 값
		
		ArrayList<QnaVo> qlist=mapper.qna(index);
		
		
		int[] QnaLen = new int[qlist.size()];
		
		for(int i=0; i<qlist.size(); i++)
		{
			String result=qlist.get(i).getResult().replace("\r\n", "<br>");
			qlist.get(i).setResult(result);
			
			QnaLen[i]=result.length();
		}
		
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("chong", chong);
		
		model.addAttribute("qlist", qlist);
		model.addAttribute("userid", userid);
		model.addAttribute("msg", msg);
		
		model.addAttribute("QnaLen", QnaLen);
		
		return "/qna/qna";
	}
	
	@Override
	public String qna_write(HttpSession session) 
	{
		if(admin_check(session))
		{
			return "/qna/qna_write";
		}
		else											// admin_check() 메소드를 통해서 userid=='admin'이 아닐경우 main으로 돌아간다
		{
			return "redirect:/main/main&warring=1";
		}
	}
	
	@Override
	public String qna_write_ok(HttpSession session, QnaVo qvo) 
	{
		if(admin_check(session))
		{
			int num=mapper.getQna_num();
			qvo.setNum(num);
			
			mapper.qna_write_ok(qvo);				
			
			return "redirect:/qna/qna";
		}
		else											// admin_check() 메소드를 통해서 userid=='admin'이 아닐경우 main으로 돌아간다
		{
			return "redirect:/main/main&warring=1";
		}
	}
	
	@Override
	public String num_change(HttpSession session, HttpServletRequest request) 
	{
		if(admin_check(session))
		{
			String id=request.getParameter("id");
			String id2=request.getParameter("id2");
			String page=request.getParameter("page");
			
			if(id2.equals("0"))
			{
				return "redirect:/qna/qna?msg=1&page="+page;
			}
			else
			{
				int imp1=mapper.getImp(id);
				int imp2=mapper.getImp(id2);
				
				if(imp1==imp2)
				{
					int num1=mapper.getNum(id);
					int num2=mapper.getNum(id2);
					
					mapper.num_change(num2, id);
					mapper.num_change(num1, id2);
					
					return "redirect:/qna/qna?page="+page;
				}
				else
				{
					return "redirect:/qna/qna?msg=1&page="+page;
				}
			}
			
		}
		else
		{
			return "redirect:/main/main&warring=1";
		}
	}

	
	@Override
	public String qna_delete(HttpSession session, HttpServletRequest request)
	{
		if(admin_check(session))
		{
			String id=request.getParameter("id");
			String page=request.getParameter("page");
			
			mapper.qna_delete(id);
			
			return "redirect:/qna/qna?page="+page;
		}
		else
		{
			return "redirect:/main/main&warring=1";
		}	
	}
	
	
	@Override
	public String qna_update(HttpSession session, Model model, HttpServletRequest request) 
	{
		if(admin_check(session))
		{
			String id=request.getParameter("id");
			String page=request.getParameter("page");
			
			QnaVo qvo=mapper.getQna_vo(id);
			
			model.addAttribute("qvo", qvo);
			model.addAttribute("page", page);
			
			return "/qna/qna_update";
		}
		else
		{
			return "redirect:/main/main&warring=1";
		}	
	}
	
	@Override
	public String qna_update_ok(HttpSession session, HttpServletRequest request, QnaVo qvo) 
	{
		if(admin_check(session))
		{
			String page=request.getParameter("page");
			
			mapper.qna_update_ok(qvo);
			
			return "redirect:/qna/qna?page="+page;
		}
		else
		{
			return "redirect:/main/main&warring=1";
		}
	}
	
}






