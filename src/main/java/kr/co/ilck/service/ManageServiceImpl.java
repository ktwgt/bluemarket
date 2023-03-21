package kr.co.ilck.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import kr.co.ilck.vo.PanmaeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.ilck.mapper.ManageMapper;

@Service
@Qualifier("mp")
public class ManageServiceImpl implements ManageService {
   
   @Autowired
   private ManageMapper mapper;
   
   @Override
   public String managelist(HttpSession session, Model model, HttpServletRequest request)
   {
      
      String userid = session.getAttribute("userid").toString();
      //System.out.println(userid);
      if(userid==null)
      {
         return "redirect:/main/main";
      }
      else
      {
         String search = "";

         if (request.getParameter("search") != null)
            search = request.getParameter("search");
         else if(request.getParameter("search") == null)
            search = "";
         model.addAttribute("search", search);

         model.addAttribute("mlist", mapper.msearch(userid,search));
         
         return "/manage/managelist";
      }
            
   }


   @Override
   public String mcontent(HttpServletRequest request, Model model, HttpSession session)
   {
      String userid = session.getAttribute("userid").toString();
      if(userid==null)
      {
         return "redirect:/main/main";
      }
      else
      {
         String pcode = request.getParameter("pcode");
         PanmaeVo pvo = mapper.mcontent(pcode);
         model.addAttribute("pvo",pvo);

         return "/panmae/pcontent";

      }


   }
   @Override
   public String sustate(HttpServletRequest request, Model model, HttpSession session)
   {
      String userid = session.getAttribute("userid").toString();
      int num = Integer.parseInt(request.getParameter("num"));

      switch(num)
      {
         case 10: model.addAttribute("mlist",mapper.getten(userid)); break;
         case 20: model.addAttribute("mlist",mapper.getthirty(userid)); break;
         case 30: model.addAttribute("mlist",mapper.getfifty(userid)); break;
         default: model.addAttribute("mlist",mapper.managelist(userid));
      }

      return "/manage/managelist";
   }


   @Override
   public String sellstate(HttpServletRequest request, Model model, HttpSession session)
   {
      String userid = session.getAttribute("userid").toString();

      int state =  Integer.parseInt(request.getParameter("state"));

      switch (state)
      {
         case 1 : model.addAttribute("mlist", mapper.getpanmae(userid)); break;
         case 2 : model.addAttribute("mlist" , mapper.getreserv(userid)); break;
         case 3 : model.addAttribute("mlist", mapper.getcomplete(userid)); break;
         default: model.addAttribute("mlist",mapper.managelist(userid));

      }

         return "/manage/managelist";
   }

   @Override
   public String mupdate(HttpServletRequest request, Model model)
   {
      String pcode = request.getParameter("pcode");

      PanmaeVo pvo = mapper.mupdate(pcode);

      model.addAttribute("pvo",pvo);
      return "/manage/mupdate";
   }
   @Override
   public String mupdate_ok(HttpSession session, HttpServletRequest request) throws IOException {
      String userid = session.getAttribute("userid").toString();


      if (userid == null)
      {
         return "redirect:/login/login";
      }
      else
      {

         String path=request.getRealPath("resources/product");
         int size=1024*1024*10;
         MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());

         String cimg = multi.getFilesystemName("cimg");
         String pimg = multi.getFilesystemName("pimg");
         String title = multi.getParameter("title");
         String pcode = multi.getParameter("pcode");
         int price = Integer.parseInt(multi.getParameter("price"));
         String selltime = multi.getParameter("selltime");
         String loca = multi.getParameter("loca");
         int pstate = Integer.parseInt(multi.getParameter("pstate"));
         String content  = multi.getParameter("content");


         PanmaeVo pvo=new PanmaeVo();

         pvo.setUserid(userid);
         pvo.setCimg(cimg);
         pvo.setPimg(pimg);
         pvo.setPcode(pcode);
         pvo.setTitle(title);
         pvo.setPrice(price);
         pvo.setSelltime(selltime);
         pvo.setLoca(loca);
         pvo.setPstate(pstate);
         pvo.setContent(content);


         mapper.mupdate_ok(pvo);


         return "redirect:/manage/managelist";

      }

   }


   @Override
   public String mdelete(HttpServletRequest request , HttpSession session) {
      String userid = session.getAttribute("userid").toString();

      if (userid == null)
      {
         return "redirect:/main/main";
      }
      else
      {
         String pcode = request.getParameter("pcode");
         mapper.mdelete(pcode);

         return "redirect:/manage/managelist";

      }

   }



}