package com.spring.handas.shop;

import java.sql.Date;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class ShopDto {
	private int pnum;
	private String pname;
	private String item;
	private int price;
	private String pdesc;
	private String img;
	private Date writeDate;
	private String writeDateFormat;
	private int totalVol;
	
	private int dateDiff; // 제품 출시 일수
	private int orderNo;
	private int volume;
	
	private int commentCnt; // 댓글수
	
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
	
	public int getDateDiff() {
		return dateDiff;
	}

	public void setDateDiff(int dateDiff) {
		this.dateDiff = dateDiff;
	}

	public Date getWriteDate() {
		return writeDate;
	}
	public String getWriteDateFormat() {
		
		return writeDateFormat;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
		
		// 날짜 형식 변경 지정 변수
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		writeDateFormat = dateFormat.format(writeDate);
		
		// 출시이후 일수 세팅
		Calendar today = Calendar.getInstance();
		this.dateDiff = (int) ((today.getTimeInMillis() - this.writeDate.getTime()) / (1000 * 24 * 60 * 60));
	}
	public void setWriteDateFormat(String writeDateFormat) {
		this.writeDateFormat = writeDateFormat;
	}

	public int getTotalVol() {
		return totalVol;
	}

	public void setTotalVol(int totalVol) {
		this.totalVol = totalVol;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public int getCommentCnt() {
		return commentCnt;
	}

	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
	
	
	
}
