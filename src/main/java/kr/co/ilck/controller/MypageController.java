package kr.co.ilck.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ilck.service.MypageService;
import kr.co.ilck.vo.*;

@Controller
public class MypageController {

	@Autowired
	@Qualifier("ms")
	private MypageService service;
	
	// 마이페이지
	@RequestMapping("/mypage/mypage")
	public String mypage(HttpSession session,Model model,HttpServletRequest request) throws IOException
	{
		return service.mypage(session,model,request);
	}
	// 다른 사람 페이지
	@RequestMapping("/mypage/shop")
	public String shop(HttpSession session,Model model,HttpServletRequest request) throws IOException
	{
		return service.shop(session,model,request);
	}
	// 찜 목록 삭제
	@RequestMapping("/mypage/wishdel")
	public String wishdel(HttpServletRequest request,Model model)
	{
		return service.wishdel(request,model);
	}
	// 판매글의 거래상태(판매등록, 판매진행, 판매완료)
	@RequestMapping("/mypage/chgstate")
	public String chgstate(HttpServletRequest request,Model model)
	{
		return service.chgstate(request,model);
	}
    @RequestMapping("/mypage/mupdate")
    public String mupdate(HttpServletRequest request, Model model)
    {
        return service.mupdate(request, model);
    }
    
    @RequestMapping("/mypage/mdelete")
    public String mdelete(HttpServletRequest request,HttpSession session)
    {
        return service.mdelete(request,session);
    }

    @RequestMapping("/mypage/mupdate_ok")
    public String mudpate_ok(HttpSession session,  HttpServletRequest request) throws IOException {
        return service.mupdate_ok(session, request);
    }
}
