package kr.co.ilck.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.ilck.vo.PanmaeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ilck.service.ManageService;

import java.io.IOException;

@Controller
public class ManageController {

    @Autowired
    @Qualifier("mp")
    private ManageService service;

    @RequestMapping("/manage/managelist")
    public String managelist(HttpSession session, Model model,HttpServletRequest request)
    {

        return service.managelist(session,model,request);
    }

   @RequestMapping("/manage/mcontent")//상품의 사진을 클릭했을시
    public String mcontent(HttpServletRequest request, Model model,HttpSession session)
    {
        return service.mcontent(request,model,session);
    }

    @RequestMapping("/manage/sellstate")
    public String sellstate(HttpServletRequest request, Model model, HttpSession session)
    {
        return service.sellstate(request, model,session);
    }

    @RequestMapping("manage/sustate")
    public String sustate(HttpServletRequest request, Model model, HttpSession session)
    {

        return service.sustate(request, model, session);
    }
    
    @RequestMapping("/manage/mupdate")
    public String mupdate(HttpServletRequest request, Model model)
    {
        return service.mupdate(request, model);
    }
    
    @RequestMapping("/manage/mdelete")
    public String mdelete(HttpServletRequest request,HttpSession session)
    {
        return service.mdelete(request,session);
    }

    @RequestMapping("/manage/mupdate_ok")
    public String mudpate_ok(HttpSession session,  HttpServletRequest request) throws IOException {
        return service.mupdate_ok(session, request);
    }







}
