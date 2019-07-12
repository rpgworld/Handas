package com.spring.handas.shop;

import java.sql.Date;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

public class ShopDto {
	private int pnum;
	private String pname;
	private String item;
	private int price;
	private String pdesc;
	private String img;
	private Date writeDate;
	private int volume;
	
	
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

	public int getPrice() {
		return price;
	}
	public String getPriceFormat() {
		DecimalFormat priceFormat = new DecimalFormat("###,###");
	
		return priceFormat.format(this.price);
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getPdesc() {
		return pdesc;
	}

	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Date getWriteDate() {
		return writeDate;
	}
	public String getWriteDateFormat() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		
		return dateFormat.format(writeDate);
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}
	
}
