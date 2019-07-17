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
.finish_top {
text-align: center;
}
.finish_bottom {
text-align: center;   
}

.finish_top h3 {
color: #848484;
font-size: 1.1em;
}
.finish_top h1 {
font-size: 1.8em;
color: #818181;
}
.finish_top h1 span {
color: #8181F7;
font-weight: bold;
}
.finish_top p {
background: #E0E6F8;
font-size: 0.85em;
color: #8181F7;
}

.finish_bottom p {
font-size: 0.95em;
color: #6E6E6E;
}
</style>
<script>

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
            <div class="col-sm-2"></div>
            <div class="col-sm-8 finish_top" style="margin-top: 20px;">
                <h3>Handas mall을 이용해주셔서 감사합니다.</h3>
                <h1><span>주문</span>과 <span>결제</span>가 정상적으로 <span>완료</span>되었습니다.</h1>
                <p>주문하신 상품을 바로 준비하겠습니다. 휴대폰으로 배송안내 문자가 전송됩니다.</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8 finish_bottom">
            	<hr>
                <p>주문하신 상품에 대한 문의는 Handas mall의 고객센터로 연락주시기 바랍니다.</p>
            </div>
            <div class="finish_btn" style="width: 100%; display: flex; flex-flow: center">
            	<div style="margin: 0 auto; margin-top: 10px;">
            		<a href="${path}/shop" class="btn btn-secondary" style="border: 1px soild #0000ff;">쇼핑 계속하기</a>
	            	<a href="${path}/shop/orderList" class="btn btn-primary">주문내역 확인하기</a>
            	</div>
            </div>
        </div>
    </div>
    
    
    <%@ include file="../modal.jsp" %>
</body>
</html>