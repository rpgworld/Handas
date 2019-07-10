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
        <div class="row">
            <div class="col-sm-12 items_list">
                <ul>
                	<c:forEach items="${list }" var="dto">
                		<li>
	                        <div class="card" style="border: none;">
	                            <a href="${path }/shop/read"><img class="card-img-top rounded" style="border: 1px solid #d9d9d9" src="${path }/resources/images/s_images/pen1.png" alt="Card image"></a>
	                            <div class="card-body">
	                                <a href="${path }/shop/read"><h4 class="card-title">${dto.pname }</h4></a>
	                                <p class="card-text">${dto.getPriceFormat() }원</p>
	                            </div>
	                        </div>
	                    </li>
                	</c:forEach>
                </ul>
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