package com.spring.handas.shop;

import java.util.List;

public class PurchaseDto {
	private int num;
	private int purNo;
	private String userID;
	private int pnum;
	private int volume;
	private int price;
	private String check;
	private List<PurchaseDto> dto;
	
	
	
	public List<PurchaseDto> getDto() {
		return dto;
	}
	public void setDto(List<PurchaseDto> dto) {
		this.dto = dto;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPurNo() {
		return purNo;
	}
	public void setPurNo(int purNo) {
		this.purNo = purNo;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getVolume() {
		return volume;
	}
	public void setVolume(int volume) {
		this.volume = volume;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	
	
}
