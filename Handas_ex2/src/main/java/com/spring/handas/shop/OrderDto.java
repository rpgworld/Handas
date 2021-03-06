package com.spring.handas.shop;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class OrderDto {
	private int num;
	private int orderNo;
	private String userID;
	private String name;
	private String address1;
	private String address2;
	private String address3;
	private String phone;
	private String message;
	private int totalCnt; // 상품 주문 총 개수
	private int totalPrice;
	private Date odate;
	private int sample_pnum;
	private int visible;
	
	private String pname; // 상품 이름 하나,
	private String img; // 상품 이미지 이름 하나.
	
	private String odateFormat; // 주문 날짜 포맷 변경
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		odateFormat = dateFormat.format(odate);
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getSample_pnum() {
		return sample_pnum;
	}
	public void setSample_pnum(int sample_pnum) {
		this.sample_pnum = sample_pnum;
	}
	public String getOdateFormat() {
		return odateFormat;
	}
	public void setOdateFormat(String odateFormat) {
		this.odateFormat = odateFormat;
	}
	public int getVisible() {
		return visible;
	}
	public void setVisible(int visible) {
		this.visible = visible;
	}
	
	
	

}
