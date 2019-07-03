<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="resources/css/reset.css?ver=1.0">
    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <title>Handas</title>
<style>
#wrap {
width: 90%;
margin: 0 auto;
max-width: 1200px;
}

/* 헤더영역 */
.header {
width: 100%;
display: flex;
}
.gnb {
margin-left: 20px;
}
.gnb li {
display: inline-block;
}

/* 컨텐츠영역 */
.content_section {
width: 80%;
margin: 0 auto;
}
.shop_table {
width: 100%;
}
.shop_table td:first-child, .shop_table td:nth-child(4) {
width: 10%;
}
.shop_table td:nth-child(2), .shop_table td:nth-child(5) {
width: 15%;
}
.shop_table td:nth-child(3) , .shop_table td:nth-child(6){
wjidth: 25%;
}
.shop_table, tr, td {
border: 1px solid black;
border-collapse: collapse;
text-align: center;
}
.shop_title {
text-align: left;
}
</style>
<script>
	var msgType = '${msgType}';
	var msgContent = '${msgContent}';
	
	if(msgType != '') {
		alert(msgContent);
	}
</script>
</head>
<body>
	<c:if test="${sessionScope.userId != null }">
		<c:set var="userId" value="${sessionScope.userId }" />
	</c:if>
	
    <div id="wrap">
    	<div class="info_section">
    		<c:choose>
    			<c:when test="${userId == null }">
    				<a href="loginForm">로그인</a>
    				<a href="joinForm">회원가입</a>
    			</c:when>
    			<c:otherwise>
    				<a href="loginForm">회원정보수정</a>
    				<a href="logout">로그아웃</a>
    			</c:otherwise>
    		</c:choose>
    	</div>
    	
    	<hr>
    	
    	<header class="header">
    		<h1 class="logo"><a href="index">Handas</a></h1>
    		<nav class="nav">
    			<ul class="gnb">
    				<li><a href="index">메인</a></li>
    				<li><a href="shopList">상품목록</a></li>
    				<li><a href="bbsList">고객센터</a></li>
    				<li><a href="#">Contact</a></li>
    				<li><a href="#">관리자</a></li>
    			</ul>
    		</nav>
    	</header>
    	
    	<hr>
    	
    	<section class="content_section">
    		<table class="shop_table">
    			<thead>
    				<tr>
    					<td>글번호</td>
    					<td>썸네일</td>
    					<td>펜이름</td>
    					<td>분류</td>
    					<td>가격</td>
    					<td>날짜</td>
    				</tr>
    			</thead>
    			<tbody>
    				<c:forEach items="${shopList }" var="list">
    					<tr>
	    					<td>${list.snum }</td>
	    					<td class="shop_name">${list.img1 }</td>
	    					<td>${list.name }</td>
	    					<td>${list.item }</td>
	    					<td>${list.price }원</td>
	    					<td>${list.writeDate }</td>
		    			</tr>
    				</c:forEach>

    			</tbody>
    		</table>
    	</section> 	
    	<footer class="footer">
    	
    	</footer>
    </div>
</body>
</html>