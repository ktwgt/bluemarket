package kr.co.ilck.vo;

public class WantVo {
	private int id,readnum,wprice;
	private String title,content,fname,userid,writeday;
	public int getWprice() {
		return wprice;
	}
	public void setWprice(int wprice) {
		this.wprice = wprice;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public int getReadnum() {
		return readnum;
	}
	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
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
