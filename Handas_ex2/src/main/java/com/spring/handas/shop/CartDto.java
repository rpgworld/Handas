package com.spring.handas.shop;

import java.util.List;

public class CartDto {
	private int num;
	private String userID;
	private int pnum;
	private String pname;
	private String item;
	private int volume;
	private int totalVol;
	private int price;
	private String img;
	
	List<CartDto> dto;
	
	
	
	public List<CartDto> getDto() {
		return dto;
	}
	public void setDto(List<CartDto> dto) {
		this.dto = dto;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public int getVolume() {
		return volume;
	}
	public void setVolume(int volume) {
		this.volume = volume;
	}
	public int getTotalVol() {
		return totalVol;
	}
	public void setTotalVol(int totalVol) {
		this.totalVol = totalVol;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
}
