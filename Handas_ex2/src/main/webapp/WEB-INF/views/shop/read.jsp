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
<script>
var count = 1;
var price = ${dto.price}; // 임시
var userID = '${sessionScope.userID}';

$('document').ready(function(){
	
	total_price();
	
	$('#purchase').click(function(){
		if(userID == '') {
			msgType = '구매해주셔서 감사합니다.';
			msgContent = '상품 구매는 로그인 상태에서 가능합니다. <br><br> 이동하시겠습니까?  <a href="${path}/user/loginForm">로그인페이지 이동하기</a>';
			modal_alert(msgType, msgContent);
			return false;
		}
		
		// 데이터도 함께 전송 해야됨
		window.location.href = '${path}/shop/purchase';
	});
	
	$('.count_up').click(function(){
		// 재고 개수만큼, 임시: 10000
		if(count == 10000) {
			return false;
		}
		
		count = count + 1;
		
		$('.item_read .count').html(count);
		
		total_price();
	});
	
	$('.count_down').click(function(){
		if(count == 1) {
			return false;
		}
		
		count = count - 1;
		
		$('.item_read .count').html(count);
		
		total_price();
	});
	
});

function total_price() {
	var total_price = price * count;
	$('.total_price').html('총상품금액 &nbsp;&nbsp;' + total_price.toLocaleString() + '원');
}
</script>
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
           			<ul>
           				<li class="item_name"><h1>${dto.pname }</h1></li>
           				<li class="item_price">${dto.getPriceFormat() }원</li>
           				<li class="item_count">
           					<div class="btn-group"> 
								<button type="button" class="btn btn-primary count_down">-</button>
								<button type="button" class="btn btn-light count" disabled>1</button>
								<button type="button" id="count_up" class="btn btn-primary count_up">+</button>
							</div>
           				</li>
           				<li class="total_group">
           					<div>
								<h3 class="total_price" style="display: inline-block;"></h3>
								<button type="button" class="btn item_setCart_btn">장바구니&nbsp;<i class="fas fa-cart-plus"></i></button>
								<button type="button" class="btn item_setLike_btn">찜&nbsp;<i class="fas fa-heart"></i></button>
							</div>
           				</li>
           				<li>
           					<input type="button" id="purchase" class="btn btn-primary" value="바로구매">
           				</li>
           			</ul>
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