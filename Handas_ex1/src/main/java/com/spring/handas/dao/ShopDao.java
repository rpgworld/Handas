package com.spring.handas.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.handas.dto.ShopDto;

public interface ShopDao {
	public ArrayList<ShopDto> shopList();
	public void shopWrite(@Param("pname") String pname, @Param("item") String item, @Param("price") int price, @Param("pdesc") String pdesc, @Param("img1") String img1, @Param("img2") String img2);
}
