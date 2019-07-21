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
	// 상품 삭제시 해당 상품 카트에서 삭제
	public void cartDeleteAll(int pnum);
	
	
	// 장바구니 넣기 전에 같은 제품이 존재하는지 체크
	public int cartCheck(String userID, int pnum);
	// 장바구니 넣기
	public void cartWrite(CartDto dto);
	// 장바구니 정보 가져오기
	public ArrayList<CartDto> cartList(String userID);
	// 장바구니 삭제
	public void cartDelete(String userID, int pnum);
	
	
	// 주문
	public void order(OrderDto orderDto);
	public void orderD(ShopDto shopDto);
	public void shopCntUpdate(int volume, int pnum);
	public int orderDCnt(int orderNo);
	public ArrayList<OrderDto> getOrderAll(String userID);
	public OrderDto getOrder(String userID, int orderNo);
	public ArrayList<OrderDDto> getOrderD(int orderNo);
	
	public OrderDto getOrderRead(int orderNo);
	
	// 상품평 삭제 (visible = 0 으로 변경)
	public void orderDelete(int num);
	
	// 상품평
	public void shopComment(CommentDto dto);
	public ArrayList<CommentDto> shopCommentList(int pnum); 
	public void shopCommentDelete(int num);
}
