<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@ include file="../header.jsp" %>
    <title>Handas</title>
<style>

.cart_form {
width: 90%;
margin: 0 auto;
}
.cart_form tbody  > tr:nth-child(even), tr:nth-child(odd) td:nth-child(4), 
tr:nth-child(odd) td:nth-child(5),  tr:nth-child(odd) td:first-child, tr:nth-child(odd) td:nth-child(2) {
border-bottom: 1px solid #d9d9d9;
}
.cart_form td, th{
text-align: center;
vertical-align: middle;
}
.cart_form th:first-child{
padding: 0;
padding-bottom: 8px;
}
.cart_form thead > tr th:first-child {
width: 4%;
}
.cart_form thead > tr th:nth-child(2) {
width: 10%;
}
.cart_form thead > tr th:nth-child(3) {
width: 56%;
}
.cart_form thead > tr th:nth-child(4), tr th:nth-child(2) {
width: 15%;
}
 {
width: 15%;
}
.cart_form tbody > tr:nth-child(odd) td:first-child {
padding: 0 0 10px 0;
}
.cart_form tbody > tr:nth-child(odd) td:nth-child(3), tr:nth-child(even) td {
text-align: left;
}
.cart_form .form-check {
padding-bottom: 20px;
}
.cart_form .total_price {
border: 4px solid #d9d9d9;
text-align: center;
padding: 20px;
font-size: 1.1em;
font-weight: bold;
}
.cart_btn_group {
margin-top: 10px;
display: flex;
justify-content: center;
}

.cart_btn_group .btn {
padding: 20px 0;
width: 200px;
}
.cart_btn_group .btn:first-child {
padding-top: 20px;
margin-right: 10px;
}
</style>
<script>
//토스트 메시지 팝업
function toast_alert(target, top_value, left_value, msgTop, msgBody) {
	// 장바구니 메세지 출력
	$('.toast strong').html(msgTop);
    $('.toast .toast-body').html(msgBody);
    
    var left = $(target).offset().left;
    var top = $(target).offset().top;

    $('.toast').css('left', left + left_value);
    $('.toast').css('top', top + top_value);
    
	$('.toast').toast('show');
}
$('document').ready(function(){
	cartCal();

	
	// 전체선택 체크박스 선택 이벤트
	$('#check_all').change(function() {
		if($(this).is(":checked") == true) {
			$('.pcheck').attr('checked', 'checked');
			$('.pcheck').val('1');
		} else {
			$('.pcheck').removeAttr('checked');
			$('.pcheck').val('0');
		}	
	});
	
	// 체크박스 선택시 value = 1, 해제시 value = 0
	$('.pcheck').change(function(){
		if($(this).is(":checked") == true) {
			$(this).val('1');
		} else {
			$(this).val('0');
		}
		
	});
	
	// 수량 조절 버튼
	$('.volume_minus').click(function(){
		var vol = $(this).next().val();
		if( vol > 1 ) {
			vol--;
			$(this).next().val(vol);
			cartCal();
		}
	});
	
	$('.volume_plus').click(function(){
		var vol = $(this).prev().val();
		var totalVol = parseInt($(this).next().val());
		if(vol < totalVol) {
			vol++;
			$(this).prev().val(vol);
			cartCal();
		}		
	});
	
	// 장바구니 삭제 버튼 클릭 이벤트
	$('#cartDelete').click(function(){
		var pnum = $('#cartDelete').val();
		
		$.ajax({
			type : 'POST',
			data : {'pnum' : pnum},
			url : '${path}/shop/cartDelete',
			dataType : 'json',
			success : function(result) {
				
				if(result == true) {
					window.location.reload();
				} 
			},
			error : function(error) {
				alert('error : ' + error);
			}
		});
	});
});

// 전체 금액, 상품별 금액 계산
function cartCal() {
	var super_total = 0;
	var priceArray = new Array();
	var volArray = new Array();
	$('input[name=price]').each(function(){
	    priceArray.push($(this).val());
	});
	$('input[name=volume]').each(function(){
	    volArray.push($(this).val());
	});
	$('input[name=total_price]').each(function(){
		var total = priceArray.shift() * volArray.shift();
		$(this).val(total);
		
		super_total += total;
	});	
	
	$('.total1').html(super_total.toLocaleString());
	$('.total2').html(super_total.toLocaleString());
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
	                                            <input type="checkbox" class="form-check-input" id="check_all" />
	                                        </label>
	                                    </div>
	                                </th>
	                                <th style="padding-left: 0;">전체선택</th>
	                                <th>상품정보</th>
	                                <th>상품총금액</th>
	                                 <th>배송비</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <c:forEach items="${list}" var="dto">
	                                <tr>
	                                    <td rowspan="2">
	                                        <div class="form-check">
	                                            <label class="form-check-label">
	                                                <input type="checkbox"  name="check" class="form-check-input pcheck" value="0">
	                                            </label>
	                                        </div>
	                                    </td>
	                                    <td rowspan="2" style="width: 100px; height: 100px;"><img class="img-fluid" src="${path }/resources/images/shop_images/${dto.img}"></td>
	                                    <td style="display: flex; justify-content: space-between; border-top: none;"><span class="cart_pname">${dto.pname }</span><span class="cart_price">상품금액 : <fmt:formatNumber value="${dto.price }" pattern="#,###" /></span></td>
	                                    <td rowspan="2"><input type="text" name="total_price" value="" style="border:none; width: 150px; text-align: center;"></td>
	                                    <td rowspan="2">무료배송</td>
	                                </tr>
	                                <tr>
	                                    <td style="display: flex; justify-content: space-between;"><div style="padding-top: 5px;"><h3>내일 도착 7/15일 도착보장</h3></div>
		                                <div>
		                                    <div class="btn-group btn-group-sm" style="margin-left: 10px;">
											    <input style="width: 10px;" type="button" class="btn btn-primary volume_minus" value="-">
											    <input type="text" name="volume" style="width: 30px;" class="btn" value="${dto.volume }">
											    <input style="width: 10px; border-top-right-radius:3px; border-bottom-right-radius:3px;" type="button" class="btn btn-primary volume_plus" value="+">
											    <input type="hidden" value="${dto.totalVol }">
											    <input type="hidden" name="price" value="${dto.price }">
											</div>
											<button type="button" class="btn btn-outline-primary btn-sm" id="cartDelete" style="margin-left: 10px;" value="${dto.pnum }">X</button>
										</div>  
										<input type="hidden" style="width: 5px;" name="pnum" value="${dto.pnum }">
	                                    </td>
	                                </tr>
	                            </c:forEach>
	                        </tbody>
	                    </table>
	                    
	                    <div class="total_price">
	                        총 상품가격 <span class="total1"></span> 원 + 배송비 0원 = 총 주문금액 <span class="total2"></span> 원
	                    </div>
	                    
	                    <div class="cart_btn_group">
	                        <a href="${path}/shop/list" class="btn btn-secondary" style="border: 1px soild #0000ff;">계속 쇼핑하기</a>
	                        <input id="submit" type="submit" class="btn btn-primary" value="구매하기">
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