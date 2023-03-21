package kr.co.ilck.vo;

public class WishVo {
	private int id;
	private String pid,userid,writeday;
	
	private String pimg,title,pcode;
	private int price,sstate;
	
	public int getSstate() {
		return sstate;
	}
	public void setSstate(int sstate) {
		this.sstate = sstate;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	
	
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pcode) {
		this.pid = pcode;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
}
