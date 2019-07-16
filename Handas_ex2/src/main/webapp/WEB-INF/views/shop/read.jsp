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
.item_info li {
margin-top: 20px;
}
.item_info h1 {
font-size: 3em;
margin-top: 20px;
font-weight: bold;
}
.item_info .item_price {
margin-top: 20px;
font-size: 2em;
}
.item_info .btn-group {
}
.item_info .btn-group .btn:first-child, .item_info .btn-group .btn:last-child {
width: 25px;
}

.item_info .total_group h3{
font-size: 1em;
font-weight: bold;
}
.item_btn_group div{
width: 300px;
padding: 20px;
border-top: 1px solid #d9d9d9;
border-bottom: 1px solid #d9d9d9;
}
.item_btn_group input {
margin-left: 10px;
}
</style>
<script>
var count = 1;
var maxCnt = ${dto.volume};
var price = ${dto.price}; // 임시
var userID = '${sessionScope.userID}';
var like = false; // 찜 등록 여부

$('document').ready(function(){
	
	total_price();
	
	// 구매 버튼 클릭시 이벤트
	$('#purchase_btn').click(function(){
		if(userID == '') {
			msgType = '구매해주셔서 감사합니다.';
			msgContent = '상품 구매는 로그인 상태에서 가능합니다. <br><br> 이동하시겠습니까?  <a href="${path}/user/loginForm">로그인페이지 이동하기</a>';
			modal_alert(msgType, msgContent);
			return false;
		}
		
		// 데이터도 함께 전송 해야됨
		window.location.href = '${path}/shop/purchaseForm?pnum=${dto.pnum}&check=1&volume=' + count;
	});
	
	// 개수 버튼 이벤트
	$('.count_up').click(function(){
		// 재고 개수만큼, 임시: 10000
		if(count == maxCnt) {
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
	
	// 장바구니 버튼 클릭 이벤트
	$('.item_info .cart_btn').click(function(){
		
		if(userID == '') { // 로그인 하지 않았다면
			
			// 로그인 필요 메세지 출력
		    toast_alert('#baguni', 35, -40, '장바구니는 로그인한 회원만 이용 가능합니다.', '로그인 페이지로 <a href="${path}/user/loginForm">이동</a>하시겠습니까?');
			
		} else {
			var pnum = ${dto.pnum};
			var pname = '${dto.pname}';
			var item = '${dto.item}';
			var volume = count;
			var totalVol = ${dto.volume};
			var price = ${dto.price};
			var img = '${dto.img}';
			
			var query = {'pnum' : pnum, 'pname' : pname, 'item' : item, 'volume' : volume, 'totalVol' : totalVol, 'price' : price, 'img' : img};
			
			$.ajax({
				type : 'POST',
				data : query,
				url : '${path}/shop/cart',
				dataType : 'json',
				success : function(result) {
					
					if(result == true) {
						// 장바구니 담기 성공 메세지
						toast_alert('#baguni', 35, -40, '장바구니 담기 성공!', '장바구니 페이지로 <a href="${path}/shop/cartForm">이동</a>하시겠습니까?');
					} else {
						// 장바구니 제품 중복
						toast_alert('#baguni', 35, -40, '해당 제품이 이미 장바구니에 존재합니다.', '장바구니 페이지로 <a href="${path}/shop/cartForm">이동</a>하시겠습니까?');
					}
					
				},
				error : function(error) {
					alert('error : ' + error);
				}
			});
			
			
		}
		
	});
	
	// 찜 버튼 눌렀을때 이벤트
	$('#like').click(function(){
		if(like == false) {
			$('#like').css('color', '#ff0000');
			like = true;
		} else {
			$('#like').css('color', '#000000');
			like = false;
		}
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
					<img class="card-img-top rounded" src="${path }/resources/images/shop_images/${dto.img }" alt="">
				</div>
           		<div class="item_info">
           			<h1>${dto.pname }</h1>
           			<ul>
           				<li class="" style="margin-top: 10px">&nbsp;${dto.item }</li>
           				<li class="item_price">${dto.getPriceFormat() }원<button type="button" style="" class="btn like_btn" id="like"><i class="fas fa-heart"></i></button></li>
           				<li class="item_desc">${dto.pdesc }</li>
           				<li class="item_count">
           					<div class="btn-group btn-group-sm"> 
								<button type="button" class="btn btn-primary count_down">-</button>
								<button type="button" class="btn btn-light count" disabled>1</button>
								<button type="button" id="count_up" class="btn btn-primary count_up">+</button>
							</div>
           				</li>
           				<li class="total_group">
           					<div>
								<h3 class="total_price" style="display: inline-block;"></h3>								
							</div>
           				</li>
           				<li class="item_btn_group">
           					<div>
           					<button type="button" class="btn cart_btn" id="baguni" style="border: 1px solid #d9d9d9">장바구니&nbsp;<i class="fas fa-cart-plus"></i></button>
           					<input type="button" id="purchase_btn" class="btn btn-primary" value="바로구매">
           					</div>
           				</li>
           			</ul>
           		</div>
           		<div style="width: 100%; display:flex; justify-content: flex-end; padding-right: 10px; margin-top: 15px">
           			<c:if test="${sessionScope.role == 'admin' }">
           				<a href="${path }/shop/updateForm?pnum=${dto.pnum}" class="btn btn-primary">수정하기</a>
           				<a href="${path }/shop/delete?pnum=${dto.pnum}" class="btn btn-primary" style="margin-left: 10px;">삭제하기</a>
           			</c:if>
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