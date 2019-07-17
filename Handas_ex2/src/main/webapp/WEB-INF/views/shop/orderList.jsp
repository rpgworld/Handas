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
width: 20%;
}
table th:nth-child(2) {
width: 15%;
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
			    					<td>${dto.odate }</td>
			    					<td><a href="${path }/shop/orderRead?orderNo=${dto.orderNo }"><img style="width: 70px;" class="card-img-top rounded" src="${path }/resources/images/shop_images/${dto.sampleImg}" alt="Card image">&nbsp;&nbsp;${dto.sampleName }외 ${dto.totalCnt }개</a></td>
			    					<td>${dto.totalPrice }</td>
			    					<td></td>
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