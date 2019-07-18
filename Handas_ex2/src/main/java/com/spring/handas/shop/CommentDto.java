package com.spring.handas.shop;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class CommentDto {
	private int num;
	private int pnum;
	private String userID;
	private String content;
	private int star;
	private Date cdate;
	private String cdateFormat;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		cdateFormat = dateFormat.format(cdate);
	}
	public String getCdateFormat() {
		return cdateFormat;
	}
	public void setCdateFormat(String cdateFormat) {
		this.cdateFormat = cdateFormat;
	}
	
	
	
}
