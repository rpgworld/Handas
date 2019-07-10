package com.spring.handas.shop;

import java.util.ArrayList;

public interface ShopDao {
	public ArrayList<ShopDto> shopList();
	public void shopWrite(ShopDto dto);
}
