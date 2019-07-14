<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@ include file="../header.jsp" %>
    <title>Handas</title>
<style>
.cart_form table, .cart_form tr, .cart_form td {
border: 1px solid #d9d9d9;
}

</style>

</head>
<body>
	<div class="container">
		<%@ include file="../menu.jsp" %>
		<div class="row">
            <div class="col-sm-12">
                
            </div>
        </div>
        <div class="row" style="margin-top: 50px;">
            <div class="col-sm-12" style="padding: 0;">
                <div class="cart_form">
                	<form action="purchaseForm" action="get">
                		<table class="table">
                			<thead>
                				<tr>
                					<th>
                						<div class="form-check">
											<label class="form-check-label">
												<input type="checkbox" class="form-check-input" value="">
											</label>
										</div>
                					</th>
                					<th>전체선택</th>
                					<th>상품정보</th>
                					<th>상품금액</th>
 									<th>배송비</th>
                				</tr>
                			</thead>
                			<tbody>
                				<tr>
                					<td rowspan="2">
                						<div class="form-check">
											<label class="form-check-label">
												<input type="checkbox" class="form-check-input" value="">
											</label>
										</div>
                					</td>
                					<td rowspan="2" style="width: 100px; height: 100px;"><img class="img-fluid" src="${path }/resources/images/shop_images/pen.png"></td>
                					<td>씨게이트 백업 플러스 레스큐 srs 외장핟, 4tb, 골드</td>
                					<td rowspan="2">155,500원</td>
                				</tr>
                				<tr>
                					<td>내일 도착 7/15일 도착보장</td>
                				</tr>
                			</tbody>
                		</table>
                		
                		<div class="total_price">
                			총 상품가격 0 원 + 배송비 + 총 주문금액 0 원
                		</div>
                		
                		<div class="cart_btn_group">
                			<a href="#" class="btn" style="border: 1px soild #0000ff;">계속 쇼핑하기</a>
                			<input type="submit" class="btn btn-primary" value="구매하기">
                		</div>
                	</form>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
            </div>
        </div>
    </div>
    
    
    <%@ include file="../modal.jsp" %>
</body>
</html>