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
#purchase_form {
width: 50%;
margin: 0 auto;
}

#purchase_form table{
border: 1px solid #d9d9d9;
}

#purchase_form input{
height: 25px;
}

#purchase_form input[type=text]{
width: 90%;
}

/* 제품정보 */
.purchase_table2 th{
width: 70%;
}
.purchase_table2 td{
width: 30%;
}


/* 결제정보 */
.purchase_table3 th{
width: 25%;
}
.purchase_table3 td{
width: 75%;
}

.purchase_btn_group {
margin-top: 20px;
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
                <form action="purchase" method="post" id="purchase_form"> 
                	<h1 style="font-size: 1.6em; font-weight: bold; padding-bottom: 10px;">받는사람 정보</h1>
                    <table class="table table-hover purchase_table1">
                        <tr>
                            <th>받으시는분</th>
                            <td><input type="text" class="form-control" name="userName" id="text" value="${user.userID }"></td>
                        	<td></td>
                        </tr>
                        <tr>
                            <th rowspan="3">주소</th>
                            <td><input type="text" class="form-control" name="address1" id="address1" placeholder="우편번호" value="${user.address1 }"></td>
                            <td><input type="button" class="btn btn-primary addr_check_btn" onclick="addr_check()" id="addr_btn" value="우편번호찾기"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="text" class="form-control" name="address2" id="address2" placeholder="주소" value="${user.address2 }"></td>
                        </tr>
                        <tr>
                        	<td colspan="2"><input type="text" class="form-control" name="address3" id="text" placeholder="상세주소" value="${user.address3 }"></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input type="text" class="form-control" name="userPhone" id="text"></td>
                        	<td></td>
                        </tr>
                        <tr>
                        	<th>배송메시지</th>
                        	<td colspan="2"><input type="text" class="form-control" name="address3" id="text" placeholder="택배기사님께 30자 이내로 메세지를 적어주세요" maxlength="30"></td>
                        </tr>
                    </table>
                    
                    <h1 style="font-size: 1.6em; font-weight: bold; padding-bottom: 10px; margin-top: 30px;">제품 정보</h1>
                    <table class="table table-hover purchase_table2">
                        <tr>
                            <th>${shop.pname }</th>
                            <td>수량 ${shop.volume }개 / 무료배송</td>
                        </tr>
                        <tr>
                            <th>제품이름</th>
                            <td>수량 1개 / 무료배송</td>
                        </tr>
                    </table>
                    
                    <h1 style="font-size: 1.6em; font-weight: bold; padding-bottom: 10px; margin-top: 30px;">결제 정보</h1>
                    <table class="table table-hover purchase_table3">
                        <tr>
                            <th>총상품가격</th>
                            <td>${shop.price * shop.volume }원</td>
                        </tr>
						<tr>
							<th>할인쿠폰</th>
							<td>0원</td>
						</tr>
						<tr>
							<th>배송비</th>
							<td>0원</td>
						</tr>
						<tr>
							<th>총결제금액</th>
							<td>${shop.price * shop.volume }원</td>
						</tr>
						<tr>
							<th>결제방법</th>
							<td>
								신용/체크카드, 무통장입금
								카드종류 select 박스 ~~ nh농협카드
								할부기간 select 박스 일시불 ~~
							</td>
						</tr>
                    </table>
                    <div class="form-check-inline">
						<label class="form-check-label">
							<input type="checkbox" class="form-check-input" value=""> 위 주문 내용을 확인하였으며, 회원 본인은 결제에 동의합니다.
						</label>
					</div>
                    <div class="purchase_btn_group">
                        <input type="button" class="btn btn-primary" value="결제하기">
                    </div>
                </form>
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