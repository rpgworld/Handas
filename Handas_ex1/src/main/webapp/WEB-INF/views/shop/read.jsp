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
</head>
<body>
	<div class="container">
		<%@ include file="../menu.jsp" %>
		<div class="row">
            <div class="col-sm-12">
                
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 item_read">
				<div class="item_image">
					<img class="card-img-top rounded" src="${path }/resources/images/s_images/pen1.png" alt="">
				</div>
           		<div class="item_info">
           			<h1>한다스 프리미엄 펜</h1>
           			<div class="item_price">2,500원</div>
           			<div class="item_count">
	           			<div class="btn-group"> 
							<button type="button" class="btn btn-primary count_down">-</button>
							<button type="button" class="btn btn-light count" disabled>1</button>
							<button type="button" class="btn btn-primary count_up">+</button>
						</div>
					</div>
						<div class="total_group">
							<div>
								<button type="button" class="btn total_price">총상품금액 &nbsp;&nbsp;50,000원</button>
								<button type="button" class="btn item_setCart_btn">장바구니&nbsp;<i class="fas fa-cart-plus"></i></button>
								<button type="button" class="btn item_setLike_btn">찜&nbsp;<i class="fas fa-heart"></i></button>
							</div>
						</div>
					<div>
						<input type="button" id="purchase" class="btn btn-primary" value="바로구매">
           			</div>
           		</div>
           		<div class="item_comment">
           			
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