package kr.co.ilck.vo;

public class MemberVo {

	private int id,state;
	
	private String userid,pwd,name,email,phone,star,sogae,levp,proimg,singo_num,writeday;
	
	
	
	public String getSingo_num() {
		return singo_num;
	}
	public void setSingo_num(String singo_num) {
		this.singo_num = singo_num;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getProimg() {
		return proimg;
	}
	public void setProimg(String proimg) {
		this.proimg = proimg;
	}
	public String getLevp() {
		return levp;
	}
	public void setLevp(String levp) {
		this.levp = levp;
	}
	public String getSogae() {
		return sogae;
	}
	public void setSogae(String sogae) {
		this.sogae = sogae;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	
	
}
