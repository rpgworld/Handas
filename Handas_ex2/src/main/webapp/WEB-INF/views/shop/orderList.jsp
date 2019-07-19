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
h1 {
margin-top: 20px;
font-size: 1.8em;
font-weight: bold;
padding: 20px 0;
}
table th, td {
text-align: center;
vertical-align: middle;
}
table th:first-child {
width: 10%;
}
table th:nth-child(2) {
width: 25%;
}
table th:nth-child(3) {
width: 35%;
}
table th:nth-child(4) {
width: 15%;
}
table th:last-child {
width: 15%;
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
                <div class="bbsList">
                	<h1>주문내역</h1>
		    		<table class="table table-striped">
		    			<thead>
		    				<tr>
		    					<th>주문번호</th>
		    					<th>날짜</th>
		    					<th>상품</th>
		    					<th>총금액</th>
		    					<th>비고</th>
		    				</tr>
		    			</thead>
		    				<c:forEach items="${list }" var="dto">
		    					<tr>
		    						<td>${dto.orderNo }</td>
			    					<td>${dto.odateFormat }</td>
			    					<td style="text-align: left;"><a style="text-decoration: none;" href="${path }/shop/orderRead?orderNo=${dto.orderNo }"><img style="width: 70px;" class="card-img-top rounded" src="${path }/resources/images/shop_images/${dto.img}" alt="Card image">&nbsp;&nbsp;${dto.pname }<c:if test="${dto.totalCnt > 1}">외 ${dto.totalCnt - 1 }개</c:if></a></td>
			    					<td><fmt:formatNumber value="${dto.totalPrice }" pattern="#,###" />원</td>
			    					<td><a href="${path }/shop/orderRead?orderNo=${dto.orderNo }" style="font-size: 0.85em; width: 120px; margin-bottom: 4px;" class="btn btn-primary" >주문내역조회</a><a href="${path }/shop/orderDelete?orderNo=${dto.orderNo }" style="font-size: 0.85em; width: 120px; margin-bottom: 4px;" class="btn btn-danger" >주문내역삭제</a></td>
				    			</tr>
		    				</c:forEach>
		    			</tbody>
		    		</table>
		    	</div>
            </div>
        </div>
    </div>
    <%@ include file="../modal.jsp" %>
</body>
</html>