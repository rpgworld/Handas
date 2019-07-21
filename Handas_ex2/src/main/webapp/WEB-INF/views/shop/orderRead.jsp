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
.orderList, .user_info, .credit_info {
width: 85%;
margin: 20px auto;
}
h1 {
margin-top: 20px;
font-size: 1.8em;
font-weight: bold;
padding: 20px 0;
}
.orderList > table th, td {
text-align: center;
vertical-align: middle;
}
.user_info table, .credit_info table {
width: 400px;
}
.user_info > table td {
text-align: left;
}
.user_info > table th {
text-align: center;
vertical-align: middle;
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
        <div class="row">
            <div class="col-sm-12 user_list">
                <div class="orderList">
                	<h1>주문 상세내역</h1>
		    		<table class="table table-striped">
		    			<thead>
		    				<tr>
		    					<th>주문번호</th>
		    					<th>상품이름</th>
		    					<th>옵션</th>
		    					<th>가격</th>
		    					<th>수량</th>
		    					<th>비고</th>
		    				</tr>
		    			</thead>
		    			<tbody>
		    				<c:forEach items="${orderList }" var="dto">
		    					<tr>
		    						<td>${dto.orderNo }</td>
			    					<td style="text-align: left;"><img style="width: 70px;" class="card-img-top rounded" src="${path }/resources/images/shop_images/${dto.img}" alt="Card image">&nbsp;&nbsp;<a style="text-decoration: none;" href="${path}/shop/read?pnum=${dto.pnum}">${dto.pname }</a></td>
			    					<td>${dto.item }</td>
			    					<td><fmt:formatNumber value="${dto.price }" pattern="#,###" /></td>
			    					<td>${dto.volume }</td>
			    					<td></td>
				    			</tr>
		    				</c:forEach>
		    			</tbody>
		    		</table>
		    	</div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="user_info">
                	<h1>받는 사람 정보</h1>
		    		<table class="table table-striped">
		    			<tr>
		    				<th>이름</th>
		    				<td>${dto.name }</td>
		    			</tr>
		    			<tr>
		    				<th rowspan="3" style="vertical-align: middle">주소</th>
		    				<td>${dto.address1 }</td>
		    			</tr>
		    			<tr>
		    				<td>${dto.address2 }</td>
		    			</tr>
		    			<tr>
		    				<td>${dto.address3 }</td>
		    			</tr>
		    			<tr>
		    				<th>전화번호</th>
		    				<td>${dto.phone }</td>
		    			</tr>
		    			<tr>
		    				<th>배송메세지</th>
		    				<td>${dto.message }</td>
		    			</tr>
		    		</table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
            	<div class="credit_info">
                	<h1>결제 정보</h1>
		    		<table class="table table-striped">
                		<tr>
		    				<th>총 결제금액</th>
		    				<td><fmt:formatNumber value="${dto.totalPrice }" pattern="#,###" />원</td>
		    			</tr>
		    		</table>
		    	</div>
            </div>
        </div>		
    </div>
    <%@ include file="../modal.jsp" %>
</body>
</html>