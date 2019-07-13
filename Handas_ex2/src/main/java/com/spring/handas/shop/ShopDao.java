package com.spring.handas.shop;

import java.util.ArrayList;

import com.spring.handas.PageMaker;

public interface ShopDao {
	public ArrayList<ShopDto> shopList(PageMaker paging);
	public int shopCnt();
	public void shopWrite(ShopDto dto);
	public ShopDto shopRead(int pnum);
	public void shopUpdate(ShopDto dto);
	public String shopImgName(int pnum);
	public void shopDelete(int pnum);
}