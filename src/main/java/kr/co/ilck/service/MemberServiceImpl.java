package kr.co.ilck.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.ilck.mapper.MemberMapper;
import kr.co.ilck.vo.MemberVo;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	// 회원가입 실행
	@Override
	public String member_input_ok(MemberVo mvo)
	{
		mapper.member_input_ok(mvo);
		return "redirect:../login/login";
	}
	// 아이디 중복확인 실행
	@Override
	public void userid_check(HttpServletRequest request,PrintWriter out) 
	{
		String userid=request.getParameter("userid");
		out.print(mapper.userid_check(userid));
	}
	// 이메일 중복확인 실행
	@Override
	public void email_check(HttpServletRequest request,PrintWriter out)
	{
		String email=request.getParameter("email");
		out.print(mapper.email_check(email));
	}
	/* 회원정보 보기 => 마이페이지에 통합
	@Override
	public String member_view(HttpSession session, Model model) {
		if(session.getAttribute("userid")==null)
			return "redirect:/login/login";
		else
		{
		String userid=session.getAttribute("userid").toString();
		model.addAttribute("mvo", mapper.member_view(userid));
		
		return "/member/member_view";
		}
	}
	*/
	// 회원정보 수정 입력폼
	@Override
	public String member_edit(HttpSession session, Model model) {
		String userid=session.getAttribute("userid").toString();
		model.addAttribute("mvo",mapper.member_edit(userid));
		return "/member/member_edit";
	}
	// 회원정보 수정 실행
	@Override
	public String member_edit_ok(HttpSession session,MemberVo mvo,HttpServletRequest request) throws IOException {
		
		String userid=session.getAttribute("userid").toString();
		String path=request.getRealPath("resources/img");
		int size=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
		
		String proimg=multi.getFilesystemName("proimg");
		String pwd=multi.getParameter("pwd");
		String email=multi.getParameter("email");
		String phone=multi.getParameter("phone");
		String sogae=multi.getParameter("sogae");
		// 프로필 이미지 비었을때 처리
		if(proimg==null)
		{
			mvo.setPwd(pwd);
			mvo.setEmail(email);
			mvo.setPhone(phone);
			mvo.setSogae(sogae);
			mvo.setUserid(userid); //mvo에 세션의 userid추가
			mapper.member_edit_ok1(mvo);
		}
		else
		{
			mvo.setProimg(proimg);
			mvo.setPwd(pwd);
			mvo.setEmail(email);
			mvo.setPhone(phone);
			mvo.setSogae(sogae);
			mvo.setUserid(userid); //mvo에 세션의 userid추가
			mapper.member_edit_ok2(mvo);
		}
		return "redirect:/mypage/mypage?ww=0";
	}
	// 탈퇴신청 실행 (1차 확인 후 실행됨)
	@Override
	public String out(HttpSession session) {
		String userid=session.getAttribute("userid").toString();
		mapper.out(userid);
		
		session.invalidate();
		
		return "redirect:/main/main";
	}
	// 가입시 휴대폰에 인증번호 전송
	@Override
	public void message_send(HttpServletRequest request,PrintWriter out)
	{
		String phone=request.getParameter("phone");
				
		DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCSKN4ZHO6FXVOTR", "MDOL3SRBBZEQDNSBHAQFNY3INGW2IYQC", "https://api.coolsms.co.kr");
		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		
		Random rand = new Random(); 
		String numStr = "";
		for(int i=0; i<4; i++) 
		{
			String ran = Integer.toString(rand.nextInt(10)); 
			numStr += ran;
		}
		
		
		Message message = new Message();
		message.setFrom("01029827219");
		message.setTo(phone);
		message.setText("블루마켓 인증번호는 [" + numStr + "] 입니다.");
		
		try {
			  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
			  messageService.send(message);
			} catch (NurigoMessageNotReceivedException exception) {
			  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
			  System.out.println(exception.getFailedMessageList());
			  System.out.println(exception.getMessage());
			} catch (Exception exception) {
			  System.out.println(exception.getMessage());
			}
		
		out.print(numStr);
	}
}
