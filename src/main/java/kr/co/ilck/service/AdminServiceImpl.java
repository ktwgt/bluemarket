package kr.co.ilck.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.ilck.mapper.AdminMapper;
import kr.co.ilck.vo.EventVo;
import kr.co.ilck.vo.GongjiVo;
import kr.co.ilck.vo.MemberVo;
import kr.co.ilck.vo.PanmaeVo;
import kr.co.ilck.vo.SingoVo;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper mapper;

	
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
	public String admin_page(HttpSession session) 
	{
		if(admin_check(session))
		{
			return "/admin/admin_page";
		}
		else
		{
			return "redirect:/main/main&warring=1";
		}
	}

	@Override
	public String member_manage(HttpSession session, Model model, HttpServletRequest request) 
	{
		if(admin_check(session))
		{
			String tableName="member";
			
			int page=getPage(request);
			int pstart=getPstart(page);
			int chong=mapper.chong(tableName);		// parameter로 테이블 이름을 받아오는 방법으로 재사용 가능
			int pend=getPend(pstart, chong);
			
			int index=(page-1)*10;		// page번째 페이지에 보여줄 10개의 값

			model.addAttribute("page", page);
			model.addAttribute("pstart", pstart);
			model.addAttribute("pend", pend);
			model.addAttribute("chong", chong);
			
			
			
			if(request.getParameter("clk")!=null)		// 참이면 search를 통해서 들어온 값
			{
				String where=request.getParameter("where");
				String search="";
				if(request.getParameter("search")!=null)
					search=request.getParameter("search");
				
//				System.out.println(where+"/"+search+"/"+index);
			
				ArrayList<MemberVo> mlist=mapper.member_search(where, search,index);
				model.addAttribute("mlist", mlist);
				
				model.addAttribute("where", where);
				model.addAttribute("search", search);
				model.addAttribute("clk", "1");
			}
			else										// 거짓이면 주소를 통해서 들어온 값
			{
				ArrayList<MemberVo> mlist=mapper.member_manage(index);
				model.addAttribute("mlist", mlist);
			}
		
			return "/admin/member_manage";
		}
		else											// admin_check() 메소드를 통해서 userid=='admin'이 아닐경우 main으로 돌아간다
		{
			return "redirect:/main/main&warring=1";
		}
	}
	
	
	@Override
	public String member_profile(HttpSession session, Model model, HttpServletRequest request) 
	{
		if(admin_check(session))
		{
			String id=request.getParameter("id");
			MemberVo mvo=mapper.member_profile(id);
			String userid=mvo.getUserid();
			
			HashMap<String, String> map=mapper.member_guel(userid);
			
			model.addAttribute("mvo", mvo);
			model.addAttribute("map", map);
			return "admin/member_profile";
		}
		else											// admin_check() 메소드를 통해서 userid=='admin'이 아닐경우 main으로 돌아간다
		{
			return "redirect:/main/main&warring=1";
		}
	}
	
	@Override
	public String member_state(HttpSession session, HttpServletRequest request) 
	{
		String id=request.getParameter("id");
		int state=Integer.parseInt(request.getParameter("state"));
		
		mapper.member_state(state,id);
		
		return "redirect:/admin/member_profile?id="+id;
	}
	
	
	@Override
	public String singo_manage(HttpSession session, Model model, HttpServletRequest request) 
	{
		if(admin_check(session))
		{
			String tableName="singo";
			int singo_table_state=100;				// 임의의 값 지정
			int chong;	
			
			
			if( request.getParameter("singo_table_state")==null || Integer.parseInt(request.getParameter("singo_table_state"))==0)
			{
				chong=mapper.chong(tableName);
//				System.out.println(chong+"/ 1");
			}
			else if(Integer.parseInt(request.getParameter("singo_table_state"))==1)
			{
				singo_table_state=0;									// singo 테이블에서 state==0인 값들만 보기 (처리전인 것)
				
				chong=mapper.chong2(tableName,singo_table_state);
//				System.out.println(chong+"/ 2");
			}
			else if(Integer.parseInt(request.getParameter("singo_table_state"))==2)
			{
				singo_table_state=1;									// singo 테이블에서 state==1인 값들만 보기 (처리완료된 것)
				
				chong=mapper.chong2(tableName,singo_table_state);
//				System.out.println(chong+"/ 3");
			}
			else
			{
				chong=mapper.chong(tableName);
//				System.out.println(chong+"/ 4");
			}
			
			
/////////////////////////////////////////////////////		paging 구현
			
			int page=getPage(request);
			int pstart=getPstart(page);
//			int chong=mapper.chong(tableName);		// parameter로 테이블 이름을 받아오는 방법으로 재사용 가능
			int pend=getPend(pstart, chong);
			
			int index=(page-1)*10;		// page번째 페이지에 보여줄 10개의 값

			model.addAttribute("page", page);
			model.addAttribute("pstart", pstart);
			model.addAttribute("pend", pend);
			model.addAttribute("chong", chong);

/////////////////////////////////////////////////////		
			
			System.out.println(singo_table_state);
			
			int state;					// singo_manage.jsp 에서 회원상태를 확인하기 위함 
			
			if(singo_table_state==0 || singo_table_state==1)
			{
				ArrayList<SingoVo> slist=mapper.singo_manage2(singo_table_state, index);
				
				for(int i=0; i<slist.size(); i++)	// singo_manage.jsp 에서 회원상태를 확인하기 위함, member 테이블의 state를 slist의 state2에 담는다
				{
					state=mapper.member_state_value(slist.get(i).getSingo_userid());
					slist.get(i).setState2(state);
				}

				model.addAttribute("slist", slist);
				model.addAttribute("singo_table_state", singo_table_state+1);
			}
			else
			{
				ArrayList<SingoVo> slist=mapper.singo_manage(index);
				
				for(int i=0; i<slist.size(); i++)	// singo_manage.jsp 에서 회원상태를 확인하기 위함, member 테이블의 state를 slist의 state2에 담는다
				{
					state=mapper.member_state_value(slist.get(i).getSingo_userid());
					slist.get(i).setState2(state);
				}
				
				model.addAttribute("slist", slist);
				model.addAttribute("singo_table_state", 0);
			}		
			
			return "/admin/singo_manage";
		}
		else											// admin_check() 메소드를 통해서 userid=='admin'이 아닐경우 main으로 돌아간다
		{
			return "redirect:/main/main&warring=1";
		}
	}

	
	@Override
	public String singo_profile(HttpSession session, Model model, HttpServletRequest request) 
	{
		if(admin_check(session))
		{
			String id=request.getParameter("id");					// singo 테이블의 id
			SingoVo svo=mapper.singo_profile(id);
			int state=mapper.member_state_value(svo.getSingo_userid());	// member 테이블의 state값(회원 상태)을 확인하는 mapper, 회원 탈퇴 상태일 시, singo 테이블의 데이터를 삭제할 때 사용하기 위함
																	// svo.getSingo_userid() == member 테이블의 userid 와 같음
			
			String pcode=mapper.getPanmae_pcode(svo.getPanmae_id());
			
			model.addAttribute("state", state);
			model.addAttribute("svo", svo);
			model.addAttribute("pcode", pcode);
			
			return "/admin/singo_profile";
		}
		else											// admin_check() 메소드를 통해서 userid=='admin'이 아닐경우 main으로 돌아간다
		{
			return "redirect:/main/main&warring=1";
		}
		
	}
	
	
	@Override
	public String singo_up(HttpSession session, HttpServletRequest request)
	{
		if(admin_check(session))
		{				
			String id=request.getParameter("id");					// singo 테이블의 id
			String singo_userid=request.getParameter("singo_userid");		// singo 테이블의 singo_userid , member 테이블의 userid
			String panmae_id=request.getParameter("panmae_id");		// singo 테이블의 panmae_id, panmae 테이블의 id
			
			mapper.guel_stop(panmae_id);							// panmae 테이블의 신고처리, 신고된 판매글로 변경 panmae 테이블의 singo_state 1 증가
			mapper.singo_num(singo_userid);								// singo 테이블의 singo_num 1 증가
			
			mapper.singo_state_up(id);								// singo 테이블의 state를 1증가 시켜, 처리완료 상태로 만듬
			
//			mapper.singo_del(id);									// singo_del(); 을 쓰면 안됨! singo 테이블에서 데이터 자체를 없애는 것이기 때문에 어떤 글이 신고되었는지 후에 확인할 수 없어짐
			
			
			if(mapper.member_state_chk(singo_userid))					// member테이블의 singo_num이 3 이상인지 확인, 3 이상이면 true
			{
//				System.out.println("oo");							// 작동 확인
				mapper.member_state_up(singo_userid);					// member 테이블의 state를 1증가시켜 임시정지 상태로 만든다.
			}
			else
			{
//				System.out.println("xx");							// 작동확인
			}
			return "redirect:/admin/singo_manage";
		}
		else											// admin_check() 메소드를 통해서 userid=='admin'이 아닐경우 main으로 돌아간다
		{
			return "redirect:/main/main&warring=1";
		}
	}
	
	@Override
	public String singo_del(HttpSession session, HttpServletRequest request) 
	{
		if(admin_check(session))
		{
			String id=request.getParameter("id");
			mapper.singo_del(id);
			
			return "redirect:/admin/singo_manage";
		}
		else											// admin_check() 메소드를 통해서 userid=='admin'이 아닐경우 main으로 돌아간다
		{
			return "redirect:/main/main&warring=1";
		}
	}
	
	
	
	@Override
	public String event_manage(HttpSession session, Model model) 
	{
		if(admin_check(session))
		{
			ArrayList<EventVo> elist=mapper.event_manage();
			
			for(int i=0; i<elist.size(); i++)
			{
//				System.out.println(elist.get(i).getTitle()+"////"+elist.get(i).getImg());
			}
			
			model.addAttribute("elist", elist);
			
			
			return "/admin/event_manage";
		}
		else
		{		
			return "redirect:/main/main&warring=1";
		}
	}
	
	
	
	@Override
	public String event_delete(HttpSession session, HttpServletRequest request) 
	{
		if(admin_check(session))
		{
			String[] del_img=request.getParameter("del_img").split(",");
			String[] del_id=request.getParameter("del_id").split(",");
			int len=del_img.length;
			
			String path=request.getRealPath("/resources/event");
			
			for(int i=0; i<len; i++)
			{
				File file=new File(path+"/"+del_img[i]);
				if(file.exists())
					file.delete();
			}
			
			for(int i=0; i<len; i++)
			{
				mapper.event_delete(del_id[i]);
			}
			
			
			return "redirect:/admin/event_manage";
		}
		else
		{		
			return "redirect:/main/main&warring=1";
		}
	}
	
	
	@Override
	public String event_add(HttpSession session) 
	{
		if(admin_check(session))
		{
			return "/admin/event_add";
		}
		else
		{		
			return "redirect:/main/main&warring=1";
		}
	}
	
	
	@Override
	public String event_add_ok(HttpSession session, HttpServletRequest request) throws Exception 
	{
		if(admin_check(session))
		{
			String path=request.getRealPath("/resources/event");
			int size=1024*1024*10;
			
			MultipartRequest multi=new MultipartRequest(request, path, size, "utf-8",
					new DefaultFileRenamePolicy());
			
			String title=multi.getParameter("title");
			String img=multi.getFilesystemName("img");
			
			mapper.event_add_ok(title, img);
			
			return "redirect:/admin/event_manage";
		}
		else
		{		
			return "redirect:/main/main&warring=1";
		}
	}
	
	
}












