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
        <div class="row" style="margin-top: 50px;">
            <div class="col-sm-12" style="padding: 0;">
                <table>
					<tr>
						<td>상품사진</td>
						<td>상품설명</td>
						<td>상품번호</td>
						<td>상품명</td>
						<td>속성</td>
						<td>상품가격</td>
						<td>수량</td>
					
					</tr>
				
					<tr>
						<td><img src="resources/images/${shopRead.img}"></td>
						<td>${shopRead.pdesc }</td>
						<td>${shopRead.pnum }</td>
						<td>${shopRead.pname }</td>
						<td>${shopRead.item }</td>
						<td>${shopRead.price }</td>
						<td><input type="number" id="number" value="1" min="1" max="100" step="1">
						<td><a href="#">장바구니</a><br><a href="#">찜</a><br><a href="#">지금 바로 구매</a> </td>
					</tr>
			</table>
			<a href="shopUpdateForm?pnum=${shopRead.pnum }">상품수정</a> <a href="shopDelete">상품삭제</a>
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