package kr.co.ilck.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ilck.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.ilck.mapper.PanmaeMapper;

@Service
@Qualifier("pm")
public class PanmaeServiceImpl implements PanmaeService {

   @Autowired
   private PanmaeMapper mapper;



   @Override
   public String panmae(HttpSession session, Model model)
   {
      if(session.getAttribute("userid")==null)
      {
         return "redirect:../main/main";
      }
      else
      {
         model.addAttribute("dae", mapper.getDae());
         return "/panmae/pnew";
      }
   }


   @Override
   public void getJung(HttpServletRequest request, PrintWriter out) {
      String daecode=request.getParameter("daecode");
      ArrayList<JungVo> jung=mapper.getJung(daecode);

      String str="<option> "+URLEncoder.encode("중분류")+ "</option>";
      for(int i=0;i<jung.size();i++)
      {
        str=str+"<option value='"+jung.get(i).getCode()+"'> "+URLEncoder.encode(jung.get(i).getName())+" </option>";
      }

      out.print(str);
   }

   @Override
   public void getSo(HttpServletRequest request, PrintWriter out) {
      String daejung=request.getParameter("daejung");
      ArrayList<SoVo> so=mapper.getSo(daejung);

      String str="<option> "+URLEncoder.encode("선택")+"</option>";

      for(int i=0;i<so.size();i++)
      {
         str=str+"<option value='"+so.get(i).getCode()+"'> "+URLEncoder.encode(so.get(i).getName())+" </option>";
      }

      out.print(str);
   }

   @Override
   public void getCode(HttpServletRequest request, PrintWriter out)
   {
      String pcode=request.getParameter("pcode");
      out.print( mapper.getCode(pcode));

   }

   @Override
   public String panmae_ok(HttpSession session , HttpServletRequest request) throws IOException
   {
	   String userid;
	   if(session.getAttribute("userid")==null)
	   {
		   return "redirect:/main/main";
	   }
	   else
	   {
		   userid = session.getAttribute("userid").toString();


      String path=request.getRealPath("resources/product");
      int size=1024*1024*10;
      MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());

      String cimg = multi.getFilesystemName("cimg");
      String pimg = multi.getFilesystemName("pimg");
      String title = multi.getParameter("title");
      int price = Integer.parseInt(multi.getParameter("price"));
      String pcode = multi.getParameter("pcode");
      String selltime = multi.getParameter("selltime");
      String loca = multi.getParameter("loca");
      int pstate = Integer.parseInt(multi.getParameter("pstate"));
      String content  = multi.getParameter("content");



      PanmaeVo pvo=new PanmaeVo();

      pvo.setUserid(userid);
      pvo.setCimg(cimg);
      pvo.setPimg(pimg);
      pvo.setTitle(title);
      pvo.setPrice(price);
      pvo.setPcode(pcode);
      pvo.setSelltime(selltime);
      pvo.setLoca(loca);
      pvo.setPstate(pstate);
      pvo.setContent(content);

      mapper.levp_up(userid);
      mapper.panmae_ok(pvo);

      return "redirect:/panmae/pcontent?pcode="+pcode;

      }

   }

   @Override
   public String readnum(HttpServletRequest request)
   {
      String pcode = request.getParameter("pcode");
      mapper.readnum(pcode);

      return "redirect:/panmae/pcontent?pcode="+pcode;

   }

   @Override
   public String plist(HttpServletRequest request, Model model) {
      String pcode=request.getParameter("pcode");
      String userid=request.getParameter("userid");
      
      model.addAttribute("fpcode", pcode);
      
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
      
      String search="";
      
      if(request.getParameter("search")==null || request.getParameter("search").length()==0 )
      {
    	  String order=request.getParameter("order");
    	  
    	  ArrayList<PanmaeVo> plist=mapper.plist(pcode,index);
    	  for(int i=0;i<plist.size();i++)
  		  {
    		  if(plist.get(i).getTitle().length()>=14)
  			  {
    			  String title=plist.get(i).getTitle().substring(0,14)+"...";
    			  plist.get(i).setTitle(title);
  			  }
  		  }
          model.addAttribute("plist",plist);
      }
      else if(userid !=null)
      {
    	  search=request.getParameter("search");
    	  
    	  ArrayList<PanmaeVo> plist=mapper.userid_search(search,index);
    	  for(int i=0;i<plist.size();i++)
  		  {
    		  if(plist.get(i).getTitle().length()>=14)
  			  {
    			  String title=plist.get(i).getTitle().substring(0,14)+"...";
    			  plist.get(i).setTitle(title);
  			  }
  		  }
    	  model.addAttribute("plist", plist);
      }
      else
      {
    	  search=request.getParameter("search");
    	  
    	  ArrayList<PanmaeVo> plist=mapper.pro_search(search,index);
    	  for(int i=0;i<plist.size();i++)
  		  {
    		  if(plist.get(i).getTitle().length()>=14)
  			  {
    			  String title=plist.get(i).getTitle().substring(0,14)+"...";
    			  plist.get(i).setTitle(title);
  			  }
  		  }
    	  model.addAttribute("plist", plist);
      }

      int pstart=page/10;
      if(page%10 == 0)
         pstart--;
      pstart=pstart*10+1;
      int pend=pstart+9;

      int chong=mapper.getChong(pcode);

      if(pend>chong)
         pend=chong;
      
      model.addAttribute("search", search);
      model.addAttribute("pstart",pstart);
      model.addAttribute("pend",pend);
      model.addAttribute("chong",chong);
      model.addAttribute("page",page);
      model.addAttribute("pcode",pcode);
      return "/panmae/plist";
   }

   @Override
   public String pcontent(HttpServletResponse response, HttpServletRequest request, Model model, HttpSession session)
   {

         String pcode = request.getParameter("pcode");

         int count = mapper.getwish(pcode);
         model.addAttribute("count",count);

         PanmaeVo pvo = mapper.pcontent(pcode);
         model.addAttribute("pvo",pvo);
         
         String puserid=pvo.getUserid();

         int countpcode = mapper.getcpcode(puserid);
         // System.out.println(countpcode+" "+puserid);
         model.addAttribute("countpcode",countpcode);

         ArrayList<PanmaeVo> cimg = mapper.getcimg(pcode.substring(0,7));

         model.addAttribute("cimg",cimg);


         ArrayList<PanmaeVo> twoimgs = mapper.getimgs(puserid);
         model.addAttribute("twoimgs",twoimgs);

         Cookie[] cookie=request.getCookies();  
         
         String imsi=null;
         // 읽어온 쿠키중에서 작업할 쿠키변수 => pcode
         for(int i=0;i<cookie.length;i++) // Cookie배열의 모든 값을 다 열람하겠다 getName() , getValue()
         {   
            // getName()이 pcode인 쿠키의 getValue()
            if( cookie[i].getName().equals("pcode") )
            {
               //System.out.println("inn");
               imsi=cookie[i].getValue(); // 지금 보는 상품을 제외한 이전에 본 상품만 존재
               
               // 현재 보는 상품의 pcode를 추가하여 저장
               if(imsi.indexOf(pcode) == -1) // 현재보는 상품이 imsi라는 문자열 변수에 존재하지 않는다면
               {
                  imsi=imsi+pcode+"/";
               }
               
               // 하나의 상품을 추가 했다면 imsi라는 문자열에 상품이 몇개? 
                  int len=imsi.split("/").length; // 
               if(len > 3)  // 상품이 3개이상 => 4개
               {
                  int n=imsi.indexOf("/");
                  imsi=imsi.substring(n+1);  // 기존의 상품 + 현재보는 상품 으로 3개 이하의 상품코드를 가진다..
               }
               
               // 변경된 imsi를 쿠키변수 pcode에 저장
               Cookie cookie2=new Cookie("pcode",imsi);
               cookie2.setMaxAge(600);
               response.addCookie(cookie2);
            }
         }

          if(imsi==null) // pcode값이 없다면 현재상품만 추가하여  쿠키변수에 저장
          {
             imsi=pcode+"/"; // 현재 상품을 imsi라는 변수에 저장
             Cookie cookie2=new Cookie("pcode",imsi);
             cookie2.setMaxAge(600);
             response.addCookie(cookie2);
          }
         //System.out.println(imsi);
         
         // imsi라는 문자열에 있는 pcode를 이용하여 해당 그림파일의 이름을 가져와서 view에 전달
         String[] pcode2=imsi.split("/"); 
         ArrayList<PanmaeVo> plist2=new ArrayList<PanmaeVo>();
         for(int i=0;i<pcode2.length;i++)
         {
            PanmaeVo pvo2=mapper.getNow(pcode2[i]); 
            plist2.add(pvo2);
         }
         model.addAttribute("plist2",plist2); // 쿠키변수에 있는 상품코드를 이용하여 그림파일명,상품코드를 view에 전달
         
         return "/panmae/pcontent";




   }

   @Override
   public void wishadd(HttpSession session, HttpServletRequest request, PrintWriter out)
   {
      int pid = Integer.parseInt(request.getParameter("pid"));
      String userid = session.getAttribute("userid").toString();


            if(mapper.getwishcount(pid, userid)==0) {
               mapper.wishadd(pid, userid);
               out.print("0");
            }
            else if(mapper.getwishcount(pid, userid)!=0)
            {
               out.print("1");
            }



   }

   @Override
   public String liststate(HttpServletRequest request,Model model)
   {
      String pcode = request.getParameter("pcode");
      String search = request.getParameter("search");
      
      model.addAttribute("fpcode", pcode);
      model.addAttribute("search", search);
      int n = Integer.parseInt(request.getParameter("n"));


         String imsi = "";

         if(n==2)
         {
            imsi= " price asc";

         }
         else if(n==3)
         {
            imsi = " price desc";
         }
         else if(n==4)
         {
            imsi = " readnum desc";
         }
         else {
            imsi = " id desc";

         }
         ArrayList<PanmaeVo> plist = mapper.desc(pcode , search, imsi);
         for(int i=0;i<plist.size();i++)
 		  {
   		  if(plist.get(i).getTitle().length()>=14)
 			  {
   			  String title=plist.get(i).getTitle().substring(0,14)+"...";
   			  plist.get(i).setTitle(title);
 			  }
 		  }
         model.addAttribute("plist",plist);


      return "/panmae/plist";



   }
   
   @Override
 	public String singo_insert(HttpSession session, HttpServletRequest request, Model model) 
 	{
 	   String userid;
 	   String panmae_id;
 	   String singo_userid;
 	   
 	   if(session.getAttribute("userid")!=null)
 		   userid=session.getAttribute("userid").toString();
 	   else
 		   return "redirect:/main/main";
 	   
 	   if(request.getParameter("panmae_id")!=null && request.getParameter("singo_userid")!=null)
 	   {
 		   panmae_id=request.getParameter("panmae_id");
 		   singo_userid=request.getParameter("singo_userid");
 	   }
 	   else
 		   return "redirect:/main/main";
 	   
 	   
 	   model.addAttribute("panmae_id", panmae_id);
 	   model.addAttribute("singo_userid", singo_userid);
 	   model.addAttribute("userid", userid);   
 	   
 	   return "/panmae/singo_insert";
 	}
    
    @Override
 	public String singo_insert_ok(HttpServletRequest request, SingoVo svo)
 	{
 	   	String pcode=mapper.pcontent2((int)svo.getPanmae_id());
//		System.out.println(svo.getPanmae_id()+"/"+svo.getSingo_userid()+"/"+svo.getUserid()+"/"+svo.getContent());
 	   
	   mapper.singo_insert_ok(svo);
 	   
 	   return "redirect:/panmae/pcontent?pcode="+pcode;
 	}

   }


   
