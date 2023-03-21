package kr.co.ilck.vo;

public class ManageVo {
   private int id , sellstate, price;
   private String userid,cimg, pname,writeday;

   public int getId() {
      return id;
   }

   public String getUserid() {
      return userid;
   }

   public void setUserid(String userid) {
      this.userid = userid;
   }

   public void setId(int id) {
      this.id = id;
   }

   public int getSellstate() {
      return sellstate;
   }

   public void setSellstate(int sellstate) {
      this.sellstate = sellstate;
   }

   public int getPrice() {
      return price;
   }

   public void setPrice(int price) {
      this.price = price;
   }

   public String getCimg() {
      return cimg;
   }

   public void setCimg(String cimg) {
      this.cimg = cimg;
   }

   public String getPname() {
      return pname;
   }

   public void setPname(String pname) {
      this.pname = pname;
   }

   public String getWriteday() {
      return writeday;
   }

   public void setWriteday(String writeday) {
      this.writeday = writeday;
   }
}