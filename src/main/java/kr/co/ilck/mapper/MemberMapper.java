package kr.co.ilck.mapper;

import kr.co.ilck.vo.MemberVo;

public interface MemberMapper {

	public void member_input_ok(MemberVo mvo);
	public int userid_check(String userid);
	public int email_check(String email);
	public MemberVo member_view(String userid);
	public MemberVo member_edit(String userid);
	public void member_edit_ok1(MemberVo mvo);
	public void member_edit_ok2(MemberVo mvo);
	public void out(String userid);
}
