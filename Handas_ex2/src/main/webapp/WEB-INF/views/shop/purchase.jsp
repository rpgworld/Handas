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
.purchase_table1 th {
vertical-align: middle;
}
.purchase_table2 th, .purchase_table2 td{
height: 64px;
padding-top: 25px;
}
.purchase_table3 th, .purchase_table3 td{
height: 64px;
padding-top: 25px;
}

</style>
<script>
$('document').ready(function(){
	
});
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
                <form action="purchase" method="post" id="purchase_form"> 
                	<h1 style="font-size: 1.6em; font-weight: bold; padding-bottom: 10px;">받는사람 정보</h1>
                    <table class="table table-hover purchase_table1">
                        <tr>
                            <th>받으시는분</th>
                            <td><input type="text" class="form-control" name="name" id="text" value="${userDto.userID }"></td>
                        	<td></td>
                        </tr>
                        <tr>
                            <th rowspan="3">주소</th>
                            <td><input type="text" class="form-control" name="address1" id="address1" placeholder="우편번호" value="${userDto.address1 }"></td>
                            <td><input type="button" class="btn btn-primary addr_check_btn" onclick="addr_check()" id="addr_btn" value="우편번호찾기"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="text" class="form-control" name="address2" id="address2" placeholder="주소" value="${userDto.address2 }"></td>
                        </tr>
                        <tr>
                        	<td colspan="2"><input type="text" class="form-control" name="address3" id="text" placeholder="상세주소" value="${userDto.address3 }"></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input type="text" class="form-control" name="phone" id="text"></td>
                        	<td></td>
                        </tr>
                        <tr>
                        	<th>배송메시지</th>
                        	<td colspan="2"><input type="text" class="form-control" name="message" id="text" placeholder="택배기사님께 30자 이내로 메세지를 적어주세요" maxlength="30"></td>
                        </tr>
                    </table>
                    
                    <h1 style="font-size: 1.6em; font-weight: bold; padding-bottom: 10px; margin-top: 30px;">제품 정보</h1>
                    <table class="table table-hover purchase_table2">
                        <c:forEach items="${shopList }" var="dto">
                        <tr>
                        	<td style="width: 20%"><div><img class="img-fluid" src="${path }/resources/images/shop_images/${dto.img}"></div></td>
                            <th style="width: 45%">${dto.pname }<input type="hidden" name="pnum" value="${dto.pnum }"></th>
                            <td style="width: 35%">수량 ${dto.volume }개 / 무료배송<input type="hidden" name="volume" value="${dto.volume }"></td>
                        </tr>
                        </c:forEach>
                    </table>
                    
                    <h1 style="font-size: 1.6em; font-weight: bold; padding-bottom: 10px; margin-top: 30px;">결제 정보</h1>
                    <table class="table table-hover purchase_table3">
                        <tr>
                            <th>총상품가격</th>
                            <td>${total }원</td>
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
							<td>${total }원</td>
						</tr>
						<tr>
							<th>결제방법</th>
							<td>
								<div style="font-size: 0.9em;">
									<div class="form-check-inline">
									  <label class="form-check-label">
									    <input type="radio" class="form-check-input" name="optradio" checked>신용/체크카드
									  </label>
									</div>
									<div class="form-check-inline">
									  <label class="form-check-label">
									    <input type="radio" class="form-check-input" name="optradio" disabled>휴대폰
									  </label>
									</div>
									<div class="form-check-inline">
									  <label class="form-check-label">
									    <input type="radio" class="form-check-input" name="optradio" disabled>무통장입금(가상계좌)
									  </label>
									</div>
								</div>
								<div style="margin-top: 5px;">
									<div class="form-group form-inline">
										<div>카드종류&nbsp;</div>
									  <select class="form-control" id="sel1" style="height: 30px; width: 130px; font-size: 0.9em;">
									    <option>NH농협카드</option>
									    <option>신한카드</option>
									    <option>현대카드</option>
									    <option>삼성카드</option>
									  </select>
									</div>
									<div class="form-group form-inline">
									  <div>할부기간&nbsp;</div>
									  <select class="form-control" id="sel1" style="height: 30px; width: 130px; font-size: 0.9em;">
									    <option>일시불</option>
									    <option>2개월</option>
									    <option>3개월</option>
									    <option>6개월</option>
									  </select>
									</div>
								</div>
							</td>
						</tr>
                    </table>
                    <div class="form-check-inline">
						<label class="form-check-label">
							<input type="checkbox" class="form-check-input" value=""> 위 주문 내용을 확인하였으며, 회원 본인은 결제에 동의합니다.
						</label>
					</div>
                    <div class="purchase_btn_group">
                        <input type="submit" class="btn btn-primary" value="결제하기">
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