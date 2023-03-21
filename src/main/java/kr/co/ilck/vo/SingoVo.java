package kr.co.ilck.vo;

public class SingoVo {
	
	private int id,state,panmae_id;
	private String userid,content,writeday,singo_userid;
	
	// member 테이블에서 참고하기 위해 필요
	private int state2;
	
	
	
	public int getState2() {
		return state2;
	}
	public void setState2(int state2) {
		this.state2 = state2;
	}
	public int getPanmae_id() {
		return panmae_id;
	}
	public void setPanmae_id(int panmae_id) {
		this.panmae_id = panmae_id;
	}
	public String getSingo_userid() {
		return singo_userid;
	}
	public void setSingo_userid(String singo_userid) {
		this.singo_userid = singo_userid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	
	

}
